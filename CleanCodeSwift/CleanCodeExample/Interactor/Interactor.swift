//
//  Interactor.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

internal class Interactor {
    let url : String
    let entity: Entity
    let fetcher: Fetcher
    var delegate: InteractorProtocol?
    
    init(url: String, entity: Entity, fetcher: Fetcher) {
        self.url = url
        self.entity = entity
        self.fetcher = fetcher
    }
    
    internal func fetchData() {
        let completeUrl = URL(string: self.url)
        self.fetcher.fetchData(url: completeUrl!) { [weak self](data, error) in
            self?.parseData(data: data, error: error)
        }
    }
    
    private func parseData(data: Data?, error: Error?)  {
        if error != nil {
            self.delegate?.show(data:nil , error: error)
        } else {
            let entity = Entity()
           self.delegate?.show(data:entity , error: nil)
        }
    }
}

protocol InteractorProtocol : NSObject {
    func show(data: Entity?, error: Error?)
}
