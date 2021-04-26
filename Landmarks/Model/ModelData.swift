//
//  ModelData.swift
//  Landmarks
//
//  Created by Manuel Casocavallo on 26/04/21.
//

import Foundation

var landmarks: [Landmark] = load("landmarkData.json")

func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    //Checks that the filename creates a valid url to an existing file
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    //Initializes data with the file's content as Data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couln't load \(filename) from main bundle:\n\(error.localizedDescription)")
    }
    
    //Decodes and return the file's content into the generic decodable object T
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error.localizedDescription)")
    }
    
}