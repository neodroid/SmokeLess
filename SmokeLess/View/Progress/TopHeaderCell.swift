//
//  TopHeaderCell.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//

import UIKit

public class TopHeaderCell: UICollectionViewCell {
    
    //MARK: - Properties
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "lol"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Cigarette Reduction"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var monthPicker: UILabel = {
        let monthPicker = UILabel()
        monthPicker.tintColor = .black
        monthPicker.font = UIFont.boldSystemFont(ofSize: 20)
        return monthPicker
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
        
        contentView.addSubview(subtitleLabel)
        subtitleLabel.anchor(top:titleLabel.bottomAnchor,left: contentView.leftAnchor,paddingTop: 10)
        
        contentView.addSubview(monthPicker)
        monthPicker.anchor(top:subtitleLabel.topAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, paddingRight: 0)
        monthPicker.frame = CGRect(x: 0, y: 0, width: 20, height: 100)
        
    }
    
    public func setup(title: String, subtitle: String, month:Int, year: Int) {
        self.titleLabel.text = title
        self.subtitleLabel.text = subtitle
        
        let monthTemplate = MonthTemplate()
        let fullString = NSMutableAttributedString(string: "\(monthTemplate.shortName[month - 1]) , \(year) ")
        let image1Attachment = NSTextAttachment()
        image1Attachment.image = UIImage(systemName: "chevron.down")
        let image1String = NSAttributedString(attachment: image1Attachment)
        fullString.append(image1String)
        monthPicker.attributedText = fullString
    }
}


