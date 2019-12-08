//
//  DownloadedMusicViewController.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/05.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class DownloadedMusicViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground

        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Downloaded Music"
    }

}
