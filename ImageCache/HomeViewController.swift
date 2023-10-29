//
//  HomeViewController.swift
//  ImageCache
//
//  Created by playhong on 2023/10/30.
//

import UIKit

class HomeViewController: UIViewController {
    
    lazy var nsCacheButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("NSCache Test", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(nsCacheButtonTapped), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        addSubviews()
        setupLayout()
    }
    
    func addSubviews() {
        self.view.addSubview(nsCacheButton)
    }
    
    func setupLayout() {
        nsCacheButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nsCacheButton.widthAnchor.constraint(equalToConstant: 200),
            nsCacheButton.heightAnchor.constraint(equalToConstant: 50),
            nsCacheButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            nsCacheButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func nsCacheButtonTapped() {
        let moveVC = ViewController()
        navigationController?.pushViewController(moveVC, animated: true)
    }
}
