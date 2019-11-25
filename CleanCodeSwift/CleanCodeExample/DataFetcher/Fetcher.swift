//
//  Fetcher.swift
//  CleanCodeSwift
//
//  Created by sunil.kumar1 on 11/25/19.
//  Copyright © 2019 sunil.kumar1. All rights reserved.
//

import UIKit

class Fetcher {
    func fetchData(url: URL, completion:@escaping((_ data:Data?, _ error:Error?)->Void)) {
        let urlRequest = URLRequest(url: url)
        URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            completion(data,error)
        }.resume()
    }

}
