//
//  FriendsModel.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 22.06.2023.
//

import Foundation

struct FriendsModel: Codable {
    var response: FriendsListModel
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    struct FriendsListModel: Codable {
        var count: Int
        
        var items: [Int]
        
        enum CodingKeys: String, CodingKey {
            case count
            case items
        }
    }
}


