//
//  CustomCollectionCell.swift
//  Collections-twoCells
//
//  Created by ineta.magone on 24/02/2022.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    static var reuseId: String = "customCell"
    
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var pictureList: [PictureData] = []
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        setupItems()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initView() {
        Bundle.main.loadNibNamed("CustomCollectionCell", owner: self, options: nil)
        addSubview(commonView)
        NSLayoutConstraint.activate([
            commonView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commonView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commonView.topAnchor.constraint(equalTo: topAnchor),
            commonView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        commonView.backgroundColor = .green
    }
    func setupItems() {
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.reuseId)
        collectionView.backgroundColor = .systemPink
        backgroundColor = .red
    }
    
    func configure (pictureList: [PictureData]) {
        self.pictureList = pictureList
    }
    
    
}

extension CustomCollectionCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print(pictureList[tag].imageGallery.count)
        return pictureList[tag].imageGallery.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseId, for: indexPath) as? ImageCell else {return .init()}
        let pictureName = pictureList[0].imageGallery[indexPath.row]
        cell.setGallery(pictureName: pictureName)
        return cell
    }
}
