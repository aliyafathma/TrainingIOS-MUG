//
//  TransferPresenterProtocol.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation
import UIKit
protocol TransferPresenterProtocol {
    func getUser(userProfileEntity :UserProfileEntity)
    func transfer(receiver : String, amount : String , notes : String)
    func navigatetoHome()
}
