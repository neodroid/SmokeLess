//
//  StatisticViewController.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 20/06/22.
//

import UIKit

class StatisticViewController: UIViewController {
    
    // MARK: - Properties
    
    let statisticLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Statistic"
        theLabel.font = .systemFont(ofSize: 34, weight: .bold)
        return theLabel
    }()
    
    let cigarreteSummaryLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarette Summary"
        theLabel.font = .systemFont(ofSize: 16, weight: .bold)
        return theLabel
    }()
    
    let changeMonthButton: UIButton = {
        let theButton = UIButton()
        theButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        theButton.tintColor = .black
        return theButton
    }()
    
    let changeMonthLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "June 2022"
        theLabel.font = .systemFont(ofSize: 16, weight: .bold)
        return theLabel
    }()
    
    let dayStatusStack: UIStackView = {
        let theStack = UIStackView()
        let theLabel = UILabel()
        let theImage = UIImageView(image: UIImage(systemName: "checkmark.seal.fill"))
        
        theImage.tintColor = .smokeLessGreen
        theLabel.textColor = .smokeLessGreen
        
        theStack.axis = .horizontal
        theLabel.text = "You did great!"
        
        theStack.addArrangedSubview(theImage)
        theStack.addArrangedSubview(theLabel)
        
        return theStack
    }()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureUI()
    }
    
    
    // MARK: - Helpers
    
    func configureUI() {
        view.addSubview(statisticLabel)
        view.addSubview(cigarreteSummaryLabel)
        view.addSubview(changeMonthButton)
        view.addSubview(changeMonthLabel)
        view.addSubview(dayStatusStack)
        
        statisticLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        cigarreteSummaryLabel.anchor(top: statisticLabel.bottomAnchor, left: statisticLabel.leftAnchor, paddingTop: 20)
                
        changeMonthLabel.anchor(top: cigarreteSummaryLabel.topAnchor, left: cigarreteSummaryLabel.rightAnchor)
        
        changeMonthButton.anchor(top: cigarreteSummaryLabel.topAnchor, left: changeMonthLabel.rightAnchor, right: statisticLabel.rightAnchor, paddingLeft: 5)
        
        
        // Change this top anchor to bottom anchor of the chart later on
        
        dayStatusStack.anchor(top: cigarreteSummaryLabel.bottomAnchor, left: statisticLabel.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingRight: 20)
        
    }
    
    

}
