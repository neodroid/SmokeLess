//
//  DateCell.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//

import UIKit
import CoreData

public class DateCell: UICollectionViewCell {
    
    //MARK: - Properties
    var containerCore: NSPersistentContainer!
    let dateFormatter = DateFormatter()
    var dayLabel = ["Sun","Mon","Tue","Wed","Thu","Fri","Sat"]
    var currDay = 0
    var data = [DailyCoreData]()
    
    var container: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.white
        view.layer.shadowColor = UIColor.black.cgColor
        view.layer.cornerRadius = 18
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var titleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "Wed"
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel: UILabel = {
        let label: UILabel = UILabel()
        label.text = "12"
        label.font = UIFont.boldSystemFont(ofSize: 22)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var blueDot: UIView = {
        let view = UIView()
        view.backgroundColor = .smokeLessLightGray
        view.layer.cornerRadius = 10
        view.setDimensions(width: 20, height: 20)
        view.isHidden = false
        return view
    }()
    
    var checkImage: UIImageView = {
        let imageView = UIImageView()
        let image = UIImage(named: "check")
        imageView.contentMode = .scaleAspectFit
        imageView.image = image
        imageView.setDimensions(width: 25, height: 25)
        return imageView
    }()
    
    //MARK: - Lifecycle
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        configureUI()
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        containerCore = appDelegate.persistentContainer
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Helpers
    
    func configureUI() {
        contentView.addSubview(container)
        container.anchor(top:contentView.topAnchor,left: contentView.leftAnchor,bottom: contentView.bottomAnchor,right: contentView.rightAnchor)
        
        container.addSubview(titleLabel)
        titleLabel.anchor(top:container.topAnchor,left: container.leftAnchor, right: container.rightAnchor,paddingTop: 20)
        titleLabel.centerX(inView: self)
        
        container.addSubview(subtitleLabel)
        subtitleLabel.anchor(top:titleLabel.bottomAnchor,left: container.leftAnchor,right: container.rightAnchor ,paddingTop: 10)
        
        contentView.addSubview(blueDot)
        blueDot.anchor(top: container.bottomAnchor, paddingTop: 10)
        blueDot.centerX(inView: self)
        
        contentView.addSubview(checkImage)
        checkImage.anchor(top: container.bottomAnchor, paddingTop: 10)
        checkImage.centerX(inView: self)
        
    }
    
    public func setup(title: Int, subtitle: String, monthYear: String, pickedDay: String) {
        
        
        
            self.currDay = title
            self.titleLabel.text = dayLabel[title]
            self.subtitleLabel.text = subtitle
            dateFormatter.dateFormat = "d/M/yyyy"
            let today = dateFormatter.string(from: Date())
            let uiToday = dateFormatter.date(from: "\(subtitle)/\(monthYear)")
            let stringUiToday = dateFormatter.string(from: uiToday ?? Date())
        
        do {
            let fetchRequest : NSFetchRequest<DailyCoreData> = DailyCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@", stringUiToday)
            data = try containerCore.viewContext.fetch(fetchRequest)
//            print(data, date)
        } catch {
            print(error)
        }
        
        if pickedDay == subtitle {
            
            container.layer.shadowOpacity = 0.3
            container.layer.shadowRadius = 3
            container.layer.shadowOffset = CGSize(width: 0, height: 0)
        }else {
            container.layer.shadowOpacity = 0
            container.layer.shadowRadius = 0
        }
            
        if today == stringUiToday {
                titleLabel.textColor = .smokeLessBlue
                subtitleLabel.textColor = .smokeLessBlue
                
        }else {
                titleLabel.textColor = .black
                subtitleLabel.textColor = .black
        }
        
        if let dayData = data.first{
            if dayData.limit >= dayData.consumed {
                blueDot.isHidden = true
                checkImage.isHidden = false
                checkImage.image = UIImage(named: "check")
            }else {
                blueDot.isHidden = true
                checkImage.isHidden = false
                checkImage.image = UIImage(named: "uncheck")
            }
        }else {
            blueDot.isHidden = false
            checkImage.isHidden = true
        }
        if dateFormatter.date(from: stringUiToday)! > Date() {
            blueDot.isHidden = false
            checkImage.isHidden = true
        }
        
    }
}
