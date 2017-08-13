//
//  TileType.swift
//  SwiftyTileMaps
//
//  Created by Jack Chorley on 12/08/2017.
//  Copyright © 2017 iZolo LTD. All rights reserved.
//

import UIKit
import SpriteKit

public class TileType {
    
    private let center: SKTexture
    
    private var topLeftEdge: SKTexture?
    private var topEdge: SKTexture?
    private var topRightEdge: SKTexture?
    
    private var rightEdge: SKTexture?
    
    private var bottomRightEdge: SKTexture?
    private var bottomEdge: SKTexture?
    private var bottomLeftEdge: SKTexture?
    
    private var leftEdge: SKTexture?
    
    
    private var topLeftCorner: SKTexture?
    private var topRightCorner: SKTexture?
    private var bottomRightCorner: SKTexture?
    private var bottomLeftCorner: SKTexture?
    
    
    init(image: UIImage) {
        self.center = SKTexture(image: image)
    }
    
    init(texture: SKTexture) {
        self.center = texture
    }
    
    init(center: SKTexture, topLeftEdge: SKTexture?, topEdge: SKTexture?, topRightEdge: SKTexture?, rightEdge: SKTexture?, bottomRightEdge: SKTexture?, bottomEdge: SKTexture?, bottomLeftEdge: SKTexture?, leftEdge: SKTexture?, topLeftCorner: SKTexture?, topRightCorner: SKTexture?, bottomRightCorner: SKTexture?, bottomLeftCorner: SKTexture?) {
        
        self.center = center
        self.topLeftEdge = topLeftEdge
        self.topEdge = topEdge
        self.topRightEdge = topRightEdge
        self.rightEdge = rightEdge
        self.bottomRightEdge = bottomRightEdge
        self.bottomEdge = bottomEdge
        self.bottomLeftEdge = bottomLeftEdge
        self.leftEdge = leftEdge
        
        self.topLeftCorner = topLeftCorner
        self.topRightCorner = topRightCorner
        self.bottomRightCorner = bottomRightCorner
        self.bottomLeftCorner = bottomLeftCorner

    }
    
    init(center: UIImage, topLeftEdge: UIImage?, topEdge: UIImage?, topRightEdge: UIImage?, rightEdge: UIImage?, bottomRightEdge: UIImage?, bottomEdge: UIImage?, bottomLeftEdge: UIImage?, leftEdge: UIImage?, topLeftCorner: UIImage?, topRightCorner: UIImage?, bottomRightCorner: UIImage?, bottomLeftCorner: UIImage?) {
        
        self.center = SKTexture(image: center)
        
        if let texture = topLeftEdge {
            self.topLeftEdge = SKTexture(image: texture)
        }
        
        if let texture = topEdge {
            self.topEdge = SKTexture(image: texture)
        }
        
        if let texture = topRightEdge {
            self.topRightEdge = SKTexture(image: texture)
        }
        
        if let texture = rightEdge {
            self.rightEdge = SKTexture(image: texture)
        }
        
        if let texture = bottomRightEdge {
            self.bottomRightEdge = SKTexture(image: texture)
        }
        
        if let texture = bottomEdge {
            self.bottomEdge = SKTexture(image: texture)
        }
        
        if let texture = bottomLeftEdge {
            self.bottomLeftEdge = SKTexture(image: texture)
        }
        
        if let texture = leftEdge {
            self.leftEdge = SKTexture(image: texture)
        }
        
        if let texture = topLeftCorner {
            self.topLeftCorner = SKTexture(image: texture)
        }
        
        if let texture = topRightCorner {
            self.topRightCorner = SKTexture(image: texture)
        }
        
        if let texture = bottomRightCorner {
            self.bottomRightCorner = SKTexture(image: texture)
        }
        
        if let texture = bottomLeftCorner {
            self.bottomLeftCorner = SKTexture(image: texture)
        }
        
    }
    
    func centerTexture() -> SKTexture {
        return center
    }
    
    func topLeftEgdeTexture() -> SKTexture? {
        return topLeftEdge
    }
    
    func topEdgeTexture() -> SKTexture? {
        return topEdge
    }
    
    func topRightEdgeTexture() -> SKTexture? {
        return topRightEdge
    }
    
    func rightEdgeTexture() -> SKTexture? {
        return rightEdge
    }
    
    func bottomRightEdgeTexture() -> SKTexture? {
        return bottomRightEdge
    }
    
    func bottomEdgeTexture() -> SKTexture? {
        return bottomEdge
    }
    
    func bottomLeftEdgeTexture() -> SKTexture? {
        return bottomLeftEdge
    }
    
    func leftEdgeTexture() -> SKTexture? {
        return leftEdge
    }
    
    func topLeftCornerTexture() -> SKTexture? {
        return topLeftCorner
    }
    
    func topRightCornerTexture() -> SKTexture? {
        return topRightCorner
    }
    
    func bottomRightCornerTexture() -> SKTexture? {
        return bottomRightCorner
    }
    
    func bottomLeftCornerTexture() -> SKTexture? {
        return bottomLeftCorner
    }
    
    func allTextures() -> [SKTexture?] {
        return [center, topLeftEdge, topEdge, topRightEdge, rightEdge, bottomRightEdge, bottomEdge, bottomLeftEdge, leftEdge, topLeftCorner, topRightCorner, bottomLeftCorner, bottomRightCorner]
    }
    
    static func ==(lhs: TileType, rhs: TileType) -> Bool {
        
        var match = true
        
        let lhsTextures = lhs.allTextures()
        
        for (i, texture) in rhs.allTextures().enumerated() {
            if texture != lhsTextures[i] {
                match = false
            }
        }
        
        return match
    }
    
    static func !=(lhs: TileType, rhs: TileType) -> Bool {
        
        return !(lhs == rhs)
    }
}





