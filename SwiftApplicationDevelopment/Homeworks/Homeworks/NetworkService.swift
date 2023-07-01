//
//  NetworkService.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 01.07.2023.
//

import Foundation

class NetworkService {
    private var session = URLSession.shared
    
    func getFriends(handler: @escaping ([Int]) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/friends.get?user_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let friendsList = try JSONDecoder().decode(FriendsModel.self, from: data)
                handler(friendsList.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getFriend(friendId: Int) {
        let url: URL? = URL(string: "https://api.vk.com/method/users.get?user_ids=" + String(friendId) + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        var result: UserModel.User?
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let friend = try JSONDecoder().decode(UserModel.self, from: data)
                result = friend.response.first
            } catch {
                print(error)
            }
        }.resume()
    }
}
