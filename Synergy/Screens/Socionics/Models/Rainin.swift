//
//  Rainin.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import Foundation

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
