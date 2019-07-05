import Foundation
import UIKit

struct sales: Codable
{
    var id          : Int?
    var pid         : Int?
    var quantity    : Int?
    var saleDate    : String?
    var storeID     : Int?
    var stockSold   : Int?
    var totalAmount : Int?
    
    enum CodingKeys: String, CodingKey
    {
        case id             = "id"
        case pid            = "productID"
        case quantity       = "quantity"
        case saleDate       = "saleDate"
        case storeID        = "storeID"
        case stockSold      = "stockSold"
        case totalAmount    = "totalAmount"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            id          = try values.decodeIfPresent(Int.self, forKey: .id)
            pid         = try values.decodeIfPresent(Int.self, forKey: .pid)
            quantity    = try values.decodeIfPresent(Int.self, forKey: .quantity)
            saleDate    = try values.decodeIfPresent(String.self, forKey: .saleDate)
            storeID     = try values.decodeIfPresent(Int.self, forKey: .storeID)
            stockSold   = try values.decodeIfPresent(Int.self, forKey: .stockSold)
            totalAmount   = try values.decodeIfPresent(Int.self, forKey: .totalAmount)
    }
}

struct completeSales : Codable
{
    var productName:String?
    var sale:sales?
    var storeLocation:String?
    var storeName:String?
    
    enum CodingKeys: String, CodingKey
    {
        case productName    = "productName"
        case sale           = "sale"
        case storeLocation  = "storeLocation"
        case storeName      = "storeName"
    }
    
    init(from decoder: Decoder) throws
    {
        let values          = try decoder.container(keyedBy: CodingKeys.self)
            productName     = try values.decodeIfPresent(String.self, forKey: .productName)
            sale            = try values.decodeIfPresent(sales.self, forKey: .sale)
            storeLocation   = try values.decodeIfPresent(String.self, forKey: .storeLocation)
            storeName       = try values.decodeIfPresent(String.self, forKey: .storeName)
    }
}
