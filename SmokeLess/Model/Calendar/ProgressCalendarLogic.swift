//
//  ProgressCalendarLogic.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//

import Foundation

struct ProgressCalendarLogic {
    private let calendar = Calendar(identifier: .gregorian)
    let dateFormatter = DateFormatter()
    let todayDate = Date()
    var selectedDate = Date()
    var selectedMonth = Date()
    var monthData: MonthMetadata?
    
    var monthString = "6/2022"
    var dayString = "1"
    var dateString = "1/6/2022"
    
    mutating func getMonthStringToday() {
        dateFormatter.dateFormat = "M/yyyy"
        let todayMonthString = dateFormatter.string(from: Date())
        //contoh return (20)
        self.monthString = todayMonthString
    }
    
    func getTodayDay() -> Int {
        dateFormatter.dateFormat = "d"
        let todayDay = dateFormatter.string(from: Date())
        //contoh return (20)
        return Int(todayDay) ?? 1
    }
    mutating func updateDay(){
        self.dayString = String(getTodayDay())
    }
    
    func getTodayDate() -> String {
        dateFormatter.dateFormat = "dd/M/yyyy"
        let todayDate = dateFormatter.string(from: Date())
        //contoh return (20)
        return String(todayDate)
    }
    
    mutating func updateDateString(){
        self.dateString = getTodayDate()
    }
    
    func getPickedMonth() -> Int {
        let pickedMonthAndYear = Calendar.current.dateComponents([.year, .month], from: selectedMonth)
        let pickedMonth = pickedMonthAndYear.month
        // contoh return (03)
        return pickedMonth ?? 1
    }
    
    func getPickedYear() -> Int {
        let pickedMonthAndYear = Calendar.current.dateComponents([.year, .month], from: selectedMonth)
        let pickedYear = pickedMonthAndYear.year
        // contoh return (2022)
        return pickedYear ?? 2022
    }
    
    func getPickedMonthAndYear() -> String {
        let pickedMonthAndYear = Calendar.current.dateComponents([.year, .month], from: selectedMonth)
        let pickedMonth = pickedMonthAndYear.month
        let pickedYear = pickedMonthAndYear.year
        //contoh return "02/2022"
        return "\(pickedMonth ?? 01)/\(pickedYear ?? 2022)"
    }
    
    func getMonthYearFormat() -> DateFormatter{
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/yy"
        return dateFormatter
    }
    
}
