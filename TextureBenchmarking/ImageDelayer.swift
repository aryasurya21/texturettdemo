//
//  ImageDelayer.swift
//  TextureBenchmarking
//
//  Created by ByteDance on 18/11/22.
//

import Foundation
import UIKit

final class ImageDelayer {
    
    private let group = DispatchGroup()
    private let queue = DispatchQueue(label: "delayer", attributes: .concurrent)
    
    internal func getDelayedImage() -> UIImage {
        let timeout: TimeInterval = Double(arc4random_uniform(11)) / 1000
        
        group.enter()
        
        queue.asyncAfter(deadline: .now() + timeout) {
            self.group.leave()
        }
        
        _ = group.wait(timeout: .distantFuture)
        
        return UIImage(named: "tiktok")!
    }
}
