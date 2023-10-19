//
//  Astrology.swift
//  Synergy
//
//  Created by Артур Кулик on 19.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct AstrologyDomain: Reducer {
    
    struct State: Equatable {
        
    }
    
    enum Action: Equatable  {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}

struct AstrologyView: View {
    let store: StoreOf<AstrologyDomain>
    
    
    var body: some View {
        Text("Astrology View!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.purple)
    }
}

#Preview {
    AstrologyView(store: Store(initialState: AstrologyDomain.State(), reducer: {
        AstrologyDomain()
    }))
}
