//
//  Utils.swift
//  NetInfo
//
//  Created by Travasoni Giuseppe on 26/08/16.
//
//

import Foundation

struct Platform {
    
    static var isSimulator: Bool {
        return TARGET_OS_SIMULATOR != 0 // Use this line in Xcode 7 or newer
    }
    
}
