//
//  Aspect.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import Foundation
import SwiftUI

struct SociotypeAspectModel: Equatable {
    var position: AspectPosition
    var aspect: Aspect
    var description: String
}

enum Aspect {
    case whiteLogic
    case whiteIntuition
    case whiteEthics
    case whiteSensorics
    case blackLogic
    case blackIntuition
    case blackEthics
    case blackSensorics
    
    var string: String {
        switch self {
        case .whiteLogic:
            "Структурная логика"
        case .whiteIntuition:
            "Интуиция времени"
        case .whiteEthics:
            "Этика отношений"
        case .whiteSensorics:
            "Сенсорика ощущения"
        case .blackLogic:
            "Деловая логика"
        case .blackIntuition:
            "Интуиция возможностей"
        case .blackEthics:
            "Этика эмоций"
        case .blackSensorics:
            "Волевая сенсорика"
        }
    }
    
    var image: some View {
        switch self {
        case .whiteLogic:
            return Theme.Socionics.Icons.logic
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.lightGray)
        case .whiteIntuition:
            return Theme.Socionics.Icons.intuition
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.lightGray)
        case .whiteEthics:
            return Theme.Socionics.Icons.ethics
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.lightGray)
        case .whiteSensorics:
            return Theme.Socionics.Icons.sensorics
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.lightGray)
        case .blackLogic:
            return Theme.Socionics.Icons.logic
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        case .blackIntuition:
            return Theme.Socionics.Icons.intuition
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        case .blackEthics:
            return Theme.Socionics.Icons.ethics
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        case .blackSensorics:
            return Theme.Socionics.Icons.sensorics
                .resizable()
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
    }
}

enum AspectPosition {
    case leading
    case creative
    case role
    case vulnerable
    case suggestive
    case mobilizing
    case restrictive
    case background
    
    var string: String {
        switch self {
        case .leading:
            "Базовая"
        case .creative:
            "Творческая"
        case .role:
            "Ролевая"
        case .vulnerable:
            "Болевая"
        case .suggestive:
            "Суггестивная"
        case .mobilizing:
            "Активационная"
        case .restrictive:
            "Ограничительная"
        case .background:
            "Фоновая"
        }
    }
}
