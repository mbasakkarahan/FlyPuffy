//
//  SonucViewController.swift
//  Fly Puffy
//
//  Created by Derin on 21.01.2021.
//

import UIKit

class SonucViewController: UIViewController {

    
    @IBOutlet weak var anlikSkorSonucLabel: UILabel!
    @IBOutlet weak var yuksekSkorSonucLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        let userDefaults = UserDefaults.standard
        let anlikSkor = userDefaults.integer(forKey: "anlikSkor")
        let yuksekSkor = userDefaults.integer(forKey: "yuksekSkor")

        anlikSkorSonucLabel.text = "\(anlikSkor)"
        
        if anlikSkor > yuksekSkor {
            userDefaults.setValue(anlikSkor, forKey: "yuksekSkor")
            yuksekSkorSonucLabel.text = "\(anlikSkor)"
        }else{
            yuksekSkorSonucLabel.text = "\(yuksekSkor)"
        }
    }
    

   
    @IBAction func tekrarOyna(_ sender: Any) {
      
          
        
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }

}
