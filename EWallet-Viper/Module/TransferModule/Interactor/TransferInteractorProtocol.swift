//
//  TransferInteractorProtocol.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation

protocol TransferInteractorProtocol {
    func getUserProfile()
    func postTransferData(receiver : String, amount : String , note : String )
    
}
