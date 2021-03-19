//
//  KarakterSecimViewController.swift
//  Fly Puffy
//
//  Created by Derin on 23.01.2021.
//

import UIKit

class KarakterSecimViewController: UIViewController {

    @IBOutlet weak var bubblessColor: UILabel!
    @IBOutlet weak var buttercupColor: UILabel!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        

        if segue.identifier == "bubbleToGame"{
            let gidilecekVC = segue.destination as! GameViewController
            gidilecekVC.anaKarakter = "Bubble"
            
        }
        if segue.identifier == "blossomToGame"{
            let gidilecekVC = segue.destination as! GameViewController
            gidilecekVC.anaKarakter = "Blossom"
        }
        if segue.identifier == "buttercupToGame"{
            let gidilecekVC = segue.destination as! GameViewController
            gidilecekVC.anaKarakter = "Buttercup"
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        bubblessColor.layer.cornerRadius = bubblessColor.frame.height / 9 //3 idi
        bubblessColor.clipsToBounds = true
        buttercupColor.layer.cornerRadius = buttercupColor.frame.height / 9
        buttercupColor.clipsToBounds = true
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    

}
