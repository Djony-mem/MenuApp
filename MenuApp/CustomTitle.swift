//
//  CustomTitle.swift
//  MenuApp
//
//  Created by brubru on 08.02.2023.
//

import UIKit

final class CustomTitle: UILabel {
    
    init(title: String) {
        super.init(frame: .zero)
        setupSelfLabel(title: title)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupSelfLabel(title: String) {
        text = title
        frame = CGRect(x: 5, y: 0, width: 220, height: 20)
        font = UIFont.boldSystemFont(ofSize: 25)
        textColor = .white
    }
}


