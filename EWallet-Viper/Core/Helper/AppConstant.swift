//
//  AppConstant.swift
//  ZWallet
//
//  Created by user217917 on 4/1/22.
//

import Foundation

public class AppConstant {
    public static var baseUrl: String {
        return Bundle.main.infoDictionary?["BASE_URL"] as? String ?? ""
    }
}
