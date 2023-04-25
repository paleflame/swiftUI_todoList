import SwiftUI

/*
 MVVM Architecture
 
 Model- data point
 View- UI
 ViewModel- manages Models for View
 */

@main
struct todoApp: App {
    @StateObject var listViewModel = ListViewModel()
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
