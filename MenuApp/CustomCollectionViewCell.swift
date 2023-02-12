//
//  CustomCollectionViewCell.swift
//  MenuApp
//
//  Created by brubru on 09.02.2023.
//

import UIKit

// MARK: - CustomCollectionViewCell
final class CustomCollectionViewCell: UICollectionViewCell {
    private let cardImageView = UIImageView()

    // MARK: - Initializer
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupContentView()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Override Methods
    override func prepareForReuse() {
        super.prepareForReuse()
        cardImageView.image = nil
    }
    
    
    func configure(imageName: String) {
        cardImageView.image = UIImage(named: imageName)
    }
}

// MARK: - Setting ContentView
private extension CustomCollectionViewCell {
    func setupContentView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        layer.cornerRadius = 25
        
        setupDogImage()
        addSubviews()
        setupLayout()
    }
}

// MARK: - Setting
private extension CustomCollectionViewCell {
    func addSubviews() {
        contentView.addSubview(cardImageView)
    }
    
    func setupDogImage() {
        cardImageView.layer.cornerRadius = 25
        cardImageView.clipsToBounds = true
        cardImageView.contentMode = .scaleToFill
    }
}

// MARK: - Layout
private extension CustomCollectionViewCell {
    func setupLayout() {
        cardImageView.translatesAutoresizingMaskIntoConstraints = false
        
        cardImageView.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        cardImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        cardImageView.rightAnchor.constraint(equalTo: rightAnchor, constant: 0).isActive = true
        cardImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
    }
}
