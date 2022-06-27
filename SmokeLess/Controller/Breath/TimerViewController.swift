//
//  TimerViewController.swift
//  SmokeLess
//
//  Created by Nabilla Azarine on 24/06/22.
//

import UIKit

class TimerViewController: UIViewController {

    // MARK: - Properties
    
    var xPosition: CGFloat = 0
    
    var scrollView: UIScrollView = {
       let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var pageControl: UIPageControl = {
       let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.pageIndicatorTintColor = .smokeLessLightGray
        pageControl.currentPageIndicatorTintColor = .black
        return pageControl
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleToFill
        image.image = UIImage(named: "breath-1.png")
        return image
    }()
    
    var labelText: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Deep breathing means taking breaths that expand your stomach. It can lower stress level, reduce cravings, and improve lung function."
        label.font = UIFont.systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        label.numberOfLines = 0
        label.addInterlineSpacing(spacingValue: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    
    var labelTimer: UILabel = {
        var label: UILabel = UILabel()
        label.text = "5:00"
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.textColor = .smokeLessBlue
        label.numberOfLines = 0
        label.addInterlineSpacing(spacingValue: 2)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        pageControl.addTarget(self, action: #selector(pageControllerChange(_ :)), for: .valueChanged)
        view.addSubview(scrollView)
        view.addSubview(pageControl)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 0, y: view.frame.size.height - 100, width: view.frame.size.width, height: 50)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        if scrollView.subviews.count == 2 {
            configureScrollView()
        }
    }
    
    
    // MARK: - Helpers

    private func configureScrollView() {
        scrollView.contentSize = CGSize(width: view.frame.size.width * 5, height: view.frame.size.height - pageControl.frame.size.height - 70)
        scrollView.delegate = self
        scrollView.isPagingEnabled = true
        scrollView.showsVerticalScrollIndicator = false
        scrollView.showsHorizontalScrollIndicator = false
        
        let colors: [UIColor] = [ .systemRed, .systemPink, .systemCyan, .systemGray, .systemBlue]
        
        let images: [String] = ["breath-1.png", "breath-2.png", "breath-3.png", "breath-4.png", "breath-5.png"]
        let text: [String] = ["Sit down in a chair or lie down on any flat surface.", "Start by placing left hand on your chest and right hand on your belly.", "Take a slow, deep breath in through your nose. Feel the hand on your belly rise.", "Breath out slowly through your mouth, feel the hand on your belly lower to its original position.", "Inhale, exhale … Repeat the process multiple times until the timer ends."]
        
        for x in 0..<5 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            let setImage: UIImage = UIImage(named: images[x])!
            image.image = setImage
            labelText.text = text[x]
            
            page.addSubview(image)
            page.addSubview(labelText)
            page.addSubview(labelTimer)
            page.contentMode = .scaleAspectFill
            scrollView.addSubview(page)
            
//            page.backgroundColor = colors[x]
            
            let ratio = setImage.size.width / setImage.size.height
            image.frame.size.width = page.frame.size.width
            image.frame.size.height = page.frame.size.width / ratio
            image.frame.origin.x = xPosition
            image.frame.origin.y = 0
            
            xPosition = xPosition + image.frame.size.width
            image.anchor(top: page.topAnchor, left: page.leftAnchor, right: page.rightAnchor, width: page.frame.size.width, height: page.frame.size.width / ratio)
            labelText.anchor(top: image.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
            labelTimer.anchor(left: page.safeAreaLayoutGuide.leftAnchor, bottom: page.safeAreaLayoutGuide.bottomAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        }
    }
    
    @objc func pageControllerChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
}

// MARK: - Extensions

private extension UILabel {
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        
        attributedString.addAttribute(
            .paragraphStyle,
            value: paragraphStyle,
            range: NSRange(location: 0, length: attributedString.length
                          ))
        
        attributedText = attributedString
    }
    
}

extension TimerViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf((Float(scrollView.contentOffset.x)) / Float(scrollView.frame.size.width)))
    }
}
