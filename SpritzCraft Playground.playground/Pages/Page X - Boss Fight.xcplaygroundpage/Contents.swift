//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit



class BossScene: SKScene {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    private var enemy : SKSpriteNode!
    private var player: SKSpriteNode!
    private var mage: SKSpriteNode!
    var texture = SKTexture(imageNamed: "thunder")
    var background = SKSpriteNode(imageNamed:"background")
    override func didMove(to view: SKView) {
        
        
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        player = SKSpriteNode(imageNamed: "heart")
        player.setScale(0.3)
        player.position = CGPoint(x: 0, y:-frame.size.height/2 + 50)
        mage = SKSpriteNode(imageNamed:"mage")
        mage.setScale(1.5)
        mage.position = CGPoint(x: 0, y:frame.size.height/2 - 50)
        addChild(mage)
        addChild(player)
        let moverl = SKAction.sequence([.moveTo(x:-frame.size.width/2 + 50, duration:3), .moveTo(x:frame.size.width/2 - 50, duration:3)])
        let moveud = SKAction.sequence([.moveTo(y:frame.size.height/2 - 70, duration:0.4), .moveTo(y:frame.size.height/2 - 30, duration:0.4)])
        mage.run(.repeatForever(moverl))
        mage.run(.repeatForever(moveud))
        bosspattern()
         
    }
    
    @objc static override var supportsSecureCoding: Bool {
        // SKNode conforms to NSSecureCoding, so any subclass going
        // through the decoding process must support secure coding
        get {
            return true
        }
    }
    

    

    func spawnBullet(enemy: SKSpriteNode) {
           let Bullet = SKSpriteNode(texture: texture)
           Bullet.setScale(0.2)
           Bullet.zPosition = 1

           Bullet.position = CGPoint(x: enemy.position.x, y: enemy.position.y)

           let action = SKAction.moveTo(y: -self.size.height/2, duration: 2)
           let actionDone = SKAction.removeFromParent()
           Bullet.run(SKAction.sequence([action, actionDone]))

        Bullet.physicsBody = SKPhysicsBody(circleOfRadius: 10)
           
           self.addChild(Bullet)
    }
    func bosspattern() {
        let wait = SKAction.wait(forDuration: 0.5)
        let run = SKAction.run {
            self.spawnBullet(enemy: self.mage)
           }

        mage.run(SKAction.repeatForever(SKAction.sequence([wait, run])))
    }
    func bosspattern2() {
        let wait_1 = SKAction.wait(forDuration: 0.2)
        let wait_2 = SKAction.wait(forDuration: 1  )
        let run = SKAction.run {
            self.spawnBullet(enemy: self.mage)
           }
        
        let moverl = SKAction.sequence([.moveTo(x:-frame.size.width/2 + 50, duration:3), .moveTo(x:frame.size.width/2 - 50, duration:3)])
        let moveud = SKAction.sequence([.moveTo(y:frame.size.height/2 - 70, duration:0.4), .moveTo(y:frame.size.height/2 - 30, duration:0.4)])
        mage.run(.repeatForever(moverl))
        mage.run(.repeatForever(moveud))
        mage.run(SKAction.repeatForever(SKAction.sequence([wait_1, run, wait_1, run, wait_1, run,  wait_2])))
    }
    
    
        override func keyDown(with event: NSEvent) {
        switch(event.keyCode) {
        case Keycode.space:
            mage.removeAllActions()
            bosspattern2()
        case Keycode.rightArrow:
            player.position = CGPoint(x:player.position.x + 20, y:player.position.y)
        case Keycode.leftArrow:
            player.position = CGPoint(x:player.position.x - 20, y:player.position.y)
        
        default: break
        }
     
    }
      
    
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
    }
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 640, height: 480))
if let scene = BossScene(fileNamed: "BossScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFill
    
    // Present the scene
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
