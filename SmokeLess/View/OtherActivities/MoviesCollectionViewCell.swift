//
//  MoviesCollectionViewCell.swift
//  SmokeLess
//
//  Created by Ishaq Adheltyo on 28/06/22.
//

import UIKit

class MoviesCollectionViewCell: UICollectionViewCell {
    static let identifier = "MoviesCollectionViewCell"
    
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.distribution = .fill
        stackView.spacing = 2

        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(stackView)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = contentView.bounds
    }
    
    public func configure(with moviesImageName: String, moviesTitle: String) {
        let moviesImage: UIImageView = {
            let imageView = UIImageView()
            imageView.image = UIImage(named: moviesImageName)
            imageView.setDimensions(width: 90, height: 135)
            return imageView
        }()
        
        let title = UILabel()
        title.text = moviesTitle
        title.numberOfLines = 0
        title.font = UIFont.systemFont(ofSize: 12)
        
        stackView.addArrangedSubview(moviesImage)
        stackView.addArrangedSubview(title)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
}
