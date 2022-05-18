//
//  EditPhoneRouterImpl.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation
import UIKit

public class EditPhoneRouterImpl {
    public static func navigateToModule(viewController: UIViewController, profile: UserProfileEntity) {
        let vc = EditPhoneViewController(nibName: "EditPhoneViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let router = EditPhoneRouterImpl()
        let interactor = EditPhoneInteractorImpl(user: profile, networkManager: balanceNetworkManager)
        let presenter = EditPhonePresenterImpl(view: vc, interactor: interactor, route: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension EditPhoneRouterImpl: EditPhoneRouter {
    func navigateToProfileSaved(viewController: UIViewController) {
        AppRouter.shared.navigateToProfile(viewController)
    }
    
    func navigateToProfile(viewController: UIViewController) {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
}
