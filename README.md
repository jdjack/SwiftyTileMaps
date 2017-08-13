# SwiftyTileMaps
A simple set of Swift classes to build orthogonal tile maps in code with ease.

## How to use

SwiftyTileMaps is based upon 4 classes: TileMaps, TileMapLayers, Tiles, and TileTypes. The TileMap is an SKNode which holds all of the layers, the TileMapLayers hold all of the tiles, and the tiles each have a type.


### Creating TileTypes
When you create a TileType, you give it either just one image to represent the tile, or an entire set of images for edges and corners. The tile will then do the hard work and figure out what goes where. You also provide the type with a name, which MUST be unique.

``` Swift
let type1 = TileType(name: "Dungeon1", center: cImage, topLeftEdge: tleImage, topEdge: teImage, topRightEdge: treImage, rightEdge: reImage, bottomRightEdge: breImage, bottomEdge: beImage, bottomLeftEdge: bleImage, leftEdge: leImage, topLeftCorner: tlcImage, topRightCorner: trcImage, bottomRightCorner: brcImage, bottomLeftCorner: blcImage)
let type2 = TileType(name: "Dungeon2", image: cImage)
```

### Creating a TileMapLayer
Once you have created your types, you can create your layer using an array of types. This makes automation easy, and can be great for randomly generated maps. You don't have to worry about placing diffent tiles on the edges, you just fill out an area and it will do it for you. 

Using the "type1" above, you would do the following to create a room.

``` Swift
let layer = TileMapLayer(tileTypes: [nil, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     type1, type1, type1, type1, type1, type1,
                                     nil, type1, type1, type1, type1, type1], horizontalTiles: 6, verticalTiles: 8, tileSize: CGSize(width: 64, height: 64))
```

You can place nil values into your array where you don't want tiles to appear. This particular array ends up looking like below:
![alt text](http://imgur.com/a/LPvbd)

As you can see, the walls and corners were automatically placed, with the center tile everywhere else.

### Mixing TileTypes

By default, two tile types are seen as boundaries, so the edge tiles will form on the border of two types as shown here:

![alt text](http://imgur.com/G5n64LJ)

Sometimes this isn't what you want out of tiles, so you can tell the layer to draw the tiles as if they were one set. To do this, use the following code:

``` Swift
type1.addBlendedType(type: type2)
```

Note that you do not need to do this both ways. 

The result will then look like this:

![alt text](http://imgur.com/6QAWD0b)

### Adding to the TileMap

Start by creating your TileMap object:

``` Swift
let tileMap = TileMap()
tileMap.position = CGPoint.zero
self.addChild(tileMap)
```

Now you can add each layer as shown:

``` Swift
layer.addLayerToMap(map: tileMap)
```


## Planned Features
- Customisable Collisions on TileMap parts
- Redraw calls to the TileMap and layers
- Change individual tiles at runtime
- Change tile types at runtime
