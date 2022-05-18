//
//  OTPRouterImpl.swift
//  ZW
//
//  Created by user217064 on 4/12/22.
//

import Foundation
import UIKit

public class OTPRouterImpl{
    
    public static func navigateToModule(){
        
        let otp = OTPViewController(nibName: "OTPViewController", bundle: nil)
        let networkManager = AuthNetworkManagerImpl()
        
        let router = OTPRouterImpl()
        let interactor = OTPInteractorImpl(networkManager: networkManager)
        let presenter = OTPPresenterImpl(view: otp, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        otp.presenter = presenter
        UIApplication.shared.windows.first?.rootViewController = otp
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension OTPRouterImpl: OTPRouterProtocol{
    func navigateToLogin() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    
}
