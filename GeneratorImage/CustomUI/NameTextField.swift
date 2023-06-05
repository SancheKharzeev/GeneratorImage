//
//  NameTextField.swift
//  GeneratorImage
//
//  Created by Александр Х on 30.05.2023.
//

import UIKit

final class NameTextField: UITextField {
    
    //MARK: - Initialization
    init(placeholder: String) {
        super.init(frame: .zero)
        setupTextField(placeholder: placeholder)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Private property
    // Padding for placeholders text and users text
    private let padding = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 40)
    
    
    //MARK: - Override Methods
    //position of the text
    override func textRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }
    
    override func editingRect(forBounds bounds: CGRect) -> CGRect {
        bounds.inset(by: padding)
    }

    //MARK: - Private Methods
    private func setupTextField(placeholder: String) {
        textColor = .white
        layer.cornerRadius = 10
        layer.backgroundColor = #colorLiteral(red: 0.2588235438, green: 0.7568627596, blue: 0.9686274529, alpha: 1)
        
        //shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 15, height: 15)
        
        //placeholder
        attributedPlaceholder = NSAttributedString(string: placeholder, attributes: [NSAttributedString.Key.foregroundColor: UIColor.systemCyan])
        font = .boldSystemFont(ofSize: 18)
        
        heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
}
