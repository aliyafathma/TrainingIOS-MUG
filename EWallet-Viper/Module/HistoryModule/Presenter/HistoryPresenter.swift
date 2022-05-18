//
//  HistoryPresenter.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import Foundation
import UIKit

protocol HistoryPresenter {
    func loadHistory()
    func dismiss(viewController: UIViewController)
}
