import SpriteKit

public struct Character {
    var name : String
    public var character : SKSpriteNode!
    var texture : [SKTexture] = []
    public init(_ name: String){
        self.name = name
        self.character = SKSpriteNode(imageNamed: name)
    }
    public func position(x: Float, y: Float){
        character.position.x = CGFloat(x)
        character.position.y = CGFloat(y)
        character.zPosition = 2
    }
    
   public mutating func walk(x: Int, y: Int, duration: Double){
        for i in 1...2{
        texture.append(SKTexture(imageNamed:"\(name)Move\(i)"))
        }
        let walkAnimation = SKAction.animate(with: texture, timePerFrame: 0.2)
        let moveR = SKAction.moveBy(x: CGFloat(x), y: CGFloat(y), duration: duration)
        let stop = SKAction.run(stopBlock)
       let turn = turn()
       character.run(SKAction.repeatForever(walkAnimation))
       character.run(SKAction.sequence([moveR,stop,turn]))
    }
    
    mutating public func turn() -> SKAction{
        texture = [SKTexture(imageNamed: "Front\(name)"),SKTexture(imageNamed: "\(name)Side")]
        let turn = SKAction.animate(with: texture, timePerFrame: 0.5)
        return turn
    }
    
    func stopBlock(){
        character.removeAllActions()
        character.texture = SKTexture(imageNamed: "\(name)")
    }
}
