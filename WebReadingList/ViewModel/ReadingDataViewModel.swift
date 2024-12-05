//
//  ReadingDataViewModel.swift
//  WebReadingList
//
//  Created by Weerawut Chaiyasomboon on 5/12/2567 BE.
//

import Foundation
import Observation

@Observable
class ReadingDataViewModel{
    var readingList: [ReadingItem] = []
    
    init(){
        load()
    }
    
    func addNewReadingItem(title: String, urlString: String){
        guard let url = URL(string: urlString) else { return }
        let newItem = ReadingItem(title: title, url: url)
        readingList.append(newItem)
        
        save()
    }
    
    func save(){
        //1. take type and convert to Data
        //2. create url for file
        //3. write data to file
        do{
            let data = try JSONEncoder().encode(readingList)
            let url = fileURL()
            try data.write(to: url)
            print("File location: \(url.absoluteString)")
        }catch{
            print("Error saving: \(error.localizedDescription)")
        }
    }
    
    func load(){
        do{
            let data = try Data(contentsOf: fileURL())
            readingList = try JSONDecoder().decode([ReadingItem].self,from: data)
        }catch{
            readingList = ReadingItem.examples
            print("Error loading: \(error.localizedDescription)")
        }
    }
    
    func fileURL() -> URL{
        let directory = URL.documentsDirectory
        return directory.appendingPathComponent("readingList.json")
    }
}
