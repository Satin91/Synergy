//
//  MainDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import Foundation
import ComposableArchitecture

struct MainDomain: Reducer {
    struct State: Equatable {
        var path = StackState<Path.State>()
        @PresentationState var socionics: SociotypeDomain.State?
        @PresentationState var astrology: AstrologyDomain.State?
        @PresentationState var reininSigns: ReininSignsDomain.State?
        @PresentationState var socionicsDetailView: SociotypeDetailDomain.State?
    }
    
    enum Action: Equatable {
        case path(StackAction<Path.State, Path.Action>)
    }
    
    struct Path: Reducer {
        enum State: Equatable {
            case socionics(SociotypeDomain.State)
            case astrology(AstrologyDomain.State)
            case reininSigns(ReininSignsDomain.State)
            case sociotypeDetail(SociotypeDetailDomain.State)
        }
        
        enum Action: Equatable {
            case socionics(SociotypeDomain.Action)
            case astrology(AstrologyDomain.Action)
            case reininSigns(ReininSignsDomain.Action)
            case sociotypeDetail(SociotypeDetailDomain.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: /State.socionics, action: /Action.socionics) {
                SociotypeDomain()
            }
            Scope(state: /State.astrology, action: /Action.astrology) {
                AstrologyDomain()
            }
            Scope(state: /State.reininSigns, action: /Action.reininSigns) {
                ReininSignsDomain()
            }
            Scope(state: /State.sociotypeDetail, action: /Action.sociotypeDetail) {
                SociotypeDetailDomain()
            }
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case let .path(.element(id: _, action: action)):
                switch action {
                case .socionics(_):
                    return .none
                case .astrology(_):
                    return . none
                case .reininSigns(_):
                    return .none
                case .sociotypeDetail(_):
                    return .none
                }
            case .path:
                return .none
            }
        }
        .forEach(\.path, action: /Action.path) {
            Path()
        }
    }
}
