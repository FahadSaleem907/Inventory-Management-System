//
//  stores.swift
//  InventoryManagement
//
//  Created by SunnyMac on 26/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

struct stores: Codable
{
    var location : String?
    var storeName : String?
    
    enum CodingKeys: String, CodingKey
    {
        case location = "location"
        case storeName = "storeName"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        location = try values.decodeIfPresent(String.self, forKey: .location)
        storeName = try values.decodeIfPresent(String.self, forKey: .storeName)
    }
    
//    var storeName:String
//    var storeLocation:String
    
//    init(name:String, location:String)
//    {
//        self.storeName = name
//        self.storeLocation = location
//    }
    
}
