//
//  MainView.swift
//  Synergy
//
//  Created by Артур Кулик on 19.10.2023.
//

import ComposableArchitecture
import SwiftUI

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
                     then: SociotypeView.init(store:)
                )
            case .astrology:
                CaseLet(
                    /MainDomain.Path.State.astrology,
                     action: MainDomain.Path.Action.astrology,
                     then: AstrologyView.init(store:)
                )
            case .reininSigns:
                CaseLet(
                    /MainDomain.Path.State.reininSigns,
                     action: MainDomain.Path.Action.reininSigns,
                     then: ReininSignsView.init(store:)
                )
            case .sociotypeDetail:
                CaseLet(
                    /MainDomain.Path.State.sociotypeDetail,
                     action: MainDomain.Path.Action.sociotypeDetail,
                     then: SociotypeDetailView.init(store:)
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
                    NavigationLink(state: MainDomain.Path.State.socionics(SociotypeDomain.State(sociotype: SociotypeFactory.robespierre.type))) {
                        SphereButton(title: "Socionics")
                    }
                    NavigationLink(state: MainDomain.Path.State.astrology(AstrologyDomain.State())) {
                        SphereButton(title: "Astrology")
                    }
                }
                Spacer()
            }
            .background(Color.black)
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
        RoundedRectangle(cornerRadius: 12)
            .foregroundStyle(Theme.Socionics.Colors.lightGray)
            .overlay(content: {
                Text(title)
                    .font(.footnote)
            })
            .overlay(content: {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(lineWidth: 1)
            })
            .frame(width: 100, height: 40)
    }
}

#Preview {
    MainView(store: Store(initialState: MainDomain.State(), reducer: {
        MainDomain()
            ._printChanges()
    }))
}
