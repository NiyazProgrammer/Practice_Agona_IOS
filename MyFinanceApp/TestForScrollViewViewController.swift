import UIKit
class TestForScrollViewViewController: UIViewController {

    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private let image: UIImageView = {
        let image = UIImageView(image: UIImage(named: "backgroundImageProfile"))
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .gray
        image.contentMode = .scaleAspectFit
        return image
    }()

    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.alignment = .center
        stackView.spacing = 20
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
//        contentView.addSubview(stackView)
        contentView.addSubview(image)

//        setupColors()
        setupViewsConstraints()

    }
}

extension TestForScrollViewViewController {
    private func setupViewsConstraints() {
//        stackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),

            image.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            image.rightAnchor.constraint (equalTo: self.contentView.rightAnchor),
            image.leftAnchor.constraint (equalTo: self.contentView.leftAnchor),
            image.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            image.widthAnchor.constraint(equalToConstant: 200),
            image.heightAnchor.constraint(equalToConstant: 2000),
        ])

//        for view in stackView.arrangedSubviews {
//            NSLayoutConstraint.activate ([
//                view.widthAnchor.constraint (equalToConstant: 300),
//                view.heightAnchor.constraint (equalToConstant: 100)
//            ])
//        }
    }

//    private func setupColors() {
//        let colors = [UIColor.red, .green, .blue]
//
//        for index in 0..<10 {
//            let view = UIView()
//            view.backgroundColor = colors[index % colors.count]
//            stackView.addArrangedSubview(view)
//        }
//    }
}
