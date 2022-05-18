//
//  NotificationViewProtocol.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation

protocol NotificationViewProtocol{
    func getAllInvoice(entity:[InvoiceResponse])
    func getUserDetails(entity : DetailsTransactionData)

}
