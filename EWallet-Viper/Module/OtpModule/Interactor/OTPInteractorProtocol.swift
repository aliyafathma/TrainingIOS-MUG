//
//  OTPInteractorProtocol.swift
//  ZW
//
//  Created by user217064 on 4/12/22.
//

import Foundation

protocol OTPInteractorProtocol{
    func postOtpData(email: String, otp: String)
}
