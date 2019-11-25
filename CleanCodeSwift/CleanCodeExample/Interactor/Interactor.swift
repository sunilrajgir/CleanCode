//
//  Interactor.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Interactor {
    let url : String
    let entity: Entity
    var delegate: InteractorProtocol?
    
    init(url: String, entity: Entity) {
        self.url = url
        self.entity = entity
    }
    
    func fetchData() {
        let completeUrl = URL(string: self.url)
        Fetcher.fetchData(url: completeUrl!) { [weak self](data, error) in
            self?.parseData(data: data, error: error)
        }
    }
    
    func parseData(data: Data?, error: Error?)  {
        if error != nil {
            self.delegate?.show(data:nil , error: error)
        } else {
            let entity = Entity()
           self.delegate?.show(data:entity , error: nil)
        }
    }
}

protocol InteractorProtocol {
    func show(data: Entity?, error: Error?)
}
