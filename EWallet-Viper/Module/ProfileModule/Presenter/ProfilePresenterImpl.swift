//
//  ProfilePresenterImpl.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import Foundation
import UIKit


class ProfilePresenterImpl: ProfilePresenter {
    
    
    let interactor: ProfileInteractor?
    let router: ProfileRouter
    let view: ProfileView
    
    init(view: ProfileView, interactor: ProfileInteractor, router: ProfileRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func loadProfile() {
        self.interactor?.getProfile()
    }
    
    func backToHome(viewController: UIViewController) {
        self.router.navigateToHome(viewController: viewController)
    }
    
    func showEditPhone(viewController: UIViewController, profile: UserProfileEntity) {
        self.router.navigateToEditProfile(viewController: viewController, profile: profile)
    }
    
    func showChangePassword(viewController: UIViewController) {
        self.router.navigateToChangePasssword(viewController:  viewController)
    }

}

extension ProfilePresenterImpl: ProfileInteractorOutput {
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showProfile(profile: userProfile)
    }
}
