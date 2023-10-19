//
//  SocionicsView.swift
//  Synergy
//
//  Created by Артур Кулик on 18.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct SocionicsDomain: Reducer {
    struct State: Equatable {
        
    }
    
    enum Action: Equatable {
        
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
                
            }
        }
    }
}


struct SocionicsView: View {
    let store: StoreOf<SocionicsDomain>
    
    var body: some View {
        content
    }
    
    var content: some View {
        Text("Socionics View!")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.orange)
    }
}

#Preview {
    SocionicsView(store: Store(initialState: SocionicsDomain.State()) {
        SocionicsDomain()
    }
    )
}
