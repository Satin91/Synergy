//
//  MainView.swift
//  Synergy
//
//  Created by Артур Кулик on 19.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct MainDomain: Reducer {
    struct State: Equatable {
        var path = StackState<Path.State>()
        @PresentationState var socionics: SocionicsDomain.State?
        @PresentationState var astrology: AstrologyDomain.State?
    }
    
    enum Action: Equatable {
        case path(StackAction<Path.State, Path.Action>)
        case toSocionicsView
    }
    
    struct Path: Reducer {
        enum State: Equatable {
            case socionics(SocionicsDomain.State)
            case astrology(AstrologyDomain.State)
        }
        
        enum Action: Equatable {
            case socionics(SocionicsDomain.Action)
            case astrology(AstrologyDomain.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: /State.socionics, action: /Action.socionics) {
                SocionicsDomain()
            }
            Scope(state: /State.astrology, action: /Action.astrology) {
                AstrologyDomain()
            }
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .toSocionicsView:
                state.socionics = SocionicsDomain.State()
                return .none
            case let .path(.element(id: _, action: action)):
                switch action {
                case .socionics(_):
                    return .none
                case .astrology(_):
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

struct MainView: View {
    let store: StoreOf<MainDomain>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) } )) {
            content
        } destination: { store in
            switch store {
            case .socionics:
                CaseLet(
                    /MainDomain.Path.State.socionics,
                     action: MainDomain.Path.Action.socionics,
                     then: SocionicsView.init(store:)
                )
            case .astrology:
                CaseLet(
                    /MainDomain.Path.State.astrology,
                     action: MainDomain.Path.Action.astrology,
                     then: AstrologyView.init(store:)
                )
            }
        }
    }
    
    var content: some View {
        WithViewStore(self.store, observe: \.path) { viewStore in
            VStack {
                navigationBar
                Spacer()
                HStack {
                    NavigationLink(state: MainDomain.Path.State.socionics(SocionicsDomain.State())) {
                        SphereButton(title: "Socionics")
                    }
                    NavigationLink(state: MainDomain.Path.State.astrology(AstrologyDomain.State())) {
                        SphereButton(title: "Astrology")
                    }
                }
                Spacer()
            }
        }
    }
    var navigationBar: some View {
        NavigationBar()
            .addCentralContainer {
                Text("Добро пожаловать в синергию")
            }
    }
    
}

struct SphereButton: View {
    let title: String
    let action: (() -> Void)? = nil
    
    var body: some View {
        content
    }
    
    var content: some View {
        Circle()
            .foregroundStyle(.gray.opacity(0.3))
            .background(Color.clear)
            .overlay {
                Text(title)
            }
            .frame(width: 100, height: 100)
    }
}

#Preview {
    MainView(store: Store(initialState: MainDomain.State(), reducer: {
        MainDomain()
            ._printChanges()
    }))
}
