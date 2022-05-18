//
//  NotificationInteractorImpl.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation
class NotificationInteractorImpl : NotificationInteractorProtocol{
   
    
    var interactorOutput: NotificationInteractorOutputProtocol?
    let networkManager: InvoiceNetworkManager
    var invoiceResponse : [InvoiceResponse] = []

    
    init(networkManager : InvoiceNetworkManager){
        self.networkManager = networkManager
        
    }
    func getUserDetails(id: Int) {
        
        self.networkManager.getDetailsTransaction(id: id){ details,error in
            
            if let user = details {
                let userProfile = DetailsTransactionData(id: user.id, senderID: user.senderID, sender: user.sender, senderPhone: user.senderPhone, senderImage: user.senderImage, receiverID: user.receiverID, receiver: user.receiver, receiverPhone: user.receiverPhone, receiverImage: user.receiverImage, amount: user.amount, notes: user.notes, type: user.type, createdAt: user.createdAt)
                print(userProfile)
//                self.interactorOutput?.getUserDetails(user:userProfile)
            }
        
            
        }
    }
    
    func getAllInvoice() {
        var invoiceToday: [InvoiceDataResponse] = []
        var invoiceMonth: [InvoiceDataResponse] = []
        var invoiceWeek: [InvoiceDataResponse] = []
        self.networkManager.getThisMonthInvoice { (data, error) in
        data?.forEach({ (invoiceData) in
            
        invoiceMonth.append(InvoiceDataResponse(id: invoiceData.id
                                           , sender: invoiceData.sender, receiver: invoiceData.receiver, name: invoiceData.name, phone: invoiceData.phone, image: invoiceData.image, type: invoiceData.type, amount: invoiceData.amount, notes: invoiceData.notes, createdAt: ""))
            
            
        })
            self.invoiceResponse.append(InvoiceResponse(date: "this month", data: invoiceMonth))

    }
        self.networkManager.getTodayInvoice { (data, error) in
        data?.forEach({ (invoiceData) in
        
        invoiceToday.append(InvoiceDataResponse(id: invoiceData.id
                                           , sender: invoiceData.sender, receiver: invoiceData.receiver, name: invoiceData.name, phone: invoiceData.phone, image: invoiceData.image, type: invoiceData.type, amount: invoiceData.amount, notes: invoiceData.notes, createdAt: ""))
            
        })
            self.invoiceResponse.append(InvoiceResponse(date: "today", data: invoiceToday))

    }
        self.networkManager.getThisWeekInvoice { (data, error) in
        data?.forEach({ (invoiceData) in
        
        invoiceWeek.append(InvoiceDataResponse(id: invoiceData.id
                                           , sender: invoiceData.sender, receiver: invoiceData.receiver, name: invoiceData.name, phone: invoiceData.phone, image: invoiceData.image, type: invoiceData.type, amount: invoiceData.amount, notes: invoiceData.notes, createdAt: ""))
            
        })
            self.invoiceResponse.append(InvoiceResponse(date: "this week", data: invoiceWeek))
            self.interactorOutput?.getNotification(invoice: self.invoiceResponse)


    }


    }

    
   
    }
    
    

