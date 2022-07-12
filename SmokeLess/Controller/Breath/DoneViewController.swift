////
////  DoneViewController.swift
////  SmokeLess
////
////  Created by Nabilla Azarine on 27/06/22.
////
//
//import UIKit
//
//class DoneViewController: UIViewController {
//    
//    // MARK: - Properties
//    
//    var getIndex: Int = 0
//    
//    var setImage = UIImage()
//    
//    var image: UIImageView = {
//        let image = UIImageView()
//        image.contentMode = .scaleToFill
//        return image
//    }()
//    
//    var titleLabel: UILabel = {
//        var label: UILabel = UILabel()
//        label.font = UIFont.boldSystemFont(ofSize: 24)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//    
//    var subtitleLabel: UILabel = {
//        var label: UILabel = UILabel()
//        label.font = UIFont.systemFont(ofSize: 16)
//        label.textColor = .black
//        label.numberOfLines = 0
//        label.addInterlineSpacing(spacingValue: 2)
//        label.translatesAutoresizingMaskIntoConstraints = false
//        label.textAlignment = .center
//        return label
//    }()
//
//    
//    // MARK: - Lifecycle
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        let defaults = UserDefaults.standard
//        getIndex = defaults.object(forKey: "feedback") as! Int
//        configureUI()
//    }
//    
//    override func viewDidLayoutSubviews() {
//        super.viewDidLayoutSubviews()
//    }
//    
//    @objc func doneClicked() {
//        print("Button Clicked")
//        
//        // MARK: - KE PROGRESS SCREEN
//        
////        let vc = TimerViewController()
////        vc.modalPresentationStyle = .fullScreen
////        self.present(vc, animated: true, completion: nil)
//    }
//    
//    @objc func distractClicked() {
//        print("Button Clicked")
//        
//        // MARK: - KE NICOTINE CRAVINGS SCREEN
//        
////        let vc = TimerViewController()
////        vc.modalPresentationStyle = .fullScreen
////        self.present(vc, animated: true, completion: nil)
//    }
//    
//    // MARK: - Helpers
//
//    func createButton1() -> UIButton.Configuration {
//        var config: UIButton.Configuration = .filled()
//        var container = AttributeContainer()
//        container.font = UIFont.boldSystemFont(ofSize: 20)
//        config.attributedTitle = AttributedString("Done", attributes: container)
//        config.cornerStyle = .capsule
//        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
//        config.baseBackgroundColor = .smokeLessBlue
//        config.titlePadding = 10
//        return config
//    }
//    
//    func createButton2() -> UIButton.Configuration {
//        var config: UIButton.Configuration = .bordered()
//        var container = AttributeContainer()
//        container.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        config.attributedTitle = AttributedString("Try other activities", attributes: container)
//        config.cornerStyle = .capsule
//        config.contentInsets = .init(top: 15, leading: 20, bottom: 15, trailing: 20)
//        config.baseBackgroundColor = .smokeLessBlue
//        config.baseBackgroundColor = .white
//        config.titlePadding = 10
//        return config
//    }
//    
//    private func configureUI() {
//        navigationController?.setNavigationBarHidden(true, animated: false)
//        
//        view.backgroundColor = .white
//        let button1 = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
//        button1.configuration = createButton1()
//        button1.titleLabel?.font = UIFont.boldSystemFont(ofSize: 20)
//        button1.addTarget(self, action: #selector((doneClicked)), for: .touchUpInside)
//        button1.center = view.center
//        
//        let button2 = UIButton(frame: CGRect(x: 0, y: 0, width: 350, height: 50))
//        button2.configuration = createButton2()
//        button2.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
//        button2.layer.borderWidth = 2
//        button2.layer.cornerRadius = 28
//        button2.layer.borderColor = UIColor.rgb(red: 61, green: 127, blue: 240).cgColor
//        button2.addTarget(self, action: #selector((distractClicked)), for: .touchUpInside)
//        button2.center = view.center
//        
//        view.addSubview(titleLabel)
//        view.addSubview(subtitleLabel)
//        view.addSubview(image)
//        view.addSubview(button1)
//        
//        if getIndex == 1 {
//            setImage = UIImage(named: "good.png")!
//            image.image = setImage
//            titleLabel.text = "Good to hear that!"
//            subtitleLabel.text = "You’re getting closer to your goal. Deep breathing slows your nervous system and lowers your stress levels. It also improves your mood and gives you an energy boost."
//        }
//        
//        else if getIndex == 2 {
//            setImage = UIImage(named: "fail.png")!
//            image.image = setImage
//            titleLabel.text = "It’s okay, let’s try another way!"
//            subtitleLabel.text = "Be patient with yourself and you will get through this phase, just as others have. Check out the activity recommendations we provided to divert you from nicotine cravings."
//            
//            view.addSubview(button2)
//            button2.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: button1.topAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
//        }
//        
//        image.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 60, paddingRight: 60, width: (setImage.size.width / 3), height: (setImage.size.height / 2))
//        titleLabel.anchor(top: image.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 50, paddingLeft: 25, paddingRight: 25)
//        subtitleLabel.anchor(top:titleLabel.bottomAnchor, left: view.safeAreaLayoutGuide.leftAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 25, paddingRight: 25)
//        
//        button1.anchor(left: view.safeAreaLayoutGuide.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.safeAreaLayoutGuide.rightAnchor, paddingTop: 20, paddingLeft: 20, paddingBottom: 20, paddingRight: 20)
//        
//    }
//    
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
//}
