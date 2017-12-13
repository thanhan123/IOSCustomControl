//
//  ViewController.swift
//  CustomControl
//
//  Created by Dinh Thanh An on 12/13/17.
//  Copyright © 2017 An. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var button2: UIButton!
    @IBOutlet weak var button: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testButtonAction()
    }
    
    func testButtonAction()  {
        button.addAction([.touchUpInside], { button in
            print("----> touchUpInside Action from \(String(describing: button.titleLabel?.text))")
        })
        
        button2.addAction([.touchUpInside]) { button in
            print("----> Action2 from \(String(describing: button.titleLabel?.text))")
        }
    }

}

