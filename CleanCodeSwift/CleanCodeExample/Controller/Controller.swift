//
//  Controller.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Controller {
    let interactor: Interactor
    init(interactor: Interactor) {
        self.interactor = interactor
    }
     
    func fetchbuttonAction() {
        self.interactor.fetchData()
    }
}
