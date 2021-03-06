//
//  Tile.swift
//  SwiftyTileMaps
//
//  Created by Jack Chorley on 12/08/2017.
//  Copyright © 2017 iZolo LTD. All rights reserved.
//

import UIKit
import SpriteKit

class Tile {
    
    var type: TileType
    var currentTexture: SKTexture
    
    init(type: TileType) {
        
        self.type =  type
        currentTexture = type.centerTexture()
        
    }
    
    func updateTexture(leftType: TileType?, upType: TileType?, rightType: TileType?, downType: TileType?, upLeftType: TileType?, upRightType: TileType?, downRightType: TileType?, downLeftType: TileType?) {
        
        
        // Center
        if leftType == nil && upType == nil && rightType == nil && downType == nil {
            return
        }
        
        
        // TRE
        if (rightType == nil || !rightType!.isBlendableWith(type: type)) && (upType == nil || !upType!.isBlendableWith(type: type)) {
            if let texture = type.topRightEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // TLE
        if (leftType == nil || !leftType!.isBlendableWith(type: type)) && (upType == nil || !upType!.isBlendableWith(type: type)) {
            if let texture = type.topLeftEgdeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // BLE
        if (leftType == nil || !leftType!.isBlendableWith(type: type)) && (downType == nil || !downType!.isBlendableWith(type: type)) {
            if let texture = type.bottomLeftEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // BRE
        if (rightType == nil || !rightType!.isBlendableWith(type: type)) && (downType == nil || !downType!.isBlendableWith(type: type)) {
            if let texture = type.bottomRightEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // TE
        if (leftType != nil && leftType!.isBlendableWith(type: type)) && (rightType != nil && rightType!.isBlendableWith(type: type)) && (upType == nil || !upType!.isBlendableWith(type: type)) {
            if let texture = type.topEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // RE
        if (upType != nil && upType!.isBlendableWith(type: type)) && (downType != nil && downType!.isBlendableWith(type: type)) && (rightType == nil || !rightType!.isBlendableWith(type: type)) {
            if let texture = type.rightEdgeTexture() {
                currentTexture = texture
            }
            return
        }

        
        // BE
        if (leftType != nil && leftType!.isBlendableWith(type: type)) && (rightType != nil && rightType!.isBlendableWith(type: type)) && (downType == nil || !downType!.isBlendableWith(type: type)) {
            if let texture = type.bottomEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // LE
        if (upType != nil && upType!.isBlendableWith(type: type)) && (downType != nil && downType!.isBlendableWith(type: type)) && (leftType == nil || !leftType!.isBlendableWith(type: type)) {
            if let texture = type.leftEdgeTexture() {
                currentTexture = texture
            }
            return
        }
        
        // BRC
        if (leftType != nil && leftType!.isBlendableWith(type: type)) && (upType != nil && upType!.isBlendableWith(type: type)) && (upLeftType == nil || !upLeftType!.isBlendableWith(type: type)) {
            if let texture = type.bottomRightCornerTexture() {
                currentTexture = texture
            }
            return
        }
        
        // BLC
        if (rightType != nil && rightType!.isBlendableWith(type: type)) && (upType != nil && upType!.isBlendableWith(type: type)) && (upRightType == nil || !upRightType!.isBlendableWith(type: type)) {
            if let texture = type.bottomLeftCornerTexture() {
                currentTexture = texture
            }
            return
        }
        
        // TRC
        if (leftType != nil && leftType!.isBlendableWith(type: type)) && (downType != nil && downType!.isBlendableWith(type: type)) && (downLeftType == nil || !downLeftType!.isBlendableWith(type: type)) {
            if let texture = type.topRightCornerTexture() {
                currentTexture = texture
            }
            return
        }
        
        // TLC
        if (rightType != nil && rightType!.isBlendableWith(type: type)) && (downType != nil && downType!.isBlendableWith(type: type)) && (downRightType == nil || !downRightType!.isBlendableWith(type: type)) {
            if let texture = type.topLeftCornerTexture() {
                currentTexture = texture
            }
            return
        }
    }
    
    func addToLayer(layer: TileMapLayer, size: CGSize, pos: CGPoint) {
        let node = SKSpriteNode(texture: currentTexture)
        node.size = size
        node.position = pos
        node.anchorPoint = CGPoint(x: 0, y: 1)
        
        layer.node.addChild(node)
    }
}
