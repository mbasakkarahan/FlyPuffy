//
//  LaunchViewController.swift
//  Fly Puffy
//
//  Created by Derin on 23.01.2021.
//

import UIKit
import UserNotifications

class LaunchViewController: UIViewController {
    var notificationAllowControl:Bool?
    
    
    @IBOutlet weak var bubbless: UIImageView!
    @IBOutlet weak var blossom: UIImageView!
    @IBOutlet weak var buttercup: UIImageView!
    
    override func viewDidLoad() {
        notificationAllowControl = false
        super.viewDidLoad()
    
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
       self.bubbless.alpha = 0
        self.blossom.alpha = 0
        self.buttercup.alpha = 0
        launchPlay()
        self.navigationController?.setNavigationBarHidden(true, animated: true)

    }
    
    func launchPlay(){
        UIView.animate(withDuration: 5, animations: {
            self.bubbless.alpha = 1
            self.blossom.alpha = 1
            self.buttercup.alpha = 1
           
          
        },completion:{
            (true) in
            
            self.performSegue(withIdentifier: "launchToCharChooise", sender: nil)
           
        })
        
    }
  
    

}
