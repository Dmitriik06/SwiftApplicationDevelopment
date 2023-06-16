//
//  DialogTitleCell.swift
//  Homeworks
//
//  Created by Дмитрий Кузнецов on 16.06.2023.
//

import UIKit

class DialogBottomCell: UITableViewCell {
    
    var leftLabel: UILabel = {
        let label = UILabel()
        label.text = "Bottom"
        label.textColor = .black
        label.backgroundColor = .white
        return label
    }()
    
    var rightLabel: UILabel = {
        let label = UILabel()
        label.text = "Ok"
        label.textColor = .white
        label.backgroundColor = .blue
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
        contentView.addSubview(leftLabel)
        contentView.addSubview(rightLabel)
//        contentView.addSubview(leftLabel)
        setupConstraints()
    }
    
    func setupConstraints(){
        leftLabel.translatesAutoresizingMaskIntoConstraints = false
        rightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        
            leftLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            leftLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            leftLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 2),
            
            rightLabel.topAnchor.constraint(equalTo: leftLabel.topAnchor),
            rightLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            rightLabel.widthAnchor.constraint(equalToConstant: (contentView.frame.width - 20) / 2),
            rightLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -10)

        
        ])
    }
}
