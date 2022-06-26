//
//  TittleCell.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//


import UIKit

public class TittleCell: UICollectionViewCell {
    
    //MARK: - Properties
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "lol"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    //MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Selectors
    
    //MARK: - Helpers
    
    func configureUI() {
        contentView.addSubview(titleLabel)
        titleLabel.anchor(top:contentView.topAnchor,left: contentView.leftAnchor, right: contentView.rightAnchor,paddingTop: 0)
        titleLabel.centerX(inView: self)
    }
    
    public func setup(title: String) {
        self.titleLabel.text = title
    }
}



