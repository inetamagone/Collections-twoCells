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
}

extension CustomCollectionCell: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.reuseId, for: indexPath) as? ImageCell else {return .init()}
        return cell
    }
}
