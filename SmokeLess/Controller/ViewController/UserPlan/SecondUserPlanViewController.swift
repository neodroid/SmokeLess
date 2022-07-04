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
        
        titleLabel.anchor(top: image.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
        
        pickerView.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 80, paddingRight: 80)
        pickerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
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
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        cigaretteUse = (row + 1)
    }
}
