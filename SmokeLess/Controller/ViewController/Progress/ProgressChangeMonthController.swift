//
//  ChangeMonthController.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//

import UIKit

protocol ProgressMonthChangeDelegate: class {
    func userEnterMonthAndYear(month: String, year:String)
}

class ProgressChangeMonthController: UIViewController {
    
    //MARK: - Properties
    
    var delegate: ProgressMonthChangeDelegate?
    
    var currPickedMonth = 11
    var currPickedYear = 2022
    
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
    //MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        monthPick.delegate = self
        monthPick.dataSource = self
        
        yearPick.delegate = self
        yearPick.dataSource = self
        
        view.addSubview(closeButton)
        closeButton.anchor(top:view.topAnchor, right: view.rightAnchor,paddingTop: 10, paddingRight: 20)
        
        let stack = UIStackView()
        stack.axis = NSLayoutConstraint.Axis.horizontal
        stack.distribution  = UIStackView.Distribution.fillEqually
        stack.alignment = UIStackView.Alignment.center
        stack.spacing   = 16.0
        
        stack.addArrangedSubview(monthPick)
        stack.addArrangedSubview(yearPick)
        stack.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(stack)
        stack.anchor(top:view.topAnchor,left: view.leftAnchor,right: view.rightAnchor,paddingTop: 50,paddingLeft: 20,paddingRight: 20)
        
        yearPick.selectRow(currPickedYear - 2022, inComponent: 0, animated: true)
        monthPick.selectRow(currPickedMonth - 1, inComponent: 0, animated: true)
    }
    
    //MARK: - Selectors
    
    @objc func didClickedDone(){
        delegate?.userEnterMonthAndYear(month: "\(monthPick.selectedRow(inComponent: 0) + 1)", year: "\(yearPick.selectedRow(inComponent: 0) + 2022)")
        self.dismiss(animated: true)
    }
    
    //MARK: - Helpers


}
extension ProgressChangeMonthController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == monthPick {
            return 12
        } else{
            return 2
        }
        
    }
    
    
    
    internal func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String?  {
        let monthTemplate = MonthTemplate()
        if pickerView == monthPick {
            return monthTemplate.shortName[row]
        } else {
            return String(2022 + row)
        }
        
        }
    
}
