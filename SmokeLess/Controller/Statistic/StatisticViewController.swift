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
        theButton.addTarget(StatisticViewController.self, action: #selector(changeMonthPressed), for: .touchUpInside)
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
    
    @objc func changeMonthPressed() {
        print("Change Month")
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
        setUpChart()


        statisticLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
        cigarreteSummaryLabel.anchor(top: statisticLabel.bottomAnchor, left: statisticLabel.leftAnchor, paddingTop: 20)
                
        changeMonthLabel.anchor(top: cigarreteSummaryLabel.topAnchor)
        
        changeMonthButton.anchor(top: cigarreteSummaryLabel.topAnchor, left: changeMonthLabel.rightAnchor, right: statisticLabel.rightAnchor, paddingLeft: 5)
        
        
         // Change this top anchor to bottom anchor of the chart later on
        

        dayStatusStack.anchor(top: collectionView.bottomAnchor, left: statisticLabel.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingRight: 20)
        
        cigarettesLimitConsumedView.anchor(top: dayStatusStack.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
        
    }
    
    func setUpChart(){
        view.addSubview(grid)
        view.addSubview(collectionView)

        
        collectionView.anchor(top: cigarreteSummaryLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 40)
        collectionView.heightAnchor.constraint(equalToConstant: grid.totalHeight).isActive = true
        grid.anchor(top: cigarreteSummaryLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 40)
        grid.heightAnchor.constraint(equalToConstant: grid.totalHeight).isActive = true
        grid.backgroundColor = .clear
        
        collectionView.delegate = self
        collectionView.dataSource = self
    
    }
    
    func createChartAxis() {
        
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
            axisLabel.anchor(left: collectionView.rightAnchor, bottom: collectionView.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 10, paddingBottom: CGFloat(CGFloat(i) * space))
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
        cell.contentView.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.bounds.width / 6, height: collectionView.bounds.height)
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
