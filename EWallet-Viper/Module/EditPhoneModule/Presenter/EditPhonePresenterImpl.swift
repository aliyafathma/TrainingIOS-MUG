//
//  EditPhonePresenterImpl.swift
//  ZW
//
//  Created by user215381 on 4/11/22.
//

import Foundation
import UIKit

class EditPhonePresenterImpl: EditPhonePresenter {
    var view: EditPhoneViewController
    var interactor: EditPhoneInteractor
    var route: EditPhoneRouter
    
    init(view: EditPhoneViewController, interactor: EditPhoneInteractor, route: EditPhoneRouter) {
        self.view = view
        self.interactor = interactor
        self.route = route
    }
    
    func showUserProfile() {
        self.interactor.getProfile()
    }
    
    func showbackToProfile(viewController: UIViewController) {
        self.route.navigateToProfile(viewController: viewController)
    }
    
    func editPhone(phone: String) {
        self.interactor.postEditPhoneData(phone: phone)
    }

    
}

extension EditPhonePresenterImpl: EditPhoneInteractorOutput {
    func theSuccess(isSuccess: Bool) {
        if isSuccess {
            self.view.showAllert()
        } else{
            self.view.showAllertFailed()
        }
    }
    
    func loadedUserProfileData(userProfile: UserProfileEntity) {
        self.view.showProfile(profile: userProfile)
    }
}
