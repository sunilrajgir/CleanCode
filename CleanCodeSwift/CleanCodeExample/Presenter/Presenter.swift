//
//  Presenter.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Presenter : NSObject {
    var delegate: PresenterProtocol?
}

extension Presenter : InteractorProtocol {
    func show(data: Entity?, error: Error?) {
        self.delegate?.dataFetchCompleted(data: data, error: error)
    }
}

protocol PresenterProtocol : NSObject {
    func dataFetchCompleted(data: Entity?, error: Error?)
}
