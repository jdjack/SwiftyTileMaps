//
//  GameScene.swift
//  SwiftyTileMaps
//
//  Created by Jack Chorley on 12/08/2017.
//  Copyright © 2017 iZolo LTD. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    private var lastUpdateTime : TimeInterval = 0
    
    override func sceneDidLoad() {
        
        self.lastUpdateTime = 0
        
        print(self.frame.size)
        
        let tileMap = TileMap()
        tileMap.position = CGPoint(x: -self.frame.size.width / 2, y: -self.frame.size.height / 2)
        self.addChild(tileMap)
        
        
        
        let type = TileType(name: "Dungeon", center: #imageLiteral(resourceName: "CENTER"), topLeftEdge: #imageLiteral(resourceName: "TLE"), topEdge: #imageLiteral(resourceName: "TE"), topRightEdge: #imageLiteral(resourceName: "TRE"), rightEdge: #imageLiteral(resourceName: "RE"), bottomRightEdge: #imageLiteral(resourceName: "BRE"), bottomEdge: #imageLiteral(resourceName: "BE"), bottomLeftEdge: #imageLiteral(resourceName: "BLE"), leftEdge: #imageLiteral(resourceName: "LE"), topLeftCorner: #imageLiteral(resourceName: "TLC"), topRightCorner: #imageLiteral(resourceName: "TRC"), bottomRightCorner: #imageLiteral(resourceName: "BRC"), bottomLeftCorner: #imageLiteral(resourceName: "BLC"))
        
        let layer = TileMapLayer(tileTypes: [nil, type, type, type, type, type,
                                             type, type, type, type, type, type,
                                             type, type, type, type, type, type,
                                             type, type, type, type, type, nil,
                                             type, type, type, type, type, nil,
                                             type, type, type, type, type, type,
                                             type, type, type, type, type, type,
                                             nil, type, type, type, type, type], horizontalTiles: 6, verticalTiles: 8, tileSize: CGSize(width: 64, height: 64))
        
        layer.addLayerToMap(map: tileMap)
        
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0) {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let _ = currentTime - self.lastUpdateTime
        
        
        self.lastUpdateTime = currentTime
    }
}
