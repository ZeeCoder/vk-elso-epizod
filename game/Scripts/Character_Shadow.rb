#==============================================================================
# ** Dynamic Shadows
#------------------------------------------------------------------------------
# Rataime
# Version 4.0
# 06/05/2007 (2007-05-06)
# Version 1.0 was based on Genzai Kawakami's shadows, extra features Boushy
#==============================================================================

#==============================================================================
# Here's the brand new free configuration feature
# The comments will be compared to the pattern using Regexp, except that I did
# the entire work for you, so you don't have to know regexps at all.
# Just choose the trigger ('s', 'begin shadow' or whatever), and the pattern
# The pattern can be one line or a list to use multiple comment lines.
# arg1 is the minimum angle
# arg2 is the maximum angle
# arg3 is the maximum distance
# The only thing you must do is using 'trigger' before the arguments
# Examples :
# 
# SHADOWS_SOURCE_COMMENT_TRIGGER = 's'
# SHADOWS_SOURCE_COMMENT_PATTERN = ['trigger','arg1','arg2','arg3']
# SHADOWS_CHAR_COMMENT_TRIGGER = 'o'
# SHADOWS_CHAR_COMMENT_PATTERN = 'trigger'
# is the old way to use shadows, with a single 's' in the first line, and the
# arguments in following lines
#
# SHADOWS_SOURCE_COMMENT_TRIGGER = 'begin shadow source'
# SHADOWS_SOURCE_COMMENT_PATTERN = 
# ['trigger','anglemin arg1','anglemax arg2','distancemax arg3']
# SHADOWS_CHAR_COMMENT_TRIGGER = 'begin shadow'
# SHADOWS_CHAR_COMMENT_PATTERN = 'trigger'
# will work with :
# Comment "begin shadow source"
# Comment "anglemin 0"
# Comment "anglemax 0"
# Comment "distancemax 250"
#
# Take the time to choose something you like, and something compatible with other
# scripts.
# Note that the comments will be detected even if they aren't in the beginning
# of the event's action list. Ah, and you can switch the arguments if you like
#==============================================================================

#==============================================================================
# Here is the method I like best, because of its compatibility with other
# scripts. But don't hesitate to change it.
# It will react to something like Shadow|0|0|250
#==============================================================================

 SHADOWS_SOURCE_COMMENT_TRIGGER = 'Shadow'
 SHADOWS_SOURCE_COMMENT_PATTERN = 'trigger|arg1|arg2|arg3'
 SHADOWS_CHAR_COMMENT_TRIGGER = 'o'
 SHADOWS_CHAR_COMMENT_PATTERN = 'trigger'

#==============================================================================
# An important option : if you set it to true, the shadows will get longer if
# you are far from the source. Nice, but induces lag : it will eat your CPU,
# and quite possibly your first born if you try that on a big map.
#==============================================================================
 
 SHADOW_GETS_LONGER = true

#==============================================================================
# Misc options
# If an event has its opacity below SHADOWS_OPACITY_THRESHOLD, no shadow will
# be displayed.
# Set SHADOWS_CATERPILLAR_COMPATIBLE to true if you uses the caterpillar script
#==============================================================================

 SHADOWS_OPACITY_THRESHOLD = 254
 SHADOWS_CATERPILLAR_COMPATIBLE = true

#==============================================================================
# You probably won't need to touch this : it's the 'map' of how to display the
# shadow depending on the event's direction and his relative position to the
# source. a minus means the shadow is mirrored. It seems complex, and it is.
# Complain to Enterbrain (why didn't they use something clockwise or counter-
# clockwise ? I suspect it's because of the rm2k legacy. More explanations 
# below.
#==============================================================================

SHADOWS_DIRECTION_ARRAY = Array.new
SHADOWS_DIRECTION_ARRAY[2] = [ -3, 4, -2, 1 ]
SHADOWS_DIRECTION_ARRAY[4] = [ 4, -2, 1, -3 ]
SHADOWS_DIRECTION_ARRAY[6] = [ 1, -3, 4, -2 ]
SHADOWS_DIRECTION_ARRAY[8] = [ -2, 1, -3, 4 ]

#------------------------------------------------------------------------------
# * SDK Log Script and Check requirements
#------------------------------------------------------------------------------
SDK.log('Shadows', 'rataime', 1.00, '05.06.2007')
SDK.check_requirements(2, [1,2])

#==============================================================================
# ** Game_Party, for compatibility with the caterpillar script.
#==============================================================================

class Game_Party
  attr_reader :characters
end

#==============================================================================
# ** Sprite_Shadow, the meat of this script
#==============================================================================

class Sprite_Shadow < RPG::Sprite

  attr_accessor :character
  
  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil,source = nil,anglemin=0, \
                 anglemax=0,distancemax=700)
    super(viewport)
    @anglemin=anglemin.to_f
    @anglemax=anglemax.to_f
    @distancemax=distancemax.to_f
    @character = character
    @source = source
    self.color = Color.new(0, 0, 0)
    update
  end
  
  #--------------------------------------------------------------------------
  # * Update
  #-------------------------------------------------------------------------- 
  def update
    if @character.transparent or @character.opacity <= SHADOWS_OPACITY_THRESHOLD
      self.visible = false
      return
    end
    @deltax=(@source.real_x-@character.real_x)/4
    @deltay= (@source.real_y-@character.real_y)/4
    @distance = (((@deltax ** 2) + (@deltay ** 2))** 0.5)
    if @distancemax !=0 and @distance>@distancemax
      self.visible = false
      return
    end
    self.angle = 57.3*Math.atan2(@deltax, @deltay )
    @angle_trigo= (self.angle+90) % 360
    if @anglemin !=0 or @anglemax !=0
      if (@angle_trigo<@anglemin or @angle_trigo>@anglemax) and \
          @anglemin<@anglemax
        self.visible = false
        return
      elsif (@angle_trigo<@anglemin and @angle_trigo>@anglemax) and \
             @anglemin>@anglemax
        self.visible = false
        return
      end     
    end
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
    self.visible = true
    self.x = @character.screen_x
    self.y = @character.screen_y-8
    self.z = @character.screen_z(@ch)-1
    if @character.animation_id != 0
      animation = $data_animations[@character.animation_id]
      animation(animation, true)
      @character.animation_id = 0
    end
    if @tile_id == 0
      sx = @character.pattern * @cw
      quarter = ((@angle_trigo/90+0.5).floor)%4
      # The quarter is the position of the event relative to the source.
      # Imagine the source is the o point (0,0). Trace the 2 lines
      # y=x and y=-x : you get something like a big X
      # On the right, quarter=0. Up, quarter = 1, and so on
      # Take the @character.direction row (2,4,6,8), and the quarter
      # column (0,1,2,3) (remember, it starts at 0), and you'll get
      # a number between 1 and 4. It correspond to the row of the charset
      # the shadow will be, and mirrored if negative.
      # Yes, it isn't obvious, but I didn't find any simple operation to
      # get those.
      magic = SHADOWS_DIRECTION_ARRAY[@character.direction][quarter]
      magic = -magic
      if magic < 0
        self.mirror = true
        magic = -magic
      else
        self.mirror = false
      end
      sy = (magic-1)*@ch
      self.src_rect.set(sx, sy, @cw, @ch)
    end
    # This is the formula of the opacity in function of the distance
    # ** 2 means square
    self.opacity = 600/((@distance ** 2)/ 1000 + 6)
    # This is the formula of the size in function of the distance
    # The 0.75 is here so you have a size of 1:1 when next to the source.
    self.zoom_y=0.75 + @distance / 256 if SHADOW_GETS_LONGER
  end
  
end

#======================================================================
# ** Sprite_Character EDIT
#======================================================================
#    All those things could go somewhere else, but they
#    work quite well here.
#======================================================================

class Sprite_Character < RPG::Sprite
  
  @@regexp_source = nil
  @@regexp_source_short = nil
  @@regexp_char = nil
  @@regexp_char_short = nil
  
  alias rataime_shadow_initialize initialize
  
  #--------------------------------------------------------------------------
  # * Initialize
  #--------------------------------------------------------------------------
  def initialize(viewport, character = nil)
    
    if @@regexp_source == nil
      regexp_initialize
    end
    @character = character
    super(viewport)
    @ombrelist=[]
    if (character.is_a?(Game_Event) and character.list!=nil)
      # Let's check the comments in our event list
      for j_list in 0..character.list.size-1
        #p [@@regexp_source_short, character.list[j_list].parameters[0]]
        if (character.list[j_list].code == 108 and \
            @@regexp_source_short.match(character.list[j_list].parameters[0])!= nil)
          # Haha ! We found a trigger tag ! Time to retrieve the parameters !
          parameter_string = character.list[j_list].parameters[0]
          j_list += 1
          while j_list < character.list.size and \
                (character.list[j_list].code == 108 or \
                 character.list[j_list].code == 408)
            parameter_string = parameter_string + "\n" + \
                               character.list[j_list].parameters[0]
            j_list += 1
          end
          # The following line is a nifty piece of code. Really. 
          @anglemin,@anglemax,@distancemax = \
          (regexp_get_parameters(parameter_string, true)+[nil]*3)[0..2]
          # We have our source parameters. Let's find which events we should
          # make have a shadow
          for i in $game_map.events.keys.sort
            if ($game_map.events[i].is_a?(Game_Event) and \
                $game_map.events[i].list!=nil)
              for i_list in 0..$game_map.events[i].list.size-1  
                if (($game_map.events[i].list[i_list].code == 108 or \
                     $game_map.events[i].list[i_list].code == 408 )and \
                    @@regexp_char_short.match( \
                      $game_map.events[i].list[i_list].parameters[0])!= nil)
                  @ombrelist[i+1] = Sprite_Shadow.new(viewport, $game_map.events[i],\
                                              self,@anglemin,@anglemax,@distancemax)
                  break # no need to add more than one shadow per source per event
                end
              end # end for                                
            end                                 
          end # end for
          @ombrelist[1] = Sprite_Shadow.new(viewport, $game_player,self,@anglemin,\
                                             @anglemax,@distancemax)
          #===================================================
          # Compatibility with fukuyama's caterpillar script
          #===================================================
          if SHADOWS_CATERPILLAR_COMPATIBLE and $game_party.characters!=nil
          
            for member in $game_party.characters
              @ombrelist.push(Sprite_Shadow.new(viewport, member,self,@anglemin,\
                                                @anglemax,@distancemax))
            end
          
          end
          #===================================================
          # End of the compatibility
          #===================================================
        end
        break # We don't need to go further in the source's list
      end # end for
    end
    rataime_shadow_initialize(viewport, @character)
  end
  
  alias rataime_shadow_update update
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    rataime_shadow_update
    if @ombrelist!=[]
      for i in 1..@ombrelist.size
        if @ombrelist[i]!=nil
          @ombrelist[i].update
        end
      end
    end
  end  
  
  #--------------------------------------------------------------------------
  # * Real_x : it just returns the character's real_x
  #--------------------------------------------------------------------------
  def real_x
    return @character.real_x
  end
  
  #--------------------------------------------------------------------------
  # * Real_y : it just returns the character's real_y
  #--------------------------------------------------------------------------
  def real_y
    return @character.real_y
  end
  
  #--------------------------------------------------------------------------
  # * regexp_initialize : the brand new configuration function
  #   This function generate the regexps based on the configuration
  #--------------------------------------------------------------------------
  def regexp_initialize
    @@regexp_source = regexp_generate(true)
    @@regexp_char = regexp_generate(false)
    @@regexp_source_short = @@regexp_source
    @@regexp_char_short = @@regexp_char
    if SHADOWS_SOURCE_COMMENT_PATTERN.is_a?(Array)
      @@regexp_source_short = regexp_generate_short(@@regexp_source)
    end
    if SHADOWS_CHAR_COMMENT_PATTERN.is_a?(Array)
      @@regexp_char_short = regexp_generate_short(@@regexp_char)
    end
  end
  #--------------------------------------------------------------------------
  # * regexp_generate generate a full length regexp including the arguments
  #   detection.
  #--------------------------------------------------------------------------
  def regexp_generate(source = false)
    if source
      pattern = SHADOWS_SOURCE_COMMENT_PATTERN
      trigger = SHADOWS_SOURCE_COMMENT_TRIGGER
      @@argument_indexes_source = []
      indexes = @@argument_indexes_source
    else
      pattern = SHADOWS_CHAR_COMMENT_PATTERN
      trigger = SHADOWS_CHAR_COMMENT_TRIGGER
      @@argument_indexes_char = []
      indexes = @@argument_indexes_char
    end
    if pattern.is_a?(Array)
      string = Regexp.escape(pattern.join("\n"))
    else
      string = Regexp.escape(pattern)
    end
    string = string.gsub('trigger',')('+trigger+')(')
    splitted = string.split('arg')
    regexp = '\A(' + splitted[0] + '(\d+)){0,1}'
    for i in 1..splitted.size-1
      if splitted[i][0..0].to_i == 0
        p 'Error : You probably forgot a digit after an arg'
        raise
      else
        indexes.push(splitted[i][0..0].to_i)
        regexp = regexp + '(' + splitted[i][1..splitted[i].size-1] + '(\d+)){0,1}'
      end
    end
    return Regexp.new(regexp.chomp('(\d+)){0,1}') + ')')
  end
  #--------------------------------------------------------------------------
  # * Will return a shorter regexp, but still able to identify the trigger
  #--------------------------------------------------------------------------
  def regexp_generate_short(regexp)
    string = regexp.inspect
    string = string.split('\n')[0]
    string = string[1..string.size-2]
    return Regexp.new(string)
  end
  #--------------------------------------------------------------------------
  # * regexp_get_parameters is called whenever a trigger has been identify,
  #   and the script wants to know the arguments. It returns an array in the
  #   right orger [arg1,arg2,arg3]
  #--------------------------------------------------------------------------
  def regexp_get_parameters(string, source = false)
    if source
      regexp = @@regexp_source
      indexes = @@argument_indexes_source.dup
    else
      regexp = @@regexp_char
      indexes = @@argument_indexes_char.dup
    end
    indexes = indexes.reverse!
    match_array = regexp.match(string).captures
    return_array = Array.new
    if match_array.size > 3
      for i in 2..match_array.size-1
        if ((i.to_f/2).ceil)*2 != i and match_array[i]!=nil
          return_array[indexes.pop-1] = match_array[i]
        end
      end
    end
    return return_array
  end
  
end