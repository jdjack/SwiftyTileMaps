//
//  TileType.swift
//  SwiftyTileMaps
//
//  Created by Jack Chorley on 12/08/2017.
//  Copyright © 2017 iZolo LTD. All rights reserved.
//

import UIKit
import SpriteKit

public class TileType: Hashable {
    public var hashValue: Int
    
    private let name: String
    
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
    
    var blendedTypes: Set = Set<TileType>()
    
    
    init(name: String, image: UIImage) {
        
        self.name = name
        hashValue = name.hashValue
        
        self.center = SKTexture(image: image)
        self.blendedTypes = [self]
        
    }
    
    init(name: String, texture: SKTexture) {
        self.name = name
        hashValue = name.hashValue
        
        self.center = texture
        self.blendedTypes = [self]
    }
    
    init(name: String, center: SKTexture, topLeftEdge: SKTexture?, topEdge: SKTexture?, topRightEdge: SKTexture?, rightEdge: SKTexture?, bottomRightEdge: SKTexture?, bottomEdge: SKTexture?, bottomLeftEdge: SKTexture?, leftEdge: SKTexture?, topLeftCorner: SKTexture?, topRightCorner: SKTexture?, bottomRightCorner: SKTexture?, bottomLeftCorner: SKTexture?) {
        
        self.name = name
        hashValue = name.hashValue
        
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
        self.blendedTypes = [self]

    }
    
    init(name: String, center: UIImage, topLeftEdge: UIImage?, topEdge: UIImage?, topRightEdge: UIImage?, rightEdge: UIImage?, bottomRightEdge: UIImage?, bottomEdge: UIImage?, bottomLeftEdge: UIImage?, leftEdge: UIImage?, topLeftCorner: UIImage?, topRightCorner: UIImage?, bottomRightCorner: UIImage?, bottomLeftCorner: UIImage?) {
        
        self.name = name
        hashValue = name.hashValue
        
        
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
        
        self.blendedTypes = [self]
        
    }
    
    func addBlendedType(type: TileType) {
        self.blendedTypes.insert(type)
        type.blendedTypes.insert(self)
    }
    
    func isBlendableWith(type: TileType) -> Bool {
        return self.blendedTypes.contains(type)
    }
    
    func removeBlendedType(type: TileType) {
        self.blendedTypes.remove(type)
        type.blendedTypes.remove(self)
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
    
    public static func ==(lhs: TileType, rhs: TileType) -> Bool {
        
        return lhs.hashValue == rhs.hashValue
    }
    
    public static func !=(lhs: TileType, rhs: TileType) -> Bool {
        
        return !(lhs == rhs)
    }
}





