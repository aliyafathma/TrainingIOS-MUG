//
//  TransferNetworkManagerImpl.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/7/22.
//

import Foundation
import Moya

public class TransferNetworkManagerImpl: TransferNetworkManager {
    public func transfer(receiver: String, amount: String, notes: String, completion: @escaping (TransferDataResponse?, Error?) -> ()) {
        let provider = MoyaProvider<TransferAPI>()
        provider.request(.transfer(receiver : receiver, amount: amount, notes: notes)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let transferResponse = try decoder.decode(TransferResponse.self, from: result.data)
                    completion(transferResponse.details, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    
    
}
