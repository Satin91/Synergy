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

struct SociotypeDescriptionModel: Equatable {
    
    struct SociotypeFunctionModel: Equatable {
        var position: SocionicsFunction.Position
        var function: SocionicsFunction.Name
        var description: String
    }
    
    let general: String
    var modelA: [SociotypeFunctionModel]
}

struct RainingSignPair {
    var signs: (first: Rainin, second: Rainin)
    init(signs: (first: Rainin, second: Rainin)) {
        self.signs = signs
    }
    
    func current(of sign: Rainin) -> Rainin {
        if sign == signs.first {
            return signs.first
        } else if sign == signs.second {
            return signs.second
        } else {
            fatalError("Fatal error: 'Current Sign are not defined' ")
        }
    }
}

enum Rainin: CaseIterable {
    
    // Экстраверт / Интроверт
    case extravert
    case introvert
    
    // Тактика / Стратегия
    case tactic
    case stragetic
    
    // Позитивизм / Негативизм
    case positivism
    case negativism
    
    // Квестим / Деклатим
    case asking
    case declaring
    
    // Статик / Динамик
    case `static`
    case dynamic
    
    // Аристократ / Демократ
    case aristocratic
    case democratic
    
    // Процесс / Результат
    case process
    case result
    
    // Конструктевист / Эмотивист
    case constructivism
    case emotivism
    
    // Решительность / Рассудительность
    case decisive
    case reasonable
    
    // Рационал / Иррационал
    case rationals
    case irrationals
 
    // Уступчивый / Упрямый
    case yielding
    case obstinate
    
    // Беспечный / Предусмотрительный
    case carefree
    case farsighted
    
    // Весёлость / Серьезность
    case gaiety
    case seriousness
    
    static var signPairs: [RainingSignPair] {
        [
            RainingSignPair(signs: (first: .extravert, second: .introvert)),
            RainingSignPair(signs: (first: .rationals, second: .irrationals)),
            RainingSignPair(signs: (first: .aristocratic, second: .democratic)),
            RainingSignPair(signs: (first: .yielding, second: .obstinate)),
            RainingSignPair(signs: (first: .carefree, second: .farsighted)),
            RainingSignPair(signs: (first: .constructivism, second: .emotivism)),
            RainingSignPair(signs: (first: .tactic, second: .stragetic)),
            RainingSignPair(signs: (first: .static, second: .dynamic)),
            RainingSignPair(signs: (first: .positivism, second: .negativism)),
            RainingSignPair(signs: (first: .process, second: .result)),
            RainingSignPair(signs: (first: .gaiety, second: .seriousness)),
            RainingSignPair(signs: (first: .decisive, second: .reasonable)),
            RainingSignPair(signs: (first: .asking, second: .declaring)),
        ]
    }
}

extension Rainin {
    var title: String {
        switch self {
        case .extravert:
            "Экстраверт"
        case .introvert:
            "Интроверт"
        case .tactic:
            "Тактик"
        case .stragetic:
            "Стратег"
        case .positivism:
            "Позитивист"
        case .negativism:
            "Негативист"
        case .asking:
            "Квестим"
        case .declaring:
            "Деклатим"
        case .static:
            "Статик"
        case .dynamic:
            "Динамик"
        case .aristocratic:
            "Аристократ"
        case .democratic:
            "Демократ"
        case .process:
            "Процесс"
        case .result:
            "Результат"
        case .constructivism:
            "Конструктивист"
        case .emotivism:
            "Эмотивист"
        case .decisive:
            "Рассудительный"
        case .reasonable:
            "Решительный"
        case .rationals:
            "Рационал"
        case .irrationals:
            "Иррационал"
        case .yielding:
            "Уступчевый"
        case .obstinate:
            "Упрямый"
        case .carefree:
            "Беспечный"
        case .farsighted:
            "Предусматрительный"
        case .gaiety:
            "Весёлый"
        case .seriousness:
            "Серьёзный"
        }
    }
}

extension Rainin {
    var description: String {
        switch self {
        case .extravert:
            "Какое то описание"
        case .introvert:
            "Какое то описание"
        case .tactic:
            "Какое то описание"
        case .stragetic:
            "Какое то описание"
        case .positivism:
            "Какое то описание"
        case .negativism:
            "Какое то описание"
        case .asking:
            "Какое то описание"
        case .declaring:
            "Какое то описание"
        case .static:
            "Какое то описание"
        case .dynamic:
            "Какое то описание"
        case .aristocratic:
            "Какое то описание"
        case .democratic:
            "Какое то описание"
        case .process:
            "Какое то описание"
        case .result:
            "Какое то описание"
        case .constructivism:
            "Какое то описание"
        case .emotivism:
            "Какое то описание"
        case .decisive:
            "Какое то описание"
        case .reasonable:
            "Какое то описание"
        case .rationals:
            "Какое то описание"
        case .irrationals:
            "Какое то описание"
        case .yielding:
            "Какое то описание"
        case .obstinate:
            "Какое то описание"
        case .carefree:
            "Какое то описание"
        case .farsighted:
            "Какое то описание"
        case .gaiety:
            "Какое то описание"
        case .seriousness:
            "Какое то описание"
        }
    }
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
                return Theme.Socionics.Images.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteIntuition:
                return Theme.Socionics.Images.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteEthics:
                return Theme.Socionics.Images.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .whiteSensorics:
                return Theme.Socionics.Images.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.whiteFunction)
            case .blackLogic:
                return Theme.Socionics.Images.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackIntuition:
                return Theme.Socionics.Images.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackEthics:
                return Theme.Socionics.Images.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.blackFunction)
            case .blackSensorics:
                return Theme.Socionics.Images.sensorics
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
