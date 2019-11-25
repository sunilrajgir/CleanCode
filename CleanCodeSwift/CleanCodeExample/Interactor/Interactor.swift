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
    init(url: String, entity: Entity) {
        self.url = url
        self.entity = entity
    }
    
    func fetchData() {
        let completeUrl = URL(string: self.url)
        Fetcher.fetchData(url: completeUrl!) { (data, error) in
            
        }
    }

}
