//
//  CarModel.swift
//  FancyCars
//
//  Created by Vitaliy Maksymlyuk on 10/9/18.
//  Copyright © 2018 Vitaliy Maksymlyuk. All rights reserved.
//

import Foundation

struct CarModelDescription: Decodable {
    var company: String
    var model: String
    var year: String
    var color: String
    var id: String
    
    private enum TheItemKeys: String, CodingKey {
        case company, model, year, color
        case id
    }
}

