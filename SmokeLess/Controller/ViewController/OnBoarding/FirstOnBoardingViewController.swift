//
//  FirstOnBoardingViewController.swift
//  SmokeLess
//
//  Created by Dylan Juliano Santoso on 28/06/22.
//

import UIKit

class FirstOnBoardingViewController: UIPageViewController {
    
    //MARK: - Properties
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    var titleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "Welcome to Smokeless!"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var subtitleLabel: UILabel = {
        var label: UILabel = UILabel()
        label.text = "We will help you quit smoking with the tapering method, which means gradually lessening your cigarette intake."
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .black
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "image1.png")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    var pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .systemGray
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
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
        
        configureUI()
//        scrollView.delegate = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
    }
    
    //MARK: - Selectors
    
    @objc func buttonClicked() {
        let controller = SecondOnBoardingViewController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc private func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }

    //MARK: - Helpers
    
    func configureUI() {

        view.backgroundColor = .white
        
        view.addSubview(scrollView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(image)
        view.addSubview(pageControl)
        view.addSubview(button)
        
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()

        image.anchor(top: view.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 150, paddingLeft: 40, paddingRight: 40, width: view.frame.size.width - 100, height: view.frame.size.width - 100)

        titleLabel.anchor(top: image.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 20, paddingRight: 20)

        subtitleLabel.anchor(top: titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 30, paddingLeft: 20, paddingRight: 20)
        subtitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true

        pageControl.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: button.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingBottom: 10)
        pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        button.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
    }

}

    //MARK: - Extensions

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

//extension FirstOnBoardingViewController: UIScrollViewDelegate {
//    func scrollViewDidScroll(_ scrollView: UIScrollView) {
//        pageControl.currentPage = Int(floorf(Float(scrollView.contentOffset.x) / Float(scrollView.frame.size.width)))
//    }
//}
