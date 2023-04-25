//
//  AddView.swift
//  todo
//
//  Created by Danil Vasilenko on 20.04.2023.
//

import SwiftUI

struct AddView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    @Environment(\.dismiss) var dismiss
    @State var titleText: String = ""
    @State var descriptionText: String = ""
    
    @State var alertTitle = ""
    @State var isAlertShown = false
    
    var body: some View {
        ScrollView{
            VStack{
                TextField("Title*",
                        text: $titleText
                    )
                    .frame(height: 55)
                    .padding(.horizontal)
                    .background(Color.myCustomGrey)
                    .cornerRadius(10)
                
                    TextField(
                        "Description",
                        text: $descriptionText,
                        axis: .vertical
                    )
                    .lineLimit(1...20)
                    .frame(minHeight: 20, maxHeight: 110)
                    .padding()
                    .background(Color.myCustomGrey)
                    .cornerRadius(10)
            
                
//                TextEditor(text: $descriptionText)
//                    .frame(height: 100)
//                    .colorMultiply(Color.myCustomGrey)
//                    .foregroundColor(.gray)
//                    .cornerRadius(10)
//
                              

//                    TextField(
//                        "Description",
//                        text: $descriptionText,
//                        axis: .vertical
//                    )
//                    .frame(height: 200)
//                    .lineLimit(10)
//                    .padding(.horizontal)
//                    .background(Color.myCustomGrey)
//                    .cornerRadius(10)
//                    .multilineTextAlignment(.leading)
//
                
                
                
                
               
                
                Button(action: addButtonPressed, label: {
                    Text("ADD")
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
    
    func addButtonPressed(){
        if isTitleValid(){
            listViewModel.addItem(title: titleText, description: descriptionText)
            dismiss()
        }
        else{
          alertTitle = "The Title field must contain at least 4 symbols. 🚬🗿"
          isAlertShown.toggle()
        }
        
    }
    
    func isTitleValid() -> Bool{
        return titleText.count > 3;
    }
    
    func getAlert() -> Alert {
        return Alert(title: Text(alertTitle))
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
