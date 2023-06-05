//
//  ViewController.swift
//  GeneratorImage
//
//  Created by Александр Х on 30.05.2023.
//

import UIKit

final class MainViewController: UIViewController {
    
    static var imageArray = [ImageGenerated]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    let imageDownload = ImageDownload()
    
    var imageName = ""
    
    //MARK: - nameTextField
    let nameTextField = NameTextField(placeholder: "Enter random word")
    
    //MARK: - image
    let newImage = NewImage(named: "logo")
    
    //MARK: - button
    let favoriteButton = CustomButton(title: "Add to favorite")
    let searchButton = CustomButton(title: "Search")
    
    //MARK: - TabBarItemSet
    let tabBarsItemSet = {
        let tabBarItemVC = UITabBarItem()
        tabBarItemVC.image = UIImage(systemName: "menucard")
        tabBarItemVC.selectedImage = UIImage(systemName: "menucard.fill")
        tabBarItemVC.title = "Menu"
        return tabBarItemVC
    }()
    
    //MARK: - viewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemCyan
        setupView()
        nameTextField.delegate = self
        imageDownload.delegate = self
        getAllItems()
    }
}

//MARK: - setting View
extension MainViewController {
    func setupView() {
        addSubViews()
        setupLayout()
        setSearchButton()
        setFavoriteButton()
        searchButton.isHidden = true
        favoriteButton.isHidden = true
    }
}

//MARK: - setting elements
extension MainViewController {
    func addSubViews() {
        view.addSubview(nameTextField)
        view.addSubview(newImage)
        view.addSubview(favoriteButton)
        view.addSubview(searchButton)
    }
    
    //MARK: Search Button action
    func setSearchButton() {
        searchButton.addTarget(self, action: #selector(searchButtonPressed), for: .touchUpInside)
    }
    @objc func searchButtonPressed() {
        nameTextField.endEditing(true)
        guard let word = nameTextField.text else { return nameTextField.placeholder = "no words here" }
        if word != "" {
            imageDownload.fetchURL(words: word)
        }
        nameTextField.text = "" // затем поле очистится
    }
    
    //MARK: Favorite Button action
    
    func setFavoriteButton() {
        favoriteButton.addTarget(self, action: #selector(addToFavorite), for: .touchUpInside)
    }
    
    @objc func addToFavorite() {
        if let imageData = newImage.image?.pngData() {
            createItem(name: "\(imageName)", img: imageData)
        } else {
            print("error save image")
        }
    }
}
    

//MARK: - setting layouts
extension MainViewController {
    func setupLayout() {
        newImage.translatesAutoresizingMaskIntoConstraints = false
        newImage.centerXAnchor.constraint(equalTo:view.centerXAnchor).isActive = true
        newImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        newImage.heightAnchor.constraint(equalToConstant: 300).isActive = true
        newImage.widthAnchor.constraint(equalToConstant: 300).isActive = true
        
        nameTextField.translatesAutoresizingMaskIntoConstraints = false
        nameTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        nameTextField.topAnchor.constraint(equalTo: newImage.bottomAnchor, constant: 30).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.8).isActive = true
        
        searchButton.translatesAutoresizingMaskIntoConstraints = false
        searchButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        searchButton.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 30).isActive = true
        
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        favoriteButton.topAnchor.constraint(equalTo: searchButton.bottomAnchor, constant: 30).isActive = true
    }
}

//MARK: - UITextFieldDelegate
extension MainViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameTextField.endEditing(true)
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        // метод передаст введенные слова из textField в класс imageDownload.fetchURL после окончания ввода текста
        
        if let words = nameTextField.text {
            let formattedString = words.replacingOccurrences(of: " ", with: "+") // заменяем пробелы в тексте на символ
            imageDownload.fetchURL(words: formattedString)
            imageName = words
            print(imageName)
        }
        nameTextField.text = "" // затем поле очистится
        favoriteButton.isHidden = false
    }
    
    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool { // разрешает закончить редактировать поле
        if textField.text != "" {  // то есть не пустое
            return true
        } else {
            textField.placeholder = "Enter a word"
            return false
        }
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        searchButton.isHidden = false
    }
}
//MARK: - ImageManagerDelegate
extension MainViewController: ImageManagerDelegate {
    func didUpdateImage(_ image: Data) {
        DispatchQueue.main.async {
            self.newImage.image = UIImage(data: image) // как сохранять файл картинки и потом его забирать
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

