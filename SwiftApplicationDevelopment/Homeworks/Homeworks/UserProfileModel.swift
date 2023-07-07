//
//  UserProfileModel.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 06.07.2023.
//

import Foundation

struct UserProfileModel: Codable {
    var response: [FriendModel]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}
