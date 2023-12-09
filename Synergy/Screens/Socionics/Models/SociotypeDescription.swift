//
//  SociotypeDescription.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import Foundation
import SwiftUI

struct SociotypeDescriptionModel: Equatable {
    
    struct SociotypeFunctionModel: Equatable {
        var position: SocionicsFunction.Position
        var function: SocionicsFunction.Name
        var description: String
    }
    
    let general: String
    var modelA: [SociotypeFunctionModel]
    var popularPersons: [Image]
}
