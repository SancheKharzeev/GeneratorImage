//
//  NewImage.swift
//  GeneratorImage
//
//  Created by Александр Х on 31.05.2023.
//

import UIKit

class NewImage: UIImageView {
    init(named: String) {
        super.init(frame: .zero)
        image = UIImage(named: named)
        setupImage()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    //MARK: - Private Methods
    private func setupImage() {
        
        //shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowRadius = 7
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: 15, height: 15)
        // size
        
        frame = CGRect(x: 0, y: 0, width: 300, height: 300)
        
    }
}

