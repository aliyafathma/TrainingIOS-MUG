//
//  NotifDataSource.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation
import UIKit
class NotifDataSource : NSObject, UITableViewDataSource,UITableViewDelegate{
    
    var viewController: NotificationViewController!
    var transactions: [InvoiceResponse] = []
    var user : DetailsTransactionData?
    var delegate : NotificationDelegate?
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions[section].data.count
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return transactions.count
    }
    
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let title = self.transactions[section].date
        return title
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        self.delegate?.getUserDetails(id: self.transactions[indexPath.section].data[indexPath.row].id)
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotificationViewCell", for: indexPath) as! NotificationViewCell
        cell.showData(invoice: self.transactions[indexPath.section],invoiceData: self.transactions[indexPath.section].data[indexPath.row] , detail : user)
        print(user)
        return cell
        }
    
    
    
    
}
