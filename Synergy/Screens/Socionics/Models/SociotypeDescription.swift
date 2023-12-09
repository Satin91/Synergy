//
//  SociotypeDescription.swift
//  Synergy
//
//  Created by Артур Кулик on 09.12.2023.
//

import Foundation
import SwiftUI

struct SociotypeDescriptionModel: Equatable {
    let general: String
    var modelA: [SociotypeAspectModel]
    var popularPersons: [Image]
}
