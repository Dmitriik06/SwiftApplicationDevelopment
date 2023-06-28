//
//  ViewController.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 11.06.2023.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    
    private var session = URLSession.shared
    
    static var userID: String = ""
    
    static var userToken: String = ""
    
    static var friendsCount: Int = 0
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    var request = URLRequest(url: URL(string: "https://oauth.vk.com/authorize?client_id=51689770&scope=262150&redirect_uri=https://vk.com/away.php?to=https://oauth.vk.com/blank.html&display=mobile&response_type=token")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        webView.frame = CGRect(x: 10, y: 10, width: 300, height: 600)
        webView.load(request)
        setupConstraints()
        view.backgroundColor = .gray
    }
    
    func setupViews(){
        view.addSubview(webView)
    }
    
    func setupConstraints(){
        webView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            webView.topAnchor.constraint(equalTo: view.topAnchor),
            webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            webView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        guard let url = navigationResponse.response.url, url.path == "/blank.html",
              let fragment = url.fragment else {
            decisionHandler(.allow)
            return
        }
        let params = fragment
            .components(separatedBy: "&")
            .map {$0.components(separatedBy: "=")}
            .reduce([String: String]()) { result, param in
                var dict = result
                let key = param[0]
                let value = param[1]
                dict[key] = value
                return dict
            }
        ViewController.userToken = params["access_token"] ?? ""
        ViewController.userID = params["user_id"] ?? ""
        decisionHandler(.cancel)
        webView.removeFromSuperview()
        navigationController?.pushViewController(FriendsViewController(), animated: true)
    }
    
    func getFriends(handler: @escaping (FriendsListModel) -> Void){
        let url: URL? = URL(string: "https://api.vk.com/method/friends.get?user_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131")
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let friendsList = try JSONDecoder().decode(FriendsModel.self, from: data)
                handler(friendsList.response)
//                print(friendsList.response.items)
                ViewController.friendsCount = friendsList.response.count
                print(ViewController.friendsCount)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getFriend(friendId: Int){
        let request: String = "https://api.vk.com/method/users.get?user_ids=" + String(friendId) + "&access_token=" + ViewController.userToken + "&v=5.131"
        let url: URL? = URL(string: request)
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let friend = try JSONDecoder().decode(UserModel.self, from: data)
                print(friend.response[0].lastName + " " + friend.response[0].firstName)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroups(){
        let request: String = "https://api.vk.com/method/groups.get?user_id=" + ViewController.userID + "&access_token=" + ViewController.userToken + "&v=5.131"
        let url: URL? = URL(string: request)
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let groupsList = try JSONDecoder().decode(GroupsModel.self, from: data)
                print(groupsList)
            } catch {
                print(error)
            }
        }.resume()
    }
    
    func getGroup(groupId: Int){
        let request: String = "https://api.vk.com/method/groups.getById?group_id=" + String(groupId) + "&access_token=" + ViewController.userToken + "&v=5.131"
        let url: URL? = URL(string: request)
        
        session.dataTask(with: url!) { (data,_,error) in
            guard let data = data else {
                return
            }
            do {
                let group = try JSONDecoder().decode(Group.self, from: data)
                print(group)
            } catch {
                print(error)
            }
        }.resume()
    }
}

