//
//  Tab.swift
//  AhnLab
//
//  Created by DaeHyeonKim on 2022/11/02.
//

import Foundation


enum Tab : String,CaseIterable
{
    case wallet = "Wallet"
    case user = "User"
    case play = "Play"
    case settings = "Settings"
    
    func getTitle() -> String
    {
        switch self {
        case .wallet:
            return ""
        case .user:
            return "user"
        case .play:
            return "김대현 개발자"
        case .settings:
            return "설정"
        }
    }
    
    func getTitleBarHidden() -> Bool
    {
        switch self {
        case .wallet:
            return true
        case .user:
            return false
        case .play:
            return false
        case .settings:
            return false
        }
    }
}

