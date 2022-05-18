//
//  CreatePINRouterImpl.swift
//  ZW
//
//  Created by user217106 on 4/10/22.
//

import Foundation
import UIKit

public class CreatePINRouterImpl {
    
    public static func navigateToModule() {
        let vc = CreatePINViewController(nibName: "CreatePINViewController", bundle: nil)
        
        
        let networkManager = CreatePINNetworkManagerImpl()
        
        let router = CreatePINRouterImpl()
        let interactor = CreatePINInteractorImpl(networkManager: networkManager)
        let presenter = CreatePINPresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        UIApplication.shared.windows.first?.rootViewController = vc
        UIApplication.shared.windows.first?.makeKeyAndVisible()
    }
}

extension CreatePINRouterImpl: CreatePINRouterProtocol {
    func navigateToHome() {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
}


