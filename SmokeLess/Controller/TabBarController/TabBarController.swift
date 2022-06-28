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
    
    var container: NSPersistentContainer!
    var data: [DailyCoreData]?
    

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        container = appDelegate.persistentContainer
        appDelegate.emptyDataStore()
        fetchRequest()
        configureViewControllers()
    }
    //MARK: - Helpers

    func configureViewControllers() {
        let progress = ProgressViewController()
        progress.delegate = self
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
    
    func fetchRequest() {
        do {
            data = try container.viewContext.fetch(DailyCoreData.fetchRequest())
        } catch {
            fatalError("Couldn't fetch User Data!!!")
        }
    }
 
}

extension TabBarController: ProgressToTabBarDelegate {
    func editData(with date: String, increment: Bool) {
        print("start edit")
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        print(urls[urls.count-1] as URL)
        // cek keberadaan data (ada ato ga)
        
        let newData: DailyCoreData?

        do {
            print("do")
            let fetchRequest : NSFetchRequest<DailyCoreData> = DailyCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@", date)
            let fetchedResults = try container.viewContext.fetch(fetchRequest)
            if let fetchedData = fetchedResults.first {
                if increment {
                    // objek.consumed += 1
                    fetchedData.consumed += 1
                    fetchedData.date = date
                    print("add", date)
                }
                else {
                    // Cek kalo 0 jangan mau
                    fetchedData.consumed -= 1
                    print("decrement", date)
                }
                print("user data")
                print(fetchedData.consumed)
            }else {
                print("DEBUG: ga nemu data")
                newData = DailyCoreData(context: container.viewContext)
                newData?.consumed += 1
                newData?.date = date
                print("new data")
                print(newData?.consumed)
            }
        }
        catch {
            print("catch")
            print ("fetch task failed", error)
            
        }

        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        appDelegate.saveContext()
        
    }
}
