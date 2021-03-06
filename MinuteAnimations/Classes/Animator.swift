//
//  Animator.swift
//  Pods
//
//  Created by Luca Gobbo on 22-06-17.
//
//

import Foundation
import UIKit

extension UIView {
  
  public final class Animator {
    
    public typealias Completion = (Bool) -> Void
    public typealias SimpleCompletion = () -> Void
    public typealias Animations = () -> Void
    
    public convenience init(duration: TimeInterval, delay: TimeInterval = 0, options: UIViewAnimationOptions = []) {
      self.init(animationType: .regular(duration, delay, options))
    }
    
    public convenience init(duration: TimeInterval,
                            delay: TimeInterval = 0,
                            damping: CGFloat,
                            velocity: CGFloat,
                            options: UIViewAnimationOptions = []) {
      
      self.init(animationType: .spring(duration, delay, damping, velocity, options))
    }
    
    public func animations(_ animations: @escaping Animations) -> Self {
      self.animations = animations
      return self
    }
    
    public func completion(_ completion: SimpleCompletion?) -> Self {
      self.completion = { _ in completion?() }
      return self
    }
    
    public func completion(_ completion: Completion?) -> Self {
      self.completion = completion
      return self
    }
    
    public func animate() {
      switch self.animationType {
        
      case let .regular(duration, delay, options):
        UIView.animate(withDuration: duration,
                       delay: delay,
                       options: options,
                       animations: self.animations,
                       completion: self.completion)
        
      case let .spring(duration, delay, dampingRatio, velocity, options):
        UIView.animate(withDuration: duration,
                       delay: delay,
                       usingSpringWithDamping: dampingRatio,
                       initialSpringVelocity: velocity,
                       options: options,
                       animations: self.animations,
                       completion: self.completion)
      }
    }
    
    // MARK: - Private stuff
    // swiftlint:disable nesting
    private enum AnimationType {
      case regular(TimeInterval, TimeInterval, UIViewAnimationOptions)
      case spring(TimeInterval, TimeInterval, CGFloat, CGFloat, UIViewAnimationOptions)
    }
    
    private let animationType: AnimationType
    private var animations: Animations = {}
    private var completion: Completion?
    
    private init(animationType: AnimationType) {
      self.animationType = animationType
    }
  }
}
