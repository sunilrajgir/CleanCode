//
//  ExampleViewController.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class View: UIViewController {
    var controller: Controller?
    let fetchButton  = UIButton()
    let loaderView = UIActivityIndicatorView()
    let messageLable = UILabel()
    let resetButton  = UIButton()
    
// MARK:- View Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.buildCleanComponent()
        self.updateUIColor()
        self.addUIComponents()
    }

// MARK:- Clean code set up
    fileprivate func buildCleanComponent(){
        //view Model
        let viewModel = ViewModel()
        viewModel.delegate = self
        
        //Presenter
        let presentor = Presenter()
        presentor.delegate = viewModel
        
        //Interactor
        let entity = Entity()
        let fetcher = Fetcher()
        let interactor = Interactor(url: "https://www.google.com/", entity: entity, fetcher: fetcher)
        interactor.delegate = presentor
        
        self.controller = Controller(interactor: interactor)
    }
    
// MARK:- UI Function
    
    fileprivate func updateUIColor() {
        self.view.backgroundColor = UIColor.white
    }
    
    fileprivate func addUIComponents(){
        self.addFetchButton()
        self.addLoaderView()
        self.addMessageLabel()
        self.addResetButton()
        self.showFetchButton()
    }
    
    fileprivate func addFetchButton(){
        self.fetchButton.frame = CGRect(x: (self.view.frame.size.width-100)/2, y: (self.view.frame.size.height-100)/2, width: 100, height: 50)
        self.fetchButton.setTitle("Fetch", for: .normal)
        self.fetchButton.backgroundColor = UIColor.gray
        self.fetchButton.addTarget(self, action: #selector(fetchButtonAction), for: .touchUpInside)
        self.fetchButton.isHidden = true
        self.view.addSubview(self.fetchButton)
    }
    
    fileprivate func addLoaderView(){
        self.loaderView.frame = CGRect(x: (self.view.frame.size.width-50)/2, y: (self.view.frame.size.height-50)/2, width: 50, height: 50)
        self.loaderView.isHidden = true
        self.view.addSubview(self.loaderView)
    }
    
    fileprivate func addMessageLabel(){
        self.messageLable.frame = CGRect(x: (self.view.frame.size.width-200)/2, y: (self.view.frame.size.height-50)/2, width: 200, height: 50)
        self.messageLable.backgroundColor = .lightGray
        self.messageLable.textColor = .blue
        self.messageLable.textAlignment = .center
        self.messageLable.isHidden = true
        self.view.addSubview(self.messageLable)
    }
    
    fileprivate func addResetButton(){
        self.resetButton.frame = CGRect(x: (self.view.frame.size.width-100)/2, y: (self.view.frame.size.height-200), width: 100, height: 50)
        self.resetButton.setTitle("Reset", for: .normal)
        self.resetButton.backgroundColor = UIColor.green
        self.resetButton.addTarget(self, action: #selector(resetButtonAction), for: .touchUpInside)
        self.resetButton.isHidden = true
        self.view.addSubview(self.resetButton)
    }
    
 // MARK:- Button Action

    @objc func fetchButtonAction(){
        self.showLoader()
        self.controller?.fetchbuttonAction()
    }
        
    @objc func resetButtonAction(){
        self.showFetchButton()
    }
    
 // MARK:- Show Hide UI
    
    fileprivate func showLoader() {
        self.fetchButton.isHidden  = true
        self.messageLable.isHidden = true
        self.resetButton.isHidden  = true
        self.loaderView.isHidden   = false
        self.loaderView.startAnimating()
    }
    
    fileprivate func showFetchButton(){
        self.messageLable.isHidden = true
        self.resetButton.isHidden  = true
        self.loaderView.isHidden   = true
        self.loaderView.stopAnimating()
        self.fetchButton.isHidden  = false
    }
    
    fileprivate func showResetButton(){
        self.fetchButton.isHidden  = true
        self.loaderView.isHidden   = true
        self.loaderView.stopAnimating()
        self.messageLable.isHidden = false
        self.resetButton.isHidden  = false
    }
        
    private func dataFetchCompleted(message:String){
        self.messageLable.text = message
        self.showResetButton()
    }
}

 // MARK:- ViewModelProtocol

extension View : ViewModelProtocol {
    func showResetButton(message: String) {
        DispatchQueue.main.async { [weak self] in
            self?.dataFetchCompleted(message: message)
        }
    }
}
