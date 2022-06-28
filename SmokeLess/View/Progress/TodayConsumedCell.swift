//
//  TodayConsumedCell.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 15/06/22.
//


import UIKit

protocol ConsumedDelegate {
    func incrementConsumed()
    func decrementConsumed()
}

public class TodayConsumedCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let dateFormatter = DateFormatter()
    var data = [DailyCoreData]()
    var delegate: ConsumedDelegate?
    
    var container: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.smokeLessLightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Cigarettes Consumed"
        label.font = UIFont.boldSystemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .white
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "0"
        label.font = UIFont.systemFont(ofSize: 40)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .white
        label.textAlignment = .left
        label.textAlignment = .center
        return label
    }()
    
    var addButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "plusSign"), for: .normal)
        button.addTarget(self, action: #selector(plusButtonPressed), for: .touchUpInside)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        return button
    }()
    
    var minButton: UIButton = {
        let button = UIButton()
        button.backgroundColor = .white
        button.layer.cornerRadius = 10
        button.setImage(UIImage(named: "minSign"), for: .normal)
        button.addTarget(self, action: #selector(minButtonPressed), for: .touchUpInside)
        button.imageView?.layer.transform = CATransform3DMakeScale(0.7, 0.7, 0.7)
        return button
    }()
    
    //MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Selectors
    
    @objc func plusButtonPressed() {
        delegate?.incrementConsumed()
//<<<<<<< HEAD
//        reloadCoreData()
//=======
//>>>>>>> ae90609 (feat: add logic for progress controller and persist the consumed data)
    }
    
    
    @objc func minButtonPressed () {
        delegate?.decrementConsumed()
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        contentView.addSubview(container)
        container.anchor(top:contentView.topAnchor,left: contentView.leftAnchor,bottom: contentView.bottomAnchor,right: contentView.rightAnchor)
        
        container.addSubview(titleLabel)
        titleLabel.anchor(top:container.topAnchor,left: container.leftAnchor, right: container.rightAnchor,paddingTop: 10, paddingLeft: 10)
       
        container.addSubview(subtitleLabel)
        subtitleLabel.centerX(inView: container)
        subtitleLabel.anchor(bottom: container.bottomAnchor, paddingBottom: 45)
        
        container.addSubview(addButton)
        addButton.anchor(top: subtitleLabel.topAnchor, left: subtitleLabel.rightAnchor, bottom: subtitleLabel.bottomAnchor, paddingLeft: 60)
        addButton.setDimensions(width: 40, height: 40)
        
        container.addSubview(minButton)
        minButton.anchor(top: subtitleLabel.topAnchor, bottom: subtitleLabel.bottomAnchor,right: subtitleLabel.leftAnchor, paddingRight: 60)
        minButton.setDimensions(width: 40, height: 40)
    }
    
    public func setup(title: Int, subtitle: String) {
        self.container.backgroundColor = .smokeLessBlue
    }
    
}
