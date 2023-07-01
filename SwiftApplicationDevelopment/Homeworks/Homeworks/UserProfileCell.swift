//
//  UserProfileCell.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 14.06.2023.
//

import UIKit

class UserProfileCell: UITableViewCell {
    
    var userImage = UIImageView(image: UIImage(systemName: "person"))
    
    var tableView = UITableView()
    
    var click: ((UITableView) -> Void)?
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit..."
        label.numberOfLines = 0
        label.textColor = .black
        label.backgroundColor = .cyan
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        let recognizer = UITapGestureRecognizer(target: self, action: #selector(clickOnCell))
        addGestureRecognizer(recognizer)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(userImage)
        contentView.addSubview(titleLabel)
        contentView.addSubview(descriptionLabel)
        setupConstraints()
    }
    
    func setupConstraints(){
        userImage.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            userImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userImage.widthAnchor.constraint(equalToConstant: frame.size.width / 5),
            userImage.heightAnchor.constraint(equalToConstant: frame.size.height / 1),
            
            titleLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 5),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            titleLabel.heightAnchor.constraint(equalToConstant: 15),
            
            descriptionLabel.leadingAnchor.constraint(equalTo: userImage.trailingAnchor, constant: 5),
            descriptionLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -5),
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
            descriptionLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)
        
        ])
    }
    
    @objc func clickOnCell(){
        click?(tableView)
    }
    
    func setUserName(id: Int){
        titleLabel.text = String(id)
        descriptionLabel.text = String(id)
    }
}
