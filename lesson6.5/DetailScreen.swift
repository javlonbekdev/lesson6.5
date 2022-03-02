//
//  DetailScreen.swift
//  lesson6.5
//
//  Created by Javlonbek on 31/01/22.
//

import SwiftUI

struct DetailScreen: View {
    @Environment(\.presentationMode) var presentation
    @Environment(\.managedObjectContext) var moc
    
    @State var title = ""
    @State var subtitle = ""
    @State var type = ""
    let types = ["#doing", "#done"]
    
    func saveTask(title: String, subtitle: String, type: String) {
        let task = Task(context: self.moc)
        task.id = UUID()
        task.title = title
        task.subtitle = subtitle
        task.type = type
        try? self.moc.save()
    }
    var body: some View {
        NavigationView{
            Form{
                Section {
                    TextField("Title", text: $title)
                    TextField("Description", text: $subtitle)
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                        }
                    }
                }
            }
            .navigationBarItems(trailing: Button(action: {
                saveTask(title: title, subtitle: subtitle, type: type)
                presentation.wrappedValue.dismiss()
            }, label: {
                Text("Add")
            }))
        }
    }
}

struct DetailScreen_Previews: PreviewProvider {
    static var previews: some View {
        DetailScreen()
    }
}
