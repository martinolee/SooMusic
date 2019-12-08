//
//  MusicTabBarController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class MusicTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabBar()
    }
    
    func setupTabBar() {
        let libraryVC = UINavigationController(rootViewController: LibraryViewController())
        libraryVC.tabBarItem.image = UIImage(systemName: "rectangle.stack.fill")
        libraryVC.tabBarItem.title = "Library"

        let forYouVC = UINavigationController(rootViewController: ForYouViewController())
        forYouVC.tabBarItem.image = UIImage(systemName: "heart.fill")
        forYouVC.tabBarItem.title = "For You"
        
        let browseVC =  UINavigationController(rootViewController: BrowseViewController())
        browseVC.tabBarItem.image = UIImage(systemName: "music.note")
        browseVC.tabBarItem.title = "Browse"
        
        let radioVC =  UINavigationController(rootViewController: RadioViewController())
        radioVC.tabBarItem.image = UIImage(systemName: "dot.radiowaves.left.and.right")
        radioVC.tabBarItem.title = "Radio"
        
        let searchVC =  UINavigationController(rootViewController: SearchViewController())
        searchVC.tabBarItem.image = UIImage(systemName: "magnifyingglass")
        searchVC.tabBarItem.title = "Search"
        
        viewControllers = [libraryVC, forYouVC, browseVC, radioVC, searchVC]
    }

}
