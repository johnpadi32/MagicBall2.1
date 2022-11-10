//
//  ViewController.swift
//  MagicBall2.1
//
//  Created by John Padilla on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties

    var ballArray = [UIImage(named: "ball1"),
                     UIImage(named: "ball2"),
                     UIImage(named: "ball3"),
                     UIImage(named: "ball4"),
                     UIImage(named: "ball5")]
    
    let toplLabel: UILabel = {
       let label = UILabel()
        label.text = "Tap!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let bottomlabel: UILabel = {
       let label = UILabel()
        label.text = "Shake it to see the answer!"
        label.font = UIFont.systemFont(ofSize: 22, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let tapButton: UIButton = {
        
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .light, scale: .default)
        let image = UIImage(systemName: "circle.circle", withConfiguration: config)
        
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(handleTapButton), for: .touchUpInside)
        return button
    }()
    
    let ballImage: UIImageView = {
       let iv = UIImageView()
        iv.image = UIImage(named: "ball1")
        iv.contentMode = .scaleAspectFit
        return iv
    }()
    
    //MARK: - Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }

    //MARK: - Helpers
    
    func configureUI() {
                
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background")!)
        
        view.addSubview(toplLabel)
        toplLabel.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 15)
        toplLabel.centerX(inView: view)
        
        view.addSubview(bottomlabel)
        bottomlabel.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor, paddingBottom: 60)
        bottomlabel.centerX(inView: view)
        
        view.addSubview(tapButton)
        tapButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, right: view.rightAnchor, paddingTop: 5, paddingRight: 10)
        
        view.addSubview(ballImage)
        ballImage.setDimensions(height: 250, width: 250)
        ballImage.center(inView: view)
    }
    
    func imageChange() {
        ballImage.image = ballArray.randomElement() as! UIImage
    }
    
    //MARK: - Actions
    
    @objc func handleTapButton() {
        imageChange()
    }
    
    override func becomeFirstResponder() -> Bool {
        return true
    }
    
    override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        if motion == .motionShake {
            imageChange()
        }
    }
}

