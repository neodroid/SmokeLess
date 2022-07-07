//
//  SecondUserPlanViewController.swift
//  SmokeLess
//
//  Created by Dylan Juliano Santoso on 28/06/22.
//

import UIKit

class SecondUserPlanViewController: UIPageViewController, UIPickerViewDelegate {
    
    //MARK: - Properties
    
    let userDefaults = UserDefaults.standard
    var startDate: Date = Date.now
    var cigaretteUse: Int = 1
    var stackView: UIStackView = {
        let stackview: UIStackView = UIStackView()
        stackview.axis = .horizontal
        stackview.distribution = .fillEqually
        stackview.alignment = .center
        stackview.spacing = 10
        return stackview
    }()
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "How many cigarette do you consume per day?"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image4.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .smokeLessBlue
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.layer.cornerRadius = 27
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    var pickerView: UIPickerView = {
        let pickerView = UIPickerView()
        return pickerView
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pickerView.delegate = self
        pickerView.dataSource = self
        
        let mStackView = UIStackView()
        mStackView.axis  = .horizontal
        mStackView.distribution  = .fillEqually
        mStackView.alignment = .center
        mStackView.spacing = 10

        let firstLine = createMyView("grayrectangle", bgColor: UIColor.smokeLessLightGray)
        let secondLine = createMyView("bluerectangle", bgColor: UIColor.smokeLessBlue)
        let thirdLine = createMyView("grayrectangle", bgColor: UIColor.smokeLessLightGray)

        mStackView.addArrangedSubview(firstLine)
        mStackView.addArrangedSubview(secondLine)
        mStackView.addArrangedSubview(thirdLine)

        mStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mStackView)
        
        NSLayoutConstraint.activate([
            mStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20.0),
            mStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20.0),
            mStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -20.0),
        ])
        
        configureUI()
        
    }
        
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    convenience init( startDate: Date ) {
        self.init()

        self.startDate = startDate
    }
    
    //MARK: - Selectors
    
    @objc func buttonClicked() {
        let controller = ThirdUserPlanViewController(startDate: self.startDate, cigaretteUse: self.cigaretteUse)
        navigationController?.pushViewController(controller, animated: true)
    }

    //MARK: - Helpers

    func configureUI() {

        view.backgroundColor = .white
        
        view.addSubview(titleLabel)
        view.addSubview(pickerView)
        view.addSubview(image)
        view.addSubview(button)

        image.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 120, paddingLeft: 40, paddingRight: 40, width: view.frame.size.width - 100, height: view.frame.size.width - 100)
        
        titleLabel.anchor(top: image.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingRight: 20)
        
        pickerView.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 0, paddingLeft: 80, paddingRight: 80)
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
}

    //MARK: - Extensions

    private extension UILabel {
        func addInterlineSpacing(spacingValue: CGFloat = 2) {
            guard let textString = text else { return }
            
            let attributedString = NSMutableAttributedString(string: textString)
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = spacingValue
            
            attributedString.addAttribute(.paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
            
            attributedText = attributedString
        }
        
    }

    extension SecondUserPlanViewController: UIPickerViewDataSource {
        func numberOfComponents(in pickerView: UIPickerView) -> Int {
            return 1
        }
        
        func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return 100
        }
        
        internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(row + 1)
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cigaretteUse = (row + 1)
    }
}
