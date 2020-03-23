//
//  Results.swift
//  song-finder
//
//  Created by Adolfo Montilla on 23-03-20.
//  Copyright © 2020 Adolfo Montilla. All rights reserved.
//

import Foundation

struct Results: Codable
{
    let artistName: String
    let trackName: String
    let collectionName: String
    let artworkUrl100: String
    let previewUrl: String
}
