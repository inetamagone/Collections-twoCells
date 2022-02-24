//
//  ImageCell.swift
//  Collections-twoCells
//
//  Created by ineta.magone on 24/02/2022.
//

import UIKit

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var commonView: UIView!
    @IBOutlet weak var myImage: UIImageView!
    
    static let reuseId: String = "imageCell"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initView()
        backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func initView() {
        Bundle.main.loadNibNamed("ImageCell", owner: self, options: nil)
        addSubview(commonView)
        NSLayoutConstraint.activate([
            commonView.leadingAnchor.constraint(equalTo: leadingAnchor),
            commonView.trailingAnchor.constraint(equalTo: trailingAnchor),
            commonView.topAnchor.constraint(equalTo: topAnchor),
            commonView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
        commonView.backgroundColor = .black
    }
    
    func setGallery(pictureName: String) {
        myImage.image = UIImage(named: pictureName)
    }
}
