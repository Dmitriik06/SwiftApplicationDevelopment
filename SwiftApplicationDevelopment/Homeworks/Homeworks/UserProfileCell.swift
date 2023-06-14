//
//  UserProfileCell.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 14.06.2023.
//

import UIKit

class UserProfileCell: UITableViewCell {
    
    var userImage = UIImageView(image: UIImage(systemName: "person"))
    
    var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "Text"
        label.textColor = .black
        label.backgroundColor = .lightGray
        return label
    }()
    
    var descriptionLabel: UILabel = {
       let label = UILabel()
        label.text = "Large text"
        label.textColor = .black
        label.backgroundColor = .lightGray
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupViews(){
        contentView.addSubview(userImage)
        setupConstraints()
    }
    
    func setupConstraints(){
        userImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            userImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
            userImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            userImage.widthAnchor.constraint(equalToConstant: frame.size.width / 5),
            userImage.heightAnchor.constraint(equalToConstant: frame.size.height / 1)
        
        ])
    }
}
