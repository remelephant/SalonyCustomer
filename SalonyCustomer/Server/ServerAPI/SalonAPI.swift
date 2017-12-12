//
//  SalonAPI.swift
//  SalonyCustomer
//
//  Created by Vahagn Gevorgyan on 12/12/17.
//  Copyright © 2017 Vahagn Gevorgyan. All rights reserved.
//

import Foundation

class SalonAPI: Networking {
    
    
    /// For now this medhod is only parsing data and creating array from ModelSalonCollection, but in future it will handle parameters building
    func obtainSalonCollection(completion: @escaping ([ModelSalon]?) -> Void) {
        // for now we dont have any parameters and don't need request parameter method, it will be added in future
        salonRequest() { data in
            if let data = data {
                do {
                    let salonsCollection = try JSONDecoder().decode(ModelSalonCollection.self, from: data)
                    if let salonsArray = salonsCollection.salons {
                        completion(salonsArray)
                    } else {
                        completion(nil)
                        // TODO: - salons array is empty
                    }
                } catch let error {
                    print("Error: \(error) - \(#line, #function, #file)")
                    completion(nil)
                    // TODO: - create error handling
                }
            } else {
                completion(nil)
                // TODO: - create error handling
            }
        }
    }
    
    func obtainExtendedSalon(id: Int64, completion: @escaping (ModelSalonExtended?) -> Void) {
        salonRequest(path: "/\(id)") { (data) in
            if let data = data {
                do {
                    let salon:[String: ModelSalonExtended] = try JSONDecoder().decode([String: ModelSalonExtended].self, from: data)
                        completion(salon.values.first)
                } catch let error {
                    print("Error: \(error) - \(#line, #function, #file)")
                    completion(nil)
                    // TODO: - create error handling
                }
            } else {
                completion(nil)
                // TODO: - create error handling
            }
        }
    }
    
    /// This is main request for all salon related requests, in future this method will get parameters and manage all requests
    func salonRequest(path: String? = nil, completion: @escaping (Data?) -> Void) {
        request(APIEndpoints.obtainSalonsCollection, path: path, method: .Get) { (success, data, response) in
            if let data = data, success {
                completion(data)
            } else {
                completion(nil)
                // TODO: - create error handling
            }
        }
    }
}
