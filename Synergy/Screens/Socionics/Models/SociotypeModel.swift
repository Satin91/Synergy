//
//  SociotypeModel.swift
//  Synergy
//
//  Created by Артур Кулик on 22.10.2023.
//

import Foundation
import SwiftUI

struct SociotypeModel: Equatable {
    var socioShortName: String // ЛИИ
    var socioName: String // Логико-Интуитивный Интроверт
    var socioNickname: String // Робеспьер
    
    var imbtName: String // INTJ
    var imbtNickName: String // Аналитик
    var raininSigns: [Rainin]
    
    var description: SociotypeDescriptionModel
}

enum SocionicsFunction {
    enum Name {
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
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .blackLogic:
                return Theme.Socionics.Icons.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            }
        }
    }
    
    enum Position {
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
}









/*
 ЛИИ
 Логико - Интуитивный Интроверт
 Аналитик
 Робеспьер
 Модель А: [whiteLogic, blackIntuition, whiteEthics, blackSensorics, blackEthics, whiteSensorics, blackLogic, whiteIntuition]
 Признаки рейнина: [positive, negative], [asking, declaring], [static, dynamic], [tactical, strategic], [aristocratic, democratic], [process, result], [constructivism, emotivism], [decisive, reasonable], [rationals, irratioinals], [yielding, obstainate], [carefree, farsighted,] [subjective, objective]
 
 Introvert and extravert
 Positive and negative personality types-------------------- Позитивизм, негативизм
 Asking and declaring personality types--------------------- Квестим, деклатим
 Static and dynamic personality types----------------------- Статика, динамика
 Tactical and strategic personality types------------------- Тактика, стратегия
 Aristocratic and Democratic personality types-------------- Аристократ, демократ
 Process and result in socionics---------------------------- Процесс, результат
 Constructivism and Emotivism------------------------------  Конструктевизм, эмотивизм
 Decisive and reasonable personality types------------------ Решительность, рассудительность
 Rationals and irrationals in socionics--------------------- Рационал, Иррационал
 Yielding vs Obstinate-------------------------------------- Уступчивость, упрямство
 Carefree and Farsighted------------------------------------ Беспечные, предусмотрительные
 Subjective and objective personality types----------------- Субъективизм, объективизм
 */
