//
//  FavoriteImagesVC.swift
//  GeneratorImage
//
//  Created by Александр Х on 01.06.2023.
//

import UIKit

final class FavoriteImagesVC: UIViewController {
    
    let tableView: UITableView = {
        let tableview = UITableView()
        tableview.register(CustomTableViewCell.self, forCellReuseIdentifier: CustomTableViewCell.reuseID)
        tableview.separatorStyle = .singleLine
        return tableview
    }()
    
    //MARK: - TabBarItemSet
    let tabBarsItemSet = {
        let tabBarItemVC = UITabBarItem()
        tabBarItemVC.image = UIImage(systemName: "basket")
        tabBarItemVC.selectedImage = UIImage(systemName: "basket.fill")
        tabBarItemVC.title = "Favorite"
        return tabBarItemVC
    }()
    
    
    override func viewDidLoad() {
        view.backgroundColor = .white
        setupView()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.reloadData()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
        print("\(MainViewController.imageArray.count) items in the Table")
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        tableView.rowHeight = CGFloat(110)
    }
}

//MARK: - setting View
extension FavoriteImagesVC {
    func setupView() {
        addSubViews()
        setupLayout()
    }
}


//MARK: - setting elements
extension FavoriteImagesVC {
    func addSubViews() {
        view.addSubview(tableView)
    }
}


//MARK: - setting layouts
extension FavoriteImagesVC {
        func setupLayout() {
            tableView.translatesAutoresizingMaskIntoConstraints = false
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true

        }
    }

extension FavoriteImagesVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MainViewController.imageArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let images = MainViewController.imageArray[indexPath.row]
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomTableViewCell.reuseID, for: indexPath) as? CustomTableViewCell else {
            return UITableViewCell()}
        cell.newImage.image = UIImage(data: images.img!)
        cell.imageTitle.text = "\(images.title!)"
        cell.imageDate.text = formatter.string(from: images.date!)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let images = MainViewController.imageArray[indexPath.row]
            let mainVC = MainViewController()
            mainVC.deleteItem(item: images)
            mainVC.getAllItems()
            tableView.reloadData()
        }
    }
}
