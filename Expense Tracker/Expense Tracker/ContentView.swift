//
//  ContentView.swift
//  Expense Tracker
//
//  Created by Rafal Pawelec on 07/07/2023.
//

import SwiftUI
import SwiftUICharts

struct ContentView: View {
    var demoData: [Double] = [9,3,5,12,3,24]
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                    //MARK: Title
                    Text("Overview")
                        .font(.title)
                        .bold()
                    
                    //MARK: Chart
                    CardView {
                        VStack {
                            ChartLabel("$900", type: .title)
                            LineChart()
                        }
                        .background(Color.systemBackground)       
                    }
                    .data(demoData)
                    .chartStyle(ChartStyle(backgroundColor: Color.systemBackground, foregroundColor: ColorGradient(Color.icon.opacity(4), Color.icon)))
                    .frame(height: 300)


                    
                    //MARK: Recent Transaction List
                    RecentTransactionList()
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
                
                
            }
            .background(Color.background)
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                // Notification Icon
                ToolbarItem {
                    Image(systemName: "bell.badge")
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(Color.icon, .primary)
                }
            }
        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
}

struct ContentView_Previews: PreviewProvider {
    static let transactionListVM: TransactionListViewModel = {
            let transactionListVM = TransactionListViewModel()
            transactionListVM.transactions = transactionListPreviewData
            return transactionListVM
        }()
    
    static var previews: some View {
        ContentView()
            .environmentObject(transactionListVM)
    }
}
