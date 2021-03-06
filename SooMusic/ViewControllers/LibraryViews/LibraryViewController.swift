//
//  LibraryViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class LibraryViewController: UIViewController {
    
    let songCollectiveTypeTableView: UITableView = {
        let tableView = UITableView()
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var originalSongCollectiveTypeList = [
        "Playlists",
        "Artists",
        "Albums",
        "Songs",
        "Music Videos",
        "Genres",
        "Compilations",
        "Composers",
        "Downloaded Music",
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Library"
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Edit", style: .plain, target: self, action: #selector(editSongCollectiveType))
        
        setupSongCollectiveTypeTableView()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let indexPath = songCollectiveTypeTableView.indexPathForSelectedRow
        let currentCell = songCollectiveTypeTableView.cellForRow(at: indexPath!)
        let title = currentCell?.textLabel?.text
        
        segue.destination.title = title
    }
    
    func setupSongCollectiveTypeTableView() {
        songCollectiveTypeTableView.delegate = self
        songCollectiveTypeTableView.dataSource = self
        
        songCollectiveTypeTableView.register(UITableViewCell.self, forCellReuseIdentifier: SongCollectiveTypeTableViewCell.identifier)
        
        view.addSubview(songCollectiveTypeTableView)
        
        NSLayoutConstraint.activate([
            songCollectiveTypeTableView.topAnchor   .constraint(equalTo: self.view.topAnchor   ),
            songCollectiveTypeTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            songCollectiveTypeTableView.rightAnchor .constraint(equalTo: self.view.rightAnchor ),
            songCollectiveTypeTableView.leftAnchor  .constraint(equalTo: self.view.leftAnchor  ),
        ])
    }
    
    @objc
    func editSongCollectiveType() {
        if songCollectiveTypeTableView.isEditing {
            navigationItem.rightBarButtonItem!.title = "Edit"
            navigationItem.rightBarButtonItem!.style = .plain
            songCollectiveTypeTableView.setEditing(false, animated: true)
            
            songCollectiveTypeTableView.reloadData()
        } else {
            navigationItem.rightBarButtonItem!.title = "Done"
            navigationItem.rightBarButtonItem!.style = .done
            songCollectiveTypeTableView.setEditing(true, animated: true)
            
            songCollectiveTypeTableView.reloadData()
        }
    }
    
}

extension LibraryViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return originalSongCollectiveTypeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SongCollectiveTypeTableViewCell.identifier)!
        let  target = indexPath.row
        
        cell.accessoryType = .disclosureIndicator
        
        cell.textLabel?.text = originalSongCollectiveTypeList[target]
        cell.textLabel?.font = .systemFont(ofSize: 20)
        
        if tableView.isEditing { tableView.selectRow(at: indexPath, animated: true, scrollPosition: .none) }
        
        return cell
    }
    
}

extension LibraryViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
        return UITableViewCell.EditingStyle.init(rawValue: 3)!
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        let songCollectiveType = originalSongCollectiveTypeList[sourceIndexPath.row]
        
        originalSongCollectiveTypeList.remove(at: sourceIndexPath.row)
        originalSongCollectiveTypeList.insert(songCollectiveType, at: destinationIndexPath.row)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if !songCollectiveTypeTableView.isEditing {
            switch originalSongCollectiveTypeList[indexPath.row] {
            case "Playlists":
                let playlistVC = PlaylistsViewController()
                navigationController?.pushViewController(playlistVC, animated: true)
            case "Artists":
                let artistsVC = ArtistsViewController()
                navigationController?.pushViewController(artistsVC, animated: true)
            case "Albums":
                let albumsVC = AlbumsViewController()
                navigationController?.pushViewController(albumsVC, animated: true)
            case "Songs":
                let songsVC = SongsViewController()
                navigationController?.pushViewController(songsVC, animated: true)
            case "Music Videos":
                let musicVideosVC = MusicVideosViewController()
                navigationController?.pushViewController(musicVideosVC, animated: true)
            case "Genres":
                let genresVC = GenresViewController()
                navigationController?.pushViewController(genresVC, animated: true)
            case "Compilations":
                let compilationsVC = CompilationsViewController()
                navigationController?.pushViewController(compilationsVC, animated: true)
            case "Composers":
                let composersVC = ComposersViewController()
                navigationController?.pushViewController(composersVC, animated: true)
            case "Downloaded Music":
                let downloadedMusicVC = DownloadedMusicViewController()
                navigationController?.pushViewController(downloadedMusicVC, animated: true)
            default:
                break
            }
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}
