//
//  HeroStats.swift
//  BelajarJSON
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import Foundation

struct HeroStats: Decodable {
    let localized_name: String
    let primary_attr: String
    let attack_type: String
    let legs: Int
    let img: String
}
