//
//  StatisticViewController.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 20/06/22.
//

import UIKit

class StatisticViewController: UIViewController {
    
    // MARK: - Properties
    
    let monthTemplate = MonthTemplate()
    let statisticLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Statistic"
        theLabel.font = .systemFont(ofSize: 34, weight: .bold)
        return theLabel
    }()
    
    let cigarreteSummaryLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarette Summary"
        theLabel.font = .systemFont(ofSize: 16, weight: .bold)
        return theLabel
    }()
    
    let changeMonthButton: UIButton = {
        let theButton = UIButton()
        theButton.setImage(UIImage(systemName: "chevron.down"), for: .normal)
        theButton.setTitle("Jun 2022 ", for: .normal)
        theButton.setTitleColor(UIColor.black, for: .normal)
        theButton.semanticContentAttribute = .forceRightToLeft
        theButton.tintColor = .black
        theButton.addTarget(self, action: #selector(changeMonthPressed), for: .touchUpInside)
        return theButton
    }()

    let dayStatusStack: UIStackView = {
        let theStack = UIStackView()
        let theLabel = UILabel()
        let theImage = UIImageView(image: UIImage(systemName: "checkmark.seal.fill"))
        
        theImage.tintColor = .smokeLessGreen
        theLabel.textColor = .smokeLessGreen
        
        theStack.axis = .horizontal
        theLabel.text = "You did great!"
        
        theStack.addArrangedSubview(theImage)
        theStack.addArrangedSubview(theLabel)
        theStack.spacing = 5
        
        return theStack
    }()
    
    let hStack: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .horizontal
        theStack.distribution = .fillEqually
        theStack.spacing = 50
        return theStack
    }()
    
    let vStackLimit: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .vertical
        theStack.spacing = 20
        return theStack
    }()
    
    let limitLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarettes\nLimit"
        theLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        theLabel.numberOfLines = 2
        return theLabel
    }()
    
    let limitNumber: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "13"
        theLabel.font = .systemFont(ofSize: 45, weight: .regular)
        return theLabel
    }()
    
    let vStackConsumed: UIStackView = {
        let theStack = UIStackView()
        theStack.axis = .vertical
        theStack.spacing = 20
        return theStack
    }()
    
    let consumedLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "Cigarettes\nConsumed"
        theLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        theLabel.numberOfLines = 2
        return theLabel
    }()
    
    
    let consumedStackForStatus = UIView()
    
    let statusImage: UIImageView = {
        let imageView = UIImageView(image: UIImage(systemName: "checkmark.seal.fill"))
        imageView.tintColor = .smokeLessGreen
        imageView.contentMode = .scaleAspectFit
        imageView.heightAnchor.constraint(equalToConstant: 25).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 25).isActive = true
        return imageView
    }()

    let consumedNumber: UILabel = {
        let theLabel = UILabel()
        theLabel.translatesAutoresizingMaskIntoConstraints = false
        theLabel.text = "13"
        theLabel.textColor = .smokeLessGreen
        theLabel.font = .systemFont(ofSize: 45)
        return theLabel
    }()
    
    let cigarettesLimitConsumedView: UIView = {
        var theView = UIView()
        theView.backgroundColor = .white
        theView = addShadowToView(viewToAdd: theView, shadowColor: UIColor.black.cgColor, shadowRadius: 7, shadowOpacity: 0.2, shadowOffset: CGSize(width: 0, height: 4))
        theView.layer.cornerRadius = 20
        return theView
    }()
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let theCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        theCollectionView.register(BarChartCollectionViewCell.self, forCellWithReuseIdentifier: "barCell")
        theCollectionView.backgroundColor = .clear
        theCollectionView.isScrollEnabled = true
        theCollectionView.showsHorizontalScrollIndicator = false
        return theCollectionView
    }()
    
    let fullDateOfChart: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "1 June 2022"
        theLabel.font = .systemFont(ofSize: 20)
        return theLabel
    }()
    
    let chartLegendStack: UIStackView = {
        let containerStack = UIStackView()
        containerStack.axis = .horizontal
        containerStack.spacing = 10
        
        let limitStack = UIStackView()
        let limitLabel = UILabel()
        let limitRect = UIView()
        limitRect.translatesAutoresizingMaskIntoConstraints = false
        limitRect.setDimensions(width: 10, height: 10)
        limitRect.backgroundColor = .smokeLessBlue
        limitLabel.text = "Limit"
        limitLabel.font = .systemFont(ofSize: 13)
        limitStack.addArrangedSubview(limitRect)
        limitStack.addArrangedSubview(limitLabel)
        limitStack.axis = .horizontal
        //limitStack.distribution = .fillEqually
        limitStack.spacing = 5
        
        let notExceedStack = UIStackView()
        let notExceedLabel = UILabel()
        let notExceedRect = UIView()
        notExceedRect.translatesAutoresizingMaskIntoConstraints = false
        notExceedRect.setDimensions(width: 10, height: 10)
        notExceedRect.backgroundColor = .smokeLessGreen
        notExceedLabel.text = "Not exceed"
        notExceedLabel.font = .systemFont(ofSize: 13)
        notExceedStack.addArrangedSubview(notExceedRect)
        notExceedStack.addArrangedSubview(notExceedLabel)
        notExceedStack.axis = .horizontal
        notExceedStack.spacing = 5
        
        let exceedStack = UIStackView()
        let exceedLabel = UILabel()
        let exceedRect = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
        exceedRect.translatesAutoresizingMaskIntoConstraints = false
        exceedRect.setDimensions(width: 10, height: 10)
        exceedRect.backgroundColor = UIColor(red: 235/255, green: 100/255, blue: 104/255, alpha: 100) // .smokelessRed
        exceedLabel.text = "Exceed"
        exceedLabel.font = .systemFont(ofSize: 13)
        exceedStack.addArrangedSubview(exceedRect)
        exceedStack.addArrangedSubview(exceedLabel)
        exceedStack.axis = .horizontal
        exceedStack.spacing = 5
        
        containerStack.addArrangedSubview(limitStack)
        containerStack.addArrangedSubview(notExceedStack)
        containerStack.addArrangedSubview(exceedStack)
        
        
        return containerStack
    }()
    
    let grid = ChartGrid(frame: .zero, gridSpace: 40)
    var coreDataFetch = [DailyCoreData]()
    var tabBar: TabBarController?
    var selectedDateChart: IndexPath?
    var calendarLogic = ProgressCalendarLogic()
    var displayedMonth = ""
    var displayedYear = ""

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        navigationController?.setNavigationBarHidden(true, animated: false)
        tabBar = tabBarController as! TabBarController
        selectedDateChart = IndexPath(row: calendarLogic.getTodayDay() - 1, section: 0)
        
        calendarLogic.getMonthStringToday()
        calendarLogic.updateDateString()
        configureUI()
        setupMonthLabel()
        setUpConsumedAndLimitLabel()

        
        tabBar?.fetchRequest()
        if let data = tabBar?.data {
            coreDataFetch = data
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawLineToView(viewToAdd: cigarettesLimitConsumedView, origin: CGPoint(x: cigarettesLimitConsumedView.bounds.width / 2, y: 10), destination: CGPoint(x: cigarettesLimitConsumedView.bounds.width / 2, y: cigarettesLimitConsumedView.bounds.height - 10))
        
        createChartAxis()

    }
    
    
    // MARK: - Helpers
    @objc func changeMonthPressed() {
        let VC = ChangeMonthController()
        VC.delegate = self
        if let sheet = VC.sheetPresentationController {
            sheet.detents = [.medium()]
        }
        
        VC.currPickedMonth = calendarLogic.getPickedMonth()
        VC.currPickedYear = calendarLogic.getPickedYear()
        self.present(VC, animated: true, completion: nil)
    }
    
    func configureUI() {
        calendarLogic.selectedMonth = calendarLogic.getMonthYearFormat().date(from: calendarLogic.monthString) ?? Date()
        
        if let metadata = try? monthMetadata(for: calendarLogic.selectedMonth) {
            calendarLogic.monthData = metadata
        }
        // Setup Limit Counter View
        vStackLimit.addArrangedSubview(limitLabel)
        vStackLimit.addArrangedSubview(limitNumber)
        
        // Setup Consumed Counter View
        vStackConsumed.addArrangedSubview(consumedLabel)
        vStackConsumed.addArrangedSubview(consumedStackForStatus)
        consumedStackForStatus.addSubview(consumedNumber)
        consumedStackForStatus.addSubview(statusImage)
        consumedNumber.anchor(top:consumedStackForStatus.topAnchor, left: consumedStackForStatus.leftAnchor, bottom: consumedStackForStatus.bottomAnchor)
        statusImage.anchor(left: consumedNumber.rightAnchor, bottom: consumedNumber.bottomAnchor, paddingLeft: 5, paddingBottom: 10)
        
        hStack.addArrangedSubview(vStackLimit)
        hStack.addArrangedSubview(vStackConsumed)
        
        // Wrap the hStack to UIView for shadow
        cigarettesLimitConsumedView.addSubview(hStack)
        hStack.anchor(top: cigarettesLimitConsumedView.topAnchor, left: cigarettesLimitConsumedView.leftAnchor, bottom: cigarettesLimitConsumedView.bottomAnchor, right: cigarettesLimitConsumedView.rightAnchor, paddingTop: 20, paddingLeft: 30, paddingBottom: 20)

        view.addSubview(statisticLabel)
        view.addSubview(cigarreteSummaryLabel)
        view.addSubview(changeMonthButton)
        view.addSubview(dayStatusStack)
        view.addSubview(cigarettesLimitConsumedView)
        view.addSubview(fullDateOfChart)
        view.addSubview(chartLegendStack)
        view.addSubview(grid)
        view.addSubview(collectionView)
        setUpChart()


        statisticLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        cigarreteSummaryLabel.anchor(top: statisticLabel.bottomAnchor, left: statisticLabel.leftAnchor, paddingTop: 20)
                        
        changeMonthButton.anchor(top: cigarreteSummaryLabel.topAnchor, left: cigarreteSummaryLabel.rightAnchor, right: statisticLabel.rightAnchor, paddingLeft: 5)
        
        fullDateOfChart.anchor(top: cigarreteSummaryLabel.bottomAnchor, left: cigarreteSummaryLabel.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 10, paddingRight: 20)
        
        chartLegendStack.anchor(top: fullDateOfChart.bottomAnchor, left: fullDateOfChart.leftAnchor, paddingTop: 25)
        
        collectionView.anchor(top: chartLegendStack.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingLeft: 20, paddingRight: 40)
        collectionView.heightAnchor.constraint(equalToConstant: grid.totalHeight).isActive = true
        
        grid.anchor(top: collectionView.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: -20, paddingLeft: 20, paddingRight: 40)
        grid.heightAnchor.constraint(equalToConstant: grid.totalHeight).isActive = true
                
        dayStatusStack.anchor(top: collectionView.bottomAnchor, left: statisticLabel.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 40, paddingRight: 20)
        
        cigarettesLimitConsumedView.anchor(top: dayStatusStack.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
    }
    
    func setUpChart(){
        grid.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func setUpConsumedAndLimitLabel() {
        let todayDataDate = dateStringForIndexPath(dayInt: calendarLogic.getTodayDay() - 1)
        tabBar?.loadSelectedDateData(with: todayDataDate)
        print(tabBar?.data)
        if let data = tabBar?.data.first {
            limitNumber.text = String(data.limit)
            consumedNumber.text = String(data.consumed)
        }
        
    }
    
    func setupMonthLabel(){
        let fullString =  "\(monthTemplate.shortName[calendarLogic.getPickedMonth() - 1]) , \(calendarLogic.getPickedYear())"
        displayedYear = String(calendarLogic.getPickedYear())
        displayedMonth = calendarLogic.dateFormatter.monthSymbols[calendarLogic.getPickedMonth() - 1]
        changeMonthButton.setTitle(fullString, for: .normal)
        fullDateOfChart.text = "\(calendarLogic.getTodayDay()) \(displayedMonth) \(displayedYear)"
    }
    
    func createChartAxis() {
        
        // For dynamic chart axis
        var axisPoint = collectionView.bounds.maxY
        var space = collectionView.bounds.height / 4
        var axisNumber = 0
        var maxNumber = 12
        var axisSpace = maxNumber / 4
        
        for i in 0...4 {
            let axisLabel = UILabel()
            axisLabel.text = String(axisNumber)
            axisLabel.font = .systemFont(ofSize: 13)
            view.addSubview(axisLabel)
            axisLabel.anchor(left: grid.rightAnchor, bottom: grid.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 10, paddingBottom: CGFloat(CGFloat(i) * space))
            axisPoint += 40
            axisNumber += axisSpace
        }
    }
    
    func dateStringForIndexPath(dayInt: Int) -> String {
        let day = dayInt + 1
        let month = calendarLogic.dateFormatter.monthSymbols.firstIndex { dateMonth in
            dateMonth == displayedMonth
        }! + 1
        let year = Int(displayedYear)!
        let date = "\(day)/\(Int(month))/\(year)"
        return date
    }
    
}

// MARK: - Extension

extension StatisticViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return calendarLogic.monthData?.numberOfDays ?? 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarChartCollectionViewCell

        // Date format 3/7/2022
        // Set this constraints for dynamic bar height
        let date = dateStringForIndexPath(dayInt: indexPath.row)
        tabBar?.loadSelectedDateData(with: date)
        cell.dateLabel.text = String(indexPath.row + 1)
        if indexPath == selectedDateChart {
            cell.dateLabel.textColor = .white
            cell.circleLabelBg.backgroundColor = .smokeLessBlue
        } else {
            cell.dateLabel.textColor = .black
            cell.circleLabelBg.backgroundColor = .clear
        }

        if let data = tabBar?.data.first {
            let collectionViewHeight = collectionView.bounds.height
            let maxNumber: Float = 12
            let consumedHeight = CGFloat(Float(data.consumed) / maxNumber) * collectionViewHeight
            let limitHeight = CGFloat(Float(data.limit) / maxNumber) * collectionViewHeight

            cell.limitHeightConstraint.constant = limitHeight
            cell.consumedHeightConstraint.constant = consumedHeight
    
            if data.consumed > data.limit {
                cell.consumedBar.backgroundColor = .red
            } else {
                cell.consumedBar.backgroundColor = .smokeLessGreen
            }
        } else {
            cell.limitHeightConstraint.constant = 0
            cell.consumedHeightConstraint.constant = 0
        }
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 6, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dateSelected = dateStringForIndexPath(dayInt: indexPath.row)
        tabBar?.loadSelectedDateData(with: dateSelected)
        print("Selected Data: ")
        print(tabBar?.data.first)
        if let selectedData = tabBar?.data.first {
            let fullString = "\(indexPath.row + 1) \(displayedMonth) \(displayedYear)"
            fullDateOfChart.text = fullString
            consumedNumber.text = String(selectedData.consumed)
            limitNumber.text = String(selectedData.limit)
            
            if indexPath.row == selectedDateChart?.row {
                return
            } else {
                selectedDateChart = indexPath
            }
            collectionView.reloadData()
        }
        
    }
}

extension StatisticViewController: MonthChangeDelegate {
    func userEnterMonthAndYear(month: String, year: String) {
        calendarLogic.updateDay()
        calendarLogic.monthString = "\(month)/\(year)"
        let fullString =  "\(monthTemplate.shortName[Int(month)! - 1]) , \(year) "
        displayedMonth = calendarLogic.dateFormatter.monthSymbols[Int(month)! - 1]
        displayedYear = year
                
        // if selected month dan year nya sama kaya skrng, default date jadi today
        calendarLogic.dateFormatter.dateFormat = "MMMM"
        let todayMonth = calendarLogic.dateFormatter.string(from: Date.now)
        let monthToString = calendarLogic.dateFormatter.monthSymbols[Int(month)! - 1]
        
        calendarLogic.dateFormatter.dateFormat = "YYYY"
        let todayYear = calendarLogic.dateFormatter.string(from: Date.now)

        if monthToString == todayMonth && year == todayYear {
            let todayDay = calendarLogic.getTodayDay()
            fullDateOfChart.text = "\(todayDay) \(calendarLogic.dateFormatter.monthSymbols[Int(month)! - 1]) \(year)"
            selectedDateChart = IndexPath(row: todayDay - 1, section: 0)
        } else {
            fullDateOfChart.text = "1 \(calendarLogic.dateFormatter.monthSymbols[Int(month)! - 1]) \(year)"
            selectedDateChart = IndexPath(row: 0, section: 0)
        }
        changeMonthButton.setTitle(fullString, for: .normal)
        collectionView.reloadData()
        configureUI()
    }

}

// MARK: - Additional Func

public func addShadowToView(viewToAdd: UIView, shadowColor: CGColor, shadowRadius: CGFloat, shadowOpacity: Float, shadowOffset: CGSize) -> UIView {
    viewToAdd.layer.shadowColor = shadowColor
    viewToAdd.layer.shadowRadius = shadowRadius
    viewToAdd.layer.shadowOpacity = shadowOpacity
    viewToAdd.layer.shadowOffset = shadowOffset
    return viewToAdd
}

public func drawLineToView(viewToAdd: UIView, origin: CGPoint, destination: CGPoint) {
    let lineOnView = DrawLineOnView(frame: .zero, from: origin, to: destination)
    lineOnView.backgroundColor = .clear
    viewToAdd.addSubview(lineOnView)
    lineOnView.anchor(top: viewToAdd.topAnchor, left: viewToAdd.leftAnchor, bottom: viewToAdd.bottomAnchor, right: viewToAdd.rightAnchor)
}

extension StatisticViewController {
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
