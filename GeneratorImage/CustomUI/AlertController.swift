//
//  AlertController.swift
//  GeneratorImage
//
//  Created by Александр Х on 18.06.2023.
//

import UIKit

class AlertHelper {
    
    func showAlert(fromController controller: UIViewController, title: String, message: String) {
        let ac = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        let cancelAction = UIAlertAction(title: "Отмена", style: .cancel)
        
        ac.addAction(okAction)
        ac.addAction(cancelAction)
        
        ac.addTextField { usernameTF in
            usernameTF.placeholder = "Введите Логин"
        }
        
        ac.addTextField { userpasswordTF in
            userpasswordTF.placeholder = "Введите Пароль"
            userpasswordTF.isSecureTextEntry = true
        }
        controller.present(ac, animated: true, completion: nil)
    }
}
