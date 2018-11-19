//
//  LocalDataManagerProtocol.swift
//  FancyCars
//
//  Created by Bodia Kovbas on 11/19/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import Foundation

protocol LocalDataManager {
    static func extractObjectFrom<Type: Decodable>(plist name: String) -> Type?
}
