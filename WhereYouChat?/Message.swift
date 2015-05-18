//
//  Message.swift
//  WhereYouChat?
//
//  Created by Rob Hislop on 5/17/15.
//  Copyright (c) 2015 Swift Team Six. All rights reserved.
//

import UIKit

class Message: NSObject {
    var text: String?
    var user: User?
    var destination: CLLocationCoordinate2D? // Store the group destination in Message so it can be updated on the fly?
}
