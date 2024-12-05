//
//  ReadingListView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ReadingListView: View {
    let readingList: [ReadingItem]
    @Binding var selection: ReadingItem?
    
    var body: some View {
        List(readingList, selection: $selection) { item in
            ReadingItemRow(readingItem: item)
                .tag(item)
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
    
    ReadingListView(readingList: ReadingItem.examples, selection: $selection)
}
