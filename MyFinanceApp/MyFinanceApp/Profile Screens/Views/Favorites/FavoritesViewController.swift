//
//  FavoritesViewController.swift
//  MyFinanceApp
//
//  Created by Нияз Ризванов on 05.03.2024.
//

import UIKit

class FavoritesViewController: BaseViewController {

    private var favoritesView = FavoritesView(frame: .zero)

//    private let viewModel: FavoritesViewModel
//
//    init(viewModel: FavoritesViewModel) {
//        self.viewModel = viewModel
//        super.init(nibName: nil, bundle: nil)
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func loadView() {
        view = favoritesView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Избранные"

    }

}
