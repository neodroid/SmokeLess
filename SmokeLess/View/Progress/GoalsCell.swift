//
//  GoalsCell.swift
//  SmokeLess
//
//  Created by Kevin ahmad on 26/06/22.
//

import UIKit

public class GoalsCell: UICollectionViewCell {
    
    //MARK: - Properties
    
    let userDefaults = UserDefaults.standard
    var container: UIView = {
        let view = UIView()
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.smokeLessLightGray.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var logoImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "goal")
        imageView.setDimensions(width: 35, height: 35)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .smokeLessBlue
        return imageView
    }()
    
    var viewForImage: UIView = {
        let view = UIView()
        view.backgroundColor = .smokeLessBlue
        view.setDimensions(width: 50, height: 50)
        view.layer.cornerRadius = 10
        return view
    }()
    
    var chevronImageView: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(systemName: "chevron.right")
        image?.withTintColor(UIColor.smokeLessBlue)
        imageView.setDimensions(width: 25, height: 25)
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Goals"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    var motivationLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Motivation"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.textColor = .black
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "“Quit smoking to get healthy”"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        label.textAlignment = .left
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
        
        container.addSubview(viewForImage)
        viewForImage.anchor(left: container.leftAnchor, paddingLeft: 20)
        viewForImage.centerY(inView: container)
        
        viewForImage.addSubview(logoImageView)
        logoImageView.center(inView: viewForImage)
        
        container.addSubview(chevronImageView)
        chevronImageView.anchor(right: container.rightAnchor, paddingRight: 10)
        chevronImageView.centerY(inView: container)
    
        container.addSubview(titleLabel)
        titleLabel.anchor(top: viewForImage.topAnchor, left: viewForImage.rightAnchor,paddingLeft: 20)
        
        container.addSubview(subtitleLabel)
        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: titleLabel.leftAnchor, right: chevronImageView.leftAnchor, paddingTop: 5)
        
        container.addSubview(motivationLabel)
        motivationLabel.anchor(left: container.leftAnchor,bottom: container.topAnchor,paddingBottom: 10)
        
        
    }
    
    public func setup(title: Int, subtitle: String) {
        self.container.backgroundColor = .white
        var textGoal = (userDefaults.string(forKey: "goals") ?? "")
        textGoal = textGoal.components(separatedBy: .newlines).joined(separator: " ")
        subtitleLabel.text = ("“" + textGoal + "“")
    }
}
