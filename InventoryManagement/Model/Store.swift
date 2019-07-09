import Foundation
import UIKit

struct Store: Codable
{
    var location : String!
    var storeName : String!
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
    
    init( storename : String , location : String )
    {
        self.storeName  = storename
        self.location   = location
    }
    
}
