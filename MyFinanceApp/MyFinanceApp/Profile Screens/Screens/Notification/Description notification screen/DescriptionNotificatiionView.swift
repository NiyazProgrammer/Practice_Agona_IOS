//
//  DescriptionNotificatiionView.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 10.04.2024.
//

import UIKit

class DescriptionNotificatiionView: UIView {

    lazy var descriptionNotificatiionLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 16)
        label.textColor = .black
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(descriptionNotificatiionLabel)
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        
    }

}
