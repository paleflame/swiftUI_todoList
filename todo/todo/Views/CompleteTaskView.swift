//
//  CompleteTaskView.swift
//  Busy Man
//
//  Created by Danil Vasilenko on 25.04.2023.
//

import SwiftUI

struct CompleteTaskView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    let item: ItemModel
    
    @State var alertTitle = ""
    @State var isAlertShown = false
    
    var body: some View {
        ScrollView{
            VStack{
                HStack{
                    Text(item.title)
                    Spacer()
                }
                .frame(height: 55)
                .padding(.horizontal)
                .background(Color.myCustomGrey)
                .cornerRadius(10)
                
                
                HStack{
                    Text(item.description)
                    Spacer()
                }
                .lineLimit(1...20)
                .frame(minHeight: 20, maxHeight: 220)
                .padding()
                .background(Color.myCustomGrey)
                .cornerRadius(10)
    
                Button(action: completeButtonPressed, label: {
                    Text("COMPLETE")
                        .foregroundColor(.white)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                })
            }
            .padding(14)
            
        }
        .navigationTitle("Add a task")
        .alert(isPresented: $isAlertShown, content: getAlert)
    }
    
    func completeButtonPressed(){

      listViewModel.updateItem(item: item)
      alertTitle = "You've done \"\(item.title)\" 🗿👍"
      isAlertShown.toggle()
        
      dismiss()
    }
    
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

