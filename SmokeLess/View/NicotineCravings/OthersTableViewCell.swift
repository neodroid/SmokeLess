//
//  OthersTableViewCell.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 22/06/22.
//

import UIKit

class OthersTableViewCell: UITableViewCell {

    static let identifier = "othersCell"
    
    private var tableImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        return image
    }()
    
    private var tableLabel: UILabel = {
        var label: UILabel = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = .black
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(tableImage)
        contentView.addSubview(tableLabel)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let imageSize = contentView.frame.size.height - 20
        
        tableImage.frame = CGRect(x: 20, y: 10, width: imageSize, height: imageSize)
        tableLabel.frame = CGRect(x: 40 + imageSize, y: 10, width: contentView.frame.size.width - imageSize - 50, height: imageSize)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configureTable(imageName: String, labelName: String) {
        tableImage.image = UIImage(named: imageName)
        tableLabel.text = labelName
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        tableImage.image = nil
        tableLabel.text = nil
    }
}
