//
//  TodayLimitCell.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 15/06/22.
//


import UIKit

public class TodayLimitCell: UICollectionViewCell {
    
    //MARK: - Properties
    var container: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.smokeLessLightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Cigarettes Limit"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "12"
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
        label.textAlignment = .center
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
    
    //MARK: - Helpers
    
    func configureUI() {
        contentView.addSubview(container)
        container.anchor(top:contentView.topAnchor,left: contentView.leftAnchor,bottom: contentView.bottomAnchor,right: contentView.rightAnchor)
        
        container.addSubview(titleLabel)
        titleLabel.anchor(top:container.topAnchor,left: container.leftAnchor, right: container.rightAnchor,paddingTop: 10, paddingLeft: 10)
        titleLabel.centerX(inView: self)
        
        container.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor,left: container.leftAnchor,right: container.rightAnchor ,paddingBottom: 5)
        subtitleLabel.centerX(inView: self)
    }
    
    public func setup(title: Int, subtitle: String) {
        self.container.backgroundColor = .white
    }
}
