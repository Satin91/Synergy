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
            static let red = Color("S_red")
            static let greenLight = Color("S_greenLight")
            static let mainText = Color("S_mainText")
            static let mint = Color("S_mint")
            static let secondaryText = Color("S_secondaryText")
            static let violet = Color("S_violet")
            static let clear = Color.clear
            static let blue = Color("S_blue")
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
        
        enum Icons {
            static let intertype = Image("intertype")
            static let reinin = Image("reinin")
            static let logic = Image("logic")
            static let intuition = Image("intuition")
            static let ethics = Image("ethics")
            static let sensorics = Image("sensorics")
        }
        
        enum Photos {
            enum Robespierres {
                static let irina_khakamada = Image("irina_khakamada")
                static let immanuel_kant = Image("immanuel_kant")
                static let mads_mikkelsen = Image("mads_mikkelsen")
                static let maria_curie = Image("maria_curie")
                static let nikola_tesla = Image("nikola_tesla")
                static let vladimir_putin = Image("vladimir_putin")
                static let robert_oppenheimer = Image("robert_oppenheimer")
                static let ludvig_van_bethoven = Image("ludvig_van_bethoven")
            }
        }
    }
    
    
    
    enum Astrology {
        enum Colors {
            
        }
    }
    
}
