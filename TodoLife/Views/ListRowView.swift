//
//  ListRowView.swift
//  TodoLife
//
//  Created by Sendo Tjiam on 25/08/21.
//

import SwiftUI

struct ListRowView: View {
    
    let item : TodoModel
    
    var body: some View {
        HStack {
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .pink)
            Text(item.title)
            Spacer()
        }
        .font(.title3)
        .padding(.vertical, 10)
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var item1 = TodoModel(title: "First", isCompleted: false)
    static var item2 = TodoModel(title: "Second", isCompleted: true)
    
    static var previews: some View {
        Group {
            ListRowView(item: item1)
            ListRowView(item: item2)
        }
        .previewLayout(.sizeThatFits)
    }
}
