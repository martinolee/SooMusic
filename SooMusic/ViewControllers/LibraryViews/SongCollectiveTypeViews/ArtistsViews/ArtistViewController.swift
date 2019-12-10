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
    
    let albumCollectionView: UICollectionView = {
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 20, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 150, height: 150)
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = artist
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sort", style: .plain, target: self, action: #selector(showSortTypes))
        
        setupAlbumCollectionView()
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
    
    func setupAlbumCollectionView() {
        
        albumCollectionView.dataSource = self
        albumCollectionView.delegate = self
        
        albumCollectionView.register(AlbumCollectionViewCell.self, forCellWithReuseIdentifier: AlbumCollectionViewCell.identifier)
        
        view.addSubview(albumCollectionView)
        
        NSLayoutConstraint.activate([
            albumCollectionView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            albumCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            albumCollectionView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            albumCollectionView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }

}

extension ArtistViewController: UICollectionViewDataSource {
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 100
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AlbumCollectionViewCell.identifier, for: indexPath) as! AlbumCollectionViewCell
        
        return cell
    }
    
}

extension ArtistViewController: UICollectionViewDelegate {
    
}
