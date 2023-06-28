//
//  GroupsModel.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 23.06.2023.
//

import Foundation

struct GroupsModel: Codable {
    
    var response: GroupsListModel
    
    enum CodingKeys: String, CodingKey {
        case response
    }
}

struct GroupsListModel: Codable {
    var count: Int
    
    var items: [Group]
    
    enum CodingKeys: String, CodingKey {
        case count
        case items
    }
}
