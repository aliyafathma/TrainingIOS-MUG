//
//  NotificationPresenterImpl.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation
class NotificationPresenterImpl : NotificationPresenterProtocol{
    func getUserDetails(id: Int) {
        self.interactor.getUserDetails(id: id)
    }
    
    func navigateToHome() {
        self.router.navigateTohome()
    }
    
    func getNotification() {
        self.interactor.getAllInvoice()
    }
    
    
    
    let interactor : NotificationInteractorProtocol
    let router : NotificationRouterProtocol
    let view : NotificationViewProtocol
    
    init(interactor: NotificationInteractorProtocol, router:NotificationRouterProtocol, view : NotificationViewProtocol){
        self.interactor = interactor
        self.router = router
        self.view = view
    }
    
    
    
}
extension NotificationPresenterImpl : NotificationInteractorOutputProtocol{
//    func getUserDetails(user: DetailsTransactionData) {
//        self.view.getUserDetails(entity: user)
//    }
    
    func getNotification(invoice: [InvoiceResponse]) {
        self.view.getAllInvoice(entity: invoice)
    }
    
    

}

