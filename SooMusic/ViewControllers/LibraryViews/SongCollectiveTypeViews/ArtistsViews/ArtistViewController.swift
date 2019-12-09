//
//  ArtistViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/09.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ArtistViewController: UIViewController {
    
    var artist = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = artist
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(showSortTypes))
    }
    
    @objc
    private func showSortTypes() {
        let sortAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        var sortActions = Array<UIAlertAction>()

        let titleSort = UIAlertAction(title: "Title", style: .default) { _ in
            print("Playlist Type")
        }
        sortActions.append(titleSort)
        
        let recentlyAddedSort =  UIAlertAction(title: "Recently Added", style: .default) { _ in
            print("Recently Added")
        }
        sortActions.append(recentlyAddedSort)
        
        let newestFirstSort = UIAlertAction(title: "Newest First", style: .default) { _ in
            print("Newest First")
        }
        sortActions.append(newestFirstSort)
        
        let oldestFirstSort = UIAlertAction(title: "Oldest First", style: .default) { _ in
            print("Oldest First")
        }
        oldestFirstSort.setValue(true, forKey: "checked")
        sortActions.append(oldestFirstSort)
        
        for sortAction in sortActions {
            sortAction.setValue(0, forKey: "titleTextAlignment")
            sortAlertController.addAction(sortAction)
        }
        sortAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(sortAlertController, animated: true, completion: nil)
    }

}
