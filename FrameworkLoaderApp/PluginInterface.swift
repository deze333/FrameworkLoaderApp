//
//  PluginInterface.swift
//  DynFrameworkLoader
//
//  Created by Denis Zubkov on 24/1/18.
//  Copyright © 2018 Denis Zubkov. All rights reserved.
//

import Foundation

// Plugin interface protocol

@objc(PluginInterface)
protocol PluginInterface: NSObjectProtocol {
    var name: String { get }
    
    @objc(sayHello)
    func sayHello()
    
    @objc(convertString:)
    func convertString(_ string: String) -> String
}
