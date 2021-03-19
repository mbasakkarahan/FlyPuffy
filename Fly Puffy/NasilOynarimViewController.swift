//
//  NasilOynarimViewController.swift
//  Fly Puffy
//
//  Created by Derin on 25.01.2021.
//

import UIKit

class NasilOynarimViewController: UIViewController {

    @IBOutlet weak var nasilOynarimLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        nasilOynarimLabel.layer.cornerRadius = nasilOynarimLabel.frame.height / 9
        nasilOynarimLabel.clipsToBounds = true
 
    }
    

    @IBAction func hazirimAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
