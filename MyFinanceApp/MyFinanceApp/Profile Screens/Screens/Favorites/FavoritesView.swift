import UIKit
import SnapKit

class FavoritesView: UIView {
    lazy var lentaNewsTable: UITableView = {
        let table = UITableView()
        table.backgroundColor = .clear
        table.separatorStyle = .none
        table.showsVerticalScrollIndicator = false
        table.register(LentaFavorireNewsTableViewCell.self, forCellReuseIdentifier: "LentaNews")
        return table
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(lentaNewsTable)
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupLayout() {
        lentaNewsTable.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(20)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.bottom.equalToSuperview()
        }
    }
}

