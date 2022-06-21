//
//  DrawLineOnView.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 21/06/22.
//

import UIKit

class DrawLineOnView: UIView {
    
    let origin: CGPoint
    let destination: CGPoint
    
    init(frame: CGRect, from: CGPoint, to: CGPoint) {
        self.origin = from
        self.destination = to
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.setLineWidth(0.2)
        context?.move(to: origin)
        context?.addLine(to: destination)
        context?.strokePath()
    }
    
}
