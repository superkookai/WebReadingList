//
//  ContentView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ContentView: View {
    @State private var readingDataVM = ReadingDataViewModel()
    
    @State private var selection: ReadingItem?
    
    @Environment(\.scenePhase) var scenePhase
    
    var body: some View {
        NavigationSplitView {
            //Side bar
            ReadingListView(readingDataVM: readingDataVM, selection: $selection)
        } detail: {
            //Detail content
            if let selection{
                ReadingDetailView(reading: selection)
            }else{
                ContentUnavailableView("Please select your book", systemImage: "book")
            }
        }
        .onChange(of: scenePhase) { _, phase in
            switch phase {
            case .active: readingDataVM.load()
            case .background, .inactive: readingDataVM.save()
            @unknown default: break
            }
        }

    }
}

#Preview {
    ContentView()
}
