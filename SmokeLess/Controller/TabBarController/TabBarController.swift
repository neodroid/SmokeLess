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
    var data = [DailyCoreData]()
    var dataYesterday = [DailyCoreData]()
    let taperingLogic = TaperingLogic()
    let userDefaults = UserDefaults.standard
    var startDate: String? = ""
    var cigaretteUse: Int? = 0
    var goals: String? = ""
    
    // MARK: - Lifecycle
    
    override func viewWillLayoutSubviews() {
        startDate = userDefaults.string(forKey: "startDate")
        cigaretteUse = userDefaults.integer(forKey: "cigaretteUse")
        goals = userDefaults.string(forKey: "goals")
        if (startDate == nil || cigaretteUse == nil || goals == nil) {
            segueToOnBoarding()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        taperingLogic.updateCigLimit(startDate: "1/7/2022", startLimit: 5)
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        container = appDelegate.persistentContainer
//        appDelegate.emptyDataStore()
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
    
    private func segueToOnBoarding() {
        let controller = FirstOnBoardingViewController()
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        present(nav, animated: true)
    }
    
}

extension TabBarController: ProgressToTabBarDelegate {
    
    func loadSelectedDateData(with date: String) {
        do {
            let fetchRequest : NSFetchRequest<DailyCoreData> = DailyCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@", date)
            data = try container.viewContext.fetch(fetchRequest)
//            print(data, date)
        } catch {
            print(error)
        }
        
    }
    
    func editData(with date: String, increment: Bool) {
//        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        //print(urls[urls.count-1] as URL)
        // cek keberadaan data (ada ato ga)
        
        let newData: DailyCoreData?
        
        do {
            //print("do")
            let fetchRequest : NSFetchRequest<DailyCoreData> = DailyCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@", date)
            data = try container.viewContext.fetch(fetchRequest)
            
            
            if let fetchedData = data.first {
                if increment {
                    // objek.consumed += 1
                    fetchedData.consumed += 1
                    fetchedData.date = date
                    if fetchedData.consumed > fetchedData.limit {
                        print("DEBUG MOREE")
                        taperingLogic.updateCigLimit(startDate: taperingLogic.nextDay(date), startLimit: Int(fetchedData.limit))
                    }
                }
                else {
                    // Cek kalo 0 jangan mau
                    if  fetchedData.consumed > 0 {
                        fetchedData.consumed -= 1
                        fetchRequest.predicate = NSPredicate(format: "date == %@", taperingLogic.dayBefore(date))
                        dataYesterday = try container.viewContext.fetch(fetchRequest)
                        guard let fetchDataYesterday = dataYesterday.first else {return}
                        if fetchedData.consumed <= fetchedData.limit {
                            if fetchDataYesterday.consumed <= fetchDataYesterday.limit && fetchDataYesterday.limit == fetchedData.limit{
                                taperingLogic.updateCigLimit(startDate: taperingLogic.dayBefore(date), startLimit: Int(fetchedData.limit))
                            }else {
                                taperingLogic.updateCigLimit(startDate: date, startLimit: Int(fetchedData.limit))
                            }
                            
                        }
                    }
                    
                }
            }else {
                //print("DEBUG: ga nemu data")
                if increment {
                    newData = DailyCoreData(context: container.viewContext)
                    newData?.consumed += 1
                    newData?.date = date
                    data = try container.viewContext.fetch(fetchRequest)
                    //print(data)
                }
                
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        appDelegate.saveContext()
    }
}
