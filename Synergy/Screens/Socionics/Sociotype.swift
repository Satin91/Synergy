//
//  Sociotypes.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import Foundation

var socioTypes: [SociotypeModel] = []

enum Sociotype {
    case robespierre
    case hugo
    
    var type: SociotypeModel {
        switch self {
        case .robespierre:
            let type = SociotypeModel(
                socioShortName: "ЛИИ",
                socioName: "Логико - Интуитивный Интроверт",
                socioNickname: "Робеспьер",
                imbtName: "INTJ",
                imbtNickName: "Аналитик",
                raininSigns: [.introvert, .rationals, .democratic, .obstinate, .farsighted, .emotivism, .stragetic, .static, .negativism, .result, .gaiety, .decisive, .asking]
            )
            return type
        case .hugo:
            let type = SociotypeModel(
                socioShortName: "ЭСЭ",
                socioName: "Этико - Сенсорный Экстраверт",
                socioNickname: "Гюго",
                imbtName: "ESFJ",
                imbtNickName: "Аналитик",
                raininSigns: [.extravert, .rationals, .democratic, .obstinate, .farsighted, .constructivism, .tactic, .dynamic, .positivism, .result, .gaiety, .decisive, .declaring]
            )
            return type
        }
    }
}

