//
//  RadialDiagram.swift
//  Synergy
//
//  Created by Артур Кулик on 08.12.2023.
//

import SwiftUI

struct RadialDiagram: View {
    
    let functionArray: [Aspect]
    let linesColor: Color
    let ballsColor: Color
    
    private var numberOfCircles: Int = 4
    private var numberOfLines: Int = 8
    
    private let circleDiff: CGFloat = 20
    private let ballDiameter: CGFloat = 6
    private let imageSize: CGFloat = 12
    private var imageCirclePadding: CGFloat = 40
    
    
    private let lineWidth: CGFloat = 1
    private var lineHeight: CGFloat {
        (CGFloat(numberOfCircles) - 1) * circleDiff / 2
    }
    
    private let aspects: [Aspect] = [
        Aspect.blackLogic,
        Aspect.blackIntuition,
        Aspect.blackEthics,
        Aspect.whiteIntuition,
        Aspect.whiteEthics,
        Aspect.whiteSensorics,
        Aspect.whiteLogic,
        Aspect.blackSensorics
    ]
    
    private var lineDegree: Double {
        360 / Double(numberOfLines)
    }
    
    var body: some View {
        content
    }
    
    init(functions: [Aspect], linesColor: Color, ballsColor: Color) {
        self.functionArray = functions
        self.linesColor = linesColor
        self.ballsColor = ballsColor
    }
    
    var content: some View {
        ZStack {
            GeometryReader { proxy in
                circles(proxy: proxy)
                lines(proxy: proxy)
                balls(proxy: proxy, point: functionArray)
                annotations(proxy: proxy)
            }
        }
    }
    
    private func circles(proxy: GeometryProxy) -> some View {
        let center = CGPoint(x: proxy.size.height / 2, y: proxy.size.height / 2)
        let startDiameter = proxy.size.height - (imageCirclePadding)
        return ForEach(0..<numberOfCircles, id: \.self) { index in
            Circle()
                .stroke(lineWidth: lineWidth)
                .foregroundStyle(linesColor)
                .position(center)
                .frame(
                    width: abs(startDiameter - (CGFloat(index) * circleDiff)),
                    height: abs(startDiameter - (CGFloat(index) * circleDiff))
                )
        }
    }
    
    private func lines(proxy: GeometryProxy) -> some View {
        let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
        let yOffset = (proxy.size.height / 2) - (lineHeight / 2) - imageCirclePadding / 2
        return ForEach(0...numberOfLines, id: \.self) { index in
            line
                .position(center)
                .offset(x: .zero, y: yOffset)
                .rotationEffect(.degrees(Double(index) * lineDegree))
        }
    }
    
    private func balls(proxy: GeometryProxy, point: [Aspect]) -> some View {
        let startRadius = (proxy.size.height / 2) - (imageCirclePadding / 2)
        let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
        return ZStack {
            ForEach(0..<numberOfCircles, id: \.self) { index in
                Circle()
                    .frame(width: ballDiameter)
                    .foregroundStyle(self.ballsColor)
                    .position(center)
                    .offset(x: 0, y: startRadius - (CGFloat(index) * (circleDiff / 2)))
                    .rotationEffect(
                        Angle(degrees: 180 + ballAngle(f: point[index]))
                    )
            }
        }
    }
    
    func annotations(proxy: GeometryProxy) -> some View {
        let theta = CGFloat(2) * .pi / CGFloat(aspects.count)
        return ZStack {
            let center = CGPoint(x: proxy.size.width / 2, y: proxy.size.height / 2)
            let radius = min(proxy.size.width / 2, proxy.size.height / 2) - imageSize / 2
            let radialOffset: CGFloat = 1.97
            ForEach(0..<aspects.count, id: \.self) { index in
                let offset = theta * CGFloat(index) + theta / 2
                aspects[index].image
                    .position(center)
                    .offset(
                        x: radius * cos(offset - radialOffset),
                        y: radius * sin(offset - radialOffset))
                    .frame(width: imageSize, height: imageSize)
            }
        }
    }
    
    private var line: some View {
        Rectangle()
            .foregroundStyle(linesColor)
            .frame(width: lineWidth, height: lineHeight)
    }
}

#Preview {
    RadialDiagram(functions: [.whiteLogic, .blackIntuition, .whiteEthics, .blackSensorics], linesColor: Theme.Socionics.Colors.lightGray, ballsColor: Theme.Socionics.Colors.red)
        .frame(width: 350, height: 350, alignment: .center)
}

extension RadialDiagram {
    func ballAngle(f: Aspect) -> Double {
        switch f {
        case .whiteLogic:
            lineDegree * 6
        case .whiteIntuition:
            lineDegree * 3
        case .whiteEthics:
            lineDegree * 4
        case .whiteSensorics:
            lineDegree * 5
        case .blackLogic:
            lineDegree * 0
        case .blackIntuition:
            lineDegree * 1
        case .blackEthics:
            lineDegree * 2
        case .blackSensorics:
            lineDegree * 7
        }
    }
}
