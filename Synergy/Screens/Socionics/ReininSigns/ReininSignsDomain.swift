//
//  ReininSignsDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 11.11.2023.
//

import ComposableArchitecture
import Foundation

struct ReininSignsDomain: Reducer {
    
    struct State: Equatable {
        var sociotype: SociotypeModel
        var sociotypes = SociotypeFactory.allCases
        var position: Int = 0
    }
    
    enum Action: Equatable  {
        case backType
        case nextType
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .backType:
                if state.position - 1 >= 0 {
                    state.position -= 1
                }
                state.sociotype = state.sociotypes[state.position].type
                return .none
            case .nextType:
                if  state.position + 1 <= state.sociotypes.count - 1 {
                    state.position += 1
                }
                state.sociotype = state.sociotypes[state.position].type
                return .none
            }
        }
    }
}
