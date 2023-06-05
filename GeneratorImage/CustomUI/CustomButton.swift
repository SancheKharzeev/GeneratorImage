//
//  CustomButton.swift
//  GeneratorImage
//
//  Created by Александр Х on 31.05.2023.
//

import UIKit

class CustomButton: UIButton {
    
    init(title: String) {
        super.init(frame: .zero)
        setupButton(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private Methods
    private func setupButton(title: String) {
        //text
        setTitle(title, for: .normal)
        setTitleColor(.white, for: .normal)
        titleLabel?.font = .boldSystemFont(ofSize: 18)
        
        layer.cornerRadius = 5
        layer.backgroundColor = #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1)
        
        //shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        widthAnchor.constraint(equalToConstant: 170).isActive = true
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
