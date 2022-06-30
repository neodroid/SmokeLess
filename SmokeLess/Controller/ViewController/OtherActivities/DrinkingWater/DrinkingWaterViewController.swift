//
//  DrinkingWaterViewController.swift
//  SmokeLess
//
//  Created by Ishaq Adheltyo on 29/06/22.
//

import UIKit

class DrinkingWaterViewController: UIViewController {

    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "secondCell")
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
extension DrinkingWaterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 350
        }
        else {
            return 125
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let image = UIImage(named: "drinkWater")
            
            cell.backgroundColor = .smokeLessBlue
            cell.imageView?.image = image
            cell.imageView?.anchor(top: cell.topAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            let titleLabel = UILabel()
            let descriptionLabel = UILabel()
            
            titleLabel.text = "Drinking a Tall Glass of Water"
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            cell.addSubview(titleLabel)
            titleLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            descriptionLabel.text = "Dehydration can trigger feelings of anxiety which, in turn, can trigger the urge to smoke. If a craving suddenly strikes, try drinking a tall glass of water."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.systemFont(ofSize: 16)
            cell.addSubview(descriptionLabel)
            descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
            
            return cell
        }
    }
}
