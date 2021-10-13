//: A SpriteKit based Playground

import PlaygroundSupport
import SpriteKit
import AVKit

let patterSplitCount: UInt32 = 40

// BIT MASKS FOR COLLISIONS
let PlayerCategory: UInt32 = 0x1 << 0
let WallCategory: UInt32 = 0x2 << 1
let BulletCategory: UInt32 = 0x3 << 2

//TEXTURES FOR SPRITES
var beast_rmove: [SKTexture]
var fireball = SKTexture(imageNamed: "Fireball")
var fireball_blue = SKTexture(imageNamed: "Fireball Blue")
var rock = SKTexture(imageNamed: "Rock")


var hp_0 = SKTexture(imageNamed: "hp_0")
var hp_1 = SKTexture(imageNamed: "hp_1")
var hp_2 = SKTexture(imageNamed: "hp_2")
var hp_3 = SKTexture(imageNamed: "hp_3")
var hp_4 = SKTexture(imageNamed: "hp_4")
var hp_5 = SKTexture(imageNamed: "hp_5")

var hp_textures: [SKTexture] = [hp_0, hp_1, hp_2, hp_3, hp_4, hp_5]
var beast_texture = SKTexture(imageNamed: "beast")
var beast_texture_r = SKTexture(imageNamed: "beast_r")
var beast_texture_spec = SKTexture(imageNamed: "beast_spec")
var beast_texture_l = SKTexture(imageNamed: "beast_l")

var beast_hit1 = SKTexture(imageNamed: "beast_hit1")
var beast_hit2 = SKTexture(imageNamed: "beast_hit2")
var beast_hit3 = SKTexture(imageNamed: "beast_hit3")

var beast_rmove_anim: [SKTexture] = [beast_texture, beast_texture_r]
var beast_lmove_anim: [SKTexture] = [beast_texture_spec, beast_texture_l]
var beast_hurt_anim: [SKTexture] = [beast_hit1, beast_hit2, beast_hit3, beast_hit2, beast_hit1, beast_texture]
class BossScene: SKScene, SKPhysicsContactDelegate {
    
    private var label : SKLabelNode!
    private var spinnyNode : SKShapeNode!
    private var enemy : SKSpriteNode!
    private var player: SKSpriteNode!
    private var mage: SKSpriteNode!
    private var touch: UITouch?
    private var health_bar: SKSpriteNode!
    private var health_points: Int = 5
    private var isInvincible: Bool = false
    private var isPowered: Bool = false
    private var bullets: [SKTexture] = [fireball, fireball_blue, rock]
    private var audioPlayer: AudioPlayerImpl!
    private var audioSecondary: AudioPlayerImpl!
    private var bulletCount: UInt32! = 0
    var bullet_index: Int = 0
    var background = SKSpriteNode(imageNamed:"background")
    override func didMove(to view: SKView) {
        
        audioPlayer = AudioPlayerImpl()
        audioSecondary = AudioPlayerImpl()
        audioPlayer.musicVolume = 0.12
        audioPlayer.play(music:Audio.MusicFiles.bossMusic)
        audioPlayer.currentMusicPlayer?.numberOfLoops = -1
        physicsWorld.contactDelegate = self
        background.position = CGPoint(x: 0, y: 0)
        addChild(background)
        health_bar = SKSpriteNode(texture: hp_5)
        health_bar.setScale(0.2)
        health_bar.position = CGPoint(x:frame.size.width/2 - 200, y:frame.size.height/2 - 40)
        player = SKSpriteNode(texture: beast_texture)
        player.setScale(0.3)
        player.name = "player"
        player.position = CGPoint(x: 0, y:-frame.size.height/2 + 60)
        let playerBody = SKPhysicsBody(circleOfRadius: player.xScale * player.size.width/2)
        player.physicsBody = playerBody
        player.physicsBody?.categoryBitMask = PlayerCategory
        player.physicsBody?.collisionBitMask = WallCategory
        player.physicsBody?.contactTestBitMask = WallCategory | BulletCategory
        player.physicsBody?.usesPreciseCollisionDetection = true
        player.physicsBody?.isDynamic = false
        player.physicsBody?.affectedByGravity = true
        
        let borderBody = SKPhysicsBody(edgeLoopFrom: self.frame)
        self.physicsBody = borderBody
        self.physicsBody?.friction = 0.1
        borderBody.contactTestBitMask = PlayerCategory
        borderBody.categoryBitMask = WallCategory
        borderBody.collisionBitMask = PlayerCategory
        borderBody.usesPreciseCollisionDetection = true
        borderBody.isDynamic = false
        mage = SKSpriteNode(imageNamed:"mage")
        mage.setScale(2)
        mage.position = CGPoint(x: 0, y:frame.size.height/2 - 80)
        addChild(health_bar)
        addChild(mage)
        addChild(player)
        
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
       
        
        let Bullet = SKSpriteNode(texture: bullets[bullet_index])
        bullet_index = (bullet_index + 1) % bullets.count
        Bullet.setScale(0.3)
        Bullet.zPosition = 1
        Bullet.name = "bullet"

        Bullet.position = CGPoint(x: enemy.position.x, y: enemy.position.y)

        let action = SKAction.moveTo(y: -self.size.height/2, duration: 2)
        let actionDone = SKAction.removeFromParent()
        Bullet.run(SKAction.sequence([action, actionDone]))

        Bullet.physicsBody = SKPhysicsBody(circleOfRadius: Bullet.frame.height/2)
            
        Bullet.physicsBody?.categoryBitMask = BulletCategory
        Bullet.physicsBody?.collisionBitMask = 0x0
        Bullet.physicsBody?.contactTestBitMask = PlayerCategory
        self.addChild(Bullet)
        bulletCount = (bulletCount + 1) % patterSplitCount
        audioPlayer.effectsVolume = 0.3
        audioPlayer.play(effect: Audio.EffectFiles.fireball)
        
    }
    
    
    func spawnCrystal(enemy: SKSpriteNode) {
       
        
        let crystal = SKSpriteNode(imageNamed: "crystal")
        crystal.zPosition = 1
        crystal.name = "crystal"
        crystal.setScale(0.4)
        crystal.position = CGPoint(x: enemy.position.x, y: enemy.position.y)
        
        let action = SKAction.moveTo(y: -self.size.height/2, duration: 2)
        let actionDone = SKAction.removeFromParent()
        crystal.run(SKAction.sequence([action, actionDone]))

        crystal.physicsBody = SKPhysicsBody(circleOfRadius: crystal.frame.height/2)
            
        crystal.physicsBody?.categoryBitMask = BulletCategory
        crystal.physicsBody?.collisionBitMask = 0x0
        crystal.physicsBody?.contactTestBitMask = PlayerCategory
        self.addChild(crystal)
        
    }
    func bosspattern() {
        let wait = SKAction.wait(forDuration: 1)
        
        let run = SKAction.run {
            self.spawnBullet(enemy: self.mage)
           }
        let moverl = SKAction.sequence([.moveTo(x:-frame.size.width/2 + 50, duration:3), .moveTo(x:frame.size.width/2 - 50, duration:3)])
        let moveud = SKAction.sequence([.moveTo(y:frame.size.height/2 - 120, duration:0.4), .moveTo(y:frame.size.height/2 - 80, duration:0.4)])
        mage.run(.repeatForever(moverl))
        mage.run(.repeatForever(moveud))
        mage.run(SKAction.repeatForever(SKAction.sequence([wait, run])))
    }
    func bosspattern2() {
        let wait_1 = SKAction.wait(forDuration:0.2)
        let wait_2 = SKAction.wait(forDuration:1)
        let run = SKAction.run {
            self.spawnBullet(enemy: self.mage)
           }
        let slide = SKAction.moveTo(x: frame.size.width/2 - 50, duration: 0.2)
        let moverl = SKAction.sequence([.moveTo(x:frame.size.width/2 - 50, duration:2), .moveTo(x:-frame.size.width/2 + 50, duration:2)])
        let moveud = SKAction.sequence([.moveTo(y:frame.size.height/2 - 120, duration:0.4), .moveTo(y:frame.size.height/2 - 80, duration:0.4)])
        mage.run(slide)
        mage.run(.repeatForever(moverl))
        mage.run(.repeatForever(moveud))
        mage.run(SKAction.repeatForever(SKAction.sequence([wait_1, run, wait_1, run, wait_1, run,  wait_2])))
    }
    
            
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch in (touches) {
            let location = touch.location(in: self)
            var movement_anim: SKAction
            let leftMoveAction = SKAction.move(to: CGPoint(x: player.position.x - 5000, y: player.position.y), duration: 10)
            let rightMoveAction = SKAction.move(to: CGPoint(x: player.position.x + 5000, y: player.position.y), duration: 10)
            
            if(location.x < player.position.x && player.position.x > -frame.size.width / 2) {
                movement_anim = SKAction.animate(with:beast_lmove_anim, timePerFrame: 0.2)
                player.run(leftMoveAction)
                player.run(.repeatForever(movement_anim))
            }
            else if(location.x > player.position.x && player.position.x < frame.size.width / 2) {
                movement_anim = SKAction.animate(with:beast_rmove_anim, timePerFrame: 0.2)
                player.run(rightMoveAction)
                player.run(.repeatForever(movement_anim))
            }
                    
        }
                    
                    
        
    }
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {

        player.removeAllActions()
    }

    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        if(player.position.x >= frame.size.width / 2 - 60) {
            player.position.x -= 1
            player.removeAllActions()
        } 
        else if(player.position.x < -frame.size.width / 2 + 60) {
            player.position.x += 1
            player.removeAllActions()
        }
        if(bulletCount == 8) {
            mage.removeAllActions()
            bosspattern2()
            bulletCount = (bulletCount + 1) % patterSplitCount
        }
        else if(bulletCount == 28) {
            mage.removeAllActions()
            bosspattern()
            bulletCount = (bulletCount + 1) % patterSplitCount
        }
        if(bulletCount == 20) {
            spawnCrystal(enemy: mage)
            bulletCount = (bulletCount + 1) % patterSplitCount
        }
            
    }
    func didBegin(_ contact: SKPhysicsContact) {
        if (contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "bullet" && !isInvincible) {
            isInvincible = true
            
            let wait = SKAction.wait(forDuration: 2)
            run(wait) { [self] in
              isInvincible = false
            }
            let hurt_action = SKAction.animate(with:beast_hurt_anim, timePerFrame: 0.1)
            self.health_points -= 1
            if(self.health_points >= 0) {
                let hp_loss_action = SKAction.setTexture(hp_textures[health_points])
                health_bar.run(hp_loss_action)
            }
            
            
            player.removeAllActions()
            
            player.run(hurt_action)
            audioSecondary.effectsVolume = 0.5
            audioSecondary.play(effect: Audio.EffectFiles.hurt)
            
            print("DANNO")
        }
        if(contact.bodyA.node?.name == "player" && contact.bodyB.node?.name == "crystal" && !isPowered) {
            isPowered = true
            player.colorBlendFactor = 0.6
            player.color = UIColor.systemGreen
            print("POWAHHH!!!")
        }
    }
    
}

// Load the SKScene from 'GameScene.sks'
let sceneView = SKView(frame: CGRect(x:0 , y:0, width: 1920, height: 1080))

if let scene = BossScene(fileNamed: "BossScene") {
    // Set the scale mode to scale to fit the window
    scene.scaleMode = .aspectFit
    
    // Present the scene
    
    sceneView.showsPhysics = false
    sceneView.presentScene(scene)
}

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView
