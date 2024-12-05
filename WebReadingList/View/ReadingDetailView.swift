//
//  ReadingDetailView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ReadingDetailView: View {
    let reading: ReadingItem
    
    var body: some View {
        Text(reading.url.absoluteString)
    }
}

#Preview {
    ReadingDetailView(reading: ReadingItem.example)
}
