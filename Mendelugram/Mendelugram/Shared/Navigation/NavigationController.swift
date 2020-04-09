//
//  NavigationController.swift
//  Mendelugram
//
//  Created by Pacek on 20/04/2019.
//

import UIKit

class NavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        setup()
    }

}

private extension NavigationController {

    func setup() {
        navigationBar.tintColor = UIColor.primary
        navigationBar.isTranslucent = false
    }

}
