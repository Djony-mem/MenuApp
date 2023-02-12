//
//  ViewController.swift
//  MenuApp
//
//  Created by brubru on 07.02.2023.
//

import UIKit

// MARK: - MainCollectionViewController
final class MainCollectionViewController: UICollectionViewController {
    
    private var topMenu = UIMenu()
    private var imageMenu = UIMenu()
    private let cards = ["card_3", "card_4", "card_5", "card_6"]
    
    private let titleNavBar = CustomTitle(title: "Главная")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()

    }
}

// MARK: - Setting View
private extension MainCollectionViewController {
    func setupView() {

        setupTopMenu()
        setupImageManu()
        
        setupNavigationBar()
        setupCollectionView()
    }
}

// MARK: - Setting
private extension MainCollectionViewController {

    func setupTopMenu() {
        let story = UIAction(title: "История", image: UIImage(systemName: "camera.metering.partial")) { _ in }
        let note = UIAction(title: "Запись", image: UIImage(systemName: "pencil.line")) { _ in }
        let photo = UIAction(title: "Фото", image: UIImage(systemName: "photo")) { _ in }
        let copyLink = UIAction(title: "Скопировать ссылку", image: UIImage(systemName: "doc.on.doc")) { _ in }
        let shareProfile = UIAction(title: "Поделится профилем", image: UIImage(systemName: "square.and.arrow.up.circle")) { _ in }
        
        let submenu = UIMenu(title: "Ещё", children: [copyLink, shareProfile])
        topMenu = UIMenu(title: "Options", children: [story, note, photo, submenu])
    }
    
    func setupImageManu() {
        let shareImage = UIAction(title: "Поделиться", image: UIImage(systemName: "square.and.arrow.up")) { _ in }
        let favorite = UIAction(title: "Избранное", image: UIImage(systemName: "heart")) { _ in }
        let delete = UIAction(title: "Удалить", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in }
        
        imageMenu = UIMenu(title: "Options", children: [shareImage, favorite, delete])
    }
    
    func setupNavigationBar() {

        let barItemRight = UIBarButtonItem(image: UIImage(systemName: "list.bullet"), menu: topMenu)
        
        navigationItem.rightBarButtonItem = barItemRight
        navigationItem.titleView = titleNavBar
        
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func setupCollectionView() {
        collectionView.backgroundColor = #colorLiteral(red: 0.4856178761, green: 0.6226238608, blue: 0.6979213953, alpha: 1)
        
        collectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: String(describing: CustomCollectionViewCell.self))
    }
}


// MARK: - UICollectionViewDataSource
extension MainCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        cards.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CustomCollectionViewCell.self), for: indexPath) as? CustomCollectionViewCell else { return UICollectionViewCell()}
        let card = cards[indexPath.row]
        cell.configure(imageName: card)
        return cell
    }
}

// MARK: - UICollectionViewDelegate
extension MainCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { _ in
            self.imageMenu
        }
    }
}


// MARK: - UICollectionViewDelegateFlowLayout
extension MainCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: collectionView.frame.width - 40 , height: collectionView.frame.width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        20
    }
}
