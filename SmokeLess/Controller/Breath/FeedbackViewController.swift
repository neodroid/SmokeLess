//
//  FeedbackViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 27/06/22.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    // MARK: - Properties
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Deep breath exercise finished"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "How are you feeling after doing the breathing exercise?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        
        let choice1 = UIButton(frame: CGRect(x: 0, y: 0, width: 175, height: 50))
        choice1.configuration = createChoice1()
        choice1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice1.center = view.center
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        button.configuration = createButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.center = view.center
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(choice1)
        view.addSubview(button)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        choice1.anchor(top: subtitleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    func createChoice1() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString("Continue", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseBackgroundColor = .smokeLessBlue
        config.titlePadding = 10
        return config
    }
    
    func createButton() -> UIButton.Configuration {
        var config: UIButton.Configuration = .filled()
        var container = AttributeContainer()
        container.font = UIFont.boldSystemFont(ofSize: 20)
        config.attributedTitle = AttributedString("Continue", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseBackgroundColor = .smokeLessBlue
        config.titlePadding = 10
        return config
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
