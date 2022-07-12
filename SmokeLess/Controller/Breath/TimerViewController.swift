////
////  TimerViewController.swift
////  SmokeLess
////
////  Created by Nabilla Azarine on 24/06/22.
////
//
//import UIKit
//
//class TimerViewController: UIViewController {
//    
//    // MARK: - Properties
//    
//    var index: Int = 0
//    var counter: Int = 300
//    var timer = Timer()
//    var isTimerRunning = false
//    
//    var scrollView: UIScrollView = {
//        let scrollView = UIScrollView()
//        scrollView.translatesAutoresizingMaskIntoConstraints = false
//        return scrollView
//    }()
//    
//    var pageControl: UIPageControl = {
//        let pageControl = UIPageControl()
//        pageControl.numberOfPages = 5
//        pageControl.pageIndicatorTintColor = .smokeLessLightGray
//        pageControl.currentPageIndicatorTintColor = .black
//        return pageControl
//    }()
//    
//    var image1: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.image = UIImage(named: "breath-1.png")
//        return image
//    }()
//    
//    var labelText1: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "Sit down in a chair or lie down on any flat surface."
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var image2: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.image = UIImage(named: "breath-2.png")
//        return image
//    }()
//    
//    var labelText2: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "Start by placing left hand on your chest and right hand on your belly."
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var image3: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.image = UIImage(named: "breath-3.png")
//        return image
//    }()
//    
//    var labelText3: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "Take a slow, deep breath in through your nose. Feel the hand on your belly rise."
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var image4: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.image = UIImage(named: "breath-4.png")
//        return image
//    }()
//    
//    var labelText4: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "Breath out slowly through your mouth, feel the hand on your belly lower to its original position."
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var image5: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        image.image = UIImage(named: "breath-5.png")
//        return image
//    }()
//    
//    var labelText5: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "Inhale, exhale … Repeat the process multiple times until the timer ends."
//        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var labelTimer: UILabel = {
//        var label: UILabel = UILabel()
//        label.text = "5:00"
//        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
//        label.textColor = .smokeLessBlue
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    // MARK: - Lifecycle
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        view.backgroundColor = .white
//        
//        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
//        button.configuration = createButton()
//        button.titleLabel?.font = UIFont.systemFont(ofSize: 17)
//        
//        pageControl.addTarget(self, action: #selector(pageControllerChange(_ :)), for: .valueChanged)
//        view.addSubview(button)
//        self.view.bringSubviewToFront(button)
//        button.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingRight: 20)
//        
//        if isTimerRunning == false {
//            createTimer()
//        }
//        
//        view.addSubview(scrollView)
//        
//        view.addSubview(labelTimer)
//        view.addSubview(pageControl)
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 100, width: view.frame.size.width, height: 50)
//        labelTimer.anchor(top: scrollView.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
//        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
//        
//        if scrollView.subviews.count == 2 {
//            configureScrollView()
//        }
//    }
//    
//    
//    // MARK: - Helpers
//    
//    func createButton() -> UIButton.Configuration {
//        var config: UIButton.Configuration = .plain()
//        var container = AttributeContainer()
//        container.font = UIFont.systemFont(ofSize: 17)
//        config.attributedTitle = AttributedString("Done", attributes: container)
//        config.baseForegroundColor = .white
//        return config
//    }
//    
//    func createTimer() {
//        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(runTimer), userInfo: nil, repeats: true)
//        isTimerRunning = true
//    }
//    
//    private func configureScrollView() {
//        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height - pageControl.frame.size.height - 70)
//        scrollView.delegate = self
//        scrollView.isPagingEnabled = true
//        scrollView.showsVerticalScrollIndicator = false
//        scrollView.showsHorizontalScrollIndicator = false
//        
//        for x in 0..<5 {
//            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
//            
//            if (x == 0) {
//                let setImage: UIImage = UIImage(named: "breath-1.png")!
//                page.addSubview(image1)
//                page.addSubview(labelText1)
//                page.contentMode = .scaleAspectFill
//                scrollView.addSubview(page)
//                
//                let ratio = setImage.size.width / setImage.size.height
//                image1.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
//                labelText1.anchor(top: image1.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
//            }
//            
//            else if (x == 1) {
//                let setImage: UIImage = UIImage(named: "breath-2.png")!
//                page.addSubview(image2)
//                page.addSubview(labelText2)
//                page.contentMode = .scaleAspectFill
//                scrollView.addSubview(page)
//                
//                let ratio = setImage.size.width / setImage.size.height
//                image2.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
//                labelText2.anchor(top: image2.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
//                labelTimer.anchor(left: page.safeAreaLayoutGuide.leftAnchor, bottom: page.safeAreaLayoutGuide.bottomAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
//            }
//            
//            else if (x == 2) {
//                let setImage: UIImage = UIImage(named: "breath-2.png")!
//                page.addSubview(image3)
//                page.addSubview(labelText3)
//                page.contentMode = .scaleAspectFill
//                scrollView.addSubview(page)
//                
//                let ratio = setImage.size.width / setImage.size.height
//                image3.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
//                labelText3.anchor(top: image3.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
//            }
//            
//            else if (x == 3) {
//                let setImage: UIImage = UIImage(named: "breath-2.png")!
//                page.addSubview(image4)
//                page.addSubview(labelText4)
//                page.contentMode = .scaleAspectFill
//                scrollView.addSubview(page)
//                
//                let ratio = setImage.size.width / setImage.size.height
//                image4.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
//                labelText4.anchor(top: image4.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
//            }
//            
//            else if (x == 4) {
//                let setImage: UIImage = UIImage(named: "breath-2.png")!
//                page.addSubview(image5)
//                page.addSubview(labelText5)
//                page.contentMode = .scaleAspectFill
//                scrollView.addSubview(page)
//                
//                let ratio = setImage.size.width / setImage.size.height
//                image5.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
//                labelText5.anchor(top: image5.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
//            }
//        }
//    }
//    
//    @objc func pageControllerChange(_ sender: UIPageControl) {
//        let current = sender.currentPage
//        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
//    }
//    
//    @objc func doneTapped(_ sender: UIBarButtonItem) {
//        let vc = DoneViewController()
//        vc.modalPresentationStyle = .fullScreen
//        vc.present(vc, animated: true, completion: nil)
//    }
//    
//    @objc func runTimer() {
//        if counter > 0 {
//            counter -= 1
//            labelTimer.text = timeString(time: TimeInterval(counter))
//            
//            if counter == 295 {
//                updateScroll()
//            }
//            
//            if counter == 290 {
//                updateScroll()
//            }
//            
//            if counter == 285 {
//                updateScroll()
//            }
//            
//            if counter == 280 {
//                updateScroll()
//            }
//        }
//        
//        else {
//            labelTimer.text = "00:00"
//        }
//    }
//    
//    func timeString(time: TimeInterval) -> String {
//        let mins = counter / 60 % 60
//        let secs = counter % 60
//        
//        return String(format: "%02d:%02d", mins, secs)
//    }
//    
//    func updateScroll() {
//        index = index + 1
//        let x = CGFloat(index) * scrollView.frame.size.width
//        scrollView.setContentOffset(CGPoint(x:x, y:0), animated: true)
//    }
//}
//
//// MARK: - Extensions
//
//private extension UILabel {
//    func addInterlineSpacing(spacingValue: CGFloat = 2) {
//        guard let textString = text else { return }
//        
//        let attributedString = NSMutableAttributedString(string: textString)
//        let paragraphStyle = NSMutableParagraphStyle()
//        paragraphStyle.lineSpacing = spacingValue
//        
//        attributedString.addAttribute(
//            .paragraphStyle,
//            value: paragraphStyle,
//            range: NSRange(location: 0, length: attributedString.length
//                          ))
//        
//        attributedText = attributedString
//    }
//    
//}
//
//extension TimerViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(floorf((Float(scrollView.contentOffset.x)) / Float(scrollView.frame.size.width)))
//    }
//}
