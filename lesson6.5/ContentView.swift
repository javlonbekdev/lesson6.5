//
//  ContentView.swift
//  lesson6.5
//
//  Created by Javlonbek on 31/01/22.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @FetchRequest(entity: Task.entity(), sortDescriptors: []) var tasks: FetchedResults<Task>
    @State var isModel: Bool = false
    
    var body: some View {
        NavigationView{
            List{
                ForEach(tasks, id: \.id) { task in
                    TaskCell(task: task)
                }
            }
            .navigationBarItems(trailing: Button(action: {
                self.isModel = true
            }, label: {
                Text("Add")
            }).sheet(isPresented: $isModel, content: {
                DetailScreen()
            })
            )
            .listStyle(PlainListStyle())
            .navigationBarTitle(Text("Task List"), displayMode: .inline)
        }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
