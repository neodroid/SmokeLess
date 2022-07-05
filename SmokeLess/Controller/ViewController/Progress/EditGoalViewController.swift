//
//  EditGoalViewController.swift
//  SmokeLess
//
//  Created by Kevin ahmad on 04/07/22.
//

import UIKit

protocol editGoalDelegate {
    func saveAndReload()
}

class EditGoalViewController: UIViewController {
    
    //MARK: - Properties
    
    var delegate: editGoalDelegate?
    let userDefaults = UserDefaults.standard
    var goals = ""
    var cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Cancel", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.tintColor = .smokeLessBlue
        button.addTarget(self, action: #selector(didClickedCancel), for: .touchUpInside)
        return button
    }()
    
    var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Save", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.addTarget(self, action: #selector(didClickedSave), for: .touchUpInside)
        button.tintColor = .smokeLessBlue
        return button
    }()
    
    var logoView: UIView = {
        let view = UIView()
        view.setDimensions(width: 120, height: 10)
        return view
    }()
    
    var giftImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "gift.fill")
        image?.withTintColor(UIColor.smokeLessBlue)
        imageView.setDimensions(width: 30, height: 30)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "My Goal"
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    var editView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.layer.borderColor = UIColor.smokeLessLightGray.cgColor
        view.layer.borderWidth = 1
        view.heightAnchor.constraint(equalToConstant: 350).isActive = true
        return view
    }()
    
    var editTextField: UITextView = {
        
        let textField = UITextView()
        textField.font = UIFont.systemFont(ofSize: 16)
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        return textField
    }()
    
    //MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        editTextField.text = userDefaults.string(forKey: "goals") ?? ""
        configureUI()
    }
    //MARK: - Selectors
    
    @objc func didClickedSave(){
        userDefaults.set(editTextField.text, forKey: "goals")
        delegate?.saveAndReload()
        self.dismiss(animated: true)
    }
    
    @objc func didClickedCancel(){
        self.dismiss(animated: true)
    }
    
    //MARK: - Helper
    func configureUI(){
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.topAnchor,left: view.leftAnchor, paddingTop: 30,paddingLeft: 20)
        
        view.addSubview(saveButton)
        saveButton.anchor(top: view.topAnchor,right: view.rightAnchor,paddingTop: 30,paddingRight: 20)
        
        view.addSubview(logoView)
        logoView.anchor(top: view.topAnchor, paddingTop: 25)
        logoView.centerX(inView: view)
        
        logoView.addSubview(giftImageView)
        //        giftImageView.anchor(top: )
        logoView.addSubview(titleLabel)
        titleLabel.anchor(left: giftImageView.rightAnchor)
        
        view.addSubview(editView)
        editView.anchor(top: cancelButton.bottomAnchor, left: cancelButton.leftAnchor,right: saveButton.rightAnchor,paddingTop: 30)
        
        editView.addSubview(editTextField)
        editTextField.anchor(top: editView.topAnchor, left: editView.leftAnchor,bottom: editView.bottomAnchor,right: editView.rightAnchor, paddingTop: 10, paddingLeft: 10, paddingBottom: 10, paddingRight: 10)
    }
    
    
}
