//
//  ChangePasswordRouterImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit

public class ChangePasswordRouterImpl{
   
    public static func navigateToModule() {
        let vc = ChangePasswordViewController(nibName: "ChangePasswordViewController", bundle: nil)
        
        let changePasswordNetworkManager = ChangePasswordNetworkManagerImpl()
        let router = ChangePasswordRouterImpl()
        let interactor = ChangePasswordInteractorImpl(changePasswordNetworkManager: changePasswordNetworkManager)
        let presenter = ChangePasswordPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        

        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
        
    }



extension ChangePasswordRouterImpl : ChangePasswordRouterProtocol{
    func navigatetoHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)

    }
}


