//
//  ViewController.swift
//  TestPassData
//
//  Created by Hoàng Đức on 02/12/2022.
//

import UIKit

class ViewController: UIViewController, SendTextDelegate  {

    @IBOutlet weak var detailText: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func goToVC2(_ sender: Any) {
        
        let vc = SecondViewController()
        vc.delegate = self
        vc.modalPresentationStyle = .overFullScreen
        
        vc.handelBack = {text in
            self.detailText.text = text
        }
        
        present(vc, animated: true)
    }
    
    func sendText(text: String) {
        self.detailText.text = text
    }
}

