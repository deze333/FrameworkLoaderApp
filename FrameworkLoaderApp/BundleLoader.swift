//
//  BundleLoader.swift
//  ExperimentalWidget
//
//  Created by Denis Zubkov on 23/1/18.
//  Copyright © 2018 seqfx. All rights reserved.
//

import Foundation

class BundleLoader {
    
    func loadPlugins(from path: String) {
        
        let url = URL(fileURLWithPath: path)
        guard let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: [URLResourceKey.nameKey, URLResourceKey.isDirectoryKey], options: [.skipsHiddenFiles, .skipsSubdirectoryDescendants]) else {
            return
        }
        
        while let item = enumerator.nextObject() as? URL {
            
            do {
                let vals = try item.resourceValues(forKeys: [.isDirectoryKey])
                if let ok = vals.isDirectory, ok {
                } else {
                    continue
                }
                
                switch item.lastPathComponent {
                    
                case "FrameworkSwift.framework": fallthrough
                case "FrameworkObjC.framework":
                    if let bundle = Bundle(url: item) {
                        do {
                            try bundle.loadAndReturnError()
                            print("🏓🏓 Loaded bundle:", item.lastPathComponent, ", principal class:", bundle.principalClass ?? "N/A")
                            
                            if let cls = bundle.principalClass {
                                print("✳️ Initializing...", cls)

                                if let cls = bundle.principalClass as? NSObject.Type,
                                    let plugin = cls.init() as? PluginInterface {
                                    plugin.sayHello()
                                    let s = plugin.convertString("Original string")
                                    print("Plugin call result: \(s)")
                                }
                                
                            } else {
                                print("🎱🎱 Bundle principalClass in NIL")
                            }
                        } catch {
                            print("🎱🎱 Bundle load failed:", item.lastPathComponent)
                        }
                    }

                default:
                    break
                }
                
            } catch {
                print("🎱🎱 ERROR:", error)
            }
        }
    }
}
