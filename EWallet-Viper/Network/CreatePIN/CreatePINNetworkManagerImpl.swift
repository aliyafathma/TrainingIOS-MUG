//
//  CreatePINNetworkManagerImpl.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation
import Moya

public class CreatePINNetworkManagerImpl : CreatePINNetworkManager{
    public func createPIN(pin: String, completion: @escaping (CreatePINResponse?, Error?) -> ()) {
        let provider = MoyaProvider<CreatePINApi>()
        provider.request(.createPIN(pin: pin)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let createPINResponse = try decoder.decode(CreatePINResponse.self, from: result.data)
                    completion(createPINResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
    
    
