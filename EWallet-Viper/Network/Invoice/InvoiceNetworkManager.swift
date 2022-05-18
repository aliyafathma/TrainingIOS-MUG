//
//  InvoiceNetworkManager.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

public protocol InvoiceNetworkManager {
    func getTodayInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getThisMonthInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getThisWeekInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getAllInvoice(completion: @escaping ([GetInvoiceDataResponse]?, Error?) -> ())
    func getDetailsTransaction(id : Int , completion: @escaping (DetailsTransactionData?, Error?) -> ())
}
