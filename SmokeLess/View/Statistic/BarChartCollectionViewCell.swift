//
//  BarChartCollectionViewCell.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 22/06/22.
//

import UIKit

class BarChartCollectionViewCell: UICollectionViewCell {
    
    let spacingBetweenBars = 5
    
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
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
