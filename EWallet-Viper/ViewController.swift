//
//  ViewController.swift
//  EWallet-Viper
//
//  Created by isa nur fajar on 24/03/22.
//

import UIKit

class ViewController: UIViewController {
    // MARK: TextField
    @IBOutlet weak var emailTF: UITextField!
    @IBOutlet weak var passTF: UITextField!
    
    // MARK: Image
    @IBOutlet weak var imgEmail: UIImageView!
    @IBOutlet weak var imgPass: UIImageView!
    
    // MARK: View
    @IBOutlet weak var underLineEmail: UIView!
    @IBOutlet weak var underLinePass: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MARK: before view init
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.imgEmail.image = UIImage(systemName: "envelope.fill")
        self.imgPass.image = UIImage(systemName: "lock.fill")
        
        self.underLinePass.backgroundColor = .blue
        self.underLineEmail.backgroundColor = .blue
        
        
    }
}

