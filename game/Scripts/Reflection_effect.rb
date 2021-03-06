# NOT UPDATED !

#==============================================================================
# ■ Sprite_Reflection
# Based on Sprite_Mirror, Modified By: JmsPlDnl, rewritten entirely by Rataime
#==============================================================================
CATERPILLAR_COMPATIBLE = true

class Game_Party
  attr_reader :characters
end

class Sprite_Reflection < RPG::Sprite

 attr_accessor :character

 def initialize(viewport=nil, character=nil,self_angle = 180)
   super(viewport)
   @character = character
   @self_angle=self_angle
   self.opacity=0
   @reflected=false
   @former=false
   @moving=false
   if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+1)==7
     @reflected=true
     @former=true
   end
   update
 end

 def update
   super
   if @tile_id != @character.tile_id or
      @character_name != @character.character_name or
      @character_hue != @character.character_hue
     @tile_id = @character.tile_id
     @character_name = @character.character_name
     @character_hue = @character.character_hue
     if @tile_id >= 384
       self.bitmap = RPG::Cache.tile($game_map.tileset_name,
         @tile_id, @character.character_hue)
       self.src_rect.set(0, 0, 32, 32)
       self.ox = 16
       self.oy = 32
     else
       self.bitmap = RPG::Cache.character(@character.character_name,
         @character.character_hue)
       @cw = bitmap.width / 4
       @ch = bitmap.height / 4
       self.ox = @cw / 2
       self.oy = @ch
     end
   end
   
   self.visible = (not @character.transparent)
   if @tile_id == 0
     sx = (@character.pattern) * @cw
     sy = (@character.direction - 2) / 2 * @ch
     if @character.direction== 6
           sy = ( 4- 2) / 2 * @ch
     end
     if @character.direction== 4
           sy = ( 6- 2) / 2 * @ch
    end
    if @character.direction != 4 and @character.direction != 6
          sy = (@character.direction - 2) / 2 * @ch
    end
   end
   
   self.x = @character.screen_x
   self.y = @character.screen_y-5
   @moving=!(@character.real_x%128==0 and @character.real_y%128==0)
   @d=@character.direction
   @rect=[sx, sy, @cw, @ch]
   if !(@moving)
     if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+1)==7 
       @reflected=true
       @former=true
     else
       @reflected=false  
       @former=false
     end
     
   else
       case @d
       
       when 2
       if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+2)==7
         @reflected=true
         if @former==false
           @offset = (@character.screen_y%32)*@ch/32
           @rect=[sx, sy, @cw, @offset]
           self.y=@character.screen_y-5
         end
       else
         @reflected=false  
       end
       
       when 4
       if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+1)!=7
         @offset = ((@character.screen_x-@cw/2)%32)*@cw/32
         @rect=[sx, sy, @offset, @ch]
         self.x=@character.screen_x
       else
         @reflected=true
         if @former==false
           @offset = ((@character.screen_x-@cw/2)%32)*@cw/32
           @rect=[sx+@offset, sy, @cw-@offset, @ch]
           self.x=@character.screen_x-@offset
         end
       end
       
       when 6
       if $game_map.terrain_tag(@character.real_x/128+1,@character.real_y/128+1)!=7
         @offset = ((@character.screen_x-@cw/2)%32)*@cw/32
         @rect=[sx+@offset, sy, @cw-@offset, @ch]
         self.x=@character.screen_x-@offset
       else
         @reflected=true
         if @former==false
           @offset = ((@character.screen_x-@cw/2)%32)*@cw/32
           @rect=[sx, sy, @offset, @ch]
           self.x=@character.screen_x
         end
       end
       
       when 8
       if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+2)==7
         @reflected=true
         if $game_map.terrain_tag(@character.real_x/128,@character.real_y/128+1)!=7
           @offset = (@character.screen_y%32)*@ch/32
           @rect=[sx, sy, @cw, @offset]
           self.y=@character.screen_y-5
         end
       else
         @reflected=false  
       end
       
       end

   end
   if @reflected
     self.opacity=128
   else
    @rect=[sx, sy, @cw, @ch]
    self.opacity=0
   end
   
   if $game_map.terrain_tag((@character.real_x+64)/128,@character.real_y/128+2)!=7
     if $game_map.terrain_tag((@character.real_x+64)/128,@character.real_y/128+2)!=7
       @rect[1]= @rect[1]+@ch/2
       @rect[3]= @rect[3]/2
       self.y = self.y - @ch/2
     else
       @reflected=false
     end
   end
     
   self.src_rect.set(@rect[0],@rect[1],@rect[2],@rect[3])
   
   @character.is_a?(Game_Player) ? self.z = 9 : self.z = 5
   self.blend_type = @character.blend_type
   self.bush_depth = @character.bush_depth
   if @character.animation_id != 0
     animation = $data_animations[@character.animation_id]
     animation(animation, true)
     @character.animation_id = 0
   end

   self.angle = @self_angle
 end
end

#===================================================
# ▼ CLASS Sprite_Character edit
#===================================================

class Sprite_Character < RPG::Sprite
  alias reflect_initialize initialize
  
  def initialize(viewport, character = nil)
    @character = character
    @reflection = []
    super(viewport)
    if (character.is_a?(Game_Event) and character.list!=nil and character.list[0].code == 108 and character.list[0].parameters == ["r"])
     @reflection.push(Sprite_Reflection.new(viewport,@character))
    end
    if (character.is_a?(Game_Event) and character.list!=nil and character.list[0].code == 108 and character.list[0].parameters == ["hero_r"])
     @reflection.push(Sprite_Reflection.new(viewport,$game_player))
#===================================================
# ● Compatibility with fukuyama's caterpillar script
#===================================================
if CATERPILLAR_COMPATIBLE and $game_party.characters!=nil

  for member in $game_party.characters
    @reflection.push(Sprite_Reflection.new(viewport,member))
  end

end
#===================================================
# ● End of the compatibility
#===================================================
    end
    reflect_initialize(viewport, @character)
  end
  
  alias reflect_update update
  
  def update
   reflect_update
   if @reflection!=nil
     for reflect in @reflection
       reflect.update
     end
   end
  end
  
end
