//
//  NotificationRouterImpl.swift
//  ZW
//
//  Created by user217336 on 4/11/22.
//

import Foundation
import UIKit
public class NotificationRouterImpl{
    public static func NavigateToModule(viewController : UIViewController){
        let vc = NotificationViewController(nibName: "NotificationViewController", bundle: nil)
       
        let networkManager = InvoiceNetworkManagerImpl()
        let router = NotificationRouterImpl()
        let interactor = NotificationInteractorImpl(networkManager: networkManager)
        let presenter = NotificationPresenterImpl(interactor: interactor, router: router, view: vc)
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
    }
    
}
extension NotificationRouterImpl : NotificationRouterProtocol{
    func navigateTohome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    
}
