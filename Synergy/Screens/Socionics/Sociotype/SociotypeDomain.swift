//
//  SociotypeMainPageDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 11.11.2023.
//

import Foundation
import ComposableArchitecture

struct SociotypeDomain: Reducer {
    struct State: Equatable {
        var sociotype: SociotypeModel
        var position: Int = 0
    }
    
    enum Action: Equatable {
        case backButtonTapped
        case nextType
        case backType
    }
    
    @Dependency(\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backButtonTapped:
                return .run { send in
                    await self.dismiss()
                }
            case .nextType:
                if state.position + 1 <= SociotypeFactory.allCases.count - 1 {
                    state.position += 1
                }
                state.sociotype = SociotypeFactory.allCases[state.position].type
                return .none
            case .backType:
                if state.position - 1 >= 0 {
                    state.position -= 1
                }
                state.sociotype = SociotypeFactory.allCases[state.position].type
                return .none
            }
        }
    }
}
