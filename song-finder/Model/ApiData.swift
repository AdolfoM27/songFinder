//
//  ApiData.swift
//  song-finder
//
//  Created by Adolfo Montilla on 22-03-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

struct ApiData: Codable
{
    let resultCount: Int
    let results: [Results]
}

