//
//  CustomTableView.swift
//  GeneratorImage
//
//  Created by Александр Х on 01.06.2023.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    static let reuseID = "CustomTableViewCell"
    
    let newImage = NewImage(named: "logo")
        
    let imageTitle: UILabel = {
        let lbl = UILabel()
        lbl.text = "название картинки"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
   
    let imageDate: UILabel = {
        let lbl = UILabel()
        lbl.text = "дата"
        lbl.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        lbl.textColor = .black
        return lbl
    }()
    
    func configure(image: Data, title: String, date: String) {
        newImage.image = UIImage(data: image)
        imageTitle.text = title
        imageDate.text = date
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubViews()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addSubViews() {
        contentView.addSubview(imageTitle)
        contentView.addSubview(newImage)
        contentView.addSubview(imageDate)
    }
    
    func setupLayout() {
        imageTitle.translatesAutoresizingMaskIntoConstraints = false
        imageDate.translatesAutoresizingMaskIntoConstraints = false
        newImage.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
        newImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8),
        newImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        newImage.heightAnchor.constraint(equalToConstant: 100),
        newImage.widthAnchor.constraint(equalToConstant: 100),
        
        imageTitle.leadingAnchor.constraint(equalTo: newImage.trailingAnchor, constant: 16),
        imageTitle.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
        
        imageDate.topAnchor.constraint(equalTo: imageTitle.bottomAnchor, constant: 16),
        imageDate.leadingAnchor.constraint(equalTo: newImage.trailingAnchor, constant: 16),
        
        
        ])
    }
}
