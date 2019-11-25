//
//  ViewController.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let startButton = UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 44))
        startButton.setTitle("Start", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.addTarget(self, action: #selector(startButtonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    @objc func startButtonAction()  {
        let exampleViewController = ExampleViewController()
        self.navigationController?.pushViewController(exampleViewController, animated: true)
    }
}

