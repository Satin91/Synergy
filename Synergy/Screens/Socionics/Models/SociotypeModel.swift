//
//  SociotypeModel.swift
//  Synergy
//
//  Created by Артур Кулик on 22.10.2023.
//

import Foundation
import SwiftUI

struct SociotypeModel: Equatable {
    var socioShortName: String // ЛИИ
    var socioName: String // Логико-Интуитивный Интроверт
    var socioNickname: String // Робеспьер
    
    var imbtShortName: String // INTJ
    var imbtNickName: String // Аналитик
    var raininSigns: [Rainin]
    
    var description: SociotypeDescriptionModel
}










/*
 ЛИИ
 Логико - Интуитивный Интроверт
 Аналитик
 Робеспьер
 Модель А: [whiteLogic, blackIntuition, whiteEthics, blackSensorics, blackEthics, whiteSensorics, blackLogic, whiteIntuition]
 Признаки рейнина: [positive, negative], [asking, declaring], [static, dynamic], [tactical, strategic], [aristocratic, democratic], [process, result], [constructivism, emotivism], [decisive, reasonable], [rationals, irratioinals], [yielding, obstainate], [carefree, farsighted,] [subjective, objective]
 
 Introvert and extravert
 Positive and negative personality types-------------------- Позитивизм, негативизм
 Asking and declaring personality types--------------------- Квестим, деклатим
 Static and dynamic personality types----------------------- Статика, динамика
 Tactical and strategic personality types------------------- Тактика, стратегия
 Aristocratic and Democratic personality types-------------- Аристократ, демократ
 Process and result in socionics---------------------------- Процесс, результат
 Constructivism and Emotivism------------------------------  Конструктевизм, эмотивизм
 Decisive and reasonable personality types------------------ Решительность, рассудительность
 Rationals and irrationals in socionics--------------------- Рационал, Иррационал
 Yielding vs Obstinate-------------------------------------- Уступчивость, упрямство
 Carefree and Farsighted------------------------------------ Беспечные, предусмотрительные
 Subjective and objective personality types----------------- Субъективизм, объективизм
 */
