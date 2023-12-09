//
//  ReininSignsView.swift
//  Synergy
//
//  Created by Артур Кулик on 23.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct ReininSignsView: View {
    let store: StoreOf<ReininSignsDomain>
    
    var body: some View {
        content
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack {
                Text(viewStore.sociotype.socioNickname)
                ForEach(0..<Rainin.signPairs.count, id: \.self) { index in
                    rainingSign(pair: Rainin.signPairs[index].signs, actual: viewStore.sociotype.raininSigns[index])
                }
                buttons
            }
        }
    }
    
    func rainingSign(pair: (Rainin, Rainin), actual: Rainin) -> some View {
        VStack {
            HStack {
                Text(pair.0.title)
                    .foregroundStyle(pair.0 == actual ? .green : .gray)
                Text(pair.1.title)
                    .foregroundStyle(pair.1 == actual ? .green : .gray)
            }
            Text(actual.description)
        }
    }
    
    var buttons: some View {
        HStack {
            Button("LII") {
                store.send(.backType)
            }
            Button("ESE") {
                store.send(.nextType)
            }
        }
    }
}

#Preview {
    ReininSignsView(store: Store(initialState: ReininSignsDomain.State(sociotype: SociotypeFactory.robespierre.type), reducer: {
        ReininSignsDomain()
    }))
}

