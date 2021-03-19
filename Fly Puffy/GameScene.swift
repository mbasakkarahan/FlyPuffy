//
//  GameScene.swift
//  Fly Puffy
//
//  Created by Derin on 17.01.2021.
//

import SpriteKit
import GameplayKit

enum CarpismaTur:UInt32{
    case ppg = 1
    case mojojojo = 2
    case him = 3
    case professor = 4
    case mayor = 5
    
}
class GameScene: SKScene,SKPhysicsContactDelegate {
   
    var canSayisi:Int = 3
    var anaKarakterSonuc:String!
    let anakarakterClass = GameViewController()
    var ppg:SKSpriteNode = SKSpriteNode()
    var mojojojo:SKSpriteNode = SKSpriteNode()
    var him:SKSpriteNode = SKSpriteNode()
    var professor:SKSpriteNode = SKSpriteNode()
    var mayor:SKSpriteNode = SKSpriteNode()
    var can1:SKSpriteNode = SKSpriteNode()
    var can2:SKSpriteNode = SKSpriteNode()
    var can3:SKSpriteNode = SKSpriteNode()
    let preferredLanguage = NSLocale.preferredLanguages[0]
    var skorLabel:SKLabelNode = SKLabelNode()
    
    var viewController:UIViewController?
    
    var ekranaDokunuluyorMu = false
    var oyunaBaslandiMi = false
    var timer:Timer?
    
    var ekranGenisligi:Int?
    var ekranYuksekligi:Int?
    var toplamSkor = 0
    
    override func didMove(to view: SKView) {
        
        print(preferredLanguage)
      
        self.physicsWorld.contactDelegate = self
        
        ekranGenisligi = Int(self.size.width)
        ekranYuksekligi = Int(self.size.height)
        if let tempKarakter = self.childNode(withName: "ppg") as? SKSpriteNode {
            
            ppg = tempKarakter
            
            ppg.physicsBody?.categoryBitMask = CarpismaTur.ppg.rawValue
            ppg.physicsBody?.collisionBitMask = CarpismaTur.mojojojo.rawValue | CarpismaTur.him.rawValue | CarpismaTur.professor.rawValue | CarpismaTur.mayor.rawValue
            ppg.physicsBody?.contactTestBitMask = CarpismaTur.mojojojo.rawValue | CarpismaTur.him.rawValue | CarpismaTur.professor.rawValue | CarpismaTur.mayor.rawValue
            
        }
        
        if let tempKarakter = self.childNode(withName: "mojojojo") as? SKSpriteNode {
            
            mojojojo = tempKarakter
            
            mojojojo.physicsBody?.categoryBitMask = CarpismaTur.mojojojo.rawValue
            mojojojo.physicsBody?.collisionBitMask = CarpismaTur.ppg.rawValue
            mojojojo.physicsBody?.contactTestBitMask = CarpismaTur.ppg.rawValue
            
        }
        
        if let tempKarakter = self.childNode(withName: "him") as? SKSpriteNode {
            
            him = tempKarakter
            
            him.physicsBody?.categoryBitMask = CarpismaTur.him.rawValue
            him.physicsBody?.collisionBitMask = CarpismaTur.ppg.rawValue
            him.physicsBody?.contactTestBitMask = CarpismaTur.ppg.rawValue
            
        }
        
        if let tempKarakter = self.childNode(withName: "professor") as? SKSpriteNode {
            
            professor = tempKarakter
            
            professor.physicsBody?.categoryBitMask = CarpismaTur.professor.rawValue
            professor.physicsBody?.collisionBitMask = CarpismaTur.ppg.rawValue
            professor.physicsBody?.contactTestBitMask = CarpismaTur.ppg.rawValue
            
        }
      
        if let tempKarakter = self.childNode(withName: "mayor") as? SKSpriteNode {
            
            mayor = tempKarakter
            
            mayor.physicsBody?.categoryBitMask = CarpismaTur.mayor.rawValue
            mayor.physicsBody?.collisionBitMask = CarpismaTur.ppg.rawValue
            mayor.physicsBody?.contactTestBitMask = CarpismaTur.ppg.rawValue
            
        }

        if let tempKarakter = self.childNode(withName: "can1") as? SKSpriteNode {
              
              can1 = tempKarakter
              can1.alpha = 1
              
        }
        
        if let tempKarakter = self.childNode(withName: "can2") as? SKSpriteNode {
            
            can2 = tempKarakter
            can2.alpha = 1
            
        }
        if let tempKarakter = self.childNode(withName: "can3") as? SKSpriteNode {
            
            can3 = tempKarakter
            can3.alpha = 1
            
        }
        
        if let tempChar = self.childNode(withName: "skorLabel") as? SKLabelNode{
            skorLabel = tempChar
            
            
            if preferredLanguage.contains("en") {
                
                skorLabel.text = "Score : 0"
            } else{
                skorLabel.text = "Skor : 0"

            }
        }
        timer = Timer.scheduledTimer(timeInterval: 0.02, target: self, selector:#selector(GameScene.hareket) , userInfo: nil, repeats: true)
    }
 
    
    @objc func hareket(){
        
        if oyunaBaslandiMi{
            let ppgHiz = CGFloat(ekranGenisligi!/100)
            let mojojojoHiz = CGFloat(ekranGenisligi!/120)
            let himHiz = CGFloat(ekranGenisligi!/110)
            let proffesorHiz = CGFloat(ekranGenisligi!/100)
            let mayorHiz = CGFloat(ekranGenisligi!/85)
           
            if ekranaDokunuluyorMu {
                let yukariHareket:SKAction = SKAction.moveBy(x: 0, y: +ppgHiz, duration: 1)
                ppg.run(yukariHareket)
            }else{
                let asagiHareket:SKAction = SKAction.moveBy(x: 0, y: -ppgHiz, duration: 1)
                ppg.run(asagiHareket)
            }
            nesneHareket(cisimAdi: mojojojo, cisimHizi: -mojojojoHiz)
            nesneHareket(cisimAdi: him, cisimHizi: -himHiz)
            nesneHareket(cisimAdi: professor, cisimHizi: -proffesorHiz)
            nesneHareket(cisimAdi: mayor, cisimHizi: -mayorHiz)
            
        }
        
    }
    
    @objc func nesneHareket(cisimAdi:SKSpriteNode,cisimHizi:CGFloat){
        if Int(cisimAdi.position.x) < 0 {
            cisimAdi.position.x = CGFloat(ekranGenisligi! + 20)
            cisimAdi.position.y = CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!)))
        }else{
            let solaHareket:SKAction = SKAction.moveBy(x: cisimHizi, y: 0, duration: 6)
            cisimAdi.run(solaHareket)
            
        }
        
    }
    
    func touchDown(atPoint pos : CGPoint) {
      
        ekranaDokunuluyorMu = true
        oyunaBaslandiMi = true
    }
    
    func touchUp(atPoint pos : CGPoint) {
      ekranaDokunuluyorMu = false
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func didBegin(_ contact: SKPhysicsContact) {
        
        if contact.bodyA.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyB.categoryBitMask == CarpismaTur.mojojojo.rawValue {
            canSayisi -= 1
          
            
            let d = UserDefaults.standard
            
            d.set(toplamSkor, forKey: "anlikSkor")
            
            if canSayisi < 0 {
                timer?.invalidate()
                print(canSayisi)
                self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
            }else{
                print(canSayisi)
                let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
                mojojojo.run(basaAl)
                if can1.alpha == 1 {
                    can1.alpha = 0
                }else if can2.alpha == 1 {
                    can2.alpha = 0
                }else if can3.alpha == 1{
                    can3.alpha = 0
                    timer?.invalidate()
                    print(canSayisi)
                    self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
                    
                }else{
                    print("ERROR")
                }
                
                
            }
        }
        if contact.bodyB.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyA.categoryBitMask == CarpismaTur.mojojojo.rawValue {
            canSayisi -= 1
          
            
            let d = UserDefaults.standard
            
            d.set(toplamSkor, forKey: "anlikSkor")
            
            if canSayisi < 0 {
                timer?.invalidate()
                print(canSayisi)
                self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
            }else{
                print(canSayisi)
                let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
                mojojojo.run(basaAl)
                if can1.alpha == 1 {
                    can1.alpha = 0
                }else if can2.alpha == 1 {
                    can2.alpha = 0
                }else if can3.alpha == 1{
                    can3.alpha = 0
                    timer?.invalidate()
                    print(canSayisi)
                    self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
                    
                }else{
                    print("ERROR")
                }
            }
            
        }
        
        if contact.bodyA.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyB.categoryBitMask == CarpismaTur.him.rawValue {
            
            canSayisi -= 1
          
            
            let d = UserDefaults.standard
            
            d.set(toplamSkor, forKey: "anlikSkor")
            
            if canSayisi < 0 {
                timer?.invalidate()
                print(canSayisi)
                self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
            }else{
                print(canSayisi)
                let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
                him.run(basaAl)
                if can1.alpha == 1 {
                    can1.alpha = 0
                }else if can2.alpha == 1 {
                    can2.alpha = 0
                }else if can3.alpha == 1{
                    can3.alpha = 0
                    timer?.invalidate()
                    print(canSayisi)
                    self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
                    
                }else{
                    print("ERROR")
                }
                
            }
        }
        
        if contact.bodyB.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyA.categoryBitMask == CarpismaTur.him.rawValue {
            
            canSayisi -= 1
            
            
            let d = UserDefaults.standard
            
            d.set(toplamSkor, forKey: "anlikSkor")
            
            if canSayisi < 0 {
                timer?.invalidate()
                print(canSayisi)
                self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
            }else{
                print(canSayisi)
                let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
                him.run(basaAl)
                if can1.alpha == 1 {
                    can1.alpha = 0
                }else if can2.alpha == 1 {
                    can2.alpha = 0
                }else if can3.alpha == 1{
                    can3.alpha = 0
                    timer?.invalidate()
                    print(canSayisi)
                    self.viewController?.performSegue(withIdentifier: "oyunToSonuc", sender: nil)
                    
                }else{
                    print("ERROR")
                }
            }
        }
        
        
        if contact.bodyA.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyB.categoryBitMask == CarpismaTur.professor.rawValue {
            
            let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
            professor.run(basaAl)
            
            toplamSkor = toplamSkor + 20
            
            
            if preferredLanguage.contains("en") {
                
                skorLabel.text = "Score : \(toplamSkor)"
            } else{
                skorLabel.text = "Skor : \(toplamSkor)"

            }
        }
        
        if contact.bodyB.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyA.categoryBitMask == CarpismaTur.professor.rawValue {
            
            let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
            professor.run(basaAl)
            
            toplamSkor = toplamSkor + 20
            
            if preferredLanguage.contains("en") {
                
                skorLabel.text = "Score : \(toplamSkor)"
            } else{
                skorLabel.text = "Skor : \(toplamSkor)"

            }
        }
        
        if contact.bodyA.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyB.categoryBitMask == CarpismaTur.mayor.rawValue {
            
            let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
            mayor.run(basaAl)
            
            toplamSkor = toplamSkor + 50
            
            if preferredLanguage.contains("en"){
                
                skorLabel.text = "Score : \(toplamSkor)"
            } else{
                skorLabel.text = "Skor : \(toplamSkor)"

            }
        }
        
        if contact.bodyB.categoryBitMask == CarpismaTur.ppg.rawValue && contact.bodyA.categoryBitMask == CarpismaTur.mayor.rawValue {
            
            let basaAl:SKAction = SKAction.moveBy(x: CGFloat(ekranGenisligi!+20), y: -CGFloat(arc4random_uniform(UInt32(ekranYuksekligi!))), duration: 0.02)
            mayor.run(basaAl)
            
            toplamSkor = toplamSkor + 50
            
            if preferredLanguage.contains("en") {
                
                skorLabel.text = "Score : \(toplamSkor)"
            } else{
                skorLabel.text = "Skor : \(toplamSkor)"

            }
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
     
        
        for t in touches { self.touchDown(atPoint: t.location(in: self)) }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchMoved(toPoint: t.location(in: self)) }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}
