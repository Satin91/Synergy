//
//  Theme.swift
//  Synergy
//
//  Created by Артур Кулик on 22.10.2023.
//

import Foundation
import SwiftUI

enum Theme {
    enum Socionics {
        enum Colors {
            static let background = Color("S_background")
            static let buttonBackground = Color("S_buttonBackground")
            static let buttonBorder = Color("S_buttonStroke")
            static let buttonSecondaryText = Color("S_buttonSecondaryText")
            static let green = Color("S_green")
            static let greenLight = Color("S_greenLight")
            static let mainText = Color("S_mainText")
            static let mint = Color("S_mint")
            static let secondaryText = Color("S_secondaryText")
            static let violet = Color("S_violet")
            static let clear = Color.clear
            static let blackFunction = Color("S_blackFunction")
            static let whiteFunction = Color("S_whiteFunction")
        }
        
        enum Fonts {
            enum Inter {
                static func extraLight(size: CGFloat) -> Font { .custom("Inter-ExtraLight", size: size) }
                static func light(size: CGFloat) -> Font { .custom("Inter-Light", size: size) }
                static func regular(size: CGFloat) -> Font { .custom("Inter-Regular", size: size) }
                static func medium(size: CGFloat) -> Font { .custom("Inter-Medium", size: size) }
                static func semiBold(size: CGFloat) -> Font { .custom("Inter-SemiBold", size: size) }
                static func bold(size: CGFloat) -> Font { .custom("Inter-Bold", size: size) }
                static func extraBold(size: CGFloat) -> Font { .custom("Inter-ExtraBold", size: size) }
                static func black(size: CGFloat) -> Font { .custom("Inter-Black", size: size) }   
            }
            
            enum PTRootUI {
                static func light(size: CGFloat) -> Font { .custom("PTRootUI-Light", size: size) }
                static func regular(size: CGFloat) -> Font { .custom("PTRootUI-Regular", size: size) }
                static func medium(size: CGFloat) -> Font { .custom("PTRootUI-Medium", size: size) }
                static func bold(size: CGFloat) -> Font { .custom("PTRootUI-Bold", size: size) }
            }
        }
        
        enum Images {
            static let userGroup = Image("userGroup")
            static let logic = Image("logic")
            static let intuition = Image("intuition")
            static let ethics = Image("ethics")
            static let sensorics = Image("sensorics")
        }
    }
    
    
    
    enum Astrology {
        enum Colors {
            
        }
    }
    
}
