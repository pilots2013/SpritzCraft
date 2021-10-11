import Foundation
import PlaygroundSupport
import SpriteKit
import CoreGraphics

var man : SKSpriteNode!
var woman : SKSpriteNode!

class IntroScene : SKScene {
    override func didMove(to view: SKView) {
        var texture:[SKTexture] = []
        texture.append(SKTexture(imageNamed: "PrinceMove1"))
        texture.append(SKTexture(imageNamed: "PrinceMove2"))
        let walkAnimation = SKAction.animate(with: texture, timePerFrame: 0.2)
        let moveR = SKAction.moveBy(x: -600, y: 0, duration: 5)
        let stop = SKAction.run {
            man.removeAllActions()
            man.texture = SKTexture(imageNamed: "Prince")
        }
        let background = SKSpriteNode(imageNamed:"Forest")
        background.zPosition = 1
        background.size = CGSize(width: self.frame.size.width, height: self.frame.size.height)
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        man = SKSpriteNode(imageNamed: "Prince")
        man.zPosition = 2
        man.position = CGPoint(x: background.size.width/2, y: -200)
        addChild(man)
        man.run(SKAction.repeatForever(walkAnimation))
        man.run(SKAction.sequence([moveR,stop]))
        
       
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
    
    func manWalk (node: SKSpriteNode){
        var texture:[SKTexture] = []
        texture.append(SKTexture(imageNamed: "PrinceMove1"))
        texture.append(SKTexture(imageNamed: "PrinceMove2"))
        let walkAnimation = SKAction.animate(withNormalTextures: texture, timePerFrame: 0.1)
        let moveR = SKAction.moveBy(x: -200, y: 0, duration: 5)
        node.run(SKAction.repeatForever(walkAnimation))
        node.run(moveR)
    }
}

let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 800, height: 600))

if let scene = IntroScene(fileNamed: "IntroScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .resizeFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView


