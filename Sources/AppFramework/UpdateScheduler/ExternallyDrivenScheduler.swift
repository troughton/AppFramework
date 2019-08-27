//
//  ExternallyDrivenScheduler.swift
//  Atomics
//
//  Created by Thomas Roughton on 10/07/19.
//

#if os(macOS)

import MetalKit

public final class ExternallyDrivenScheduler : UpdateScheduler  {
    private var application : Application! = nil
    
    public init(appDelegate: ApplicationDelegate?, updateables: @escaping @autoclosure () -> [FrameUpdateable]) {
        self.application = CocoaApplication(delegate: appDelegate, updateables: updateables(), updateScheduler: self)
    }
    
    public func update() {
        autoreleasepool {
            for window in application.windows {
                (window as! MTKWindow).mtkView.draw()
            }
        }
    }
    
    public func quit() {
        self.application = nil
    }
}

#endif
