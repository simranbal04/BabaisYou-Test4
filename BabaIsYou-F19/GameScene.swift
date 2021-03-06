//
//  GameScene.swift
//  BabaIsYou-F19
//  sim
//  Created by Parrot on 2019-10-17.
//  Copyright © 2019 Parrot. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene, SKPhysicsContactDelegate {
    
    var player:SKSpriteNode!
    
    var flagBlock:SKSpriteNode!
    var flag:SKSpriteNode!
    var wallBlock:SKSpriteNode!
    var isBlock:SKSpriteNode!
    var stopBlock:SKSpriteNode!
    var winBlock:SKSpriteNode!
    
    let PLAYER_SPEED:CGFloat = 20
    

    override func didMove(to view: SKView) {
        self.physicsWorld.contactDelegate = self
        
        
        self.flag = self.childNode(withName: "flag") as! SKSpriteNode

                self.flag.physicsBody = SKPhysicsBody(rectangleOf: flag.size)
                self.flag.physicsBody?.affectedByGravity = false
                self.flag.physicsBody?.categoryBitMask = 1
        //        self.flag.physicsBody?.collisionBitMask = 0
                self.flag.physicsBody?.contactTestBitMask = 4
        
        
        // initialize the player
        self.player = self.childNode(withName: "baba") as! SKSpriteNode
        
        
                self.player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
                self.player.physicsBody?.affectedByGravity = false
                self.player.physicsBody?.categoryBitMask = 4
        //        self.player.physicsBody?.collisionBitMask = 0
        //        self.player.physicsBody?.contactTestBitMask = 0
                
              // flagblock---------------
                self.flagBlock = self.childNode(withName: "flagblock") as! SKSpriteNode
//                self.flagBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
                self.flagBlock.physicsBody?.affectedByGravity = false
                self.flagBlock.physicsBody?.categoryBitMask = 256
        //        self.wallBlock.physicsBody?.collisionBitMask = 0
        //        self.wallBlock.physicsBody?.contactTestBitMask = 0

            // stopblock---------------
                self.stopBlock = self.childNode(withName: "stopblock") as! SKSpriteNode
                self.stopBlock.physicsBody = SKPhysicsBody(rectangleOf: stopBlock.size)
                self.stopBlock.physicsBody?.affectedByGravity = false
                self.stopBlock.physicsBody?.categoryBitMask = 8
        //        self.stopBlock.physicsBody?.collisionBitMask = 0
        //        self.stopBlock.physicsBody?.contactTestBitMask = 0
                
 
            // wallblock---------------
                 self.wallBlock = self.childNode(withName: "wallblock") as! SKSpriteNode
                 self.wallBlock.physicsBody = SKPhysicsBody(rectangleOf: wallBlock.size)
                 self.wallBlock.physicsBody?.affectedByGravity = false
                 self.wallBlock.physicsBody?.categoryBitMask = 16
                //        self.wallBlock.physicsBody?.collisionBitMask = 0
                //        self.wallBlock.physicsBody?.contactTestBitMask = 0
        
        
        
        
                 self.isBlock = self.childNode(withName: "isblock") as! SKSpriteNode
                 self.isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
                 self.isBlock.physicsBody?.affectedByGravity = false
                 self.isBlock.physicsBody?.categoryBitMask = 32
                 self.isBlock.physicsBody?.collisionBitMask = 0
                 self.isBlock.physicsBody?.contactTestBitMask = 0
//                 self.isBlock = self.childNode(withName: "iblock") as! SKSpriteNode

                self.isBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
                self.isBlock.physicsBody?.affectedByGravity = false
                self.isBlock.physicsBody?.categoryBitMask = 32
                self.isBlock.physicsBody?.collisionBitMask = 0
                self.isBlock.physicsBody?.contactTestBitMask = 0


                self.winBlock = self.childNode(withName: "winblock") as! SKSpriteNode

                self.winBlock.physicsBody = SKPhysicsBody(rectangleOf: isBlock.size)
                self.winBlock.physicsBody?.affectedByGravity = false
                self.winBlock.physicsBody?.categoryBitMask = 64
        //        self.winBlock.physicsBody?.collisionBitMask = 0
        //        self.winBlock.physicsBody?.contactTestBitMask = 0
                
                self.enumerateChildNodes(withName: "wall") {
                    (node, stop) in
                    let stick = node as! SKSpriteNode
                    stick.physicsBody = SKPhysicsBody(rectangleOf: stick.size)
                    stick.physicsBody?.affectedByGravity = false
                    stick.physicsBody?.categoryBitMask = 128
                    stick.physicsBody?.collisionBitMask = 0
                }

        
                
                        
    }
   
    
    
    func didBegin(_ contact: SKPhysicsContact) {
        let nodeA = contact.bodyA.node
        let nodeB = contact.bodyB.node
//        print("Something collided!")
        
                           
         if (nodeA == nil || nodeB == nil)
         {
                   return
         }

         if(nodeA!.name == "flag" && nodeB!.name == "baba")
         {
                print("You won")
         }
        
//        if(nodeA!.name == "baba" && nodeB!.name == "flag"){
//            print("win")
//        }
//        
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    

        override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
            // GET THE POSITION WHERE THE MOUSE WAS CLICKED
            // ---------------------------------------------
            let mouseTouch = touches.first
            if (mouseTouch == nil) {
                return
            }
            let location = mouseTouch!.location(in: self)

            // WHAT NODE DID THE PLAYER TOUCH
            // ----------------------------------------------
            let nodeTouched = atPoint(location).name
            print("Player touched: \(nodeTouched)")
            
            
            // GAME LOGIC: Move player based on touch
            if (nodeTouched == "upButton") {
                // move up
                self.player.position.y = self.player.position.y + PLAYER_SPEED
            }
            else if (nodeTouched == "downButton") {
                // move down
                 self.player.position.y = self.player.position.y - PLAYER_SPEED
            }
            else if (nodeTouched == "leftButton") {
                // move left
                 self.player.position.x = self.player.position.x - PLAYER_SPEED
            }
            else if (nodeTouched == "rightButton") {
                // move right
                 self.player.position.x = self.player.position.x + PLAYER_SPEED
            }
            
        }
        

    
    
    
}
