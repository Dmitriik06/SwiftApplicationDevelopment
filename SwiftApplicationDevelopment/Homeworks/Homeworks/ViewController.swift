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
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    var request = URLRequest(url: URL(string: "https://oauth.vk.com/authorize?client_id=51679394&scope=262150&redirect_uri=https://vk.com/away.php?to=https://oauth.vk.com/blank.html&display=mobile&response_type=token")!)

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = ColorTheme.currentTheme.backgroundColor
        setupViews()
        webView.frame = CGRect(x: 10, y: 10, width: 300, height: 600)
        webView.load(request)
        setupConstraints()
        view.backgroundColor = .gray
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = ColorTheme.currentTheme.backgroundColor
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
//        navigationController?.pushViewController(FriendsViewController(), animated: true)
        
        let tab1 = UINavigationController(rootViewController: FriendsViewController())
        let tab2 = UINavigationController(rootViewController: GroupsViewController())
        let tab3 = UINavigationController(rootViewController: PhotosViewController(collectionViewLayout: UICollectionViewFlowLayout()))
        let tab4 = UINavigationController(rootViewController: UserProfileViewController())

        tab1.tabBarItem.title = "Friends"
        tab2.tabBarItem.title = "Groups"
        tab3.tabBarItem.title = "Photos"
        tab4.tabBarItem.title = "My profile"

        let controllers = [tab1, tab2, tab3, tab4]

        let tabBarController = UITabBarController()
        tabBarController.viewControllers = controllers
        
        guard let firstScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let firstWindow = firstScene.windows.first else {
            return
        }

        firstWindow.rootViewController =  tabBarController
    }
    
}

