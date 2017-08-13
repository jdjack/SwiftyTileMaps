//
//  TileMapLayer.swift
//  SwiftyTileMaps
//
//  Created by Jack Chorley on 12/08/2017.
//  Copyright © 2017 iZolo LTD. All rights reserved.
//

import UIKit
import SpriteKit

class TileMapLayer {
    
    let node: SKNode
    var tiles: [Tile?]
    
    let horizontalTiles: Int
    let verticalTiles: Int
    let numberOfTiles: Int
    
    let mapHeight: CGFloat
    let mapWidth: CGFloat
    
    //Tiles are ordered as so for a 4x3 size 12
    
    /*   0   1   2   3
         4   5   6   7
         8   9   10  11
     */
    
    init(tileTypes: [TileType?], horizontalTiles: Int, verticalTiles: Int, tileSize: CGSize) {
        
        node = SKNode()
        
        self.horizontalTiles = horizontalTiles
        self.verticalTiles = verticalTiles
        
        self.numberOfTiles = tileTypes.count
        
        mapWidth = CGFloat(horizontalTiles) * tileSize.width
        mapHeight = CGFloat(verticalTiles) * tileSize.height
        
        assert((horizontalTiles * verticalTiles) == tileTypes.count)
        
        tiles = tileTypes.map({ (tileType) -> Tile? in
            if tileType == nil {
                return nil
            }
            
            return Tile(type: tileType!)
        })
        
        
        for (i, tile) in tiles.enumerated() {
            
            if tile == nil {
                continue
            }
            
            let leftType: TileType? = getTileTypeLeftOf(i: i)
            let upType: TileType? = getTileTypeUpFrom(i: i)
            let rightType: TileType? = getTileTypeRightOf(i: i)
            let downType: TileType? = getTileTypeDownFrom(i: i)
            
            let upLeftType: TileType? = getTileTypeAtIndex(i: getIndexUpFrom(i: getIndexLeftOf(i: i)))
            let upRightType: TileType? = getTileTypeAtIndex(i: getIndexUpFrom(i: getIndexRightOf(i: i)))
            let downLeftType: TileType? = getTileTypeAtIndex(i: getIndexDownFrom(i: getIndexLeftOf(i: i)))
            let downRightType: TileType? = getTileTypeAtIndex(i: getIndexDownFrom(i: getIndexRightOf(i: i)))
            
            
            tile!.updateTexture(leftType: leftType, upType: upType, rightType: rightType, downType: downType, upLeftType: upLeftType, upRightType: upRightType, downRightType: downRightType, downLeftType: downLeftType)
            
            let position = CGPoint(x: CGFloat(i % horizontalTiles) * tileSize.width, y: mapHeight - (CGFloat(i / horizontalTiles) * tileSize.height))
            tile!.addToLayer(layer: self, size: tileSize, pos: position)
        }
        
    }
    
    func addLayerToMap(map: TileMap) {
        map.addChild(self.node)
    }
    
    func getTileTypeUpFrom(i: Int) -> TileType? {
        if i >= horizontalTiles {
            if let t = tiles[i-horizontalTiles] {
                return t.type
            }
        }
        
        return nil
    }
    
    func getTileTypeDownFrom(i: Int) -> TileType? {
        if i < numberOfTiles - horizontalTiles {
            if let t = tiles[i+horizontalTiles] {
                return t.type
            }
        }
        return nil
    }
    
    func getTileTypeLeftOf(i: Int) -> TileType? {
        if i > 0 && (i) % horizontalTiles != 0 {
            if let t = tiles[i-1] {
                return t.type
            }
        }
        
        return nil
    }
    
    func getTileTypeRightOf(i: Int) -> TileType? {
        if i < numberOfTiles - 1 && (i + 1) % horizontalTiles != 0 {
            if let t = tiles[i+1] {
                return t.type
            }
        }
        
        return nil
    }
    
    func getIndexUpFrom(i: Int?) -> Int? {
        
        if i == nil {
            return nil
        }
        
        if i! >= horizontalTiles {
            if let _ = tiles[i! - horizontalTiles] {
                return i! - horizontalTiles
            }
        }
        
        return nil
    }
    
    func getIndexDownFrom(i: Int?) -> Int? {
        
        if i == nil {
            return nil
        }
        
        if i! < numberOfTiles - horizontalTiles {
            if let _ = tiles[i! + horizontalTiles] {
                return i! + horizontalTiles
            }
        }
        return nil
    }
    
    func getIndexLeftOf(i: Int?) -> Int? {
        
        if i == nil {
            return nil
        }
        
        if i! > 0 && i! % horizontalTiles != 0 {
            if let _ = tiles[i! - 1] {
                return i! - 1
            }
        }
        
        return nil
    }
    
    func getIndexRightOf(i: Int?) -> Int? {
        
        if i == nil {
            return nil
        }
        
        if i! < numberOfTiles - 1 && (i! + 1) % horizontalTiles != 0 {
            if let _ = tiles[i! + 1] {
                return i! + 1
            }
        }
        
        return nil
    }
    
    func getTileTypeAtIndex(i: Int?) -> TileType? {
        if i == nil || i! < 0 || i! >= numberOfTiles {
            return nil
        }
        
        if let t = tiles[i!] {
            return t.type
        }
        
        return nil
    }
    
}
