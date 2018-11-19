//
//  LocalDataManagerProtocol.swift
//  FancyCars
//
//  Created by Bodia Kovbas on 11/19/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import Foundation

protocol LocalDataManagerProtocol {
    static func extractObjectFrom<PlistType: Decodable>(plist name: String, of type: PlistType.Type) -> PlistType?
}

struct LocalDataManager: LocalDataManagerProtocol {
    static func extractObjectFrom<PlistType>(plist name: String, of type: PlistType.Type) -> PlistType? where PlistType : Decodable {
        let url: URL = Bundle.main.url(forResource: name, withExtension: "plist")!
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = PropertyListDecoder()
            let result = try decoder.decode(type, from: data)
            
            return result
            
        } catch {
            print(error.localizedDescription)
            
            return nil
        }
    }
}
