import Foundation

class GameCharacter {
    var curr_hp: Int
    var speed: Float = 1.0
    var max_hp: Int
    var def: Float = 1.0
    var atk: Float = 1.0
    init() {
        max_hp = 100
        curr_hp = max_hp
        
    }
    init(hp: Int) {
        max_hp = hp
        curr_hp = max_hp
        
    }
}
