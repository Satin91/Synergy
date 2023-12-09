//
//  SociotypeDetailDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 11.11.2023.
//

import Foundation

struct SociotypeDetailDomain: Reducer {
    
    struct State: Equatable {
        var sociotype: Sociotype
    }
    
    enum Action: Equatable  {
        case dismiss
    }
    
    @Dependency (\.dismiss) var dismiss
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .dismiss:
                return .run { send in
                    await self.dismiss()
                }
            }
        }
    }
}
