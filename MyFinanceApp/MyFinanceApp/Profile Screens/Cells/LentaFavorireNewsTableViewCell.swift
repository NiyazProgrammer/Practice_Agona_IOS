import UIKit
import SnapKit

class LentaFavorireNewsTableViewCell: UITableViewCell {
    private lazy var appAvatar: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "LaunchImage"))
        return imageView
    }()

    private lazy var favoriteImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "favoriteDidTap"))
        imageView.tintColor = UIColor.orange
        return imageView
    }()

    private lazy var likeImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "like"))
        return imageView
    }()

    private lazy var newsImage: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .gray
        return imageView
    }()

    private lazy var appNameTitle: UILabel = {
        let label = UILabel()
        label.text = "My.Finance"
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = .black
        return label
    }()

    private lazy var datePublisher: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        return label
    }()

    private lazy var shortDescriptionNews: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.font = .systemFont(ofSize: 20)
        label.numberOfLines = 0
        return label
    }()

    private lazy var labelAndDateStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [appNameTitle, datePublisher])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()

    private lazy var actionForNewsStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likeImage])
        stackView.axis = .horizontal
        stackView.spacing = 15
        stackView.distribution = .fillEqually
        return stackView
    }()

    private let separatorForBodyAndLikeButton: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray
        return view
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        layer.cornerRadius = 20
        clipsToBounds = true
        setupLayout()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupLayout() {
        headerCard()
        bodyCard()
        footerCard()
    }

    private func headerCard() {
        contentView.addSubview(appAvatar)
        appAvatar.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalToSuperview().offset(10)
            make.width.height.equalTo(30)
        }

        contentView.addSubview(labelAndDateStackView)
        labelAndDateStackView.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.leading.equalTo(appAvatar.snp.trailing).offset(10)
        }

        contentView.addSubview(favoriteImage)
        favoriteImage.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.width.height.equalTo(30)
        }
    }

    private func bodyCard() {
        contentView.addSubview(newsImage)
        newsImage.snp.makeConstraints { make in
            make.top.equalTo(labelAndDateStackView.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(180)
        }
        newsImage.layer.cornerRadius = 20
        newsImage.clipsToBounds = true

        contentView.addSubview(shortDescriptionNews)
        shortDescriptionNews.snp.makeConstraints { make in
            make.top.equalTo(newsImage.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
        }

        contentView.addSubview(separatorForBodyAndLikeButton)
        separatorForBodyAndLikeButton.snp.makeConstraints { make in
            make.top.equalTo(shortDescriptionNews.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.trailing.equalToSuperview().offset(-10)
            make.height.equalTo(1)
        }
    }

    private func footerCard() {
        contentView.addSubview(actionForNewsStackView)
        actionForNewsStackView.snp.makeConstraints { make in
            make.top.equalTo(separatorForBodyAndLikeButton.snp.bottom).offset(10)
            make.leading.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
    }

    func configure(with news: News) {
        newsImage.image = news.picture
        shortDescriptionNews.text = news.shortDescription
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        datePublisher.text = dateFormatter.string(from: news.date)
        // MARK: Добавить правильное отображение лайка и избранное
    }
}
