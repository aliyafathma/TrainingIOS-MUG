//
//  TopUpPresenterImpl.swift
//  ZW
//
//  Created by user217917 on 4/11/22.
//

import Foundation
import UIKit

class TopUpPresenterImpl : TopUpPresenterProtocol {
    
    let view: TopUpViewController
    let interactor: TopUpInteractorProtocol
    let router: TopUpRouterProtocol


    init(view : TopUpViewController, interactor : TopUpInteractorProtocol, router : TopUpRouterProtocol){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
}

extension TopUpPresenterImpl: TopUpInteractorOutputProtocol {
    
}


