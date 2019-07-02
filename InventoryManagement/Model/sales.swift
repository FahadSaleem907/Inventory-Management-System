//
//  sales.swift
//  InventoryManagement
//
//  Created by SunnyMac on 26/06/2019.
//  Copyright © 2019 SunnyMac. All rights reserved.
//

import Foundation
import UIKit

struct sales: Codable
{
    var pid : Int?
    var quantity : Int?
    var saleDate : String?
    var sid : Int?
    var stockSold : Int?
    
    enum CodingKeys: String, CodingKey
    {
        case pid = "pid"
        case quantity = "quantity"
        case saleDate = "saleDate"
        case sid = "sid"
        case stockSold = "stockSold"
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        pid = try values.decodeIfPresent(Int.self, forKey: .pid)
        quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
        saleDate = try values.decodeIfPresent(String.self, forKey: .saleDate)
        sid = try values.decodeIfPresent(Int.self, forKey: .sid)
        stockSold = try values.decodeIfPresent(Int.self, forKey: .stockSold)
    }
    
    
//    var productID: Int
//    var saleID: Int
//    var saleDate: String
//    var quantity: Int
//    var stockSold: Int
//
//    init(pid:Int, sid:Int, saleDate:String, productQuantity:Int, stockSold:Int)
//    {
//        self.productID = pid
//        self.saleID = sid
//        self.saleDate = saleDate
//        self.quantity = productQuantity
//        self.stockSold = stockSold
//    }
    
}
