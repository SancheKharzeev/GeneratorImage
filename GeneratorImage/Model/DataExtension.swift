//
//  DataExtension.swift
//  GeneratorImage
//
//  Created by Александр Х on 02.06.2023.
//

import UIKit

extension MainViewController {
    
    func getAllItems() {
        do {
            MainViewController.imageArray = try context.fetch(ImageGenerated.fetchRequest())
            MainViewController.imageMaxCount()
            print("get All item")
        }
        catch {
            print("get All item ERROR")
        }
    }
    
    func createItem(name: String, img: Data) {
        let newItem = ImageGenerated(context: context)
        newItem.img = img
        newItem.date = Date()
        newItem.title = name
        
        do {
            try context.save()
            print("Item created")
            getAllItems()
            FavoriteImagesVC().tableView.reloadData()
        }
        catch {
            print("create item ERROR")
        }
    }
    
    func deleteItem(item: ImageGenerated) {
        context.delete(item)
        
        do {
            try context.save()
            print("delete item")
        }
        catch {
            print("delete item ERROR")
        }
    }
}
