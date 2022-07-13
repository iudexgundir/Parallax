//
//  MotionManager.swift
//  Parallax
//
//  Created by Эрхаан Говоров on 13.07.2022.
//

import SwiftUI
import CoreMotion

class MotionManager: ObservableObject {
    
    @Published var manager: CMMotionManager = .init()
    @Published var xValue: CGFloat = 0
    @Published var yValue: CGFloat = 0
    @Published var currentSlide: Place = sample_places.first!
    
    func detectMotion(){
        if !manager.isDeviceMotionActive{
            // MARK: MEMORY USAGE
            // 60 fps
            manager.deviceMotionUpdateInterval = 1/60
            manager.startDeviceMotionUpdates(to: .main) {[weak self] motion, err in
                if let attitude = motion?.attitude{
                    self?.xValue = attitude.roll
                    print(attitude.roll)
                }
            }
        }
    }
        
        func stopMotionUpdates(){
            manager.stopDeviceMotionUpdates()
        }
    
}
