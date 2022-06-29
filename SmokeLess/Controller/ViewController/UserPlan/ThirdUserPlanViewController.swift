//
//  ThirdUserPlanViewController.swift
//  SmokeLess
//
//  Created by Dylan Juliano Santoso on 28/06/22.
//

import UIKit

class ThirdUserPlanViewController: UIPageViewController {
    
    //MARK: - Properties
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "What is your goals to stop smoking?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "We will help you quit smoking with the tapering method, which means gradually lessening your cigarette intake."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image5.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Start Your Journey", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .smokeLessBlue
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.layer.cornerRadius = 27
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    var textField: UITextField = {
        let textField = UITextField(frame: CGRect(x: 10.0, y: 100.0, width: 10.0, height: 50.0))
        
        //Border Hitam di Text Field
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: 385, height: 2.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.borderStyle = .line
        textField.layer.addSublayer(bottomLine)
        
        textField.keyboardAppearance = .default
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.placeholder = "Enter your goal"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = UITextField.BorderStyle.none
        
        return textField
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        configureUI()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    //MARK: - Selectors
    
    @objc func buttonClicked() {
        print("worked")
        let controller = ViewController()
        //navigationController?.pushViewController(controller, animated: true)
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }

    //MARK: - Helpers

    func configureUI() {

        view.backgroundColor = .white

        view.addSubview(titleLabel)
        view.addSubview(textField)
        view.addSubview(image)
        view.addSubview(button)

        image.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 120, paddingLeft: 40, paddingRight: 40, width: view.frame.size.width - 100, height: view.frame.size.width - 100)
        
        titleLabel.anchor(top: image.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        
        textField.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingRight: 20)
        textField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
}

    //MARK: - Extensions

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
