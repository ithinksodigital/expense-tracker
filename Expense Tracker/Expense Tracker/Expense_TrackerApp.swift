//
//  Expense_TrackerApp.swift
//  Expense Tracker
//
//  Created by Rafal Pawelec on 07/07/2023.
//

import SwiftUI

@main
struct Expense_TrackerApp: App {
    @StateObject var transactionListVM = TransactionListViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(transactionListVM)
        }
    }
}
