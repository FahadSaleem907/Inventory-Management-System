import Foundation
import UIKit

struct users: Codable
{
    var email : String?
    var name : String?
    var password : String?
    var role : Bool?
    var id: Int?
    
    enum CodingKeys: String, CodingKey
    {
        case password   = "password"
        case id         = "id"
        case email      = "email"
        case name       = "name"
        case role       = "Role"
    }
    
    init(from decoder: Decoder) throws
    {
        let values      = try decoder.container(keyedBy: CodingKeys.self)
            password    = try values.decodeIfPresent(String.self    , forKey: .password)
            id          = try values.decodeIfPresent(Int.self       , forKey: .id)
            email       = try values.decodeIfPresent(String.self    , forKey: .email)
            name        = try values.decodeIfPresent(String.self    , forKey: .name)
            role        = try values.decodeIfPresent(Bool.self      , forKey: .role)
    }

}
