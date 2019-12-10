//
//  ArtistsViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ArtistsViewController: UIViewController {
    
    private var artists = [
        "Jungle", "HONNE", "Rhye", "Jeremy Zucker", "Still Woozy", "How Great Were the Robins", "carpetgarden", "Mac DeMarco", "SALES", "Hippo Campus", "Mild Orange", "Imagine Dragons", "Coldplay", "Queen", "Finding Hope", "Lauv", "Ten Sleep", "Bruno Major", "Russ", "Unknown Mortal Orchestra", "AJR", "Alexsander 23", "blink-182", "Daniel Caesar", "Ed Sheeran", "Fazerdaze", "Frank Sinatra", "Foster the People", "Grouplove", "kennytheking", "Nauset Light", "Oasis", "Post Malone", "Vance Joy", "Wingtip", "XXXTENTACION", "Years & Years", "Zac Brown Band", "2Pac", "21 Savage",
    ]
    
    private var sortedFirstLetters = Array<String>()
    private var alphabeticallySortedArtists = [[String]]()
    
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
        
        setupArtistsData()
        setupArtistsTableView()
    }
    
    private func setupArtistsTableView() {
        artistsTableView.delegate = self
        artistsTableView.dataSource = self
        
        artists.sort()
        
        for artist in artists {
            let firstLetter = String(artist.first!).uppercased()
            let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ"
            
            if alphabet.contains(firstLetter) {
                sortedFirstLetters.append(String(artist.first!).uppercased())
            }
            
        }
        
        sortedFirstLetters = Array(Set(sortedFirstLetters))
        sortedFirstLetters.sort()
        
        alphabeticallySortedArtists = sortedFirstLetters.map { firstLetter in
            return artists
                .filter { $0.first!.uppercased() == firstLetter }
        }
        
        artistsTableView.register(ArtistsTableViewCell.self, forCellReuseIdentifier: ArtistsTableViewCell.identifier)
        
        view.addSubview(artistsTableView)
        
        NSLayoutConstraint.activate([
            artistsTableView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            artistsTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            artistsTableView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            artistsTableView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }
    
    private func setupArtistsData() {
        let alphabet = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLKMNOPQRSTUVWXYZ"
        
        artists.sort()
        
        for artist in artists {
            let firstLetter = String(artist.first!).uppercased()
            
            if !alphabet.contains(firstLetter) {
                sortedFirstLetters.append("#")
            } else {
                sortedFirstLetters.append(firstLetter)
            }
        }
        
        sortedFirstLetters = Array(Set(sortedFirstLetters)).sorted()
        
        alphabeticallySortedArtists = sortedFirstLetters.map { firstLetter in
            return artists.filter { artist -> Bool in
                if firstLetter == "#" {
                    if !alphabet.contains(String(artist.first!)) {
                        return true
                    }
                }
                return artist.first!.uppercased() == firstLetter
            }
        }
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
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        view.tintColor = .systemBackground
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: ArtistsTableViewCell.identifier) as! ArtistsTableViewCell
        let artist = alphabeticallySortedArtists[indexPath.section][indexPath.row]
        
        cell.artistLabel.text = artist
        
        if let artistImage = UIImage(named: artist) {
            cell.artistImageView.image = artistImage
        } else {
            cell.artistImageView.image = UIImage(systemName: "music.mic")
        }
        
        return cell
    }
    
}

extension ArtistsViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let artistVC = ArtistViewController()
        artistVC.artist = alphabeticallySortedArtists[indexPath.section][indexPath.row]
        navigationController?.pushViewController(artistVC, animated: true)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
