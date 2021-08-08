//
//  secondViewController.swift
//  app2021
//
//  Created by futoshi on 2021/06/02.
//

import UIKit

class secondViewController: UIViewController {
    
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var backButton: UIButton!
    
    //viewControllerから受け取る変数
    var receiveData : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //labelへ格納
        label.text = receiveData
        
        label.layer.borderWidth = 2
        label.layer.borderColor = UIColor.black.cgColor
        topLabel.layer.borderWidth = 2
        topLabel.layer.borderColor = UIColor.black.cgColor
        backButton.layer.borderWidth = 2
        backButton.layer.borderColor = UIColor.black.cgColor
        
    }
    
    @IBAction func addBtnBack(_ sender: Any) {
        presentingViewController?.dismiss(animated: true)
    }
    
    
    

}
