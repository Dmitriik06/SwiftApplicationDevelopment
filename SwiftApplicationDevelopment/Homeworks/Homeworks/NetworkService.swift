//
//  NetworkService.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 01.07.2023.
//

import Foundation

final class NetworkService {
    private var session = URLSession.shared
    
    func getFriends(handler: @escaping ([FriendModel]) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/friends.get?fields=photo_50&user_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131")
        
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
    
    func getGroups(handler: @escaping ([GroupModel]) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/groups.get?extended=1&fields=description&user_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let groupsList = try JSONDecoder().decode(GroupsModel.self, from: data)
                handler(groupsList.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getPhotos(handler: @escaping ([PhotoModel]) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/photos.get?photo_sizes=1&album_id=profile&owner_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let photosList = try JSONDecoder().decode(PhotosModel.self, from: data)
                handler(photosList.response.items)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getUserProfile(handler: @escaping ([FriendModel]) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/users.get?fields=photo_50,first_name,last_name" + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let userProfile = try JSONDecoder().decode(UserProfileModel.self, from: data)
                handler(userProfile.response)
            } catch {
                print(error)
            }
        }.resume()
    }
}
