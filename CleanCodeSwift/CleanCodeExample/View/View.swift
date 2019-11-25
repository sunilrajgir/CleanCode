//
//  ExampleViewController.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class View: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        let startButton = UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 44))
        startButton.setTitle("Fetch", for: .normal)
        startButton.backgroundColor = UIColor.gray
        startButton.addTarget(self, action: #selector(fetchButtonAction), for: .touchUpInside)
        self.view.addSubview(startButton)
    }
    
    func updateUI() {
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func fetchButtonAction() {
        let entity = Entity()
        let interactor = Interactor(url: "https://www.google.com/", entity: entity)
        let controller = Controller(interactor: interactor)
        controller.fetchbuttonAction()
    }
    
}
