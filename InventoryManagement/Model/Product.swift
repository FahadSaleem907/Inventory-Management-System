import Foundation
import UIKit

struct Product: Codable
{
    var amount : Int?
    var date : String?
    var descriptionField : String?
    var manufacture : String?
    var name : String?
    var quantity : Int?
    var pid : Int?
    
    enum CodingKeys: String, CodingKey
    {
        case pid = "id"
        case amount = "amount"
        case date = "date"
        case descriptionField = "description"
        case manufacture = "manufacture"
        case name = "name"
        case quantity = "quantity"
    }
    
    init(from decoder: Decoder) throws
    {
        let values = try decoder.container(keyedBy: CodingKeys.self)
            amount = try values.decodeIfPresent(Int.self, forKey: .amount)
            date = try values.decodeIfPresent(String.self, forKey: .date)
            descriptionField = try values.decodeIfPresent(String.self, forKey: .descriptionField)
            manufacture = try values.decodeIfPresent(String.self, forKey: .manufacture)
            name = try values.decodeIfPresent(String.self, forKey: .name)
            quantity = try values.decodeIfPresent(Int.self, forKey: .quantity)
            pid = try values.decodeIfPresent(Int.self, forKey: .pid)
    }
   
    init( productname : String , productmanufacturer : String , productdescription : String , productamount : Int , productquantity : Int , productdate : String )
    {
        self.name = productname
        self.manufacture = productmanufacturer
        self.descriptionField = productdescription
        self.amount = productamount
        self.quantity = productquantity
        self.date = productdate
    }
}
