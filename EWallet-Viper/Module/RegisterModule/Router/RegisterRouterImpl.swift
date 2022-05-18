//
//  RegisterRouterImpl.swift
//  ZWallet
//
//  Created by user217917 on 4/5/22.
//

import Foundation
import UIKit

public class RegisterRouterImpl {
  
    public static func navigateToModule(viewController : UIViewController) {
        let register = RegisterViewController(nibName: "RegisterViewController", bundle: nil)
        let networkManager = AuthNetworkManagerImpl()
        
        let router = RegisterRouterImpl()
        let interactor = RegisterInteractorImpl(networkManager: networkManager)
        let presenter = RegisterPresenterImpl(view: register, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        register.presenter = presenter
        UIApplication.shared.windows.first?.rootViewController = register
        UIApplication.shared.windows.first?.makeKeyAndVisible()
        
        viewController.present(register, animated: true, completion: nil)

    }
}

extension RegisterRouterImpl: RegisterRouterProtocol {
    
    func navigateToOtp() {
        OTPRouterImpl.navigateToModule()
    }
    
}

