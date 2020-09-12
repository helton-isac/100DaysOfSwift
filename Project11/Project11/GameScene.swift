//
//  GameScene.swift
//  Project11
//
//  Created by Helton Isac Torres Galindo on 12/09/20.
//  Copyright © 2020 Helton Isac Torres Galindo. All rights reserved.
//

import SpriteKit

class GameScene: SKScene {
    
    override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "background")
        background.position = CGPoint(x: 512, y: 384)
        addChild(background)
        
    }
}
