//
//  BarChartCollectionViewCell.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 22/06/22.
//

import UIKit

class BarChartCollectionViewCell: UICollectionViewCell {
    
    let spacingBetweenBars: CGFloat = 5
    
    let limitBar: UIView = {
        let theView = UIView()
        theView.backgroundColor = .smokeLessGreen
        return theView
    }()
    
    let consumedBar: UIView = {
        let theView = UIView()
        theView.backgroundColor = .smokeLessBlue
        return theView
    }()
    
    let dateLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "1" // Dynamic
        return theLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
            
        contentView.addSubview(limitBar)
        contentView.addSubview(consumedBar)
        contentView.addSubview(dateLabel)
        
        limitBar.anchor(left: contentView.leftAnchor, bottom: contentView.bottomAnchor)
        consumedBar.anchor(left: limitBar.rightAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingLeft: spacingBetweenBars)
        dateLabel.anchor(top: contentView.bottomAnchor, left: contentView.leftAnchor, right: contentView.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingRight: 5)
        
        // Height Constraint for Dynamic Bar
        //limitBar.setDimensions(width: 20, height: contentView.bounds.height)
        //consumedBar.setDimensions(width: 20, height: contentView.bounds.height)

        
        // End
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
