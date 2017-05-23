//
//  ViewController.swift
//  CustomTransition
//
//  Created by Yap Hong Kheng on 22/5/17.
//  Copyright © 2017 Singapore Power. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var showButton: UIButton!

    let transition = PresentFromRightAnimation()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func pushFromRightAnimator() {
        let transition = CATransition()
        transition.duration = 0.3
        transition.type = kCATransitionPush
        transition.subtype = kCATransitionFromRight
        view.window?.layer.add(transition, forKey: kCATransition)
    }

    @IBAction func showButtonTapped(_ sender: UIButton) {

        let storyboard = UIStoryboard(name: "SecondView", bundle: nil)
        guard let rootVC = storyboard.instantiateViewController(withIdentifier: "SecondViewController") as? SecondViewController else {
            return
        }
        let naviVC = UINavigationController(rootViewController: rootVC)
        naviVC.transitioningDelegate = self
        self.present(naviVC, animated: true, completion: nil)
    }
}

extension ViewController: UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = true
        return transition
    }

    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.isPresenting = false
        return transition
    }
}

