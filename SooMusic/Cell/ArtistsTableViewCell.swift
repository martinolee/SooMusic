//
//  ArtistsTableViewCell.swift
//  SooMusic
//
//  Created by Soohan Lee on 2019/12/09.
//  Copyright © 2019 Soohan. All rights reserved.
//

import UIKit

class ArtistsTableViewCell: UITableViewCell {
    
    let artistImageView: UIImageView = {
        let imageView = UIImageView()
        
        imageView.frame = CGRect(x: 0, y: 0, width: 50, height: 52)
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = (imageView.layer.frame.width) / 2
        
        return imageView
    }()
    
    let artistLabel: UILabel = {
        let label = UILabel()
        
        label.frame = CGRect(x: 50, y: 0, width: 300, height: 52)
        label.textColor = .label
        
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(artistImageView)
        contentView.addSubview(artistLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
