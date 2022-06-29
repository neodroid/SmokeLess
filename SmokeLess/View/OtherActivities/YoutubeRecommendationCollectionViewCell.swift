//
//  YoutubeRecommendationCollectionViewCell.swift
//  SmokeLess
//
//  Created by Ishaq Adheltyo on 29/06/22.
//

import UIKit

class YoutubeRecommendationCollectionViewCell: UICollectionViewCell {
    static let identifier = "YoutubeRecommendationCollectionViewCell"

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.setDimensions(width: 167, height: 162)
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        imageView.frame = contentView.bounds
    }
    
    public func configure(with imageName: String) {
        imageView.image = UIImage(named: imageName)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
}
