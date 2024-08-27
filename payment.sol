// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Payroll {
    address public owner;

    struct Worker {
        uint256 packagePerMonth; // Monthly salary in wei
        uint256 lastPaid;        // Timestamp of the last payment
    }

    mapping(address => Worker) public workers;
    address[] public workerAddresses; // To keep track of worker addresses

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor() {
        owner = msg.sender;
    }

    // Function to add or update a worker
    function setWorker(address _worker, uint256 _packagePerMonth) external onlyOwner {
        if (workers[_worker].packagePerMonth == 0) {
            workerAddresses.push(_worker); // Add to list if not already present
        }
        workers[_worker] = Worker({
            packagePerMonth: _packagePerMonth,
            lastPaid: block.timestamp
        });
    }

    // Function to remove a worker
    function removeWorker(address _worker) external onlyOwner {
        require(workers[_worker].packagePerMonth != 0, "Worker does not exist");
        delete workers[_worker];
        
        // Remove from the workerAddresses array
        for (uint256 i = 0; i < workerAddresses.length; i++) {
            if (workerAddresses[i] == _worker) {
                workerAddresses[i] = workerAddresses[workerAddresses.length - 1];
                workerAddresses.pop();
                break;
            }
        }
    }

    // Function to deposit funds into the contract
    function deposit() external payable onlyOwner {}

    // Function to pay workers
    function payWorkers() external {
        for (uint256 i = 0; i < workerAddresses.length; i++) {
            address workerAddress = workerAddresses[i];
            Worker storage worker = workers[workerAddress];
            
            // Check if a month has passed since the last payment
            if (block.timestamp >= worker.lastPaid + 30 days) {
                // Pay the worker
                require(address(this).balance >= worker.packagePerMonth, "Insufficient funds");
                payable(workerAddress).transfer(worker.packagePerMonth);
                worker.lastPaid = block.timestamp;
            }
        }
    }

    // Function to get the balance of the contract
    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }

    // Function to get the number of workers
    function getWorkerCount() external view returns (uint256) {
        return workerAddresses.length;
    }
}
