//
//  ViewController.swift
//  ImageCache
//
//  Created by playhong on 2023/10/29.
//

import UIKit

class ViewController: UIViewController {
    
    let urlList: [String] = [
        "https://img.freepik.com/premium-photo/banana-on-white-background_88281-24.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/strawberries-cut-in-half-and-whole-berries-ripe-berries-top-view-background-of-ripe-strawberries-delicious-natural-dessert_166373-2358.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/close-up-apples-on-branch_23-2150713362.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/premium-photo/snow-pear-fruit-in-wooden-basket-fresh-nashi-pear-or-korean-pear-fruit-in-the-basket_557176-989.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/top-view-of-pineapple-on-blue-surface_141793-1492.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/premium-photo/banana-on-white-background_88281-24.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/strawberries-cut-in-half-and-whole-berries-ripe-berries-top-view-background-of-ripe-strawberries-delicious-natural-dessert_166373-2358.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/close-up-apples-on-branch_23-2150713362.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/premium-photo/snow-pear-fruit-in-wooden-basket-fresh-nashi-pear-or-korean-pear-fruit-in-the-basket_557176-989.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/top-view-of-pineapple-on-blue-surface_141793-1492.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/premium-photo/banana-on-white-background_88281-24.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/strawberries-cut-in-half-and-whole-berries-ripe-berries-top-view-background-of-ripe-strawberries-delicious-natural-dessert_166373-2358.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/close-up-apples-on-branch_23-2150713362.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/premium-photo/snow-pear-fruit-in-wooden-basket-fresh-nashi-pear-or-korean-pear-fruit-in-the-basket_557176-989.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
        "https://img.freepik.com/free-photo/top-view-of-pineapple-on-blue-surface_141793-1492.jpg?size=626&ext=jpg&ga=GA1.1.489429765.1698598290&semt=sph",
    ]
    
    let collectionViewCellSize: CGFloat = (UIScreen.main.bounds.width - 4) / 3

    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: self.collectionViewCellSize, height: self.collectionViewCellSize)
        layout.minimumLineSpacing = 2
        layout.minimumInteritemSpacing = 2
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        return cv
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.register(ImageCell.self, forCellWithReuseIdentifier: ImageCell.identifier)
        setupLayout()
    }
    
    func setupLayout() {
        self.view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.collectionView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.collectionView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.collectionView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor),
            self.collectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor)
        ])
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return urlList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageCell.identifier, for: indexPath) as? ImageCell else { return UICollectionViewCell() }
        cell.imageView.setImageURLToCache(self.urlList[indexPath.row])
        return cell
    }
}

extension ViewController: UICollectionViewDelegate {
    
}

