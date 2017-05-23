//
//  PresentFromRightAnimation.swift
//  CustomTransition
//
//  Created by Yap Hong Kheng on 22/5/17.
//  Copyright © 2017 Singapore Power. All rights reserved.
//

import Foundation
import UIKit

class PresentFromRightAnimation: NSObject, UIViewControllerAnimatedTransitioning {

    var isPresenting = true

    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }

    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        guard let toViewController = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to) else {
            return
        }

        let containerView = transitionContext.containerView

        let animationDuration = transitionDuration(using: transitionContext)
        if isPresenting {
            toViewController.view.transform = CGAffineTransform(translationX: containerView.bounds.width, y: 0)
        } else {
            toViewController.view.transform = CGAffineTransform(translationX: -containerView.bounds.width, y: 0)
        }

        containerView.addSubview(toViewController.view)                                                                                                                                                                                                                                                                                                                                                                                                                           

        UIView.animate(withDuration: animationDuration, animations: {

            toViewController.view.transform = CGAffineTransform.identity
            }, completion: { finished in

            transitionContext.completeTransition(finished)
        })

    }
}
