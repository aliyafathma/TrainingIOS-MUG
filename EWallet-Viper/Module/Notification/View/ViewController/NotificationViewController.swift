//
//  NotificationViewController.swift
//  ZW
//
//  Created by user217336 on 4/10/22.
//

import UIKit

class NotificationViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let dataSource = NotifDataSource()
    var presenter : NotificationPresenterProtocol?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter?.getNotification()
        self.presenter?.getUserDetails(id: 5)
        self.dataSource.viewController = self
        self.setTableView()
        tableView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.tableView.rowHeight = UITableView.automaticDimension
        self.tableView.estimatedRowHeight = 100.0
    }
    
    func setTableView(){
        self.tableView.register(UINib(nibName: "NotificationViewCell", bundle: Bundle(identifier: "com.casestudy.Notification")), forCellReuseIdentifier: "NotificationViewCell")
        self.tableView.dataSource = self.dataSource

    
}
    @IBAction func backToHome(_ sender: Any) {
        self.presenter?.navigateToHome()
    }
}
extension NotificationViewController : NotificationDelegate{
    func getUserDetails(id: Int) {
        print("hehehehehe\(id)")
        
    }

}
extension NotificationViewController : NotificationViewProtocol{
    func getUserDetails(entity: DetailsTransactionData) {
          print(entity)
//        self.dataSource.user = entity
//        print(entity)
//        self.tableView.reloadData()
        
    }
    
    func getAllInvoice(entity: [InvoiceResponse]) {
        self.dataSource.transactions = entity
        self.tableView.reloadData()
    }
   
    
}
