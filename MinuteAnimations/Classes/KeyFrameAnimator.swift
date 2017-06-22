//
//  KeyFrameAnimator.swift
//  Pods
//
//  Created by Luca Gobbo on 22-06-17.
//
//

import Foundation
import UIKit

public extension UIView {
  
  public class KeyFrameAnimator {
    
    public typealias Completion = (Bool) -> Void
    public typealias SimpleCompletion = () -> Void
    
    //swiftlint:disable:next nesting
    private struct KeyFrameAnimation {
      
      let relativeStartTime: TimeInterval
      let relativeDuration: TimeInterval
      let animation: () -> Void
      
      init(relativeStartTime: TimeInterval, relativeDuration: TimeInterval, animation: @escaping () -> Void) {
        self.relativeStartTime = relativeStartTime
        self.relativeDuration = relativeDuration
        self.animation = animation
      }
    }
    
    private let duration: TimeInterval
    private let delay: TimeInterval
    private let options: UIViewKeyframeAnimationOptions
    private let animations: [KeyFrameAnimation]
    private let completion: Completion?
    
    public convenience init(duration: TimeInterval,
                            delay: TimeInterval = 0,
                            options: UIViewKeyframeAnimationOptions = []) {
      
      // we need to explicitly call the correct initializer otherwise it will recursivly call the same initializer
      self.init(duration: duration, delay: delay, options: options, animations: [], completion: nil)
    }
    
    private init(duration: TimeInterval,
                 delay: TimeInterval = 0,
                 options: UIViewKeyframeAnimationOptions = [],
                 animations: [KeyFrameAnimation] = [],
                 completion: Completion? = nil) {
      self.duration = duration
      self.delay = delay
      self.options = options
      self.animations = animations
      self.completion = completion
    }
    
    public func addAnimation(relativeStartTime: TimeInterval,
                             relativeDuration: TimeInterval,
                             animation: @escaping () -> Void) -> KeyFrameAnimator {
      
      let animation = KeyFrameAnimation(relativeStartTime: relativeStartTime,
                                        relativeDuration: relativeDuration,
                                        animation: animation)
      
      return addAnimation(animation: animation)
    }
    
    
    public func completion(_ completion: SimpleCompletion?) -> KeyFrameAnimator {
      return KeyFrameAnimator(duration: duration,
                              delay: delay,
                              options: options,
                              animations: animations,
                              completion: { _ in completion?() })
      
    }
    
    public func completion(_ completion: Completion?) -> KeyFrameAnimator {
      return KeyFrameAnimator(duration: duration,
                              delay: delay,
                              options: options,
                              animations: animations,
                              completion: completion)
      
    }
    
    public func animate() {
      
      UIView.animateKeyframes(withDuration: duration, delay: delay, options: options, animations: {
        self.animations.forEach { animation in
          UIView.addKeyframe(withRelativeStartTime: animation.relativeStartTime,
                             relativeDuration: animation.relativeDuration,
                             animations: animation.animation)
        }
      }, completion: completion)
    }
    
    private func addAnimation(animation: KeyFrameAnimation) -> KeyFrameAnimator {
      return KeyFrameAnimator(duration: duration,
                              delay: delay,
                              options: options,
                              animations: animations + [animation],
                              completion: completion)
    }
    
  }
  
}
