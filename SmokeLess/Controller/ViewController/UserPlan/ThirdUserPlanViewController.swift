//
//  ThirdUserPlanViewController.swift
//  SmokeLess
//
//  Created by Dylan Juliano Santoso on 28/06/22.
//

import UIKit

class ThirdUserPlanViewController: UIPageViewController {
    
    //MARK: - Properties
    
    let userDefaults = UserDefaults.standard
    var startDate: Date = Date()
    var cigaretteUse: Int? = 1
    var goals: String? = ""
    
    
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
        let textField = UITextField(frame: CGRect(x: 10.0, y: 100.0, width: 350.0, height: 50.0))
                
        //Border Hitam di Text Field
        var bottomLine = CALayer()
        bottomLine.frame = CGRect(x: 0.0, y: textField.frame.height - 1, width: textField.frame.width, height: 2.0)
        bottomLine.backgroundColor = UIColor.black.cgColor
        textField.backgroundColor = .white
        textField.borderStyle = .line
        textField.layer.addSublayer(bottomLine)
        
        textField.keyboardAppearance = .default
        textField.textAlignment = .center
        textField.keyboardType = .default
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.placeholder = "Enter your goal"
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.borderStyle = UITextField.BorderStyle.none
        
        return textField
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        textField.delegate = self
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
       view.addGestureRecognizer(tap)
        let mStackView = UIStackView()
        mStackView.axis  = .horizontal
        mStackView.distribution  = .fillEqually
        mStackView.alignment = .center
        mStackView.spacing = 10

        let firstLine = createMyView("grayrectangle", bgColor: UIColor.smokeLessLightGray)
        let secondLine = createMyView("grayrectangle", bgColor: UIColor.smokeLessLightGray)
        let thirdLine = createMyView("bluerectangle", bgColor: UIColor.smokeLessBlue)

        mStackView.addArrangedSubview(firstLine)
        mStackView.addArrangedSubview(secondLine)
        mStackView.addArrangedSubview(thirdLine)

        mStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mStackView)
        
        NSLayoutConstraint.activate([
            mStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5.0),
            mStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            mStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
        ])
        
        configureUI()
        configureNotificationObservers()
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    convenience init( startDate: Date, cigaretteUse: Int ) {
        self.init()

        self.startDate = startDate
        self.cigaretteUse = cigaretteUse
    }
    
    //MARK: - Selectors
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @objc func buttonClicked() {
        if(textField.hasText) {
            self.goals = textField.text
            
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "d/M/yyyy"
            let actualDate = dateFormatter.string(from: startDate)
                        
            userDefaults.set(actualDate, forKey: "startDate")
            userDefaults.set(cigaretteUse, forKey: "cigaretteUse")
            userDefaults.set(goals, forKey: "goals")
            segueToTabBar()
            
        }
        else {
            let alert = UIAlertController(title: "Goals Empty", message: "Please add your goals", preferredStyle: .alert)
            let okayButton = UIAlertAction(title: "Okay", style: .default, handler: nil)
            alert.addAction(okayButton)
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    @objc func keyboardWillShow() {
        if view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 88
        }
    }
    
    @objc func keyboardWillHide() {
        if view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
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
        
        textField.anchor(top: titleLabel.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 100, paddingLeft: 20, paddingRight: 20)
        
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }
    
    func createMyView(_ imageName: String, bgColor: UIColor) -> UIView {
        
        let myView = UIView()
        myView.backgroundColor = bgColor

        let vStackView = UIStackView()
        vStackView.axis  = .vertical
        vStackView.alignment = .center
        vStackView.distribution  = .fill
        vStackView.spacing = 1

        let vImageName = imageName
        let vImageView = UIImageView()

        if let vImage = UIImage(named: vImageName) {
            vImageView.image = vImage
        }

        myView.addSubview(vStackView)

        vStackView.addArrangedSubview(vImageView)
        
        myView.translatesAutoresizingMaskIntoConstraints = false
        vStackView.translatesAutoresizingMaskIntoConstraints = false
        vImageView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            vImageView.widthAnchor.constraint(equalTo: myView.widthAnchor),
            vImageView.heightAnchor.constraint(equalToConstant: 5.0),

            vStackView.topAnchor.constraint(equalTo: myView.topAnchor, constant: 0.0),
            vStackView.bottomAnchor.constraint(equalTo: myView.bottomAnchor, constant: 0.0),
            vStackView.leadingAnchor.constraint(equalTo: myView.leadingAnchor, constant: 0.0),
            vStackView.trailingAnchor.constraint(equalTo: myView.trailingAnchor, constant: 0.0),
        ])
        
        return myView
        
    }
    
    func segueToTabBar() {
        let controller = TabBarController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
    
    func configureNotificationObservers() {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
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

extension ThirdUserPlanViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // dismiss keyboard
        return true
    }
}
