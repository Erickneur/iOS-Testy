//
//  ContainerController.swift
//  sidemenu
//
//  Created by Erick Dávila on 1/17/20.
//  Copyright © 2020 Erick Dávila. All rights reserved.
//

import UIKit

class ContainerController: UIViewController {

    // MARK: - Properties
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureHomeController()
    }
    
    // MARK: - Handlers
    
    func configureHomeController() {
        let homeController = HomeController()
        let controller = UINavigationController(rootViewController: homeController)
        view.addSubview(controller.view)
        addChild(controller)
        controller.didMove(toParent: self)
    }
    
    func configureMenuController() {
        
    }
    
    // MARK: - Navigation

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
