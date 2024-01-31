//
//  GalleryCollectionCell.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/31/24.
//

import UIKit

class GalleryCollectionCell: UICollectionViewCell {
    var photo: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(photo)
        
        photo.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0),
            photo.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            photo.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0),
            photo.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
        ])
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
