//
//  ReadingItem.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import Foundation
import Observation

@Observable
class ReadingItem: Identifiable, Hashable, Equatable, Codable{
    var title: String
    var url: URL
    let createdDate: Date
    var hasFinishedReading: Bool
    let id: UUID
    
    init(title: String, url: URL, createdDate: Date = Date(), hasFinishedReading: Bool = false, id: UUID = UUID()) {
        self.title = title
        self.url = url
        self.createdDate = createdDate
        self.hasFinishedReading = hasFinishedReading
        self.id = id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: ReadingItem, rhs: ReadingItem) -> Bool {
        lhs.id == rhs.id
    }
    
    //MARK: preview helper
    
    static var example: ReadingItem {
        ReadingItem(title: "Apple", url: URL(string: "https://www.apple.com")!)
    }
    
    static var examples: [ReadingItem] {
        [.example,
         ReadingItem(title: "swiftyplace", url: URL(string: "https://www.swiftyplace.com/blog/swiftui-lazyvgrid-and-lazyhgrid")!,
                     hasFinishedReading: true),
         ReadingItem(title: "UIViewRepresentable", url: URL(string: "https://nilcoalescing.com/blog/CustomSizeForUIViewsWrappedInUIViewRepresentable/")!)
        ]
    }
}
