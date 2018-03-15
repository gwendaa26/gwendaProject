//
//  structFile.swift
//  Worldwide
//
//  Created by Gwenda Hasna'a on 3/15/18.
//  Copyright © 2018 Gwenda Hasna'a. All rights reserved.
//

import Foundation


struct Countries:Decodable {
    let name: String
    let capital: String
    let region: String
    let subregion: String
}
