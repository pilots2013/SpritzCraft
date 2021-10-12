import Foundation

public struct Audio {
    
   public struct MusicFiles {
        public static let bossMusic = Music(filename: "bossMusic", type: "mp3")
    }
    
    public struct EffectFiles {
        public static let fireball = Effect(filename: "fireball_sfx", type: "mp3")
        public static let hurt = Effect(filename:"damage", type: "mp3")

    }
}
