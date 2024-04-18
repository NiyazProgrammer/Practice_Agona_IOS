import UIKit
import SnapKit

class FavoritesView: UIView {
    private let collectionTitleText = Resources.Strings.all

    private lazy var navigationHorizontalScroll: UICollectionView = {
        var size = ((UIScreen.main.bounds.size.width) / 4) - 10
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: size, height: size)
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.isPagingEnabled = false
        collectionView.showsHorizontalScrollIndicator = true
        collectionView.backgroundColor = .clear
        collectionView.register(
            FavoriteNavScrollerCollectionViewCell.self,
            forCellWithReuseIdentifier: FavoriteNavScrollerCollectionViewCell.reuseIdentifier)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(navigationHorizontalScroll)
        navigationHorizontalScroll.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(50)
        }
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension FavoritesView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionTitleText.count
    }

    func collectionView(
        _ collectionView: UICollectionView,
        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        if let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: FavoriteNavScrollerCollectionViewCell.reuseIdentifier,
            for: indexPath) as? FavoriteNavScrollerCollectionViewCell {
            cell.configure(for: collectionTitleText[indexPath.row])
            return cell
        } else {
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if indexPath.row == 0 {

        } else {

        }
    }
}
