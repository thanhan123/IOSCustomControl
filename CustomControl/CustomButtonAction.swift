//
//  CustomButtonAction.swift
//  CustomControl
//
//  Created by Dinh Thanh An on 12/13/17.
//  Copyright © 2017 An. All rights reserved.
//

import Foundation
import UIKit

class ActionTrampoline<T>: NSObject {
    var action: (T) -> Void

    init(action: @escaping (T) -> Void) {
        self.action = action
    }

    @objc func action(sender: UIControl) {
        print(sender)
        action(sender as! T)
    }
}

let NSControlActionFunctionProtocolAssociatedObjectKey = UnsafeMutablePointer<Int8>.allocate(capacity: 1)

protocol NSControlActionFunctionProtocol {}
extension NSControlActionFunctionProtocol where Self: UIControl {
    func addAction(_ events: UIControlEvents, _ action: @escaping (Self) -> Void) {
        let trampoline = ActionTrampoline(action: action)
        self.addTarget(trampoline, action: #selector(ActionTrampoline<Self>.action(sender:)), for: events)
        objc_setAssociatedObject(self, NSControlActionFunctionProtocolAssociatedObjectKey, trampoline, .OBJC_ASSOCIATION_RETAIN)
    }
}
extension UIControl: NSControlActionFunctionProtocol {}


