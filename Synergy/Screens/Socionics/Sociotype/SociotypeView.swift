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
            VStack(spacing: .zero) {
                navigationBar
                ScrollView {
                    VStack(spacing: 22) {
                        sociotypeContainer(viewStore: viewStore)
                        radialDiagramm(viewStore: viewStore)
                        Spacer()
                        tempButtonsContainer
                        buttonContainer(viewStore: viewStore)
                    }
                    .padding(16)
                }
            }
        }
    }
    
    var navigationBar: some View {
        VStack {
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
                .padding()
            Divider()
        }
        .background(Color.white)
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
                        Spacer()
                        moreDetailButton(viewStore: viewStore)
                    }
                }
                .padding(16)
            }
    }
    
    func radialDiagramm(viewStore: ViewStoreAlias) -> some View {
        HStack {
            VStack(spacing: 12) {
                Text("Витальное кольцо")
                    .font(Theme.Socionics.Fonts.Inter.light(size: 14))
                    .foregroundStyle(Theme.Socionics.Colors.secondaryText)
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
            }
            Spacer()
            VStack(spacing: 12) {
                Text("Ментальное кольцо")
                    .font(Theme.Socionics.Fonts.Inter.light(size: 14))
                    .foregroundStyle(Theme.Socionics.Colors.secondaryText)
                RadialDiagram(
                    functions: [
                        viewStore.sociotype.description.modelA[7].aspect,
                        viewStore.sociotype.description.modelA[6].aspect,
                        viewStore.sociotype.description.modelA[5].aspect,
                        viewStore.sociotype.description.modelA[4].aspect
                    ],
                    linesColor: Theme.Socionics.Colors.lightGray,
                    ballsColor: Theme.Socionics.Colors.darkBlue
                )
                .frame(width: 150, height: 150)
            }
    
        }
        .padding()
        .background(Color.white)
        .cornerRadius(12)
    }
    
    
    func buttonContainer(viewStore: ViewStoreAlias) -> some View {
        VStack(spacing: 16) {
            NavigationLink(state: MainDomain.Path.State.reininSigns(ReininSignsDomain.State(sociotype: viewStore.sociotype))) {
                SocionicsButton(
                    size: .large(title: "Интертипные отношения", subtitle: "Отношения \(viewStore.sociotype.socioShortName) с другими типами"),
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
            Button(action: {
                store.send(.backType)
            }, label: {
                Text("Back")
                    .foregroundStyle(Theme.Socionics.Colors.red)
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Theme.Socionics.Colors.red.opacity(0.05))
                    .cornerRadius(8)
            })
            Button(action: {
                store.send(.nextType)
            }, label: {
                Text("Next")
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Theme.Socionics.Colors.lightGray)
                    .cornerRadius(8)
            })
        }
    }
    
    func modelAContainer(viewStore: ViewStoreAlias) -> some View {
        Text(viewStore.sociotype.socioNickname)
            .font(Theme.Socionics.Fonts.Inter.bold(size: 36))
            .foregroundStyle(Theme.Socionics.Colors.mainText)
    }
}

#Preview {
    SociotypeView(store: Store(initialState: SociotypeDomain.State(sociotype: SociotypeFactory.robespierre.type)) {
        SociotypeDomain()
    }
    )
}
