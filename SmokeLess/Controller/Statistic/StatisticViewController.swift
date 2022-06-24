//
//  StatisticViewController.swift
//  SmokeLess
//
//  Created by Hada Melino Muhammad on 20/06/22.
//

import UIKit

class StatisticViewController: UIViewController {
    
    // MARK: - Properties
    
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
        theButton.tintColor = .black
        theButton.addTarget(self, action: #selector(changeMonthPressed), for: .touchUpInside)
        return theButton
    }()
    
    let changeMonthLabel: UILabel = {
        let theLabel = UILabel()
        theLabel.text = "June 2022"
        theLabel.font = .systemFont(ofSize: 16, weight: .bold)
        return theLabel
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
    
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        drawLineToView(viewToAdd: cigarettesLimitConsumedView, origin: CGPoint(x: cigarettesLimitConsumedView.bounds.width / 2, y: 10), destination: CGPoint(x: cigarettesLimitConsumedView.bounds.width / 2, y: cigarettesLimitConsumedView.bounds.height - 10))
        
        createChartAxis()

    }
    
    
    // MARK: - Helpers
    
    var selectedDateChart: IndexPath?
    
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
        view.addSubview(changeMonthLabel)
        view.addSubview(dayStatusStack)
        view.addSubview(cigarettesLimitConsumedView)
        view.addSubview(fullDateOfChart)
        view.addSubview(chartLegendStack)
        view.addSubview(grid)
        view.addSubview(collectionView)
        setUpChart()


        statisticLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        cigarreteSummaryLabel.anchor(top: statisticLabel.bottomAnchor, left: statisticLabel.leftAnchor, paddingTop: 20)
                
        changeMonthLabel.anchor(top: cigarreteSummaryLabel.topAnchor)
        
        changeMonthButton.anchor(top: cigarreteSummaryLabel.topAnchor, left: changeMonthLabel.rightAnchor, right: statisticLabel.rightAnchor, paddingLeft: 5)
        
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
    
    func createChartAxis() {
        
        // For dynamic chart axis
        var axisPoint = collectionView.bounds.maxY
        var space = collectionView.bounds.height / 4
        var axisNumber = 0
        var maxNumber = 40
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
    
}

// MARK: - Extension

extension StatisticViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "barCell", for: indexPath) as! BarChartCollectionViewCell
        
        // Set this constraints for dynamic bar height
        cell.limitBar.setDimensions(width: cell.contentView.bounds.width / 4, height: 40)
        cell.consumedBar.setDimensions(width: cell.contentView.bounds.width / 4, height: 80)
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 6, height: collectionView.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? BarChartCollectionViewCell else {return}
        
        if indexPath.row == selectedDateChart?.row {
            return
        } else {
            cell.dateLabel.textColor = .white
            cell.circleLabelBg.backgroundColor = .smokeLessBlue
            if let previousIndexPath = selectedDateChart {
                let previousCell = collectionView.cellForItem(at: previousIndexPath) as? BarChartCollectionViewCell
                previousCell?.dateLabel.textColor = .black
                previousCell?.circleLabelBg.backgroundColor = .clear
            }
            selectedDateChart = indexPath

        }
    }
    
    
    
    
}

extension StatisticViewController: MonthChangeDelegate {
    func userEnterMonthAndYear(month: String, year: String) {
        calendarLogic.updateDay()
        calendarLogic.monthString = "\(month)/\(year)"
        collectionView.reloadData()
        configureUI()
        scrollToDate()
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
