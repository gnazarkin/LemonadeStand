//
//  Customer.swift
//  LemonadeStandv2
//
//  Created by Gleb Nazarkin on 2014-12-25.
//  Copyright (c) 2014 Addo Labs. All rights reserved.
//

import Foundation

struct Customer {
    var preference = Double(Int(arc4random_uniform(UInt32(11)))/10)
}