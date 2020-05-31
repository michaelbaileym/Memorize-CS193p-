//
//  Array+Only.swift
//  Memorize
//
//  Created by Michael Bailey on 5/31/20.
//  Copyright © 2020 DefenseAR. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}
