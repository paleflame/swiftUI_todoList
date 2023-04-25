import SwiftUI

struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        
        if item.description.count == 0{
            HStack{
                CheckBoxView(item: item)
                
                
                NavigationLink(formatTitle(title: item.title),
                               destination: CompleteTaskView(item: item))
                .strikethrough(item.isCompleted, color: .black)
          
                   
                Spacer()
            }
            .font(.title)
            .padding(.vertical, 8)
        }
        else{
            HStack{
                VStack{
                    CheckBoxView(item: item)
                        .padding(.top, 9)
                    Spacer()
                }
                VStack{
                    HStack{
                        NavigationLink(formatTitle(title: item.title),
                                       destination: CompleteTaskView(item: item))
                        .strikethrough(item.isCompleted, color: .black)
                           
//                        Text(formatTitle(title: item.title))
                        Spacer()
                    }
                    HStack{
                        Text(formatDescription(description: item.description))
                            .strikethrough(item.isCompleted, color: .black)
                            .font(.title2)
                        
                        Spacer()
                    }
                }
            }
            .font(.title)
            .padding(.vertical, 8)
        }
        
        
    }
    
    func formatTitle(title: String)-> String {
        if title.count > 15{
            return title.prefix(15) + "..."
        }
        return title
    }
    func formatDescription(description: String)-> String{
        if description.count > 70 {
            return description.prefix(70) + "..."
        }
        return description
    }
}

struct ListRowView_Previews: PreviewProvider {
    
    static let exampleFalse: ItemModel = ItemModel(title: "Haha", isCompleted: false)
    static let exampleTrue: ItemModel = ItemModel(title: "Hihi", isCompleted: true)
    
    static var previews: some View {
        Group{
            ListRowView(item: exampleFalse)
            ListRowView(item: exampleTrue)
        }
            .previewLayout(.sizeThatFits)
    }
    
}
