//
//  TaperingLogic.swift
//  SmokeLess
//
//  Created by Kevin ahmad on 03/07/22.
//
import UIKit
import CoreData

struct TaperingLogic {
    var quitDate = "3/7/2022"
    var startingCig = 5
    let dateFormatter = DateFormatter()
    let calendar = Calendar(identifier: .gregorian)
    
    func updateCigLimit(startDate: String, startLimit: Int){
        var day = startDate
        var limit = startLimit
        var double = false
        while limit != 0 {
            saveLimit(date: day, limit: limit)
            day = nextDay(day)
            if double{
                limit -= 1
                double = false
            }else {
                double = true
            }
            
        }
    }
    
    func nextDay(_ today: String) -> String {
        dateFormatter.dateFormat = "d/M/yyyy"
        guard let todayDate = dateFormatter.date(from: today) else { return ""}
        let modifiedDate = Calendar.current.date(byAdding: .day, value: 1, to: todayDate)!
        let modDate = dateFormatter.string(from: modifiedDate)
        return modDate
    }
    
    func saveLimit(date: String, limit: Int){
        let newData: DailyCoreData?
        var container: NSPersistentContainer!
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        container = appDelegate.persistentContainer
        var data = [DailyCoreData]()
        do {
            let fetchRequest : NSFetchRequest<DailyCoreData> = DailyCoreData.fetchRequest()
            fetchRequest.predicate = NSPredicate(format: "date == %@", date)
            data = try container.viewContext.fetch(fetchRequest)
            if let fetchedData = data.first {
                fetchedData.limit = Int64(limit)
            }else {
                    newData = DailyCoreData(context: container.viewContext)
                    newData?.limit = Int64(limit)
                    newData?.date = date
            }
        }
        catch {
            print ("fetch task failed", error)
        }
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return}
        appDelegate.saveContext()
    }
}
