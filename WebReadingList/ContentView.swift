//
//  ContentView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
    let readingList: [ReadingItem] = ReadingItem.examples
    
    @State private var selection: ReadingItem?
    
    var body: some View {
        NavigationSplitView {
            //Side bar
            ReadingListView(readingList: readingList, selection: $selection)
        } detail: {
            //Detail content
            if let selection{
                ReadingDetailView(reading: selection)
            }else{
                ContentUnavailableView("Please select your book", systemImage: "book")
            }
        }

    }
}

#Preview {
    ContentView()
}
