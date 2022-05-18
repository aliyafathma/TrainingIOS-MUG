//
//  DashboardCellDelegate.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation

protocol DashboardCellDelegate {
    func showAllTransaction()
    func logout()
    func showTransfer()
    func showToProfile()
    func topUp()
    func showNotification()
}
