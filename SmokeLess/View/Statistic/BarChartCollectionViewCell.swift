//
//  BarChartCollectionViewCell.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 22/06/22.
//

import UIKit

class BarChartCollectionViewCell: UICollectionViewCell {
    
    let spacingBetweenBars: CGFloat = 5
    
    let container: UIView = {
        let theContainer = UIView()
        return theContainer
    }()
    
    let limitBar: UIView = {
        let theView = UIView()
        theView.backgroundColor = .smokeLessBlue
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    
    let consumedBar: UIView = {
        let theView = UIView()
        theView.backgroundColor = .smokeLessGreen
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    
    let dateLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "1" // Dynamic
        theLabel.textAlignment = .center
        theLabel.font = .systemFont(ofSize: 11)
        theLabel.textAlignment = .center
        return theLabel
    }()
    
    let circleLabelBg: UIView = {
        let circleBG = UIView()
        return circleBG
    }()
    
    var limitHeightConstraint = NSLayoutConstraint()
    var limitWidthConstraint = NSLayoutConstraint()
    
    var consumedHeightConstraint = NSLayoutConstraint()
    var consumedWidthConstraint = NSLayoutConstraint()

    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(container)
        container.addConstraintsToFillView(contentView)
        container.addSubview(limitBar)
        container.addSubview(consumedBar)
        circleLabelBg.addSubview(dateLabel)
        container.addSubview(circleLabelBg)

        limitBar.anchor(bottom: container.bottomAnchor, right: consumedBar.leftAnchor, paddingBottom: 20, paddingRight: 5)
        consumedBar.anchor(bottom: container.bottomAnchor, right: container.rightAnchor, paddingBottom: 20)
        
        circleLabelBg.anchor(bottom: container.bottomAnchor, right: container.rightAnchor, paddingRight: 13.75)
        dateLabel.addConstraintsToFillView(circleLabelBg)
        circleLabelBg.setDimensions(width: 15, height: 15)
        circleLabelBg.layer.cornerRadius = 15 / 2
        
        limitHeightConstraint = NSLayoutConstraint(item: limitBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        limitWidthConstraint = NSLayoutConstraint(item: limitBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55.0/4.0)
        
        consumedHeightConstraint = NSLayoutConstraint(item: consumedBar, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 0)
        consumedWidthConstraint = NSLayoutConstraint(item: consumedBar, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 55.0/4.0)
        
        limitWidthConstraint.isActive = true
        limitHeightConstraint.isActive = true
        
        consumedWidthConstraint.isActive = true
        consumedHeightConstraint.isActive = true

    }
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
