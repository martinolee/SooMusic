//
//  AlbumCollectionViewCell.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/10.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class AlbumCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "SongCollectiveTypeCell"
    
    let albumImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 52)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = (imageView.layer.frame.width) / 2
        
        return imageView
    }()
    
    let albumTitleLabel: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 0, y: 0, width: 300, height: 50)
        label.text = "albumTitleLabel"
        label.textColor = .label
        label.textAlignment = .left
        
        return label
    }()
    
    let albumReleaseYearLabel: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 0, y: 50, width: 300, height: 50)
        label.text = "albumReleaseYearLabel"
        label.textColor = .label
        label.textAlignment = .left
        
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(albumImageView)
        addSubview(albumTitleLabel)
        addSubview(albumReleaseYearLabel)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
