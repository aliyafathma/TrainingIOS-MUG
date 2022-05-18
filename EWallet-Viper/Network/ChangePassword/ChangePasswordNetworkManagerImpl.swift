//
//  ChangePasswordNetworkManagerImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import Moya

public class ChangePasswordNetworkManagerImpl: ChangePasswordNetworkManager {
    public func changePassword(
        old_password: String,
        new_password: String,
        completion: @escaping (ChangePasswordResponse?, Error?) -> ()) {
        
        let provider = MoyaProvider<ChangePasswordAPI>()
            provider.request(.changePassword(old_password: old_password, new_password: new_password)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let changePasswordResponse = try decoder.decode(ChangePasswordResponse.self, from: result.data)
                    completion(changePasswordResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    
}
