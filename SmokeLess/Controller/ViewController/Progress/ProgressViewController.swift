//
//  ProgressViewController.swift
//  Smokeless-playground
//
//  Created by Kevin ahmad on 12/06/22.
//


import UIKit

class ProgressViewController: UIViewController, ProgressMonthChangeDelegate{
    
    //MARK: - Properties
    
    let dailyData = [DailyData]()
    var calendarLogic = ProgressCalendarLogic()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: makeLayout())
        collectionView.backgroundColor = .white
        collectionView.register(DateCell.self, forCellWithReuseIdentifier: "dateCell")
        collectionView.register(TopHeaderCell.self, forCellWithReuseIdentifier: "topHeaderCell")
        collectionView.register(TittleCell.self, forCellWithReuseIdentifier: "TittleCell")
        collectionView.register(TodayLimitCell.self, forCellWithReuseIdentifier: "TodayLimitCell")
        collectionView.register(TodayConsumedCell.self, forCellWithReuseIdentifier: "TodayConsumedCell")
        return collectionView
    }()
    
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        calendarLogic.updateDay()
        calendarLogic.getMonthStringToday()
        configureUI()
        // TODO: bug at the end of month
//        scrollToDate()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // TODO: bug at the end of month
//        scrollToDate()
    }
    
    //MARK: - Selectors
    
    @objc func advance() {
        let VC = ProgressChangeMonthController()
        VC.delegate = self
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        VC.currPickedMonth = calendarLogic.getPickedMonth()
        VC.currPickedYear = calendarLogic.getPickedYear()
        self.present(VC, animated: true, completion: nil)
    }
    
    
    //MARK: - Helpers
    
    // scroll UI ke hari ini
    func scrollToDate() {
        if calendarLogic.getTodayDay() > 4 {
            collectionView.scrollToItem(at: (NSIndexPath(item: calendarLogic.getTodayDay(), section: 1) as IndexPath), at: [], animated: true)
        }
    }
    //fungsi untuk enter bulan dan tahun di ChangeMonthAndYearController
    func userEnterMonthAndYear(month: String, year:String) {
        calendarLogic.updateDay()
        calendarLogic.monthString = "\(month)/\(year)"
        collectionView.reloadData()
        configureUI()
        scrollToDate()
    }
    
    // load data dan bikin UI
    func configureUI(){
        navigationController?.setNavigationBarHidden(true, animated: false)
        
        calendarLogic.selectedMonth = calendarLogic.getMonthYearFormat().date(from: calendarLogic.monthString) ?? Date()
        
        if let metadata = try? monthMetadata(for: calendarLogic.selectedMonth) {
            calendarLogic.monthData = metadata
        }
        
        view.backgroundColor = .white
        view.addSubview(collectionView)
        collectionView.anchor(top: view.safeAreaLayoutGuide.topAnchor,left: view.leftAnchor,bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor)
        collectionView.dataSource = self
        collectionView.delegate = self
    }
    
    // Layout untuk cell collectionView
    func makeLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewCompositionalLayout { (section: Int, environment: NSCollectionLayoutEnvironment) -> NSCollectionLayoutSection? in
            if section == 0 {
                return LayoutBuilder.buildHeaderSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)))
            }else if section == 1{
                return LayoutBuilder.buildGallerySectionLayout(size: NSCollectionLayoutSize(widthDimension: .absolute(80), heightDimension: .absolute(90)))
            }else if section == 2{
                return LayoutBuilder.buildTodayLimitSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(100)))
            }else {
                return LayoutBuilder.buildTodayProgressSectionLayout(size: NSCollectionLayoutSize(widthDimension: .fractionalWidth(1), heightDimension: .absolute(150)))
            }
        }
        return layout
        
    }
    
    // navigasi ke page ChangeMonthController
    func showChangeMonth(){
        let VC = ChangeMonthController()
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        self.present(VC, animated: true, completion: nil)
        
    }
}

// MARK: - Extensions

extension ProgressViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 1{
            return calendarLogic.monthData?.numberOfDays ?? 1
        }else {
            return 1
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = CellBuilder.getTopHeaderCell(collectionView: collectionView, indexPath: indexPath, month: calendarLogic.getPickedMonth(), year: calendarLogic.getPickedYear())
            return cell
        }else if indexPath.section == 1{
            let cell = CellBuilder.getDateCell(collectionView: collectionView, indexPath: indexPath, startDay: calendarLogic.monthData?.firstDayWeekday ?? 0, monthYear: calendarLogic.getPickedMonthAndYear(), pickedDay: calendarLogic.dayString)
            return cell
        }else if indexPath.section == 2{
            let cell = CellBuilder.getLimitCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        }else {
            let cell = CellBuilder.getConsumedCell(collectionView: collectionView, indexPath: indexPath)
            return cell
        }
    }
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if indexPath.section == 0 {
            perform(#selector(advance), with: nil, afterDelay: 0)
        }else if indexPath.section == 1 {
            let currData = Calendar.current.dateComponents([.year, .month], from: calendarLogic.selectedMonth)
            let pickedDate = "\(indexPath.row + 1)/\(currData.month ?? 01)/\(currData.year ?? 2022)"
            calendarLogic.dayString = String(indexPath.row + 1)
            calendarLogic.dateString = pickedDate
            collectionView.reloadData()
            print(calendarLogic.dateString)
            configureUI()
        }
    }
}

// MARK: - Day Generation

extension ProgressViewController {
    
    func monthMetadata(for baseDate: Date) throws -> MonthMetadata {
        let calendar = Calendar(identifier: .gregorian)
        guard
            let numberOfDaysInMonth = calendar.range(
                of: .day,
                in: .month,
                for: baseDate)?.count,
            let firstDayOfMonth = calendar.date(
                from: calendar.dateComponents([.year, .month], from: baseDate))
        else {
            fatalError()
        }
        let firstDayWeekday = calendar.component(.weekday, from: firstDayOfMonth)
        
        return MonthMetadata(
            numberOfDays: numberOfDaysInMonth,
            firstDay: firstDayOfMonth,
            firstDayWeekday: firstDayWeekday)
    }
}

