//
//  CheckBoxView.swift
//  Busy Man
//
//  Created by Danil Vasilenko on 25.04.2023.
//

import SwiftUI

struct CheckBoxView: View {
    let item: ItemModel
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        Image(systemName: item.isCompleted ?  "checkmark.circle" : "circle")
            .foregroundColor(item.isCompleted ? .green : .black)
            .onTapGesture {
                withAnimation(.linear){
                    listViewModel.updateItem(item: item)
                }
            }
    }
}
