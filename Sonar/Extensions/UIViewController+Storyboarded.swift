//
//  UIViewController+Storyboarded.swift
//  Sonar
//
//  Created by NHSX on 25/03/2020.
//  Copyright © 2020 NHSX. All rights reserved.
//

import UIKit

protocol Storyboarded: class {
    static var storyboardName: String { get }
    static func instantiate() -> Self
}

extension Storyboarded where Self: UIViewController {
    static func instantiate() -> Self {
        let fullName = NSStringFromClass(self)
        let className = fullName.components(separatedBy: ".")[1]
        let storyboard = UIStoryboard(name: storyboardName, bundle: Bundle(for: Self.self))
        return storyboard.instantiateViewController(withIdentifier: className) as! Self
    }
}

extension Storyboarded {
    
    static func instantiate(prepare: (Self) -> Void) -> Self {
        let instance = self.instantiate()
        prepare(instance)
        return instance
    }
    
}
