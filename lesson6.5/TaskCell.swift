//
//  TaskCell.swift
//  lesson6.5
//
//  Created by Javlonbek on 31/01/22.
//

import SwiftUI

struct TaskCell: View {
    @Environment(\.managedObjectContext) var moc
    var task: Task
    
    var body: some View {
        HStack{
            VStack(alignment: .leading) {
                Text(task.title!)
                    .fontWeight(.bold)
                Text(task.subtitle!)
            }
            Spacer()
            Text(task.type!)
                .foregroundColor(.red)
            Button {
                moc.delete(task)
            } label: {
                Text("delete")
                    .foregroundColor(.red)
            }

        }.padding()
    }
}

struct TaskCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskCell(task: Task())
    }
}
