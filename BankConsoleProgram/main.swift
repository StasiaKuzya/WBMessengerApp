//
//  main.swift
//  BankConsoleProgram
//
//  Created by Анастасия on 23.06.2024.
//

import Foundation

struct Transaction {
    let date: Date
    let amount: Double
    let type: String
}

final class Account {
    let accountNumber: String
    var balance: Double
    var transactions: [Transaction] = []
    
    init(accountNumber: String, balance: Double) {
        self.accountNumber = accountNumber
        self.balance = balance
    }
    
    func deposit(amount: Double) {
        balance += amount
        let transaction = Transaction(date: Date(), amount: amount, type: "Deposit")
        transactions.append(transaction)
    }
    
    func withdraw(amount: Double) {
        if balance >= amount {
            balance -= amount
            let transaction = Transaction(date: Date(), amount: amount, type: "Withdraw")
            transactions.append(transaction)
        } else {
            print("Недостаточно средств на счете.")
        }
    }
    
    var description: String {
        var desc = "Счет \(accountNumber): баланс = \(balance), дата последней транзакции: \(transactions.last?.date ?? Date())\n"
        for transaction in transactions {
            desc += "Операция: \(transaction.type), сумма: \(transaction.amount), дата: \(transaction.date)\n"
        }
        return desc
    }
}

final class Bank {
    var accounts: [String: Account] = [:]
    
    func addAccount(account: Account) {
        if let existingAccount = accounts[account.accountNumber] {
            existingAccount.deposit(amount: account.balance)
        } else {
            accounts[account.accountNumber] = account
        }
    }
    
    func transfer(fromAccountNumber: String, toAccountNumber: String, amount: Double) {
        guard let fromAccount = accounts[fromAccountNumber], let toAccount = accounts[toAccountNumber] else {
            print("Один из указанных счетов не существует.")
            return
        }
        
        if fromAccount.balance >= amount {
            fromAccount.withdraw(amount: amount)
            toAccount.deposit(amount: amount)
            print("Перевод \(amount) со счета \(fromAccountNumber) на счет \(toAccountNumber) выполнен.")
        } else {
            print("Недостаточно средств на счете для перевода.")
        }
    }
    
    func printAccounts() {
        for account in accounts.values {
            print(account.description)
        }
    }
}

// Realization of console program
func main() {
    let bank = Bank()
    
    let account1 = Account(accountNumber: "1001", balance: 1000.0)
    let account2 = Account(accountNumber: "1002", balance: 500.0)
    let account3 = Account(accountNumber: "1003", balance: 400.0)
    
    bank.addAccount(account: account1)
    bank.addAccount(account: account2)
    bank.addAccount(account: account3)
    
    print("Состояние счетов до выполнения операций:")
    bank.printAccounts()
    
    account1.deposit(amount: 200.0)
    bank.transfer(fromAccountNumber: "1001", toAccountNumber: "1002", amount: 300.0)
    
    account3.deposit(amount: 100.0)
    bank.transfer(fromAccountNumber: "1003", toAccountNumber: "1001", amount: 100.0)
    
    print("Состояние счетов после выполнения операций:")
    bank.printAccounts()
}

main()
