//
//  NicotineMenuViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 22/06/22.
//

import UIKit

class NicotineMenuViewController: UIViewController {
    
    // MARK: - Properties
    
    private let scrollView: UIScrollView = {
        let view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(OthersTableViewCell.self, forCellReuseIdentifier: "othersCell")
        return tableView
    }()
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Nicotine Cravings"
        label.font = UIFont.boldSystemFont(ofSize: 34)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "When you feel like consuming more cigarattes, try to distract yourself with these activities"
        label.font = UIFont.systemFont(ofSize: 15)
        label.numberOfLines = 0
        label.textColor = UIColor.rgb(red: 132, green: 132, blue: 132)
        label.addInterlineSpacing(spacingValue: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    var othersText:[String] = ["Play Games or Watch Movies", "Yoga Exercise", "Drinking a Tall Glass of Water", "Do Gardening", "Talk with Friends or Community"]
    var othersImage:[String] = ["watching.png", "yoga.png", "drink.png", "gardening.png", "talking.png"]
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupScrollView()
        setupViews()
        
        tableView.dataSource = self
        tableView.delegate = self
        self.tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
    }
    
    // MARK: - Helpers
    
    func setupScrollView(){
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
//        scrollView.backgroundColor = .red
        
        scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        scrollView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        scrollView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//        scrollView.heightAnchor.constraint(equalToConstant: view.bounds.height + 200).isActive = true
        contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor).isActive = true
        contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor).isActive = true
        contentView.topAnchor.constraint(equalTo: scrollView.topAnchor).isActive = true
        contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor).isActive = true
    }
    
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(subtitleLabel)
        contentView.addSubview(tableView)
        
        titleLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.anchor(top:titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor,bottom: tableView.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
        tableView.anchor(left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor, paddingLeft: 10, paddingRight: 10)
    }
    
}

// MARK: - Extensions

extension NicotineMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if (section == 0) {
            return 1
        }
        else {
            return 5
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50))
        let tableLabel = UILabel(frame: CGRect (x: 10, y: 0, width: header.frame.size.width, height: header.frame.size.height))
        tableLabel.font = UIFont.boldSystemFont(ofSize: 18)
        header.addSubview(tableLabel)
        
        if (section == 0) {
            tableLabel.text = "Recommended"
        }
        else {
            tableLabel.text = "Other Activities"
        }
        
        return header
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            let width = view.frame.width
            let image = UIImage(named: "breath-bg.png")
            let ratio = image!.size.width / image!.size.height
            
            return (width / ratio) - 10
        }
        else {
            let width = view.frame.width
            let image = UIImage(named: "others-bg.png")
            let ratio = image!.size.width / image!.size.height
            
            return (width / ratio) - 10
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let image = UIImage(named: "breath-bg.png")
            let ratio = image!.size.width / image!.size.height
            let newHeight = cell.frame.width / ratio
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: newHeight))
            
            imageView.image = image
            cell.backgroundView = UIView()
            cell.textLabel!.text = "Deep Breath Exercise"
            cell.textLabel!.font = UIFont.boldSystemFont(ofSize: 18)
            cell.textLabel!.textColor = .white
            cell.backgroundView!.addSubview(imageView)
            
            return cell
        }
        
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: OthersTableViewCell.identifier, for: indexPath) as! OthersTableViewCell
            
            let image = UIImage(named: "others-bg.png")
            let ratio = image!.size.width / image!.size.height
            let newHeight = cell.frame.width / ratio
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: newHeight))
            
            imageView.image = image
            cell.backgroundView = UIView()
            
            cell.configureTable(imageName: othersImage[indexPath.row], labelName: othersText[indexPath.row])
            
            let templateSize = UIImage(systemName: "chevron.right")
            let realArrow = UIImage(named: "blue-arrow.png")
            let arrowRatio = realArrow!.size.width / realArrow!.size.height
            let arrowHeight = (templateSize?.size.width)! / arrowRatio
            let accessory  = UIImageView(frame:CGRect(x:0, y:0, width:(templateSize?.size.width)!, height:arrowHeight))
            accessory.image = realArrow
            cell.accessoryView = accessory
            
            cell.backgroundView!.addSubview(imageView)
//            cell.contentView.addSubview(illustration)
//            cell.contentView.addSubview(othersLabel)
            
            return cell
        }
    }
    
    // MARK: didSelectRowAt
    // MARK: prepare segue
    
}

private extension UILabel {
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
        ))
        
        attributedText = attributedString
    }

}
