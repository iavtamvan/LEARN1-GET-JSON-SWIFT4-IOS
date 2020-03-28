//
//  CountryModel.swift
//  BelajarJSON
//
//  Created by iav on 28/03/20.
//  Copyright © 2020 iav. All rights reserved.
//

import Foundation
struct Country:Decodable {
    let name: String
    let capital: String
    let region: String
}
