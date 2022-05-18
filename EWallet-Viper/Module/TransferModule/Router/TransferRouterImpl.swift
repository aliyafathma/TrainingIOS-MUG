//
//  TransferRouterImpl.swift
//  EWallet-Viper
//
//  Created by user217336 on 4/6/22.
//

import Foundation
import UIKit


public class TransferRouterImpl{
   
    
    public static func navigateToModule(viewController : UIViewController) {
        let vc = TransferViewController(nibName: "TransferViewController", bundle: nil)
        //vc.modalPresentationStyle = .automatic
        
        let transferNetworkManager = TransferNetworkManagerImpl()
        let router = TransferRouterImpl()
        let interactor = TransferInteractorImpl(transferNetworkManager: transferNetworkManager)
        let presenter = TransferPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        

        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
        
    }



extension TransferRouterImpl : TransferRouterProtocol{
    func navigatetoHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)

    }
    
    
    
    
}



    
    

   
    
    

