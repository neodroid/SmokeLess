//
//  ChangeMonthViewController.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 24/06/22.
//

import UIKit

protocol MonthChangeDelegate: AnyObject {
    func userEnterMonthAndYear(month: String, year:String)
}

class ChangeMonthController: UIViewController {
    
    //MARK: - Properties
    
    var delegate: MonthChangeDelegate?
    
    var currPickedMonth = 11
    var currPickedYear = 2024
    
    private let closeButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Done", for: .normal)
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.layer.cornerRadius = 18
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(didClickedDone), for: .touchUpInside)
        return button
    }()
    
    private let monthPick: UIPickerView = {
        let uiPicker = UIPickerView()
        uiPicker.tintColor = .black
        return uiPicker
    }()
    
    private let yearPick: UIPickerView = {
        let uiPicker = UIPickerView()
        uiPicker.tintColor = .black
        return uiPicker
    }()
    
    lazy var whiteView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        return view
    }()
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
    
        monthPick.delegate = self
        monthPick.dataSource = self
        yearPick.delegate = self
        yearPick.dataSource = self
        
        view.addSubview(whiteView)
        whiteView.anchor(left: view.leftAnchor,bottom: view.bottomAnchor,right: view.rightAnchor)
        whiteView.setDimensions(width: view.frame.width, height: view.frame.height/2)
        
        whiteView.addSubview(closeButton)
        closeButton.anchor(top:whiteView.topAnchor, right: whiteView.rightAnchor,paddingTop: 10, paddingRight: 20)
        
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.spacing   = 16.0
        
        stack.addArrangedSubview(monthPick)
        stack.addArrangedSubview(yearPick)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        whiteView.addSubview(stack)
        stack.anchor(top:whiteView.topAnchor,left: whiteView.leftAnchor,right: whiteView.rightAnchor,paddingTop: 50,paddingLeft: 20,paddingRight: 20)
        
        yearPick.selectRow(currPickedYear - 2021, inComponent: 0, animated: true)
        monthPick.selectRow(currPickedMonth - 1, inComponent: 0, animated: true)
    }
    
    //MARK: - Selectors
    
    @objc func didClickedDone(){
        delegate?.userEnterMonthAndYear(month: "\(monthPick.selectedRow(inComponent: 0) + 1)", year: "\(yearPick.selectedRow(inComponent: 0) + 2021)")
        self.dismiss(animated: true)
    }
    
    //MARK: - Helpers

}


extension ChangeMonthController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == monthPick {
            return 12
        } else{
            return 4
        }
        
    }
    
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        let monthTemplate = MonthTemplate()
        if pickerView == monthPick {
            return monthTemplate.shortName[row]
        } else {
            return String(2021 + row)
        }
        
        }
    
}
