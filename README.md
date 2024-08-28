# smart-paycheck-distributor-program
Here's a README file for your Solidity Payroll smart contract project:

---

# Payroll Smart Contract
<img width="187" alt="image" src="https://github.com/user-attachments/assets/e2f785e3-c06a-4689-8c48-7bee2044ab7a">





## Vision
The Payroll Smart Contract is designed to automate monthly salary payments for office workers. This contract ensures transparency, accuracy, and efficiency by leveraging the Ethereum blockchain, making salary disbursement processes trustless and decentralized.

## Flowchart
```plaintext
Owner (Employer) 
    |
    |---> setWorker() [Add/Update Worker] 
    |           |
    |           |---> Store Worker Details
    |
    |---> deposit() [Deposit Funds] 
    |
    |---> payWorkers() [Automate Payments]
                |
                |---> Verify 30 days since last payment
                |---> Transfer Ether to Workers
```

## Contract Details
- **Contract Name:** Payroll
- **Owner:** The employer who deploys the contract.
- **Worker Structure:**
  - `packagePerMonth`: The monthly salary in wei.
  - `lastPaid`: Timestamp of the last payment.
- **Functions:**
  - `setWorker(address _worker, uint256 _packagePerMonth)`: Add or update a worker's details.
  - `removeWorker(address _worker)`: Remove a worker from the contract.
  - `deposit()`: Deposit funds into the contract.
  - `payWorkers()`: Automatically pay workers based on their package and last payment date.
  - `getBalance()`: View the contract's Ether balance.
  - `getWorkerCount()`: Get the number of workers currently registered.

## Contract Address
The smart contract is deployed on the Ethereum network at the following address:

```
0x78e15ff661c3e081406d95c977905445e36329d8
```
<img width="833" alt="image" src="https://github.com/user-attachments/assets/18ee9114-bea4-4538-9de5-9d8ca1532c00">

## Future Scope
- **Integration with ERC20 Tokens:** Expand the contract to support payments in ERC20 tokens, allowing employers to pay workers in stablecoins or other cryptocurrencies.
- **Scheduled Automation:** Integrate with off-chain services (like Chainlink Keepers) for automatic execution of the `payWorkers()` function, removing the need for manual intervention.
- **Multi-Owner Support:** Extend the contract to allow multiple owners (e.g., HR and Finance departments) to manage workers and funds collaboratively.
- **UI/UX Interface:** Develop a user-friendly web interface for employers to manage workers, view payment history, and monitor contract balances.

## License
This project is licensed under the MIT License. See the LICENSE file for more details.

---

Feel free to customize the content based on your specific deployment and future plans!
