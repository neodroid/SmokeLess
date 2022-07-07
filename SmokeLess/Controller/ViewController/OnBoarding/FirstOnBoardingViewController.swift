//
//  FirstOnBoardingViewController.swift
//  SmokeLess
//
//  Created by Dylan Juliano Santoso on 28/06/22.
//

import UIKit

class FirstOnBoardingViewController: UIPageViewController {
    
    //MARK: - Properties
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var titleLabel1: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Welcome to Smokeless!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var titleLabel2: UILabel = {
        var label: UILabel = UILabel()
        label.text = "All data is confidential"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel1: UILabel = {
        var label: UILabel = UILabel()
        label.text = "We will help you quit smoking with the tapering method, which means gradually lessening your cigarette intake."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel2: UILabel = {
        var label: UILabel = UILabel()
        label.text = "We will help you quit smoking with the tapering method, which means gradually lessening your cigarette intake."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var image1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var image2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image2.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray
        pageControl.currentPage = 0
        pageControl.numberOfPages = 2
        return pageControl
    }()
    
    var button: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .smokeLessBlue
        button.heightAnchor.constraint(equalToConstant: 54).isActive = true
        button.layer.cornerRadius = 27
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        button.addTarget(self, action: #selector(nextPage(_:)), for: .touchUpInside)
        return button
    }()
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        configureUI()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 50)
        if (scrollView.subviews.count == 2) {
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
        
        for x in 0..<2 {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width, y: 0, width: view.frame.size.width, height: scrollView.frame.size.height))
            
            if (x == 0) {
                let setImage: UIImage = UIImage(named: "image1.png")!
                page.addSubview(image1)
                page.addSubview(titleLabel1)
                page.addSubview(subtitleLabel1)
//                page.addSubview(button)
                page.contentMode = .scaleAspectFill
                scrollView.addSubview(page)
                
                image1.anchor(top: page.topAnchor, left: page.leftAnchor, bottom: titleLabel1.topAnchor, right: page.rightAnchor, paddingTop: 150, paddingBottom: 30 ,width: page.frame.size.width / 2, height: page.frame.size.width / 2)
                
                titleLabel1.anchor(top: image1.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
                
                subtitleLabel1.anchor(top: titleLabel1.bottomAnchor, left: page.leftAnchor, right: page.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
                
            }
            
            else if (x == 1) {
                let setImage: UIImage = UIImage(named: "image2.png")!
                page.addSubview(image2)
                page.addSubview(titleLabel2)
                page.addSubview(subtitleLabel2)
                page.contentMode = .scaleAspectFill
                scrollView.addSubview(page)
                
                image2.anchor(top: page.topAnchor, left: page.leftAnchor, bottom: titleLabel2.topAnchor, right: page.rightAnchor, paddingTop: 150, paddingBottom: 30, width: page.frame.size.width / 2, height: page.frame.size.width / 2)
                
                titleLabel2.anchor(top: image2.bottomAnchor, left: page.safeAreaLayoutGuide.leftAnchor, right: page.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)
                
                subtitleLabel2.anchor(top: titleLabel2.bottomAnchor, left: page.leftAnchor, right: page.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
                
            }
            
        }
    }
    
    private func configureUI() {
        
        view.addSubview(button)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
        
        view.addSubview(pageControl)
        
        pageControl.addTarget(self, action: #selector(pageControllerDidChange(_ :)), for: .valueChanged)
        
        pageControl.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: button.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingLeft: 20, paddingBottom: 10, paddingRight: 20)
        
    }
    
    @objc func pageControllerDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }
    
    @objc func nextPage(_ sender: UIButton) {
        let controller = FirstUserPlanViewController()
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: true, completion: nil)
    }
}

// MARK: - Extensions

private extension UILabel {
    func addInterlineSpacing(spacingValue: CGFloat = 2) {
        guard let textString = text else { return }
        
        let attributedString = NSMutableAttributedString(string: textString)
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineSpacing = spacingValue
        
        attributedString.addAttribute( .paragraphStyle, value: paragraphStyle, range: NSRange(location: 0, length: attributedString.length))
        
        attributedText = attributedString
    }
    
}

extension FirstOnBoardingViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(floorf((Float(scrollView.contentOffset.x)) / Float(scrollView.frame.size.width)))
    }
}
