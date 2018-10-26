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
//    var image: Data
    
//    init(company: String, model: String, year: String, color: String) {
//        self.company = company
//        self.model = company
//        self.year = year
//        self.color = color
////        self.image = image
//    }
//
    
//
//    init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: TheItemKeys.self)
//
//        let company: String = try container.decode(String.self, forKey: .company)
//        let model: String = try container.decode(String.self, forKey: .model)
//        let year: String = try container.decode(String.self, forKey: .year)
//        let color: String = try container.decode(String.self, forKey: .color)
//
//        self.init(company: company, model: model, year: year, color: color)
//    }
}

