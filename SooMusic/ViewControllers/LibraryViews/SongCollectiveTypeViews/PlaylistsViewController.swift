//
//  PlaylistsViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class PlaylistsViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "PlayLists"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(showSortTypes))
    }
    
    @objc
    func showSortTypes() {
        let sortAlertController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        var sortActions = Array<UIAlertAction>()

        let playlistSort = UIAlertAction(title: "Playlist Type", style: .default) { _ in
            print("Playlist Type")
        }
        sortActions.append(playlistSort)
        
        let titleSort =  UIAlertAction(title: "Title", style: .default) { _ in
            print("Title")
        }
        sortActions.append(titleSort)
        
        let recentlyAddedSort = UIAlertAction(title: "Recently Added", style: .default) { _ in
            print("Recently Added")
        }
        sortActions.append(recentlyAddedSort)
        
        let recentlyPlayedSort = UIAlertAction(title: "Recently Played", style: .default) { _ in
            print("Rencently Played")
        }
        sortActions.append(recentlyPlayedSort)
        
        for sortAction in sortActions {
            sortAction.setValue(0, forKey: "titleTextAlignment")
            sortAlertController.addAction(sortAction)
        }
        sortAlertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        
        present(sortAlertController, animated: true, completion: nil)
    }

}
