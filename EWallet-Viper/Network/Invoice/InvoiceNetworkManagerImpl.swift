//
//  InvoiceNetworkManagerImpl.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import Moya

public class InvoiceNetworkManagerImpl: InvoiceNetworkManager {
    public func getDetailsTransaction(id: Int, completion: @escaping (DetailsTransactionData?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>()
        provider.request(.getTransferDetails(id: id)) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let transactionDetails = try decoder.decode(DetailsTransaction.self, from: result.data)
                    completion(transactionDetails.data, nil)
                    print(transactionDetails)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
                
            }
        }
    }
    
    public func getTodayInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>()
        provider.request(.getTodayInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    
    public func getThisMonthInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>()
        provider.request(.getThisMonthInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
    

    public init() {

    }
    
    public func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>()
        provider.request(.getThisWeekInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }

    public func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ()) {
        let provider = MoyaProvider<InvoiceApi>()
        provider.request(.getAllInvoice) { response in
            switch response {
            case .success(let result):
                let decoder = JSONDecoder()
                do {
                    let getInvoiceResponse = try decoder.decode(GetInvoiceResponse.self, from: result.data)
                    completion(getInvoiceResponse.data, nil)
                } catch let error {
                    completion(nil, error)
                }
            case .failure(let error):
                completion(nil, error)
            }
        }
    }


}
