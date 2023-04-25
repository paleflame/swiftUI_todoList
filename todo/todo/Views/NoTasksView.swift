//
//  NoTasksView.swift
//  todo
//
//  Created by Danil Vasilenko on 25.04.2023.
//

import SwiftUI

struct NoTasksView: View {
    var body: some View {
        VStack{
            Text("There are no tasks yet...")
            Text("🗿🤙")
                
        }
        .font(.title3)
        .foregroundColor(.gray)
    }
}

struct NoTasksView_Previews: PreviewProvider {
    static var previews: some View {
        NoTasksView()
    }
}
