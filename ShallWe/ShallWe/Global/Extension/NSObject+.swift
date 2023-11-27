//
//  NSObject+.swift
//  ShallWe
//
//  Created by KJ on 11/27/23.
//

import Foundation

extension NSObject {

    var className: String {
        NSStringFromClass(self.classForCoder).components(separatedBy: ".").last!
    }
    
    static var className: String {
        NSStringFromClass(self.classForCoder()).components(separatedBy: ".").last!
    }
}
