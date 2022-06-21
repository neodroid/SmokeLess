//
//  ChartGrid.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 21/06/22.
//

import UIKit

class ChartGrid: UIView {
    
    let gridSpace: CGFloat
    var totalHeight: CGFloat = 0.0
    
    init(frame: CGRect, gridSpace: CGFloat) {
        self.gridSpace = gridSpace
        self.totalHeight = 4 * gridSpace
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        var nextPoint: CGPoint = CGPoint()
        var originPoint: CGPoint = CGPoint(x: self.bounds.minX, y: self.bounds.minY)
        
        context?.setLineWidth(0.2)
        context?.move(to: originPoint)
        
        for i in 0...4 {
            let axisLabel = UILabel()
            axisLabel.font = UIFont.systemFont(ofSize: 13)
            nextPoint = CGPoint(x: self.bounds.maxX, y: (gridSpace * CGFloat(i)) + self.bounds.minY)
            originPoint.y = nextPoint.y
            context?.move(to: originPoint)
            context?.addLine(to: nextPoint)
            self.addSubview(axisLabel)
            context?.strokePath()
        }

        context?.move(to: CGPoint(x: self.bounds.minX, y: self.bounds.minY))
        context?.addLine(to: CGPoint(x: self.bounds.minX, y: self.bounds.minY + totalHeight))
        context?.strokePath()
        
    }

}
