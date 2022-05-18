//
//  ProfileRouterImpl.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import Foundation
import UIKit

public class ProfileRouterImpl {
    public static func navigateToModule(viewController: UIViewController) {
        let vc = ProfileViewController(nibName: "ProfileViewController", bundle: nil)
        vc.modalPresentationStyle = .automatic
        
        let balanceNetworkManager = BalanceNetworkManagerImpl()
        let router = ProfileRouterImpl()
        let interactor = ProfileInteractorImpl(networkManager: balanceNetworkManager)
        let presenter = ProfilePresenterImpl(view: vc, interactor: interactor, router: router)
        
        interactor.interactorOutput = presenter
        vc.presenter = presenter
        
        viewController.present(vc, animated: true, completion: nil)
    }
}

extension ProfileRouterImpl: ProfileRouter {
    func navigateToEditProfile(viewController: UIViewController, profile: UserProfileEntity) {
        AppRouter.shared.navigateToEditPhone(viewController, profile)
    }
    
    func navigateToHome(viewController: UIViewController) {
        NotificationCenter.default.post(name: Notification.Name("reloadRootView"), object: nil)
    }
    
    func navigateToChangePasssword(viewController: UIViewController) {
        ChangePasswordRouterImpl.navigateToModule()
    }
}
