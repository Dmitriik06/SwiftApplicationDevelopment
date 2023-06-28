//
//  ConversationsModel.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 20.06.2023.
//

import Foundation

struct ConversationModel: Codable {
    var count: Int
    
    var items: [Conversation]
    
    var unreadCount: Int
    
    var profiles: [UserModel]
    
    var groups: [Group]
    
    enum CodingKeys: String, CodingKey {
        case count
        case items
        case unreadCount = "unread_count"
        case profiles
        case groups
    }
}

struct Conversation: Codable {
    var peer: PeerModel
    
    var inRead: Int
    
    var outRead: Int
    
    var unreadCount: Int
    
    var important: Bool
    
    var unanswered: Bool
    
    var pushSettings: PushSettings
    
    var canWrite: CanWrite
    
    var chatSettings: ChatSettings
    
    enum CodingKeys: String, CodingKey {
        case peer
        case inRead = "in_read"
        case outRead = "out_read"
        case unreadCount = "unread_count"
        case important
        case unanswered
        case pushSettings = "push_settings"
        case canWrite = "can_write"
        case chatSettings = "chat_settings"
    }
    
}

struct UserModel: Codable {
    var response: [User]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    struct User: Codable {
        var id: Int
        
        var firstName: String
        
        var lastName: String
        
        var deactivated: String?
        
        var isClosed: Bool
        
        var canAccessClosed: Bool
        
        enum CodingKeys: String, CodingKey {
            case id
            case firstName = "first_name"
            case lastName = "last_name"
            case deactivated
            case isClosed = "is_closed"
            case canAccessClosed = "can_access_closed"
        }
    }
}

struct Group: Codable {
    var response: [GroupM]
    
    enum CodingKeys: String, CodingKey {
        case response
    }
    
    struct GroupM: Codable {
        var id: Int
        
        var name: String
        
        var screenName: String
        
        var isClosed: Int
        
        var deactivated: String
        
        var isAdmin: Int
        
        var adminLevel: Int
        
        var isAdvertiser: Int
        
        var invitedBy: Int
        
        var type: String
        
        var photo50: String
        
        var photo100: String
        
        var photo200: String
        
        enum CodingKeys: String, CodingKey {
            case id
            case name
            case screenName = "screen_name"
            case isClosed = "is_closed"
            case deactivated
            case isAdmin = "is_admin"
            case adminLevel = "admin_level"
            case isAdvertiser = "is_advertiser"
            case invitedBy = "invited_by"
            case type
            case photo50 = "photo_50"
            case photo100 = "photo_100"
            case photo200 = "photo_200"
        }
    }
}

struct PeerModel: Codable {
    var id: Int
    
    var type: String
    
    var localId: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case type
        case localId = "local_id"
    }
}

struct PushSettings: Codable {
    var disabledUntil: Int
    
    var disabledForever: Bool
    
    var noSound: Bool
    
    enum CodingKeys: String, CodingKey {
        case disabledUntil = "disabled_until"
        case disabledForever = "disabled_forever"
        case noSound = "no_sound"
    }
}

struct CanWrite: Codable {
    var allowed: Bool
    
    var reason: Int
    
    enum CodingKeys: String, CodingKey {
        case allowed
        case reason
    }
}

struct ChatSettings: Codable {
    var membersCount: Int
    
    var title: String
    
    var pinnedMessage: Message?
    
    var state: String
    
    var photo: Photo
    
    var activeIds: [Int]
    
    var isGroupChannel: Bool
    
    enum CodingKeys: String, CodingKey {
        case membersCount = "members_count"
        case title
        case pinnedMessage = "pinned_message"
        case state
        case photo
        case activeIds = "active_ids"
        case isGroupChannel = "is_group_channel"
    }
}

struct Message: Codable {
    var id: Int
    
    var date: Int
    
    var fromId: Int
    
    var text: String
    
    var attachments: String
    
    var geo: Geo
    
    var fwdMessages: [Message?]
    
    enum CodingKeys: String, CodingKey {
        case id
        case date
        case fromId = "from_id"
        case text
        case attachments
        case geo
        case fwdMessages = "fwd_messages"
    }
}

struct Geo: Codable {
    var type: String
    
    var coordinates: String
    
    var place: Place?
    
    enum CodingKeys: String, CodingKey {
        case type
        case coordinates
        case place
    }
}

struct Place: Codable {
    var id: Int
    
    var title: String
    
    var latitude: String
    
    var longitude: String
    
    var created: Int
    
    var icon: String
    
    var country: String
    
    var city: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case latitude
        case longitude
        case created
        case icon
        case country
        case city
    }
}

struct Photo: Codable {
    var photo50: String
    
    var photo100: String
    
    var photo200: String
    
    enum CodingKeys: String, CodingKey {
        case photo50 = "photo_50"
        case photo100 = "photo_100"
        case photo200 = "photo_200"
    }
}
