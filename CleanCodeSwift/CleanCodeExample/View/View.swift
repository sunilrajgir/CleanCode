//
//  ExampleViewController.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class View: UIViewController {
    var controller: Controller?
    let startButton = UIButton(frame: CGRect(x: 150, y: 200, width: 100, height: 44))
    let activityView = UIActivityIndicatorView(frame: CGRect(x: 200, y: 300, width: 44, height: 44))
    let messageLable = UILabel(frame: CGRect(x: 20, y: 200, width: 200, height: 50))
    let resetButton = UIButton(frame: CGRect(x: 150, y: 400, width: 200, height: 44))
    override func viewDidLoad() {
        super.viewDidLoad()
        self.updateUI()
        self.startButton.setTitle("Fetch", for: .normal)
        self.startButton.backgroundColor = UIColor.gray
        self.startButton.addTarget(self, action: #selector(fetchButtonAction), for: .touchUpInside)
        self.view.addSubview(self.startButton)
    }
    
    func updateUI() {
        self.view.backgroundColor = UIColor.white
    }
    
    @objc func fetchButtonAction() {
        self.showLoader()
        let entity = Entity()
        let fetcher = Fetcher()
        let interactor = Interactor(url: "https://www.google.com/", entity: entity, fetcher: fetcher)
        let viewModel = ViewModel()
        let presentor = Presenter()
        presentor.delegate = viewModel
        viewModel.delegate = self
        interactor.delegate = presentor
        self.controller = Controller(interactor: interactor)
        self.controller?.fetchbuttonAction()
    }
    
    func showLoader() {
        self.messageLable.isHidden = true
        self.resetButton.isHidden = true
        self.startButton.isHidden = true
        self.activityView.startAnimating()
        self.view.addSubview(activityView)
    }
    
    func completedDataFetch(messsage:String) {
        self.activityView.stopAnimating()
        self.activityView.isHidden = true
        self.startButton.isHidden = true
        self.showMessage(message: messsage)
        self.showResetButton()
    }
    
    func showMessage(message:String) {
        self.messageLable.text = message
        self.messageLable.isHidden = false
        self.view.addSubview(self.messageLable)
    }
    
    func showResetButton() {
        self.view.addSubview(self.resetButton)
        self.resetButton.isHidden = false
    }
    
}

extension View : ViewModelProtocol {
    func showResetButton(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.completedDataFetch(messsage: message)
        }
    }
}
