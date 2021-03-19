  //
//  GameViewController.swift
//  Fly Puffy
//
//  Created by Derin on 17.01.2021.
//

import UIKit
import SpriteKit
import GameplayKit

class GameViewController: UIViewController {
    var anaKarakter:String!
    var ppg:SKSpriteNode = SKSpriteNode()
    override func viewDidLoad() {
        print(anaKarakter!)
        super.viewDidLoad()
        
        if let view = self.view as! SKView? {
            if let scene = GameScene(fileNamed: "GameScene") {
                scene.scaleMode = .aspectFill
                scene.viewController = self
                view.presentScene(scene)
                scene.anaKarakterSonuc = anaKarakter
                if let tempKarakter = ppg as? SKSpriteNode {
                    
                    if anaKarakter == "Bubble"{
                        scene.ppg.texture = SKTexture(imageNamed: "bubblesGame")
                        scene.backgroundColor = UIColor(named: "bubblesColor")!
                        scene.ppg.size = CGSize(width: 150, height: 150)
                    }
                    if anaKarakter == "Blossom"{
                        scene.ppg.texture = SKTexture(imageNamed: "blossomGame")
                        scene.backgroundColor = UIColor(named: "blossomColor")!

                    }
                    if anaKarakter == "Buttercup"{
                        scene.ppg.texture = SKTexture(imageNamed: "buttercupGame")
                        scene.backgroundColor = UIColor(named: "buttercupColor")!
                        scene.ppg.size = CGSize(width: 200, height: 200)
                    }
                }
            }
            
            view.ignoresSiblingOrder = true
            
        }
    }
        override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
}
