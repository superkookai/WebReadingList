//
//  ReadingDataEditorView.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import SwiftUI

struct ReadingDataEditorView: View {
    @Bindable var readingDataVM: ReadingDataViewModel
    @State var newURLString = ""
    @State var title = ""
    
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Create new Reading Item")
                .font(.title)
            
            TextField("Title", text: $title)
            TextField("URL", text: $newURLString)
                .textInputAutocapitalization(.never)
            
            HStack{
                Spacer()
                
                Button("Cancel"){
                    dismiss()
                }
                .buttonStyle(.bordered)
                
                Button("Save"){
                    readingDataVM.addNewReadingItem(title: title, urlString: newURLString)
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
        }
        .textFieldStyle(.roundedBorder)
        .padding()
    }
}

#Preview {
    ReadingDataEditorView(readingDataVM: ReadingDataViewModel())
}
