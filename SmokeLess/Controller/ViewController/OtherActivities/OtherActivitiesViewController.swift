//
//  OtherActivitiesViewController.swift
//  SmokeLess
//
//  Created by Ishaq Adheltyo on 27/06/22.
//

import UIKit

class OtherActivitiesViewController: UIViewController {
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "secondCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "thirdCell")
        return tableView
    }()
    
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
    }
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        configureNavigationBar(withTitle: "", preferLargeTitles: false)
        configureTableView()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor)
    }
}

// MARK: - Extension
extension OtherActivitiesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 350
        }
        else if (indexPath.section == 1) {
            return 125
        }
        else {
            return 150
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let image = UIImage(named: "peoplePlayGame")
            
            cell.backgroundColor = .smokeLessBlue
            cell.imageView?.image = image
            cell.imageView?.anchor(top: cell.topAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
            
            return cell
        }
        else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            let titleLabel = UILabel()
            let descriptionLabel = UILabel()
            
            titleLabel.text = "Play Games or Watch Movies"
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            cell.addSubview(titleLabel)
            titleLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            descriptionLabel.text = "Playing games and watching could help distract you from nicotine cravings, as time tends to fly by faster when you’re focused on something."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.systemFont(ofSize: 16)
            cell.addSubview(descriptionLabel)
            descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath)
            let titleLabel = UILabel()
            
            titleLabel.text = "Games Recommendation"
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            cell.addSubview(titleLabel)
            titleLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            let stackView = UIStackView()
            cell.addSubview(stackView)
            stackView.axis = .horizontal
            stackView.distribution = .equalCentering
            stackView.spacing = 5
            stackView.anchor(top: titleLabel.bottomAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            let numberOfStackViewItems = 5;
            let gamesTitleList = ["Candy Crush", "Mario Kart Tour", "Genshin Impact", "PUBG Mobile", "Stumble Guys"]
            let iconGamesImageNameList = ["candyCrush", "marioKartTour", "genshinImpact", "pubgMobile", "stumbleGuys"]
            
            for i in 1...numberOfStackViewItems {
                
                let itemStackView = UIStackView()
                itemStackView.axis = .vertical
                itemStackView.distribution = .fill
                itemStackView.spacing = 2
                
                let iconGamesImage: UIImageView = {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: iconGamesImageNameList[i-1])
                    imageView.setDimensions(width: 60, height: 60)
                    return imageView
                }()
                
                let titleGamesLabel = UILabel()
                titleGamesLabel.numberOfLines = 0
                titleGamesLabel.text = gamesTitleList[i-1]
                titleGamesLabel.font = UIFont.systemFont(ofSize: 12)
                
                itemStackView.addArrangedSubview(iconGamesImage)
                itemStackView.addArrangedSubview(titleGamesLabel)
                                
                stackView.addArrangedSubview(itemStackView)
            }
            
            return cell
        }
    }
}
