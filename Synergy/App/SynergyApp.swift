//
//  SynergyApp.swift
//  Synergy
//
//  Created by Артур Кулик on 18.10.2023.
//

import ComposableArchitecture
import SwiftUI

@main
struct SynergyApp: App {
    var body: some Scene {
        WindowGroup {
            MainView(store: Store(initialState: MainDomain.State()) {
                MainDomain()
            }
            )
        }
    }
}
