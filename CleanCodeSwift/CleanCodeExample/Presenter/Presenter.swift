//
//  Presenter.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

protocol PresenterProtocol : NSObject {
    func dataFetchCompleted(message:String)
}

internal class Presenter : NSObject {
    internal var delegate: PresenterProtocol?
}

extension Presenter : InteractorProtocol {
    internal func show(data: Entity?, error: Error?) {
        var message : String
        if error != nil {
            message = "Failure"
        } else {
            message = "Success"
        }
        self.delegate?.dataFetchCompleted(message:message)
    }
}


