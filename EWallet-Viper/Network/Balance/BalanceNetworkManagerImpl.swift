//
//  BalanceNetworkManagerImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public class BalanceNetworkManagerImpl: BalanceNetworkManager {
   
    
    public init() {
        
    }
    
    public func getBalance(completion: @escaping (GetBalanceDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>()
        provider.request(.getBalance) { result in
            switch result {
            case .success(let res):
                let decoder = JSONDecoder()
                do {
                    let getBalanceResponse = try decoder.decode(GetBalanceResponse.self, from: res.data)
                    completion(getBalanceResponse.data[0], nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func editPhone(phone: String, completion: @escaping (EditPhoneResponse?, Error?) -> ()) {
        let provider = MoyaProvider<BalanceApi>()
            provider.request(.patchProfile(phone: phone)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let editPhoneResponse = try decoder.decode(EditPhoneResponse.self, from: result.data)
                    completion(editPhoneResponse, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
