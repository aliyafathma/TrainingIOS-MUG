//
//  HomeViewController.swift
//  ZWallet
//
//  Created by user215381 on 4/5/22.
//

import UIKit

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var dataSource = HomeDataSource()
    var presenter: HomePresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupTableView()
        self.presenter?.loadProfile()
        self.presenter?.loadTransaction()

        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        self.dataSource.viewController = self
        
        self.tableView.register(UINib(nibName: "DashboardHomeCell", bundle: Bundle(identifier: "com.casestudy.Home")), forCellReuseIdentifier: "DashboardHomeCell")
        self.tableView.register(UINib(nibName: "TransactionCell", bundle: Bundle(identifier: "com.casestudy.Core")), forCellReuseIdentifier: "TransactionCell")

        self.tableView.dataSource = self.dataSource
    }
}

extension HomeViewController: DashboardCellDelegate {
    func showNotification() {
        self.presenter?.showNotification(viewController: self)
    }
    func showTransfer() {
        self.presenter?.showTranfer(viewController: self)
    }
    
    func showAllTransaction() {
        self.presenter?.showHistory(viewController: self)
    }

    func logout() {
        self.presenter?.logout()
    }

    func showToProfile() {
            self.presenter?.showProfile(viewController: self)
        }

    func topUp() {
        self.presenter?.topUp(viewController: self)
    }

}


extension HomeViewController: HomeView {

    func showUserProfileData(userProfile: UserProfileEntity) {
        self.dataSource.userProfile = userProfile
        self.tableView.reloadData()
    }

    func showTransactionData(transactions: [TransactionEntity]) {
        self.dataSource.transactions = transactions
        self.tableView.reloadData()
    }
}
