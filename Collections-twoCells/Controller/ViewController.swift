//
//  ViewController.swift
//  Collections-twoCells
//
//  Created by ineta.magone on 24/02/2022.
//

import UIKit

class ViewController: UIViewController {
    
    let pictureList: [PictureData] = [
        PictureData(imageGallery: ["forest", "green", "sun", "yellow", "tree", "red"]),
        PictureData(imageGallery: ["red", "tree", "yellow", "sun", "green" , "red"]),
        PictureData(imageGallery: ["yellow", "sun", "green", "forest", "red", "tree"])
    ]
    
    @IBOutlet weak var mainCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainCollectionView.dataSource = self
        mainCollectionView.register(CustomCollectionCell.self, forCellWithReuseIdentifier: CustomCollectionCell.reuseId)
        mainCollectionView.backgroundColor = .lightGray
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return pictureList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = mainCollectionView.dequeueReusableCell(withReuseIdentifier: CustomCollectionCell.reuseId, for: indexPath) as? CustomCollectionCell else {return .init()}
        cell.configure(pictureList: pictureList)
        return cell
    }
}
