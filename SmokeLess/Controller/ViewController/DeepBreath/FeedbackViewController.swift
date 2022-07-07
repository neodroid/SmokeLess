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
        
        let choice1 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice1.configuration = createChoice1()
        choice1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice1.layer.borderWidth = 2
        choice1.layer.cornerRadius = 25
        choice1.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice1.center = view.center
        
        let choice2 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice2.configuration = createChoice2()
        choice2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice2.layer.borderWidth = 2
        choice2.layer.cornerRadius = 25
        choice2.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice2.center = view.center
        
        let choice3 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice3.configuration = createChoice3()
        choice3.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice3.layer.borderWidth = 2
        choice3.layer.cornerRadius = 25
        choice3.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice3.center = view.center
        
        let choice4 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice4.configuration = createChoice4()
        choice4.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice4.layer.borderWidth = 2
        choice4.layer.cornerRadius = 25
        choice4.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice4.center = view.center
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        button.configuration = createButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.center = view.center
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(choice1)
        view.addSubview(choice2)
        view.addSubview(choice3)
        view.addSubview(choice4)
        view.addSubview(button)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        choice1.anchor(top: subtitleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 70, paddingBottom: 20, paddingRight: 70)
        choice2.anchor(top: choice1.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 70, paddingBottom: 20, paddingRight: 70)
        choice3.anchor(top: choice2.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 70, paddingBottom: 20, paddingRight: 70)
        choice4.anchor(top: choice3.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 70, paddingBottom: 20, paddingRight: 70)
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    func createChoice1() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString("Very relaxed", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseForegroundColor = .smokeLessBlue
        config.baseBackgroundColor = .white
        config.titlePadding = 10
        return config
    }
    
    func createChoice2() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString("Relaxed", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseForegroundColor = .smokeLessBlue
        config.baseBackgroundColor = .white
        config.titlePadding = 10
        return config
    }
    
    func createChoice3() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString("Restless", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseForegroundColor = .smokeLessBlue
        config.baseBackgroundColor = .white
        config.titlePadding = 10
        return config
    }
    
    func createChoice4() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString("Not finished", attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseForegroundColor = .smokeLessBlue
        config.baseBackgroundColor = .white
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
