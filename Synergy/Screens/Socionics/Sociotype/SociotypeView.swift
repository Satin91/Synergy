//
//  SociotypeMainPageDomain.swift
//  Synergy
//
//  Created by Артур Кулик on 18.10.2023.
//

import ComposableArchitecture
import SwiftUI

struct SociotypeView: View {
    typealias ViewStoreAlias = ViewStore<SociotypeDomain.State, SociotypeDomain.Action>
    let store: StoreOf<SociotypeDomain>
    
    var body: some View {
        content
            .toolbar(.hidden)
            .background(Theme.Socionics.Colors.background)
    }
    
    var content: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            VStack(spacing: 22) {
                navigationBar
                sociotypeContainer(viewStore: viewStore)
                radialDiagramm(viewStore: viewStore)
                Spacer()
                tempButtonsContainer
                buttonContainer(viewStore: viewStore)
            }
            .padding(16)
        }
    }
    
    var navigationBar: some View {
        NavigationBar()
            .addLeftContainer {
                Button(action: {
                    store.send(.backButtonTapped)
                }, label: {
                    Text("Back")
                })
            }
            .addCentralContainer({
                Text("Типология")
                    .font(Theme.Socionics.Fonts.Inter.medium(size: 18))
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            })
    }
    
    func sociotypeContainer(viewStore: ViewStoreAlias) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .foregroundStyle(Theme.Socionics.Colors.buttonBackground)
            .frame(height: 180)
            .overlay {
                VStack(alignment: .leading) {
                    Text(Array(viewStore.sociotype.socioName.components(separatedBy: " ").dropLast()).joined(separator: " "))
                        .font(Theme.Socionics.Fonts.Inter.light(size: 26))
                        .foregroundStyle(Theme.Socionics.Colors.mainText)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Text(viewStore.sociotype.socioName.components(separatedBy: " ").last!)
                        .font(Theme.Socionics.Fonts.Inter.bold(size: 26))
                        .foregroundStyle(Theme.Socionics.Colors.mainText)
                    Spacer()
                    HStack(alignment: .bottom) {
                        modelAContainer(viewStore: viewStore)
                            .frame(width: 50, height: 50)
                        Spacer()
                        moreDetailButton(viewStore: viewStore)
                    }
                }
                .padding(16)
            }
    }
    
    func radialDiagramm(viewStore: ViewStoreAlias) -> some View {
        RoundedRectangle(cornerRadius: 14)
            .foregroundStyle(Color.white)
            .overlay {
                HStack(content: {
                    RadialDiagram(
                        functions: [
                            viewStore.sociotype.description.modelA[0].aspect,
                            viewStore.sociotype.description.modelA[1].aspect,
                            viewStore.sociotype.description.modelA[2].aspect,
                            viewStore.sociotype.description.modelA[3].aspect
                        ],
                        linesColor: Theme.Socionics.Colors.lightGray,
                        ballsColor: Theme.Socionics.Colors.red
                    )
                    .frame(width: 150, height: 150)
                    RadialDiagram(
                        functions: [
                            viewStore.sociotype.description.modelA[7].aspect,
                            viewStore.sociotype.description.modelA[6].aspect,
                            viewStore.sociotype.description.modelA[5].aspect,
                            viewStore.sociotype.description.modelA[4].aspect
                        ],
                        linesColor: Theme.Socionics.Colors.lightGray,
                        ballsColor: Theme.Socionics.Colors.blue
                    )
                    .frame(width: 150, height: 150)
                })
            }
    }
    
    func buttonContainer(viewStore: ViewStoreAlias) -> some View {
        VStack(spacing: 16) {
            NavigationLink(state: MainDomain.Path.State.reininSigns(ReininSignsDomain.State(sociotype: viewStore.sociotype))) {
                SocionicsButton(
                    size: .large(title: "Интертипные отношения", subtitle: "Отношения ЛИИ с другими типами"),
                    image: Theme.Socionics.Icons.intertype,
                    imageColor: Theme.Socionics.Colors.red
                )
            }
            NavigationLink(state: MainDomain.Path.State.reininSigns(ReininSignsDomain.State(sociotype: viewStore.sociotype))) {
                SocionicsButton(
                    size: .large(title: "Признаки рейнина", subtitle: "Дополнительное описание"),
                    image: Theme.Socionics.Icons.reinin,
                    imageColor: Theme.Socionics.Colors.blue
                )
            }
        }
    }
    
    private func moreDetailButton(viewStore: ViewStoreAlias) -> some View {
        NavigationLink(state: MainDomain.Path.State.sociotypeDetail(SociotypeDetailDomain.State(sociotype: viewStore.sociotype ))) {
            Text("Подробнее")
                .font(Theme.Socionics.Fonts.PTRootUI.medium(size: 14))
                .foregroundStyle(Theme.Socionics.Colors.mainText)
        }
    }
    
    var tempButtonsContainer: some View {
        HStack {
            Button("Back") {
                store.send(.backType)
            }
            Button("Next") {
                store.send(.nextType)
            }
        }
    }
    
    func modelAContainer(viewStore: ViewStoreAlias) -> some View {
        VStack {
            HStack {
                SocionicsAspectView(aspect: viewStore.sociotype.description.modelA[0].aspect)
                SocionicsAspectView(aspect: viewStore.sociotype.description.modelA[1].aspect)
            }
            HStack {
                SocionicsAspectView(aspect: viewStore.sociotype.description.modelA[3].aspect)
                SocionicsAspectView(aspect: viewStore.sociotype.description.modelA[2].aspect)
            }
        }
    }
    
    struct SocionicsAspectView: View {
        let aspect: Aspect
        
        var body: some View {
            content
        }
        
        private var content: some View {
            switch aspect {
            case .whiteLogic:
                return Theme.Socionics.Icons.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.lightGray)
            case .whiteIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.lightGray)
            case .whiteEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.lightGray)
            case .whiteSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.lightGray)
            case .blackLogic:
                return Theme.Socionics.Icons.logic
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            case .blackIntuition:
                return Theme.Socionics.Icons.intuition
                    .resizable()
                
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            case .blackEthics:
                return Theme.Socionics.Icons.ethics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            case .blackSensorics:
                return Theme.Socionics.Icons.sensorics
                    .resizable()
                    .foregroundStyle(Theme.Socionics.Colors.mainText)
            }
        }
    }
}

#Preview {
    SociotypeView(store: Store(initialState: SociotypeDomain.State(sociotype: SociotypeFactory.robespierre.type)) {
        SociotypeDomain()
    }
    )
}
