//
//  FeedbackViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 27/06/22.
//

import UIKit

class FeedbackViewController: UIViewController {
    
    // MARK: - Properties
    
    var buttonView = UIView()
    var buttonTitle = String()
    var allButtons = [UIButton]()
    
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
        buttonView.frame = CGRect(x: 0, y: subtitleLabel.frame.maxY + 20, width: view.frame.size.width, height: view.frame.size.height - 100)
    }
    
    @objc func buttonClicked(sender: UIButton) {
        print("Button Clicked")
        
        allButtons[0].setTitle("Very relaxed", for: .normal)
        allButtons[0].configuration = createChoice1()
        allButtons[0].titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        allButtons[1].setTitle("Relaxed", for: .normal)
        allButtons[1].configuration = createChoice2()
        allButtons[1].titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        allButtons[2].setTitle("Restless", for: .normal)
        allButtons[2].configuration = createChoice3()
        allButtons[2].titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        allButtons[3].setTitle("Not finished", for: .normal)
        allButtons[3].configuration = createChoice4()
        allButtons[3].titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        
        buttonTitle = sender.currentTitle!
        sender.configuration = selectButton()
    }
    
    @objc func nextClicked() {
        print("Button Clicked")
        
        if buttonTitle == "Very relaxed" || buttonTitle == "Relaxed" {
            let defaults = UserDefaults.standard
            let feedindex = 1
            defaults.set(feedindex,forKey: "feedback")
            defaults.synchronize()
            
            let vc = DoneViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else if buttonTitle == "Restless" || buttonTitle == "Not finished" {
            let defaults = UserDefaults.standard
            let feedindex = 2
            defaults.set(feedindex,forKey: "feedback")
            defaults.synchronize()
            
            let vc = DoneViewController()
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        }
        else {
            print("No input")
        }
    }
    
    // MARK: - Helpers
    
    private func configureUI() {
        view.backgroundColor = .white
        
        let choice1 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice1.setTitle("Very relaxed", for: .normal)
        choice1.configuration = createChoice1()
        choice1.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice1.layer.borderWidth = 2
        choice1.layer.cornerRadius = 25
        choice1.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        
        choice1.addTarget(self, action: #selector((buttonClicked)), for: .touchUpInside)
        choice1.center = view.center
        
        let choice2 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice2.setTitle("Relaxed", for: .normal)
        choice2.configuration = createChoice2()
        choice2.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice2.layer.borderWidth = 2
        choice2.layer.cornerRadius = 25
        choice2.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice2.addTarget(self, action: #selector((buttonClicked)), for: .touchUpInside)
        choice2.center = view.center
        
        let choice3 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice3.setTitle("Restless", for: .normal)
        choice3.configuration = createChoice3()
        choice3.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice3.layer.borderWidth = 2
        choice3.layer.cornerRadius = 25
        choice3.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice3.addTarget(self, action: #selector((buttonClicked)), for: .touchUpInside)
        choice3.center = view.center
        
        let choice4 = UIButton(frame: CGRect(x: 0, y: 0, width: 170, height: 50))
        choice4.setTitle("Not finished", for: .normal)
        choice4.configuration = createChoice4()
        choice4.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        choice4.layer.borderWidth = 2
        choice4.layer.cornerRadius = 25
        choice4.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
        choice4.addTarget(self, action: #selector((buttonClicked)), for: .touchUpInside)
        choice4.center = view.center
        
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
        button.configuration = createButton()
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector((nextClicked)), for: .touchUpInside)
        button.center = view.center
        
        buttonView.addSubview(choice1)
        buttonView.addSubview(choice2)
        buttonView.addSubview(choice3)
        buttonView.addSubview(choice4)
        
        allButtons.append(choice1)
        allButtons.append(choice2)
        allButtons.append(choice3)
        allButtons.append(choice4)
        
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(buttonView)
        view.addSubview(button)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        choice1.anchor(top: buttonView.topAnchor, left: buttonView.safeAreaLayoutGuide.leftAnchor, right: buttonView.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 20, paddingRight: 50)
        choice2.anchor(top: choice1.bottomAnchor, left: buttonView.safeAreaLayoutGuide.leftAnchor, right: buttonView.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 20, paddingRight: 50)
        choice3.anchor(top: choice2.bottomAnchor, left: buttonView.safeAreaLayoutGuide.leftAnchor, right: buttonView.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 20, paddingRight: 50)
        choice4.anchor(top: choice3.bottomAnchor, left: buttonView.safeAreaLayoutGuide.leftAnchor, right: buttonView.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 50, paddingBottom: 20, paddingRight: 50)
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
    
    func selectButton() -> UIButton.Configuration {
        var config: UIButton.Configuration = .bordered()
        var container = AttributeContainer()
        container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        config.attributedTitle = AttributedString(buttonTitle, attributes: container)
        config.cornerStyle = .capsule
        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
        config.baseForegroundColor = .white
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
