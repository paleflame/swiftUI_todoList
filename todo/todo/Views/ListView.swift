//
//  ListView.swift
//  todo
//
//  Created by Danil Vasilenko on 20.04.2023.
//

import SwiftUI


struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        
        ZStack{
            if listViewModel.items.isEmpty {
                NoTasksView()
            }
            else{
                List{
                    ForEach(listViewModel.items)
                    {
                        item in
                        ListRowView(item: item)
                            
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Busy To-Do 🗿")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add",
                               destination: AddView()
                              )
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ListView()
        }
        .environmentObject(ListViewModel())
    }
}

