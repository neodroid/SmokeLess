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
        theView.backgroundColor = .smokeLessGreen
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    
    let consumedBar: UIView = {
        let theView = UIView()
        theView.backgroundColor = .smokeLessBlue
        theView.translatesAutoresizingMaskIntoConstraints = false
        return theView
    }()
    
    let dateLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "1" // Dynamic
        return theLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        contentView.addSubview(container)
        container.addConstraintsToFillView(contentView)
        
        container.addSubview(limitBar)
        container.addSubview(consumedBar)
//        container.backgroundColor = .lightGray
        
        limitBar.anchor(bottom: container.bottomAnchor, right: consumedBar.leftAnchor, paddingBottom: 0, paddingRight: 5)
        consumedBar.anchor(bottom: container.bottomAnchor, right: container.rightAnchor, paddingBottom: 0)
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
