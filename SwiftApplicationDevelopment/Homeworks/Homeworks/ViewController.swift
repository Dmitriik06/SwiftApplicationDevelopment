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
    
    private lazy var webView: WKWebView = {
        let webView = WKWebView()
        webView.navigationDelegate = self
        return webView
    }()
    
    var request = URLRequest(url: URL(string: "https://oauth.vk.com/authorize?client_id=51679394&redirect_uri=https://vk.com/away.php?to=https://oauth.vk.com/blank.html&display=mobile&response_type=token")!)
    
    var topImage = UIImageView(image: UIImage(systemName: "lock"))
    
    var topLabel: UILabel = {
        let label = UILabel()
        label.text = "Authorization"
        label.textColor = .blue
        label.backgroundColor = .cyan
        label.textAlignment = .center
        return label
    }()
    
    var loginTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Login"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.borderStyle = .line
        return textField
    }()
    
    var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.text = "Password"
        textField.textAlignment = .center
        textField.keyboardType = .numberPad
        textField.textColor = .gray
        textField.backgroundColor = .white
        textField.borderStyle = .line
        return textField
    }()
    
    var enterButton: UIButton = {
        let button = UIButton()
        button.setTitle("Enter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.setTitleColor(.blue, for: .highlighted)
        button.backgroundColor = .cyan
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        webView.frame = CGRect(x: 10, y: 10, width: 300, height: 300)
        webView.load(request)
//        setupConstraints()
        view.backgroundColor = .gray
//        addEnterButtonTarget()
    }
    
    func setupViews(){
        view.addSubview(webView)
//        view.addSubview(topImage)
//        view.addSubview(topLabel)
//        view.addSubview(loginTextField)
//        view.addSubview(passwordTextField)
//        view.addSubview(enterButton)
    }
    
    func setupConstraints(){
        topImage.translatesAutoresizingMaskIntoConstraints = false
        topLabel.translatesAutoresizingMaskIntoConstraints = false
        loginTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        enterButton.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            topImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            topImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topImage.heightAnchor.constraint(equalToConstant: view.frame.width / 4),
            topImage.widthAnchor.constraint(equalToConstant: view.frame.width / 4),
            
            topLabel.topAnchor.constraint(equalTo: topImage.bottomAnchor, constant: 5),
            topLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            topLabel.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            topLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 15),
            
            loginTextField.topAnchor.constraint(equalTo: topLabel.bottomAnchor, constant: 5),
            loginTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            loginTextField.heightAnchor.constraint(equalToConstant: view.frame.height / 15),
            
            passwordTextField.topAnchor.constraint(equalTo: loginTextField.bottomAnchor, constant: 5),
            passwordTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            passwordTextField.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            passwordTextField.heightAnchor.constraint(equalToConstant: view.frame.height / 15),
            
            enterButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 5),
            enterButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            enterButton.widthAnchor.constraint(equalToConstant: view.frame.width / 1.5),
            enterButton.heightAnchor.constraint(equalToConstant: view.frame.height / 15)
        ])
    }
    
    private func addEnterButtonTarget(){
        enterButton.addTarget(self, action: #selector(clickOnEnterButton), for: .touchUpInside)
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
        let token = params["access_token"]
        let userID = params["user_id"]
        print(token!)
        print(userID!)
        decisionHandler(.cancel)
        webView.removeFromSuperview()
    }
    
    @objc func clickOnEnterButton(){
        navigationController?.pushViewController(UserProfileViewController(), animated: true)
    }
    
}

