//
//  ArtistsViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {
    
    var artists = ["Jungle", "HONNE", "Rhye", "Jeremy Zucker", "Still Woozy", "How Great Were the Robins", "carpetgarden", "Mac DeMarco", "SALES", "Hippo Campus", "Mild Orange", "Imagine Dragons", "Coldplay", "Queen", "Finding Hope", "Lauv", "Ten Sleep", "Bruno Major", "Russ", "Unknown Mortal Orchestra", "AJR", "Alexsander 23", "blink-182", "Daniel Caesar", "Ed Sheeran", "Fazerdaze", "Frank Sinatra", "Foster the People", "Grouplove", "kennytheking", "Nauset Light", "Oasis", "Post Malone", "Vance Joy", "Wingtip", "XXXTENTACION", "Years & Years", "Zac Brown Band"]
    
    var sortedFirstLetters = Array<String>()
    var alphabeticallySortedArtists = [[String]]()
    
    let artistsTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.rowHeight = 52
        
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Artists"
        
        setupArtistsTableView()
        print(alphabeticallySortedArtists)
    }
    
    func setupArtistsTableView() {
        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        
        artists.sort()
        
        for artist in artists {
            sortedFirstLetters.append(String(artist.first!).uppercased())
        }
        
        sortedFirstLetters = Array(Set(sortedFirstLetters))
        sortedFirstLetters.sort()
        
        alphabeticallySortedArtists = sortedFirstLetters.map { firstLetter in
            return artists
                .filter { $0.first!.uppercased() == firstLetter }
        }
        
        artistsTableView.register(UITableViewCell.self, forCellReuseIdentifier: "ArtistsCell")
        
        view.addSubview(artistsTableView)
        
        NSLayoutConstraint.activate([
            artistsTableView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            artistsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            artistsTableView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            artistsTableView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }
    
}

extension ArtistsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sortedFirstLetters[section]
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        return sortedFirstLetters
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return alphabeticallySortedArtists.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return alphabeticallySortedArtists[section].count
    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        headerView.backgroundColor = UIColor.clear
//        return headerView
//    }
    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let returnedView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: 30))
//        returnedView.backgroundColor = .white
//
//        return returnedView
//    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ArtistsCell")!
        let artist = alphabeticallySortedArtists[indexPath.section][indexPath.row]
        
        tableView.headerView(forSection: indexPath.section)?.contentView.backgroundColor = .clear
        
        cell.textLabel?.text = artist
        cell.imageView?.layer.masksToBounds = true
        cell.imageView?.layer.cornerRadius = (cell.imageView?.layer.frame.width)! / 2
        
        if let artistImage = UIImage(named: artist) {
            cell.imageView?.image = artistImage
        } else {
            cell.imageView?.image = UIImage(systemName: "music.mic")
        }
        
        return cell
    }
    
}

extension ArtistsViewController: UITableViewDelegate {
    
}
