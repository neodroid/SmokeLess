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
        theStack.spacing = 5
        
        return theStack
    }()
    
    let hStack: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .horizontal
        theStack.distribution = .fillEqually
        theStack.spacing = 50
        return theStack
    }()
    
    let vStackLimit: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .vertical
        theStack.spacing = 20
        return theStack
    }()
    
    let limitLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarettes\nLimit"
        theLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        theLabel.numberOfLines = 2
        return theLabel
    }()
    
    let limitNumber: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "13"
        theLabel.font = .systemFont(ofSize: 45, weight: .regular)
        return theLabel
    }()
    
    let vStackConsumed: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .vertical
        theStack.spacing = 20
        return theStack
    }()
    
    let consumedLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarettes\nConsumed"
        theLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        theLabel.numberOfLines = 2
        return theLabel
    }()
    
    
    let consumedStackForStatus = UIView()
    
    let statusImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.seal.fill"))
        imageView.tintColor = .smokeLessGreen
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()

    let consumedNumber: UILabel = {
        let theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.text = "13"
        theLabel.textColor = .smokeLessGreen
        theLabel.font = .systemFont(ofSize: 45)
        return theLabel
    }()
    
    let cigarettesLimitConsumedView: UIView = {
        var theView = UIView()
        theView.backgroundColor = .white
        theView.layer.cornerRadius = 20
        theView = addShadowToView(viewToAdd: theView, shadowColor: UIColor.black.cgColor, shadowRadius: 7, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0, height: 4))
        return theView
    }()
    
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
    }
    
    // MARK: - Helpers
    
    func configureUI() {
        // Setup Limit Counter View
        vStackLimit.addArrangedSubview(limitLabel)
        vStackLimit.addArrangedSubview(limitNumber)
        
        // Setup Consumed Counter View
        vStackConsumed.addArrangedSubview(consumedLabel)
        vStackConsumed.addArrangedSubview(consumedStackForStatus)
        consumedStackForStatus.addSubview(consumedNumber)
        consumedStackForStatus.addSubview(statusImage)
        consumedNumber.anchor(top:consumedStackForStatus.topAnchor, left: consumedStackForStatus.leftAnchor, bottom: consumedStackForStatus.bottomAnchor)
        statusImage.anchor(left: consumedNumber.rightAnchor, bottom: consumedNumber.bottomAnchor, paddingLeft: 5, paddingBottom: 10)
        
        hStack.addArrangedSubview(vStackLimit)
        hStack.addArrangedSubview(vStackConsumed)
        
        // Wrap the hStack to UIView for shadow
        cigarettesLimitConsumedView.addSubview(hStack)
        hStack.anchor(top: cigarettesLimitConsumedView.topAnchor, left: cigarettesLimitConsumedView.leftAnchor, bottom: cigarettesLimitConsumedView.bottomAnchor, right: cigarettesLimitConsumedView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 20)
        
        view.addSubview(statisticLabel)
        view.addSubview(cigarreteSummaryLabel)
        view.addSubview(changeMonthButton)
        view.addSubview(changeMonthLabel)
        view.addSubview(dayStatusStack)
        view.addSubview(cigarettesLimitConsumedView)
        
        statisticLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        cigarreteSummaryLabel.anchor(top: statisticLabel.bottomAnchor, left: statisticLabel.leftAnchor, paddingTop: 20)
                
        changeMonthLabel.anchor(top: cigarreteSummaryLabel.topAnchor, left: cigarreteSummaryLabel.rightAnchor)
        
        changeMonthButton.anchor(top: cigarreteSummaryLabel.topAnchor, left: changeMonthLabel.rightAnchor, right: statisticLabel.rightAnchor, paddingLeft: 5)
        
        
        // Change this top anchor to bottom anchor of the chart later on
        
        dayStatusStack.anchor(top: cigarreteSummaryLabel.bottomAnchor, left: statisticLabel.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingRight: 20)
        
        cigarettesLimitConsumedView.anchor(top: dayStatusStack.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        
    }
    
    
    

}

public func addShadowToView(viewToAdd: UIView, shadowColor: CGColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) -> UIView {
    viewToAdd.layer.shadowColor = shadowColor
    viewToAdd.layer.shadowRadius = shadowRadius
    viewToAdd.layer.shadowOpacity = shadowOpacity
    viewToAdd.layer.shadowOffset = shadowOffset
    return viewToAdd
}
