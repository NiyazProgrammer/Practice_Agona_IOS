import UIKit
import SnapKit

// MARK: Не получилось применить
class FavoriteNavScrollerCollectionViewCell: UICollectionViewCell {
    private lazy var titleNavigation: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 18)
        return label
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleNavigation)
        setupLayout()
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupLayout() {
        titleNavigation.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview()
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview()
        }
    }

    func configure(for titleText: String) {
        titleNavigation.text = titleText
    }
}

extension FavoriteNavScrollerCollectionViewCell {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}
