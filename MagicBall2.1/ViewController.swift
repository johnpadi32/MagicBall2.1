//
//  ViewController.swift
//  MagicBall2.1
//
//  Created by John Padilla on 11/8/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Properties
    
    let toplLabel: UILabel = {
       let label = UILabel()
        label.text = "Tap!"
        label.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        label.textColor = .white
        return label
    }()
    
    let bottomlabel: UILabel = {
       let label = UILabel()
        label.text = "Shake it ti see the answer"
        label.font = UIFont.systemFont(ofSize: 19, weight: .semibold)
        label.textColor = .white
        return label
    }()
    
    let tapButton: UIButton = {
        
        let config = UIImage.SymbolConfiguration(pointSize: 35, weight: .light, scale: .default)
        let image = UIImage(systemName: "circle.circle", withConfiguration: config)
        
        let button = UIButton(type: .system)
        button.setImage(image, for: .normal)
        button.tintColor = .white
        return button
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
        
    }
}

