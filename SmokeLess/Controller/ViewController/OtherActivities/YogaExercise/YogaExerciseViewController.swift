//
//  YogaExerciseViewController.swift
//  SmokeLess
//
//  Created by Ishaq Adheltyo on 29/06/22.
//

import UIKit

class YogaExerciseViewController: UIViewController {

    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "secondCell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "thirdCell")
        return tableView
    }()
    
    var collectionView: UICollectionView?
        
    // MARK: - LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
        collectionView?.frame = CGRect(x: 0, y: 60, width: tableView.frame.size.width, height: 400)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true

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
extension YogaExerciseViewController: UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: YoutubeRecommendationCollectionViewCell.identifier, for: indexPath) as! YoutubeRecommendationCollectionViewCell
        cell.configure(with: "yogaRecommendationOne")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    
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
        else if (indexPath.section == 1) {
            return 150
        }
        else {
            return 400
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let image = UIImage(named: "yogaExercise")
            cell.selectionStyle = .none
            cell.backgroundColor = .smokeLessBlue
            cell.imageView?.image = image
            cell.imageView?.anchor(top: cell.topAnchor, left: cell.leftAnchor, bottom: cell.bottomAnchor, right: cell.rightAnchor, paddingTop: 50, paddingLeft: 50, paddingBottom: 50, paddingRight: 50)
            
            return cell
        }
        else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            let titleLabel = UILabel()
            let descriptionLabel = UILabel()
            cell.selectionStyle = .none
            titleLabel.text = "Yoga Exercise"
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 22)
            cell.addSubview(titleLabel)
            titleLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            descriptionLabel.text = "Certain yoga poses are designed to further open the air pathways in the body and encourage fuller and deeper breaths, such as the cobra pose, bow pose, and cat-cow pose."
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.systemFont(ofSize: 16)
            cell.addSubview(descriptionLabel)
            descriptionLabel.anchor(top: titleLabel.bottomAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 10, paddingLeft: 20, paddingRight: 20)
            
            return cell
        }
        else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "thirdCell", for: indexPath)
            let titleLabel = UILabel()
            
            titleLabel.text = "Recommendation"
            titleLabel.numberOfLines = 0
            titleLabel.font = UIFont.boldSystemFont(ofSize: 17)
            cell.addSubview(titleLabel)
            titleLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
            
            let layout = UICollectionViewFlowLayout()
            
            layout.itemSize = CGSize(width: 167, height: 162)
            layout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
            
            collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
            collectionView?.register(YoutubeRecommendationCollectionViewCell.self, forCellWithReuseIdentifier: YoutubeRecommendationCollectionViewCell.identifier)
            collectionView?.delegate = self
            collectionView?.dataSource = self
            
            guard let myCollection = collectionView else {
                return cell
            }
            
            cell.addSubview(myCollection)
            
            return cell
        }
    }
}
