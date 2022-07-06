//
//  StartBreathViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 24/06/22.
//

import UIKit

class StartBreathViewController: UIViewController {
    
    // MARK: - Properties
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Deep Breath"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Deep breathing means taking breaths that expand your stomach. It can lower stress level, reduce cravings, and improve lung function."
        label.font = UIFont.systemFont(ofSize: 15)
        label.textColor = .black
        label.numberOfLines = 0
        label.addInterlineSpacing(spacingValue: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "deep-breath.png")
        image.contentMode = .scaleToFill
        return image
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    @objc func buttonClicked() {
        print("Button Clicked")
        let controller = TimerViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: - Helpers
    
    func createButton() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        config.attributedTitle = AttributedString("Start", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseBackgroundColor = .smokeLessBlue
        config.titlePadding = 10
        return config
    }
    
    func configureUI(){
        view.backgroundColor = .white
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        button.configuration = createButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.center = view.center
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(image)
        view.addSubview(button)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.anchor(top:titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        image.anchor(top: subtitleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 40, paddingRight: 40, width: view.frame.size.width - 100, height: view.frame.size.width - 100)
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .smokeLessBlue
    }
    
}

// MARK: - Extensions

private extension UILabel {
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
                          ))
        
        attributedText = attributedString
    }
}
