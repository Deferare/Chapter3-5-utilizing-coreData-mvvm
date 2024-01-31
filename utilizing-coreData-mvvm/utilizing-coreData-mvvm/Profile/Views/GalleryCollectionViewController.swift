//
//  GalleryCollectionViewController.swift
//  utilizing-coreData-mvvm
//
//  Created by JiHoon K on 1/31/24.
//

import UIKit

class GalleryCollectionViewController: UICollectionViewController {
    private let reuseIdentifier = "galleryCell"
    let itemsPerRow: CGFloat = 3
    let sectionInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    
    var photoNames = [String]()
    
    init() {
        let flowLayout = UICollectionViewFlowLayout()
        super.init(collectionViewLayout: flowLayout)
        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow
        
        flowLayout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        flowLayout.sectionInset = sectionInsets
        flowLayout.minimumInteritemSpacing = sectionInsets.left
        flowLayout.minimumLineSpacing = sectionInsets.left
        
        self.collectionView!.register(GalleryCollectionCell.self, forCellWithReuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...9 {
            photoNames.append("picture-\(i)")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        guard let collectionView = collectionView, let flowLayout = collectionViewLayout as? UICollectionViewFlowLayout else { return }

        let paddingSpace = sectionInsets.left * (itemsPerRow + 1)
        let availableWidth = collectionView.frame.width - paddingSpace
        let widthPerItem = availableWidth / itemsPerRow

        flowLayout.itemSize = CGSize(width: widthPerItem, height: widthPerItem)
        flowLayout.sectionInset = sectionInsets
        flowLayout.minimumInteritemSpacing = sectionInsets.left
        flowLayout.minimumLineSpacing = sectionInsets.left
    }
}

//MARK: - DataSource
extension GalleryCollectionViewController {
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photoNames.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as? GalleryCollectionCell else {
            fatalError("Unable to dequeue GalleryCollectionCell")
        }
        
        cell.photo.image = UIImage(named: photoNames[indexPath.row])
        return cell
    }
}
