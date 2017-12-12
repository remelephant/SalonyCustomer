//
//  Networking.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class Networking {
    
    typealias CompletionBlock = (_ success: Bool, _ result: Data?, _ response: URLResponse? ) -> Void
    
    enum HTTPMethod: String {
        case Post = "POST"
        case Get = "GET"
        case Put = "PUT"
        case Delete = "DELETE"
        
        fileprivate func getMethod() -> String {
            return self.rawValue
        }
    }
    
    func request(_ methodName: String, path: String? = nil, method: HTTPMethod, parameters: [String: Any]? = nil, body: [String: Any]? = nil, completion: @escaping CompletionBlock) {
        
        let url = Constants.APIEntryPoint + methodName
        guard var urlComponents = URLComponents(string: url) else {
            return
        }
        
        if let path = path {
            urlComponents.path.append(contentsOf: "/\(path)")
        }
        
        // TODO: - remove parameter printing before relise
        urlComponents.queryItems = []
        if let parameters = parameters {
            for (key, value) in parameters {
                
                let item = URLQueryItem(name: key, value: String(describing: value))
                print("Parameter value is: ", String(describing: value))
                urlComponents.queryItems?.append(item as URLQueryItem)
                
            }
        }
        
        var request = URLRequest(url: urlComponents.url!)
        // in future we will need request.allHTTPHeaderFields for authorization to
        
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        if let body = body {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }
        
        request.httpMethod = method.getMethod()
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            // Continue only if error is nil
            // and data is not nil
            guard error == nil || data != nil else {
                print("error: \(#file, #function, #line)")
                DispatchQueue.main.async {
                    completion(false, nil, response)
                }
                return
            }
            if let data = data {
                DispatchQueue.main.async {
                    completion(true, data, response)
                }
            }
            }.resume()
    }
}
