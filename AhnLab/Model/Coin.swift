//
//  Coin.swift
//  AhnLab
//
//  Created by DaeHyeonKim on 2022/11/03.
//

import Foundation
import SwiftUI


enum Coin : String,CaseIterable
{
    case bitcoin = "Bitcoin"
    case dOGE = "DOGE"
    case etherium_Classic = "Etherium Classic"
    case etherium = "Etherium"
    case litecoin = "Litecoin"
    
    func getCoinPrice() -> String
    {
        switch self {
        case .bitcoin:
            return "7.3 BIT"
        case .dOGE:
            return "300.2 DOG"
        case .etherium_Classic:
            return "12.2 ETH"
        case .etherium:
            return "7.3 ETH"
        case .litecoin:
            return "110.3 LTE"
        }
    }
    
    func getCoinColor() -> Color
    {
        switch self {
        case .bitcoin:
            return Color.orange
        case .dOGE:
            return Color.yellow.opacity(0.6)
        case .etherium_Classic:
            return Color.green
        case .etherium:
            return Color.gray
        case .litecoin:
            return Color.gray.opacity(0.6)
        }
    }
    
}

