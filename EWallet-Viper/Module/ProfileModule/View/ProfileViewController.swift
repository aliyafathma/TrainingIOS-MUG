//
//  ProfileViewController.swift
//  ZW
//
//  Created by user215381 on 4/10/22.
//

import UIKit
import Kingfisher

class ProfileViewController: UIViewController {
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profilePhone: UILabel!
    @IBOutlet weak var profileImage: UIImageView!
    
    var presenter: ProfilePresenter?
    var profile: UserProfileEntity?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadProfile()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func logout(_ sender: Any) {
    }
    
    @IBAction func editProfileBtn(_ sender: Any) {
        if let profile = self.profile {
            self.presenter?.showEditPhone(viewController: self, profile: profile)
        }
    }

    @IBAction func backBtn(_ sender: Any) {
        self.presenter?.backToHome(viewController: self)
    }
    
    
    @IBAction func changePasswordBtn(_ sender: Any) {
        self.presenter?.showChangePassword(viewController: self)
    }
    
}

extension ProfileViewController: ProfileView {
    func showProfile(profile: UserProfileEntity) {
        self.profileImage.kf.setImage(with: URL(string: AppConstant.baseUrl+profile.imageUrl))
        self.profileNameLabel.text = profile.name
        self.profilePhone.text = profile.phoneNumber
        self.profile = profile
    }
}
