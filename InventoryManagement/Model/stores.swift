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
    var id : Int?
    
    enum CodingKeys: String, CodingKey
    {
        case location   = "location"
        case storeName  = "storeName"
        case id         = "id"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            location    = try values.decodeIfPresent(String.self,   forKey: .location)
            storeName   = try values.decodeIfPresent(String.self,   forKey: .storeName)
            id          = try values.decodeIfPresent(Int.self,      forKey: .id)
    }
    
//    var storeName:String
//    var storeLocation:String
    
//    init(name:String, location:String)
//    {
//        self.storeName = name
//        self.storeLocation = location
//    }
    
}
