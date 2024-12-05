//
//  ReadingListView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ReadingListView: View {
    @Bindable var readingDataVM: ReadingDataViewModel
    @Binding var selection: ReadingItem?
    @State private var newReadingEditorShown: Bool = false
    
    var body: some View {
        List($readingDataVM.readingList,
             editActions: [.move,.delete],
             selection: $selection) { $item in
            ReadingItemRow(readingItem: item)
                .tag(item)
                .swipeActions(edge:.leading) {
                    Button("Toggle Finished"){
                        item.hasFinishedReading.toggle()
                    }
                }
        }
        .toolbar {
            Button {
                newReadingEditorShown.toggle()
            } label: {
                Image(systemName: "plus")
            }
            
            EditButton()
        }
        .sheet(isPresented: $newReadingEditorShown) {
            ReadingDataEditorView(readingDataVM: readingDataVM)
        }
    }
}

fileprivate struct ReadingItemRow: View {
    let readingItem: ReadingItem
    
    var body: some View {
        HStack(alignment: .firstTextBaseline) {
            Image(systemName: readingItem.hasFinishedReading ? "book.fill" : "book")
                .foregroundStyle(.green)
            
            VStack(alignment: .leading){
                Text(readingItem.title)
                Text(readingItem.createdDate.formatted(.dateTime))
                    .font(.caption)
                    .foregroundStyle(.secondary)
            }
        }
    }
}

#Preview {
    @State @Previewable var selection: ReadingItem?
    
    NavigationStack {
        ReadingListView(readingDataVM: ReadingDataViewModel(), selection: $selection)
    }
}
