//
//  NicotineMenuViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 22/06/22.
//

import UIKit


class NicotineMenuViewController: UIViewController {
    
    // MARK: - Properties
    private let tableView: UITableView = {
        let tableView = UITableView()
        let dummyViewHeight = CGFloat(40)

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "secondCell")
        tableView.register(OthersTableViewCell.self, forCellReuseIdentifier: OthersTableViewCell.identifier)
        tableView.tableHeaderView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.size.width, height: dummyViewHeight))
        tableView.contentInset = UIEdgeInsets(top: -dummyViewHeight, left: 0, bottom: 0, right: 0)
        
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = CGRect(x: tableView.frame.origin.x, y: tableView.frame.origin.y, width: tableView.frame.size.width, height: tableView.frame.size.height)
        tableView.reloadData()
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        tableView.separatorStyle = UITableViewCell.SeparatorStyle.none
        tableView.delegate = self
        tableView.dataSource = self
        tableView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 5, paddingRight: 5)
    }
    
    var othersText:[String] = ["Play Games or Watch Movies", "Yoga Exercise", "Drinking a Tall Glass of Water", "Do Gardening", "Talk with Friends or Community"]
    var othersImage:[String] = ["watching.png", "yoga.png", "drink.png", "gardening.png", "talking.png"]
    
    // MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .white
        configureTableView()
        configureNavBar()
    }
    
    func configureNavBar() {
        navigationController?.navigationBar.backgroundColor = .white
        navigationController?.navigationBar.tintColor = .smokeLessBlue
    }
    
    func segueToScreen(controller: UIViewController) {
        navigationController?.pushViewController(controller, animated: true)
    }
    
}

// MARK: - Extension
extension NicotineMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(section == 2) {
            return 5
        }
        else {
            return 1
        }
    }
        
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if (indexPath.section == 0) {
            return 50
        }
        else if (indexPath.section == 1) {
            return 125
        }
        else {
            let width = view.frame.width
            let image = UIImage(named: "others-bg.png")
            let ratio = image!.size.width / image!.size.height
            
            return (width / ratio) - 5
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(indexPath.section == 1) {
            segueToScreen(controller: StartBreathViewController())
        }
        else if(indexPath.section == 2) {
            if(indexPath.row == 0) {
                segueToScreen(controller: PlayGamesOrWatchMoviesViewController())
            }
            else if(indexPath.row == 1) {
                segueToScreen(controller: YogaExerciseViewController())
            }
            else if(indexPath.row == 2) {
                segueToScreen(controller: DrinkingWaterViewController())
            }
            else if(indexPath.row == 3) {
                segueToScreen(controller: DoGardeningViewController())
            }
            else if(indexPath.row == 4) {
                segueToScreen(controller: TalkWithFriendsOrCommunityViewController())
            }
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 40))
        let tableLabel = UILabel(frame: CGRect (x: 5, y: 0, width: header.frame.size.width, height: header.frame.size.height))
        
        header.addSubview(tableLabel)
        
        if (section == 0) {
            tableLabel.font = UIFont.boldSystemFont(ofSize: 34)
            tableLabel.text = "Nicotine Cravings"
        }
        else if (section == 1) {
            tableLabel.font = UIFont.boldSystemFont(ofSize: 18)
            tableLabel.text = "Recommended"
        }
        else {
            tableLabel.font = UIFont.boldSystemFont(ofSize: 18)
            tableLabel.text = "Other Activities"
        }
        
        return header
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if (indexPath.section == 0) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            let descriptionLabel = UILabel()
            
            cell.selectionStyle = .none
            cell.addSubview(descriptionLabel)
            descriptionLabel.text = "When you feel like consuming more cigarettes, try to distract yourself with these activities"
            descriptionLabel.numberOfLines = 0
            descriptionLabel.font = UIFont.systemFont(ofSize: 15)
            descriptionLabel.textColor = UIColor.rgb(red: 132, green: 132, blue: 132)
            descriptionLabel.anchor(top: cell.topAnchor, left: cell.leftAnchor, right: cell.rightAnchor, paddingTop: 20, paddingLeft: 5, paddingRight: 5)
            
            return cell
        }
        else if (indexPath.section == 1) {
            let cell = tableView.dequeueReusableCell(withIdentifier: "secondCell", for: indexPath)
            let image = UIImage(named: "breath-bg.png")
            let ratio = image!.size.width / image!.size.height
            let newHeight = cell.frame.width / ratio
            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: newHeight))

            imageView.image = image
            cell.selectionStyle = .none
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
            cell.selectionStyle = .none
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
            
            return cell
        }
    }
}
