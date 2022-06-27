//
//  TabBarController.swift
//  SmokeLess
//
//  Created by Kevin ahmad on 26/06/22.
//


import UIKit
import CoreData

class TabBarController: UITabBarController {

    // MARK: - Properties
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureViewControllers()
    }
    //MARK: - Helpers

    
    func configureViewControllers() {
        let progress = ProgressViewController()
        let nav1 = navigationController(image: UIImage(systemName: "calendar.badge.minus"),title: "Progress", rootViewController: progress)
        let nicotine = NicotineMenuViewController()
        let nav2 = navigationController(image: UIImage(systemName: "cross.fill"), title: "Nicotine Cravings", rootViewController: nicotine)
        let statistic = StatisticViewController()
        let nav3 = navigationController(image: UIImage(systemName: "chart.bar.fill"), title: "Statistic", rootViewController: statistic)
        viewControllers = [nav1,nav2,nav3]
    }
    
    func navigationController(image: UIImage?,title: String, rootViewController: UIViewController) ->
        UINavigationController{
            let nav = UINavigationController(rootViewController: rootViewController)
            nav.tabBarItem.image = image
            nav.tabBarItem.title = title
            nav.navigationBar.barTintColor = .white
            return nav
    }
 
}
