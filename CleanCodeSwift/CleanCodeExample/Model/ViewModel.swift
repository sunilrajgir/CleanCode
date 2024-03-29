//
//  ViewModel.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

protocol ViewModelProtocol {
    func showResetButton(message:String)
}

internal class ViewModel : NSObject {
    var delegate: ViewModelProtocol?
}

extension ViewModel : PresenterProtocol {
    func dataFetchCompleted(message: String) {
        self.delegate?.showResetButton(message: message)
    }
}

