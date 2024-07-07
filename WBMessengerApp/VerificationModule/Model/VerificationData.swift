//
//  VerificationData.swift
//  WBMessengerApp
//
//  Created by Анастасия on 07.07.2024.
//

import Foundation

struct VerificationData {
    var phoneNumber: String
    var verificationCode: String
}

extension VerificationData {
    static func +(lhs: VerificationData, rhs: VerificationData) -> VerificationData {
        return VerificationData(phoneNumber: lhs.phoneNumber, verificationCode: rhs.verificationCode)
    }
}
