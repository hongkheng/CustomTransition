//
//  SecondViewController.swift
//  CustomTransition
//
//  Created by Yap Hong Kheng on 22/5/17.
//  Copyright © 2017 Singapore Power. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func nextButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "SecondView", bundle: nil)
        guard let vc = storyboard.instantiateViewController(withIdentifier: "InnerSecondViewController") as? InnerSecondViewController else {
            return
        }
        navigationController?.pushViewController(vc, animated: true)
    }

    @IBAction func dismissBtnTapped(_ sender: UIButton) {
        self.presentingViewController?.dismiss(animated: true, completion: nil)
    }
}
