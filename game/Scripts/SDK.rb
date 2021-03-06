#==============================================================================
# ** RMXP Standard Development Kit (SDK)
#------------------------------------------------------------------------------
# Build Date  - 2005-11-22
# Version 1.0 - Near Fantastica                - 2005-11-22
# Version 1.1 - SephirothSpawn                 - 2005-12-18 - (Near Fantastica)
# Version 1.2 - Near Fantastica                - 2005-12-18 - (Wachunga)
# Version 1.3 - Wachunga                       - 2005-12-19 - (Near Fantastica)
# Version 1.4 - Prexus                         - 2006-03-02 - (SephirothSpawn)
# Version 1.5 - Jimme Reashu                   - 2006-03-25 - (Near Fantastica)
# Version 2.0 - SephirothSpawn / Trickster /
#               Der Drake / Sandgolem          - 2007-02-22 - (SDK Team)
# Version 2.1 - tibuda /alexanderpas / Mr. Mo  - 2007-02-25 - (SephirothSpawn)
# Version 2.2 - SephirothSpawn / Trickster / 
#               tibuda                         - 2007-04-04 - (SDK Team)
# Version 2.3 - Rataime / SephirothSpawn / 
#               Trickster / vgvgf              - 2007-07-22 - (SDK Team)
# Version 2.4 - SephirothSpawn / Trickster     - 2008-07-13 - (SephirothSpawn)
#==============================================================================

#==============================================================================
# ** SDK
#==============================================================================

module SDK
  #--------------------------------------------------------------------------
  # * Include Parts
  #
  #   When a SDK Part, all classes and methods within that class are
  #   included, even if they are not in the individual parts.
  #
  #   Individual Parts allow you to include just a individual method split
  #   from a certain part. This allows you to only use part of a SDK Part,
  #   to allow further compatability.
  #
  # * Individual Part Listings:
  #
  #   Part 2
  #    - 'RPG::Sprite#update'
  #    - 'Game_Map#setup'
  #    - 'Game_Map#update'
  #    - 'Game_Battler#attack_effect'
  #    - 'Game_Battler#skill_effect'
  #    - 'Game_Battler#item_effect'
  #    - 'Game_Battler#slip_damage_effect'
  #    - 'Game_Actor#exp='
  #    - 'Game_Character#update'
  #    - 'Game_Event#refresh'
  #    - 'Game_Player#update'
  #    - 'Sprite_Battler#update'
  #    - 'Spriteset_Map#initialize'
  #    - 'Spriteset_Map#update'
  #    - 'Spriteset_Battle#initialize'
  #    - 'Spriteset_Battle#update'
  #    - 'Window_SaveFile#initialize'
  #
  #   Part 3
  #    - 'Part 3#Scene_Title'
  #    - 'Part 3#Scene_Map'
  #    - 'Part 3#Scene_Menu'
  #    - 'Part 3#Scene_Item'
  #    - 'Part 3#Scene_Skill'
  #    - 'Part 3#Scene_Equip'
  #    - 'Part 3#Scene_Status'
  #    - 'Part 3#Scene_File'
  #    - 'Part 3#Scene_Save'
  #    - 'Part 3#Scene_Load'
  #    - 'Part 3#Scene_End'
  #    - 'Part 3#Scene_Battle'
  #    - 'Part 3#Scene_Shop'
  #    - 'Part 3#Scene_Name'
  #    - 'Part 3#Scene_Gameover'
  #    - 'Part 3#Scene_Debug'
  #
  #   Part 4
  #    - 'Part 4#Scene_Title'
  #    - 'Part 4#Scene_Menu'
  #    - 'Part 4#Scene_End'
  #    - 'Part 4#Scene_Battle'
  #    - 'Part 4#Scene_Shop'
  #--------------------------------------------------------------------------
  Parts = [1, 2, 3, 4, 5]
  Individual_Parts = []
  #--------------------------------------------------------------------------
  # * Show Disable Messages
  #--------------------------------------------------------------------------
  Show_Error_Disable_Message  = true
  Show_Method_Overwrite_Error = true
end

#==============================================================================
# ** SDK Scene Commands
#------------------------------------------------------------------------------
# This module contains all scene commands. This is only needed to be configured
# if you use Part 4 of the SDK, or an individual part that uses part 4.
#==============================================================================

module SDK::Scene_Commands
  #--------------------------------------------------------------------------
  # * Load Data System
  #--------------------------------------------------------------------------
  DataSystem = load_data('Data/System.rxdata')
  
  #============================================================================
  # ** Scene_Title
  #============================================================================
  module Scene_Title
    New_Game = 'Új játék'
    Continue = 'Betöltés'
    Shutdown = 'Kilépés'
  end
  
  #============================================================================
  # ** Scene_Menu
  #============================================================================
  module Scene_Menu
    Item     = DataSystem.words.item
    Skill    = DataSystem.words.skill
    Equip    = DataSystem.words.equip
    Status   = 'Státusz'
    Save     = 'Mentés'
    End_Game = 'Kilépés'
  end
  
  #============================================================================
  # ** Scene_End
  #============================================================================
  module Scene_End
    To_Title = 'Menübe'
    Shutdown = 'Kilépés'
    Cancel   = 'Mégsem'
  end
  
  #============================================================================
  # ** Scene_Battle
  #============================================================================
  module Scene_Battle
    Fight    = 'Fight'
    Escape   = 'Escape'
    Attack   = DataSystem.words.attack
    Skill    = DataSystem.words.skill
    Guard    = DataSystem.words.guard
    Item     = DataSystem.words.item
  end
  
  #============================================================================
  # ** Scene_Shop
  #============================================================================
  module Scene_Shop
    Buy      = 'Vesz'
    Sell     = 'Elad'
    Exit     = 'Kilép'
  end
end

#==============================================================================
# ** RMXP Standard Development Kit (SDK) - Documentation
#==============================================================================

=begin 
  ** 1.0 - SDK Definition & Information

  The Standard Development Kit (SDK) aims to increase compatibility between
  RGSS scripts by:

    a) defining a set of scripting standards (see section 4)
    b) restructuring often-used default classes and methods (see section 5)
    c) providing a scripting tools module (see section 6)
  
  The SDK has been divided up into individual parts, to allow more users to
  use only part of or the complete SDK. It is recommended to use all 4 parts
  of the SDK but is not required. All SDK scripts must use at least part I, 
  but this should not interfer with any other scripts. The Parts are divided
  up as follows :
  
    Part I   : SDK Module ; Standard RGSS Fixes
    Part II  : SDK Modifications - Hidden, Game, Sprite & Spriteset Classes
    Part III : SDK Modifications - Scene Classes
    Part IV  : SDK Modifications - Scene Input Handeling
  
  Using Part I will not cause problems with non-SDK scripts. Parts II - IV
  split up default methods into specialized methods allowing easier 
  modification. Part IV requires Part III.
#------------------------------------------------------------------------------
  * 1.1 - Terms & Conditions for the RMXP Standard Development Kit

  The RMXP SDK Kit is open for any commerical or non-commerical game usage. It
  is required to credit the SDK and all authors found in the SDK script 
  heading.
#==============================================================================
  ** 2.0 - Modifications to the RMXP Standard Development Kit

  Since edits to the SDK may cause massive capability errors, any and all
  modifications must first be approved by a member of the RMXP SDK Team. 

  The author of any modifications must be sure to update all relevant
  documentation. This also includes the header, where the author is to put
  the next version number with his or her name and the name of the approval
  member (from the SDK Team) under the latest version in the following format.

  Version # - Name - Date - (Approval Member Name)

#==============================================================================
  ** 3.0 - Instructions & FAQ
  
  Q) How do I install the SDK?
  A) Copy and Paste The RMXP SDK Complete code into your script editor
     below Scene_Debug, and above all other scripts.
     
  Q) What order do I place my scripts?
  A) There is no simple answer for this. Some scripts overwrite methods or 
     other problems may arise. The most common order of placement is
     
     * Default Scripts
     * The SDK
     * Non-SDK Scripts
     * SDK Scripts
     * Main
     
     However, non-SDK scripts could overwrite SDK methods rendering them
     uselss. If a problem arises, feel free to ask for help 
     here : 
     
     SDK General Support         
      - http://www.rmxp.org/forums/showthread.php?t=17691
     SDK Conversion Request Shop
      - http://www.rmxp.org/forums/showthread.php?t=1985
     
  Q) What is the SDK Patch?
  A) The SDK Patch is for upgrading purpose only. Old SDK methods were renamed,
     deleted, replaced, etc. with new, better methods. This patch is to
     redirect old scripts to use the new methods as the old one. Unless you
     are using a script that requires a previous version of the SDK, you do
     not need to include the patch.
     
  Q) What is compliant? Compatible?
  A) Compliant means that the script you are using follows all guidelines
     set in the coding standards of the SDK. Compatible is scripts that use
     SDK created methods and will not conflict with other SDK scripts (in 
     theory).
  
  Q) I only want to use a certain part of the SDK. Do I need all of them?
  A) No. Only if you are using a script that uses elements of a certain part
     of the SDK are you required to use that part. However, Part I is required
     for use with any other part and part III is required for part IV.
       
  Have more questions? Post them here : 
   - http://www.rmxp.org/forums/showthread.php?t=1802
#==============================================================================
  ** 4.0 - Coding Standards

  To be compliant with the SDK, a script must comply with the following
  coding standards:

  4.1  - Commenting
  4.2  - Classes
  4.3  - Variables
  4.4  - Aliases
  4.5  - Strings
  4.6  - Line Length
  4.7  - White Space
  4.8  - Constants
  4.9  - Parentheses
  4.10 - Versions
#------------------------------------------------------------------------------
  * 4.1 - Commenting

  Scripts must begin with the following header :
 
#==============================================================================
# ** Script Name
#------------------------------------------------------------------------------
# Your Name
# Version
# Date
# SDK Version : (SDK Version Number) - Parts #s
#==============================================================================

  All classes and methods must have a comment describing the process or what
  was added. All code added to methods that can not be aliased must be
  formatted as follows:

  #----------------------------------------------------------------------------
  # Begin Script Name Edit
  #----------------------------------------------------------------------------
  [Code]  
  #----------------------------------------------------------------------------
  # End Script Name Edit
  #----------------------------------------------------------------------------

  Single line comments should precede the described block of code and should be
  indented at the same level. Code that is not self-documenting should be
  commented.
  
  However, very short comments can appear on the same line as the described
  code, but should be shifted far enough to separate them from the statements.
  If more than one short comment appears in a chunk of code, they should all be
  indented to the same tab setting. Attribute declarations should always have a
  trailing comment.
#------------------------------------------------------------------------------
  * 4.2 - Classes

  All classes must be named consistently with the default code, namely:
 
    Data      - Any class that defines database information
    Game      - Any class that defines specific game data for specific session
    Sprite    - Any class that defines a specialized sprite class
    Spriteset - Any class that defines multiple sprites
    Window    - Any class that defines a specialized window class
    Arrow     - Any class that defines a specialized arrow class
    Scene     - Any class that defines a specialized scene class
#------------------------------------------------------------------------------
  * 4.3 - Variables

  All variable names must be reasonably descriptive. Use of class and global
  variables should be limited. Any variable used by the default system can not
  have its use changed.
#------------------------------------------------------------------------------
  * 4.4 - Aliases

  Aliasing a method is preferable to overriding it; an alias should be used
  whenever possible to increase compatibility with other scripts. All aliased
  method names must either be logged, or by using the alias_method method in 
  class Module. All alias names must have the following format:

  alias new_method_name old_method_name
  SDK.log_alias(:class_name, :old_method_name, :new_method_name)
  
  - or -
  
  alias_method :new_method_name, :old_method_name
  
  * Format for New Method Name should be:
  
  yourname_scriptname_classname_methodname / yourname_scriptname_methodname
  
  ** Note : When Aliasing the same method in parent / child-class, it is
            required for you to put class name in the alias naming.
#------------------------------------------------------------------------------
  * 4.5 – Strings
 
  Strings should normally be defined with single quotes ('example'); this
  decreases the processing time of the engine. Double quotes are useful when
  using the following features:
  a) substitutions, i.e. sequences that start with a backslash character
     (e.g. \n for the newline character)
  b) expression interpolation, i.e. #{ expression } is replaced by the value
     of expression
#------------------------------------------------------------------------------
  * 4.6 - Line Length
  
  Lines should not cause the the viewer to have to scroll sideways to view them
  in the script editor. When the line needs to be broken, it should follow the
  following guidelines, in preferential order:
  
    Break after a comma.
    Break before an operator.
    Prefer higher-level breaks to lower-level breaks.
    Align the new line with the beginning of the expression at the same level 
    on the previous line.
  
  If the above rules lead to confusing code or to code that’s squished up 
  against the right margin, just indent 4 spaces instead.
#------------------------------------------------------------------------------
  * 4.7 - White Space
  
  A blank line(s) should be used in the following places:
  
    Between sections of a source file
    Between class and module definitions
    Between attributes and the class definition
    Between methods
    Between the local variables in a method and its first statement
    Before a block or single-line comment
    Between logical sections inside a method to improve readability

  Blank spaces should be used in the following places:
  
    A keyword followed by a parenthesis, e.g. if (some_boolean_statements)
    After commas in argument lists, e.g. def method (arg1, arg2, ...)
    All binary operators except '.', e.g. a + b; c = 1
#------------------------------------------------------------------------------
  * 4.8 - Constants
  
  Numercial values that are used constantly and have the same purpose 
  for being used, is encouraged to be made a constant value instead of being 
  hard coded. Also if a numericial value has a important function that can be 
  changed then it is also encouraged for it to be made a constant.
#------------------------------------------------------------------------------
  * 4.9 - Parentheses
  
  It is generally a good idea to use parentheses liberally in expressions 
  involving mixed operators to avoid operator precedence problems. Even if 
  the operator precedence seems clear to you, it might not be to others -— you 
  shouldn’t assume that other programmers know precedence as well as you do.
#------------------------------------------------------------------------------
  * 4.10 - Versions

  You are required to document the script with the current version. Here is a
  general guideline to recording this. (Thanks to Ccoa)
  
  Format : A.BC (A.B.C is fine except when logging)
  
  A = Main Version or Rewrites
  B = Additions or Modifications
  C = Bug Fixes
  
  Due to the version checking, A.B.C will result in an error if used to log
  your script. Please use the A.BC method when logging script.
#==============================================================================
  ** 5.0 - Engine Updates

  The following is a list of classes and methods that have been updated by the
  SDK to help improve compatibility:

#------------------------------------------------------------------------------
  * 5.0.1 - Part I
  
  * New Classes :
    - SDK::Scene_Base
    - Window_HorizCommand
  
  * Created Methods :
    - Object#disable_dispose, #disable_dispose= & #disable_dispose?
    - Object#disable_update,  #disable_update=  & #disable_update?
    - RPG::Event::Page::Condition#conditions_met?
    - RPG::Event::Page::Condition#conditions_met?
    - Window_Command#command
    - Window_Command#commands
    - Window_Command#commands=
    
  * Bug & Bug Prevention Fixes :
    - Window_Base#dispose
    - Window_SaveFile#initialize
    - Interpreter#command_355
    
  * Deprecated Methods :
    - SDK#print -> SDK#return_log
    - SDK#state -> SDK#enabled?
  
#------------------------------------------------------------------------------
  * 5.0.2 - Part II
    
  * Split Methods :
    - RPG::Sprite#update
      - update_whiten                 # Update Whiten
      - update_appear                 # Update Appear
      - update_escape                 # Update Escape
      - update_collapse               # Update Collapse
      - update_damage                 # Update Damage
      - update_animation_duration     # Update Animation Duration
      - update_loop_animation_index   # Update Loop Animation
      - update_blink                  # Update Blink
    - Window_SaveFile#initialize
      - init_filename                 # Initialize Filename
      - init_filedata                 # Initialize Filedata
      - init_gamedata                 # Initialize Gamedata
    - Game_Map#setup
      - setup_map_id                  # Setup Map ID       
      - setup_load                    # Setup Map Data
      - setup_tileset                 # Setup Tileset Data
      - setup_display                 # Setup Display
      - setup_refresh                 # Setup Refresh
      - setup_events                  # Setup Events
      - setup_common_events           # Setup Common Events
      - setup_fog                     # Setup Fog
      - setup_scroll                  # Setup Scroll
    - Game_Battler#attack_effect
      - attack_effect_setup
      - attack_effect_first_hit_result
      - attack_effect_base_damage
      - attack_effect_element_correction
      - attack_effect_critical_correction
      - attack_effect_guard_correction
      - attack_effect_dispersion
      - attack_effect_second_hit_result
      - attack_effect_damage
      - attack_effect_miss
    - Game_Battler#skill_effect
      - skill_effect_setup
      - skill_effect_scope
      - skill_effect_effective_setup
      - skill_effect_first_hit_result
      - skill_effect_effective_correction
      - skill_effect_power
      - skill_effect_rate
      - skill_effect_base_damage
      - skill_effect_element_correction
      - skill_effect_guard_correction
      - skill_effect_disperation
      - skill_effect_second_hit_result
      - skill_effect_physical_hit_result
      - skill_effect_damage
      - skill_effect_power0
      - skill_effect_miss
      - skill_effect_damagefix
    - Game_Battler#item_effect
      - item_effect_setup
      - item_effect_scope
      - item_effect_effective_setup
      - item_effect_hit_result
      - item_effect_effective_correction
      - item_effect_recovery
      - item_effect_element_correction
      - item_effect_guard_correction
      - item_effect_dispersion
      - item_effect_damage
      - item_effect_parameter_points
      - item_effect_no_recovery
      - item_effect_miss
      - item_effect_damagefix
    - Game_Battler#slip_damage_effect
      - slip_damage_effect_base_damage
      - slip_damage_effect_dispersion
      - slip_damage_effect_damage
    - Game_Map#update
      - update_refresh                # Update Refresh Flag
      - update_scrolling              # Update Scrolling
      - update_events                 # Update Events
      - update_common_events          # Update Common Events
      - update_fog_scroll             # Update Fog Scrolling
      - update_fog_color              # Update Fog Color
      - update_fog                    # Update Fog
    - Game_Actor#exp=
      - level_up                      # Level Actor Up
      - level_down                    # Level Actor Down
    - Game_Character#update
      - update_movement_type          # Update Movement Type
      - update_animation              # Update Animation Counters
      - update_wait?                  # Update Wait Test
      - update_force?                 # Update Force Route Test
      - update_startlock?             # Update Start/Lock Test
      - update_movement               # Update Movement
    - Game_Event#refresh
      - refresh_new_page              # Refresh New Page
      - refresh_page_change?          # Refresh Page Change Test
      - refresh_page_reset?           # Refresh Page Reset Test
      - refresh_set_page              # Refresh Set page variables
      - refresh_check_process         # Check parallel processing
    - Game_Player#update
      - update_player_movement        # Update Player Movement
      - update_plyrmvttest?           # Update Can Move Test
      - update_scroll_down            # Update Scroll Down
      - update_scroll_left            # Update Scroll Left
      - update_scroll_right           # Update Scroll Right
      - update_scroll_up              # Update Scroll Up
      - update_nonmoving              # Update Non-Moving
    - Sprite_Battler#update
      - redraw_battler                # Redraw Battler
      - loop_anim                     # Loop Animaiton
      - adjust_actor_opacity          # Adjust Actor Opacity
      - adjust_blink                  # Adjust Blink
      - adjust_visibility             # Adjust Visibility
      - sprite_escape                 # Sprite Escape
      - sprite_white_flash            # Sprite White Flash
      - sprite_animation              # Sprite Animation
      - sprite_damage                 # Sprite Damage
      - sprite_collapse               # Sprite Collapse
      - sprite_position               # Sprite Position
    - Spriteset_Map#initialize
      - init_viewports                # Initialize Viewports
      - init_tilemap                  # Initialize Tilemap
      - init_panorama                 # Initialize Panorama
      - init_fog                      # Initialize Fog
      - init_characters               # Initialize Characters
      - init_player                   # Initialize Player
      - init_weather                  # Initialize Weather
      - init_pictures                 # Initialize Pictures
      - init_timer                    # Initialize Timer
    - Spriteset_Map#update
      - update_panorama               # Update Panorama
      - update_fog                    # Update Fog
      - update_tilemap                # Update Tilemap
      - update_panorama_plane         # Update Panorama Plane
      - update_fog_plane              # Update Fog Plane
      - update_character_sprites      # Update Character Sprites
      - update_weather                # Update Weather
      - update_picture_sprites        # Update Picture Sprites
      - update_timer                  # Update Timer Sprite
      - update_viewports              # Update Viewports
    - Spriteset_Battle#initialize
      - init_viewport                 # Initialize Viewports
      - init_battleback               # Initialize Battleback
      - init_enemysprites             # Initialize Enemy Sprites
      - init_actorsprites             # Initialize Actor Sprites
      - init_picturesprites           # Initialize Picture Sprites
      - init_weather                  # Initialize Weather
      - init_timer                    # Initialize Timer
    - Spriteset_Battle#update
      - update_battleback             # Update Battleback
      - update_battlers               # Update Actor Battlers
      - update_sprites                # Update Sprites
      - update_weather                # Update Weather
      - update_timer                  # Update Timer
      - update_viewports              # Update Viewports
      
  * Deprecated Methods :
    - Game_Map       : update_fog_colour          -> update_fog_color
    - Game_Character : update_wait                -> update_wait?
    - Game_Character : update_event_execution?    -> update_startlock?
    
#------------------------------------------------------------------------------
  * 5.0.3 - Part III

  All scenes are now child classes of SDK::Scene_Base. You still must alias
  every Scene_Base method even if not defined below.
  
  * Created Methods :
    - Window_EquipItem#disable_update?
    - Window_Message#disable_update?
  
  * Split Methods :
    - Scene_Title#main
      - main_battle_test?             # Main Battle Test Mode Test
      - main_variable                 # Main Variable Initialization
        - main_database               # Main Database Initialization
        - main_test_continue          # Test For Saved Files
      - main_sprite                   # Main Sprite Initialization
      - main_window                   # Main Window Initialization
      - main_audio                    # Main Audio Initialization
    - Scene_Title#command_new_game
      - commandnewgame_audio          # Audio Control
      - commandnewgame_gamedata       # Game Data Setup
      - commandnewgame_partysetup     # Party Setup
      - commandnewgame_mapsetup       # Map Setup
      - commandnewgame_sceneswitch    # Scene Switch
    - Scene_Title#battle_test
      - battletest_database           # Setup Battletest Database
      - commandnewgame_gamedata       # Game Data Setup
      - battletest_setup              # Battletest Setup
      - battletest_sceneswitch        # Scene Switch
    - Scene_Map#main
      - main_spriteset                # Main Spriteset Initialization
      - main_window                   # Main Window Initialization
      - main_end                      # Main End
    - Scene_Map#update
      - update_systems                # Update Systems
      - update_transferplayer?        # Break if Transfer Player
      - update_transition?            # Break if Transition
      - update_game_over?             # Exit If Gameover
      - update_to_title?              # Exit if Title
      - update_message?               # Exit If Message
      - update_transition             # Update Transition
      - update_encounter              # Update Encounter
      - update_call_menu              # Update Menu Call
      - update_call_debug             # Update Debug Call
      - update_calling                # Update Calls
    - Scene_Menu#main
      - main_window                   # Main Window Initialization
        - main_command_window         # Main Command Window Setup
    - Scene_Item#main
      - main_window                   # Main Window Initialization
    - Scene_Skill#main
      - main_variable                 # Main Variable Initialization
      - main_window                   # Main Window Initialization
    - Scene_Equip#main
      - main_variable                 # Main Variable Initialization
      - main_window                   # Main Window Initialization
    - Scene_Status#main
      - main_variable                 # Main Variable Initialization
      - main_window                   # Main Window Initialization
    - Scene_File#main
      - main_variable                 # Main Variable Initialization
      - main_window                   # Main Window Initialization
    - Scene_Save#write_save_data
      - write_characters(file)        # Write Characters
      - write_frame(file)             # Write Frame Count
      - write_setup(file)             # Write Setup Data
      - write_data(file)              # Write Game Data
    - Scene_Load#read_save_data
      - read_characters(file)         # Read Characters
      - read_frame(file)              # Read Frame Count
      - read_data(file)               # Read Game Data 
      - read_edit                     # Read Edit
      - read_refresh                  # Read Refresh
    - Scene_End#main
      - main_window                   # Main Window Initialization
      - main_end                      # Main End
    - Scene_Battle#main
      - main_variable                 # Main Variable Initialization
        - main_battledata             # Setup Battle Temp Data & Interpreter
        - main_troopdata              # Setup Troop Data
      - main_spriteset                # Main Spriteset Initialization
      - main_window                   # Main Window Initialization
      - main_transition               # Main Transition Initialization
      - main_end                      # Main End
    - Scene_Battle#update
      - update_interpreter            # Update Battle Interpreter
      - update_systems                # Update Screen & Timer
      - update_transition             # Update Transition
      - update_message?               # Update Message Test
      - update_sseffect?              # Update Spriteset Effect Test
      - update_gameover?              # Update Gameover Test
      - update_title?                 # Update Title Test
      - update_abort?                 # Update Abort Test
      - update_wait?                  # Update Wait Test
      - update_forcing?               # Update Forcing Test
      - update_battlephase            # Update Battle Phase
    - Scene_Shop#main
      - main_window                   # Main Window Initialization
    - Scene_Name#main
      - main_variable                 # Main Variable Initialization
      - main_window                   # Main Window Initialization
    - Scene_Gameover#main
      - main_sprite                   # Main Sprite Initialization
      - main_audio                    # Main Audio Initialization
      - main_transition               # Main Transition Initialization
      - main_end                      # Main End
    - Scene_Debug#main
      - main_window                   # Main Window Initialization
    
  * Deprecated Methods :
    - Scene_Title   : main_background        -> main_sprite
    - Scene_Title   : main_scenechange?      -> main_break?
    - Scene_Map     : main_draw              -> main_spriteset ; main_window
    - Scene_Map     : main_scenechange?      -> main_break? 
    - Scene_Map     : main_tiletrigger       -> main_end
    - Scene_Map     : update_graphics        -> nil
    - Scene_Map     : update_scene           -> update_calling
    - Scene_Title   : main_windows           -> main_window
    - Scene_Title   : main_scenechange?      -> main_break?
    - Scene_Battle  : main_temp              -> main_battledata
    - Scene_Battle  : main_troop             -> main_troopdata
    - Scene_Battle  : main_command           -> main_windows
    - Scene_Battle  : main_windows           -> main_window
    - Scene_Battle  : main_scenechange?      -> main_break?
    
#------------------------------------------------------------------------------
  * 5.0.4 - Part IV
    
  * Altered Classes :
    - Window_ShopCommand              # Child-class of Window_HorizCommand
    - Window_PartyCommand             # Child-class of Window_HorizCommand
    
  * Rewrote Methods (Methods Created In Part III) :
    - Scene_Title#main_window         # Assigns Commands with SDK Commands
    - Scene_Menu#main_command_window  # Assigns Commands with SDK Commands
    - Scene_End#main_window           # Assigns Commands with SDK Commands
    - Scene_Battle#main_window        # Assigns Commands with SDK Commands
    
  * Command Methods :
    - Scene_Title#update
      - main_command_input            # Command Branch
        - disabled_main_command?      # Test For Disabled Command
    - Scene_Menu#update_command
      - disabled_main_command?        # Test For Disabled Command
      - main_command_input            # Command Branch
        - command_item                # Item Command
        - command_skill               # Skill Command
        - command_equip               # Equip Command
        - command_status              # Status Command
        - command_save                # Save Command
        - command_endgame             # End Game Command
        - active_status_window        # Activate Status Method
    - Scene_Menu#update_status
      - disabled_sub_command?         # Test For Disabled Command
      - sub_command_input             # Command Branch
        - command_skill               # Skill Command
        - command_equip               # Equip Command
        - command_status              # Status Command
    - Scene_End#update
      - disabled_main_command?        # Test For Disabled Command
      - main_command_input            # Branch Command
        - command_to_title            # To Title Command
        - command_shutdown            # Shutdown Command
        - command_cancel              # Cancel Command
    - Scene_Battle#update_phase2
      - phase2_command_disabled?      # Test For Disabled Command
      - phase2_command_input          # Command Branch
        - phase2_command_fight        # Fight Command
        - phase2_command_escape       # Escape Command
    - Scene_Battle#update_phase3_basic_command
      - phase3_basic_command_disabled?  # Test for Disabled Command
      - phase3_basic_command_input    # Command Branch
        - phase3_command_attack       # Attack Command
        - phase3_command_skill        # Skill Command
        - phase3_command_guard        # Guard Command
        - phase3_command_item         # Item Command
    - Scene_Shop#update_command
      - disabled_main_command?        # Test for Disabled Command
      - main_command_input            # Command Branch
        - command_main_buy            # Command Buy
        - command_main_sell           # Command Sell
        - command_exit                # Command Exit
    - Scene_Shop#update_number
      - number_cancel_command_input   # Command Branch
      - number_command_input          # Command Branch
        - command_number_buy          # Command Buy
        - command_number_sell         # Command Sell
    
  * Deprecated Methods :
    - Scene_Menu   : buzzer_check           -> disabled_main_command?
    - Scene_Menu   : update_command_check   -> main_command_input
    - Scene_Menu   : update_status_check    -> sub_command_input
    - Scene_Menu   : command_start_skill    -> command_skill
    - Scene_Menu   : command_start_equip    -> command_equip
    - Scene_Menu   : command_start_status   -> command_status
    - Scene_Battle : check_commands         -> phase3_basic_command_input
    - Scene_Battle : update_phase3_command_attack   -> phase3_command_attack
    - Scene_Battle : update_phase3_command_skill    -> phase3_command_skill
    - Scene_Battle : update_phase3_command_guard    -> phase3_command_guard
    - Scene_Battle : update_phase3_command_item     -> phase3_command_item
        
  * Removed Methods :
    - Scene_Menu#commands_init        -> See SDK::Scene_Commands::Scene_Menu
    - Scene_Battle#commands_init      -> See SDK::Scene_Commands::Scene_Battle
    - Scene_Battle#make_basic_action_result_attack
    - Scene_Battle#make_basic_action_result_guard
    - Scene_Battle#make_basic_action_result_escape
    - Scene_Battle#make_basic_action_result_nothing
    
#------------------------------------------------------------------------------
  * 5.0.5 - Individual Parts Listing
  
    Part 2
     - 'RPG::Sprite#update'
     - 'Game_Map#setup'
     - 'Game_Map#update'
     - 'Game_Battler#attack_effect'
     - 'Game_Battler#skill_effect'
     - 'Game_Battler#item_effect'
     - 'Game_Battler#slip_damage_effect'
     - 'Game_Actor#exp='
     - 'Game_Character#update'
     - 'Game_Event#refresh'
     - 'Game_Player#update'
     - 'Sprite_Battler#update'
     - 'Spriteset_Map#initialize'
     - 'Spriteset_Map#update'
     - 'Spriteset_Battle#initialize'
     - 'Spriteset_Battle#update'
     - 'Window_SaveFile#initialize'
  
    Part 3
     - 'Part 3#Scene_Title'
     - 'Part 3#Scene_Map'
     - 'Part 3#Scene_Menu'
     - 'Part 3#Scene_Item'
     - 'Part 3#Scene_Skill'
     - 'Part 3#Scene_Equip'
     - 'Part 3#Scene_Status'
     - 'Part 3#Scene_File'
     - 'Part 3#Scene_Save'
     - 'Part 3#Scene_Load'
     - 'Part 3#Scene_End'
     - 'Part 3#Scene_Battle'
     - 'Part 3#Scene_Shop'
     - 'Part 3#Scene_Name'
     - 'Part 3#Scene_Gameover'
     - 'Part 3#Scene_Debug'
     
    Part 4
     - 'Part 4#Scene_Title'
     - 'Part 4#Scene_Menu'
     - 'Part 4#Scene_End'
     - 'Part 4#Scene_Battle'
     - 'Part 4#Scene_Shop'
    
#------------------------------------------------------------------------------
  * 5.1 - SDK Module
    
  ~ Constants
   - Version                     : Specifies SDK Version (Float)
   - Parts                       : Specifies SDK Parts   (Array of Integers)
   - Show_Error_Disable_Message  : Show Error Messages   (Boolean)
   - Show_Method_Overwrite_Error : Show Method Errors    (Boolean)
   
  ~ Method Instances
   - @list                       : Specifies Logged Scripts      (Hash)
       Setup : script_name => [ scripter, version, date ]
         script_name : Script Name    (String)
         scripter    : Scripter Name  (String)
         version     : Version Number (Numeric)
         date        : Script Date    (String)
       Default : nil
   - @enabled                    : Specifies Enabled Scripts     (Hash)
       Setup : script_name => boolean
         script_name : Script Name    (String)
         boolean     : true or false
       Default : false
   - @aliases                    : Specifies Aliased Methods     (Hash)
       Setup : script_name => [ [class, old_method, new_method], ... ]
         script_name : Script Name    (String)
         class       : Class Name     (Symbol)
         old_method  : Method Name    (Symbol)
         new_method  : Method Name    (Symbol)
       Default : []
   - @overwrites                 : Specifies Overwrote Methods   (Hash)
       Setup : script_name => [ [class, method], ... ]
         script_name : Script Name    (String)
         method      : Method Name    (Symbol)
       Default : []
   - @method_branch_log          : Specifies SDK Method Branches (Hash)
       Setup : [class, method] => [method, ... ]
         class       : Class Name     (Symbol)
         method      : Method Name    (Symbol)
   - @last_script                : Specifies Last Logged Scripts (String)

  ~ Methods
   - SDK.log(script, name, ver, date)
       script : Script Name   (String)
       name   : Scripter Name (String)
       ver    : Version       (Float)
       date   : Date          (String)
   - SDK.log_alias(classname, oldmethodname, newmethodname)
       classname     : Class Name      (Symbol)
       oldmethodname : Old Method Name (Symbol)
       newmethodname : New Method Name (Symbol)
   - SDK.log_overwrite(classname, methodname)
       classname  : Class Name  (Symbol)
       methodname : Method Name (Symbol)
   - self.log_branch(classname, methodname, *sub_methods)
       classname  : Class Name  (Symbol)
       methodname : Method Name (Symbol)
       submethods : Method Name (Symbol)
   - self.check_requirements(version = 2.3, parts = [1], scripts = [])
       version : Required SDK Version or greater (Float)
       parts   : Required SDK Parts              (Array of Integers)
       scripts : Script Name                     (String)
                 Array of Script Names           (Strings)
                 Hash of Script Name => Version  (Hash)
   - self.check_individual_parts(*individual_parts)
       individual_parts : Part Name              (String)
   - self.enable(script)
       script : Script Name   (String)
   - self.disable(script)
       script : Script Name   (String)
   - self.write(scripts = self.sorted_log, filename = 'Scripts List.txt')
       scripts  : Array of Script Info
       filename : Filename of Log
   - self.write_enabled
   - self.write_aliases
   - self.write_overwrites
   - self.return_log(script = '')
       script : Script Name or No Argument
   - self.return_enabled_log(script = '')
       script : Script Name or No Argument
   - self.return_alias_log(script = '')
       script : Script Name or No Argument
   - self.return_overwrite_log(script = '')
       script : Script Name or No Argument
   - self.text_box_input(element, index)
   - self.event_comment_input(*args)
#==============================================================================
  6.0 - SDK Tools

  The following tools are included in the SDK to help improve the development
  process:

  6.1 - Logging Scripts
  6.2 - Checking Script Requirements (Script Dependencies)
  6.3 - Logging Aliased & Overwrote Methods
  6.4 - Enabling/Disabling Scripts
  6.5 - Standard Text Box Input
  6.6 - Standard Event Comment Input
  6.7 - Scene_Base

  6.8 - Scene Command Input
#------------------------------------------------------------------------------
  * 6.1 – Logging Scripts

  All SDK-compliant scripts should be logged. This is done by calling the
  SDK.log(script, name, ver, date) method, where

  script = script name
  name   = your name
  ver    = version
  date   = date last updated
#------------------------------------------------------------------------------
  * 6.2 - Checking SDK Requirements
  
  All SDK-compliant scripts must check for for the current SDK version and
  required SDK parts. This is done by calling : 
  
  SDK.check_requirements(version, [parts], [scripts])
  
  or
  
  SDK.check_requirements(version, [parts], {scripts})
  
  
  version = Required Version of SDK (or greater)
  parts   = Array of all SDK required parts (part 1 is not required)
  scripts = Array of required script names
  
  or
  
  scripts = Hash with script names as key and required min version as values
  
  If the requirements are not met, the script will be disabled and an error
  will be given on why the script was disabled.
  
  * 6.2.1 - Checking SDK individual parts
  
  You may check individual parts instead of entire parts using the following
  method:
  
  SDK.check_individual_parts(*individual_parts)
  
  This is none-case sensitive, but be sure to one of the individual part
  names outlined in 5.0.5
  
#------------------------------------------------------------------------------
  * 6.3 - Logging Aliased & Overwrote Methods
  
  Aliased methods must be logged using :
  
    alias_method :yourname_scriptname_classname_methodname, :oldmethodname
    
  or
  
    alias yourname_scriptname_classname_methodname oldmethodname
    SDK.log_alias(:classname, :oldmethodname, :newmethodname)
  
  
  Overwrote methods must be logged using :
  
  SDK.log_overwrite(:classname, :methodname)
  
  The reason for this is there is an auto-error detection system that will 
  check method overwrites for compatability issues.
#------------------------------------------------------------------------------
  * 6.4 – Enabling/Disabling Scripts

  When a script is logged it is also enabled. A script can be enabled and
  disabled using the following calls:

  SDK.enable('Script Name') 
  SDK.disable('Script Name')

  All non-default scripts (and code added to default scripts) must be enclosed
  in an if statement that checks whether or not they have been enabled, as
  follows:
  
  #--------------------------------------------------------------------------
  # Begin SDK Enabled Check
  #--------------------------------------------------------------------------
  if SDK.enabled?('Script Name')
    
    [Script or Code]
    
  end
  #--------------------------------------------------------------------------
  # End SDK Enabled Test
  #--------------------------------------------------------------------------

  Keep in mind that this if statement can not continue on to other pages and
  every page needs its own if statement testing the state of the script. As
  well every script should have its own test.
#------------------------------------------------------------------------------
  * 6.5 – Standard Text Box Input
  
  Any script that requires input from a database text field should use the
  following:
  
  SDK.text_box_input(element, index)
  
  where:
  element = an object of the text field
  index   = the index in which your script call falls
    
  The text field should be formatted in the following way:
  
  "Default value | script call | script call"
#------------------------------------------------------------------------------
  * 6.6 – Standard Event Comment Input
  
  Any script that requires input from an event comment should use the 
  following:
  
  SDK.event_comment_input(event, elements, trigger)
  
  where:
  event    = an object of the event
  elements = the number of elements the method is to process
  trigger  = the text value triggering the script to start processing
  
  or 
  
  SDK.event_comment_input(page, elements, trigger)
  
  where:
  page     = an object of the event.page
  elements = the number of elements the method is to process
  trigger  = the text value triggering the script to start processing
  
  The method returns nil if the trigger can not be found; otherwise, it
  returns a list of the parameters from the event.
#------------------------------------------------------------------------------
  * 6.7 – Scene Base (Part I)

  This script was designed to act as a parent class for all scenes. It
  provides 2 major purposes :

  a) Give the Main Processing Method a Common Structure
  b) Automatically Update & Dispose All Spritesets, Sprites, Windows or
     any other instance variable that responds to :update or :dispose

   This is a script for developers, not non-scripters. If you do not
   plan to create scenes in RMXP, this isn't needed.
  
  The SDK::Scene_Base class divides the main processing method into :
  
    main_variable
    main_spriteset
    main_sprite
    main_window
    main_audio
    main_transition
    main_loop
    main_update
    main_breaktest
    main_dispose
    main_end
    
  When making scenes, make Scene_Base the parent class. Organize the
  creation of variables, spritesets, sprites, windows and audio within these
  methods:

    main_variable       Used for Variables Non-Sprite or Window Related
    main_spriteset      Used for spriteset setup
    main_sprite         Used for sprite setsup
    main_window         Used for window setup
    main_audio          Used for Audio setup

  You need to only use methods needed and others may be leftout. It is
  advised to place super calls within these methods, in case of further
  updates or additions to the SDK::Scene_Base class.

  ** Notes **

  main_transition

  This method can can be left alone unless you are wanting to alter from
  the default Graphics.transition call.

  main_loop / main_update

  This method updates the Graphics and Input modules. It is advised to add
  other module updates directly to the Scene_Base class (such as the
  Keyboard or Mouse Module). The sub-method to this is main_update, where
  the automatic update takes place of objects.
  
    ** Special Note On Automatic Update & Dispose
    
    The autoupdate and autodispose method will test every instance object
    to check if it responds to the method names list below. This will pass
    through arrays and hashes as well.
    
    Basic Update Processing
    
    if object responds to :update
      if object responds to :disable_update?
        return if object :disable_update?
      end
      update object
    end
    
    Basic Dispose Processing
    
    if object responds to :dispose
      if object responds to :disposed?
        return if object :disposed?
      end
      dispose object
    end

  main_breaktest

  This method test to break the scene loop. By default, it returns true
  only when the $scene changes to another scene class.

  main_dispose

  Like the main_update method, this method is designed to automatically
  dispose all instance variables.

  main_end

  This method was added on in the event you are wanting to add additional
  coding after the scene has been executed and exited.
#------------------------------------------------------------------------------
  * 5.8 - Scene Command Input (Part IV)
  
  The SDK has a sub-module (SDK::Scene_Commands) that holds more sub-modules
  containing constants for scene commands. Each sub-module of Scene_Commands
  should match the name of the scene you are adding commands to. If you add
  any commands to the default scenes, the commands are to be placed with here.
  It is advised that any custom scenes you create with command windows are
  added here as well.
  
  Each C trigger branch is set up as the following :
  
  if Input.trigger?(Input::C)
    if <phasename>_command_disabled?
      <play_buzzer_se>
      return
    end
    <phasename>_command_input
  end
  
  Commands are not to be branched by the index, but the command using
  
  <your_command_window>.command
  
  Each command is to have its own method, for simpler modification.
  
  
  * Changes in the Window_Command class 
  
  The window command class now has added methods, Window_Command#command and
  Window_Command#commands=. The #command method returns the current command
  depending upon the index (by default ; can pass alternate index). The
  #commands= method allows you to reset the commands. This method automatically
  resets the windows contents, item max, etc. if a change occurs.
  
  
  * Changes in Horizontal Command classes
  
  The creation of a Window_HorizCommand class has been created to match the
  Window_Command class, just horizonatally. All methods of Window_Command are
  found in this class (default and SDK created methods). The default classes
  Window_ShopCommand and Window_PartyCommand have been rewrote, using this
  class.
    
    
  * For more information, refer to Part IV
=end #=========================================================================

#==============================================================================
# ** RMXP Standard Development Kit (SDK) - Update Patch
#------------------------------------------------------------------------------
# ** Patch Details
#
#  This patch was created to fix method renames, deprecated methods, etc. to
#  make scripts specifically designed with an older version of the SDK to
#  work with the new updated version.
#
#  However, the the commands initialization and command input have been
#  completely removed, so if any of the scripts use these methods, the
#  script will be removed until a later date. We are considering an improved
#  way of handeling, adding and customizing options to scenes.
#
#  If you do not use old scripts that require previous versions, it is
#  suggested to not have this patch in your project.
#==============================================================================

#==============================================================================
# ** Enable Part V Check
#==============================================================================
if SDK::Parts.include?(5)

#==============================================================================
# ** SDK
#==============================================================================

module SDK
  #--------------------------------------------------------------------------
  def self.print(script = '')
    return self.return_log(script)
  end
  #--------------------------------------------------------------------------
  def self.state(script)
    return self.enabled?(script)
  end
  #--------------------------------------------------------------------------
  def self.using_old_method
    p 'You are using a script that uses an old element of the SDK. Using ' +
      'this script will cause incompatibility with new versoins of the ' + 
      'SDK. You must either modify, remove or request for the script to ' +
      'be made compatable with the new SDK. We are sorry for the trouble.'
  end
  #--------------------------------------------------------------------------
  def self.part_included_for_patch?(part_required, method)
    # Return true If Part Include
    return true if Parts.include?(part_required)
    # If Part Not Included
    p 'You are trying to use the method ' + method + ', which is an ' +
      'old SDK method. You need to either enable part ' + part_required.to_s +
      ' of the SDK, or modify your script using this method.'
    # Return False
    return false
  end
end

#==============================================================================
# ** Game_Map
#==============================================================================

class Game_map
  #--------------------------------------------------------------------------
  def update_fog_colour
    method = 'Game_Map#update_fog_colour'
    update_fog_color if SDK.part_included_for_patch?(2, method)
  end
end

#==============================================================================
# ** Game_Character
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  def update_wait
    method = 'Game_Character#update_wait'
    return update_wait? if SDK.part_included_for_patch?(2, method)
  end
  #--------------------------------------------------------------------------
  def update_event_execution?
    method = 'Game_Character#update_event_execution?'
    return update_startlock? if SDK.part_included_for_patch?(2, method)
  end
end

#==============================================================================
# ** Scene_Title
#==============================================================================

class Scene_Title
  #--------------------------------------------------------------------------
  def main_background
    method = 'Scene_Title#main_background'
    main_sprite if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_windows
    method = 'Scene_Title#main_windows'
    main_window if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_scenechange?
    method = 'Scene_Title#main_scenechange?'
    return main_break? if SDK.part_included_for_patch?(3, method)
  end
end

#==============================================================================
# ** Scene_Map
#==============================================================================

class Scene_Map
  #--------------------------------------------------------------------------
  def main_draw
   if SDK.part_included_for_patch?(3, 'Scene_Map#main_draw')
      main_spriteset
      main_window
    end
  end
  #--------------------------------------------------------------------------
  def main_scenechange?
    method = 'Scene_Map#main_scenechange?'
    return main_break? if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_tiletrigger
    main_end if SDK.part_included_for_patch?(3, 'Scene_Map#main_tiletrigger')
  end
  #--------------------------------------------------------------------------
  def update_graphics
  end
  #--------------------------------------------------------------------------
  def update_scene
    method = 'Scene_Map#main_scenechange?'
    update_calling if SDK.part_included_for_patch?(3, method)
  end
end

#==============================================================================
# ** Scene_Battle
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  def main_temp
    method = 'Scene_Battle#main_temp'
    main_battledata if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_troop
    method = 'Scene_Battle#main_troop'
    main_troopdata if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_command
    method = 'Scene_Battle#main_command'
    main_windows if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_windows
    method = 'Scene_Battle#main_windows'
    main_window if SDK.part_included_for_patch?(3, method)
  end
  #--------------------------------------------------------------------------
  def main_scenechange?
    method = 'Scene_Battle#main_scenechange?'
    return main_break? if SDK.part_included_for_patch?(3, method)
  end
end

#==============================================================================
# ** Scene_Menu
#==============================================================================

class Scene_Menu
  #--------------------------------------------------------------------------
  def buzzer_check
    method = 'Scene_Menu#buzzer_check'
    return disabled_main_command? if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_command_check
    method = 'Scene_Menu#update_command_check'
    main_command_input if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_status_check
    method = 'Scene_Menu#update_status_check'
    sub_command_input if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def command_start_skill
    method = 'Scene_Menu#command_start_skill'
    command_skill if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def command_start_equip
    method = 'Scene_Menu#command_start_equip'
    command_equip if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def command_start_status
    method = 'Scene_Menu#command_start_status'
    command_status if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def commands_init
    SDK.using_old_method
  end
end

#==============================================================================
# ** Scene_Battle
#==============================================================================

class Scene_Battle
  #--------------------------------------------------------------------------
  def check_commands
    method = 'Scene_Battle#check_commands'
    phase3_basic_command_input if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_phase3_command_attack
    method = 'Scene_Battle#update_phase3_command_attack'
    phase3_command_attack if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_phase3_command_skill
    method = 'Scene_Battle#update_phase3_command_skill'
    phase3_command_skill if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_phase3_command_guard
    method = 'Scene_Battle#update_phase3_command_guard'
    phase3_command_guard if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def update_phase3_command_item
    method = 'Scene_Battle#update_phase3_command_item'
    phase3_command_item if SDK.part_included_for_patch?(4, method)
  end
  #--------------------------------------------------------------------------
  def commands_init
    SDK.using_old_method
  end
  #--------------------------------------------------------------------------
  def make_basic_action_result_attack
    SDK.using_old_method
  end
  #--------------------------------------------------------------------------
  def make_basic_action_result_guard
    SDK.using_old_method
  end
  #--------------------------------------------------------------------------
  def make_basic_action_result_escape
    SDK.using_old_method
  end
  #--------------------------------------------------------------------------
  def make_basic_action_result_nothing
    SDK.using_old_method
  end
end
  
#==============================================================================
# ** Ends Enable Part V Check
#==============================================================================
end

#==============================================================================
# ** SDK Vocab
#------------------------------------------------------------------------------
# This module is the same as SDK::Scene_Commands.
#==============================================================================

module SDK::Vocab
  include SDK::Scene_Commands
end

#==============================================================================
# ** SDK
#==============================================================================

module SDK
  #--------------------------------------------------------------------------
  # * Version & Parts Log Correction
  #--------------------------------------------------------------------------
  Version = 2.4
  Parts << 1      unless Parts.include?(1)
  Parts.delete(4) if Parts.include?(4) && !Parts.include?(3)
  Individual_Parts.collect! {|i| i.upcase}
  #--------------------------------------------------------------------------
  # * Individual Parts - Part Section
  #--------------------------------------------------------------------------
  Individual_Parts_Sections = {}
  for ind in ['RPG::Sprite#update', 'Game_Map#setup', 
    'Game_Map#update', 'Game_Battler#attack_effect', 
    'Game_Battler#skill_effect', 'Game_Battler#item_effect', 
    'Game_Battler#slip_damage_effect', 'Game_Actor#exp=', 
    'Game_Character#update', 'Game_Event#refresh', 'Game_Player#update', 
    'Sprite_Battler#update', 'Spriteset_Map#initialize', 
    'Spriteset_Map#update', 'Spriteset_Battle#initialize', 
    'Spriteset_Battle#update', 'Window_SaveFile#initialize']
    Individual_Parts_Sections[ind.upcase] = 2
  end
  for ind in ['Part 3#Scene_Title', 'Part 3#Scene_Map', 'Part 3#Scene_Menu',
    'Part 3#Scene_Item', 'Part 3#Scene_Skill', 'Part 3#Scene_Equip',
    'Part 3#Scene_Status', 'Part 3#Scene_File', 'Part 3#Scene_Save',
    'Part 3#Scene_Load', 'Part 3#Scene_End', 'Part 3#Scene_Battle',
    'Part 3#Scene_Shop', 'Part 3#Scene_Name', 'Part 3#Scene_Gameover',
    'Part 3#Scene_Debug']
    Individual_Parts_Sections[ind.upcase] = 3
  end
  for ind in ['Part 4#Scene_Title', 'Part 4#Scene_Menu', 'Part 4#Scene_End',
    'Part 4#Scene_Battle', 'Part 4#Scene_Shop']
    Individual_Parts_Sections[ind.upcase] = 4
  end
  #--------------------------------------------------------------------------
  # * Script, Alias, Overwrite & Method Branch Log Logging
  #--------------------------------------------------------------------------
  @list               = {}
  @enabled            = {}
  @enabled.default    = false
  @aliases            = {}
  @aliases.default    = []
  @overwrites         = {}
  @overwrites.default = []
  @method_branch_log  = {}
  @last_script        = 'SDK'
  #--------------------------------------------------------------------------
  # * Logs a custom script
  #--------------------------------------------------------------------------
  def self.log(script, name, ver, date)
    # Logs Script
    @list[script]    = [name, ver, date]
    # Enables Script
    @enabled[script] = true
    # Sets Last Script
    @last_script     = script
  end
  #--------------------------------------------------------------------------
  # * Logs an alias
  #--------------------------------------------------------------------------
  def self.log_alias(classname, oldmethodname, newmethodname)
    # Gets Value
    value = [classname, oldmethodname, newmethodname]
    # Convert Values to Symbols
    value.collect! { |x| (x.is_a?(Symbol) ? x : x.to_s.to_sym) }
    # Creates Array
    @aliases[@last_script] = [] unless @aliases.has_key?(@last_script)
    # Logs Alias
    @aliases[@last_script] << value
    # Check for overwrites
    self.check_for_overwrites(value) if Show_Method_Overwrite_Error
  end
  #--------------------------------------------------------------------------
  # * Logs an overwrite
  #--------------------------------------------------------------------------
  def self.log_overwrite(classname, methodname)
    # Gets Value
    value = [classname, methodname]
    # Convert Values to Symbols
    value.collect! { |x| (x.is_a?(Symbol) ? x : x.to_s.to_sym)}
    # Creates Array
    @overwrites[@last_script] = [] unless @overwrites.has_key?(@last_script)
    # Stop if Overwrite Logged
    return if @overwrites[@last_script].include?(value)
    # Log Overwrite
    @overwrites[@last_script] << value
    # Check for aliases
    self.check_for_aliases(value) if Show_Method_Overwrite_Error
  end
  #--------------------------------------------------------------------------
  # * Logs an method branch
  #--------------------------------------------------------------------------
  def self.log_branch(classname, methodname, *sub_methods)
    # Creates Key
    key = [classname, methodname]
    # Convert Values to Symbols
    key.collect! { |x| (x.is_a?(Symbol) ? x : x.to_s.to_sym)}
    # Creates Sub Method List (if none yet recorded)
    @method_branch_log[key] = [] unless @method_branch_log.has_key?(key)
    # Adds New Sub Methods
    @method_branch_log[key] << sub_methods
    # Organize Sub Method List
    @method_branch_log[key].flatten!
    @method_branch_log[key].uniq!
  end
  #--------------------------------------------------------------------------
  # * Check Requirements
  #--------------------------------------------------------------------------
  def self.check_requirements(version = 2.3, parts = [1], scripts = [])
    # Start Missing Requirements
    missing_reqs = {}
    # Checks Version
    missing_reqs[0] = version unless Version >= version
    # Checks Required Part
    for part in parts
      unless Parts.include?(part)
        missing_reqs[1] = parts
        break
      end
    end
    # Checks Required Scripts
    if scripts.is_a?(String)
      unless self.enabled?(scripts)
        missing_reqs[2] = [] unless missing_reqs.has_key?(2)
        missing_reqs[2] << scripts
      end
    elsif scripts.is_a?(Array)
      for script in scripts
        unless self.enabled?(script)
          missing_reqs[2] = [] unless missing_reqs.has_key?(2)
          missing_reqs[2] << script
        end
      end
    elsif scripts.is_a?(Hash)
      scripts.each do |script, v|
        if self.enabled?(script) == false
          missing_reqs[2] = [] unless missing_reqs.has_key?(2)
          missing_reqs[2] << script
        elsif self.enabled?(script, v) == false
          missing_reqs[3] = {} unless missing_reqs.has_key?(3)
          missing_reqs[3][script] = v
        end
      end
    end
    # If Script Needing Disabled
    unless missing_reqs.size == 0
      # Disable Script
      self.disable(@last_script)
      # If Show Auto Disable Script Message
      if Show_Error_Disable_Message
        # Show Error Message
        self.auto_disable_script_message(@last_script, missing_reqs)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Check Individual Parts
  #--------------------------------------------------------------------------
  def self.check_individual_parts(*ind_parts)
    # Starts Empty Missing Array
    missing = []
    # Pass through methods
    ind_parts.each do |ind_part|
      # Skip if Individual Part Include
      next if Individual_Parts.include?(ind_part.upcase)
      # Skip if Complete Part Included
      next if Parts.include?(Individual_Parts_Sections[ind_part.upcase])
      # Add Missing Part
      missing << ind_part.upcase
    end
    # If Script Needing Disabled
    unless missing_reqs.size == 0
      # Disable Script
      self.disable(@last_script)
      # If Show Auto Disable Script Message
      if Show_Error_Disable_Message
        # Print message
        p 'The following individual sections are needed for the script ' +
          @last_script + ' to work: ' + missing.join(', ')
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Enables the passed script
  #--------------------------------------------------------------------------
  def self.enable(script)
    @enabled[script] = true
  end
  #--------------------------------------------------------------------------
  # * Disables the passed script
  #--------------------------------------------------------------------------
  def self.disable(script)
    @enabled[script] = false
  end
  #--------------------------------------------------------------------------
  # * Enabled Test
  #--------------------------------------------------------------------------
  def self.enabled?(script, version = nil)
    # If Version Specified & List Included
    if version != nil && @list.has_key?(script)
      # Return False Unless Script Version High Enough
      return false unless @list[script][1] >= version
    end
    # Return Enabled
    return @enabled[script]
  end
  #--------------------------------------------------------------------------
  # * Writes a list of the custom scripts to a file
  #--------------------------------------------------------------------------
  def self.write(scripts = self.sorted_log, filename = 'Scripts List.txt')
    # Opens / Creates File & Writes Script Listings
    file = File.open(filename, 'wb')
    for script in scripts
      l = "#{script[0]} : #{script[1]} Version #{script[2]} (#{script[3]})\n"
      file.write(l)
    end
    file.close
  end
  #--------------------------------------------------------------------------
  # * Writes a list of the enabled scripts to a file
  #--------------------------------------------------------------------------
  def self.write_enabled
    self.write(self.sorted_enabled_log, 'Enabled Script List.txt')
  end
  #--------------------------------------------------------------------------
  # * Writes a list of the aliases
  #--------------------------------------------------------------------------
  def self.write_aliases
    # Opens / Creates File & Writes Script Listings
    file = File.open('Alias List.txt', 'wb')
    for line in self.sorted_alias_log
      file.write("#{line}\n")
    end
    file.close
  end
  #--------------------------------------------------------------------------
  # * Writes a list of the overwrites
  #--------------------------------------------------------------------------
  def self.write_overwrites
    # Opens / Creates File & Writes Script Listings
    file = File.open('Overwrites List.txt', 'wb')
    for line in self.sorted_overwrite_log
      file.write("#{line}\n")
    end
    file.close
  end
  #--------------------------------------------------------------------------
  # * Returns a list of custom scripts
  #--------------------------------------------------------------------------
  def self.return_log(script = '')
    return script == '' || @list.include?(script) == false ? 
      self.sorted_log : @list[script]
  end
  #--------------------------------------------------------------------------
  # * Returns a list of enabled scripts
  #--------------------------------------------------------------------------
  def self.return_enabled_log(script = '')
    return script == '' || self.enabled?(script) == false ? 
      self.sorted_enabled_log : @enabled[script]
  end
  #--------------------------------------------------------------------------
  # * Returns alias log
  #--------------------------------------------------------------------------
  def self.return_alias_log(script = '')
    return script == '' || @list.include?(script) == false ?
      self.sorted_alias_log : @aliases[script]
  end
  #--------------------------------------------------------------------------
  # * Returns overwrite log
  #--------------------------------------------------------------------------
  def self.return_overwrite_log(script = '')
    return script == '' || @list.include?(script) == false ?
      self.sorted_overwrite_log : @overwrites[script]
  end
  #--------------------------------------------------------------------------
  # * Sort Script List
  #
  #   sort_type : 0 - Scripter, 1 - Script Name
  #--------------------------------------------------------------------------
  def self.sorted_log(sort_type = 0)
    # Creates Sorted Nested Array
    nested = @list.sort do |a, b|
      sort_type == 0 ? a[1][0] <=> b [1][0] : a[0] <=> b[0]
    end
    # Creates Sorted List
    lst = []
    nested.each do |x|
      x.flatten!
      lst << ((sort_type == 0 ? [x[1], x[0]] : [x[0], x[1]]) << x[2] << x[3])
    end
    # Return List
    return lst
  end
  #--------------------------------------------------------------------------
  # * Sort Enabled Script List
  #
  #   sort_type : 0 - Scripter, 1 - Script Name
  #--------------------------------------------------------------------------
  def self.sorted_enabled_log(sort_type = 0)
    # Creates Sorted Nested Array
    nested = @list.sort do |a, b|
      sort_type == 0 ? a[1][0] <=> b [1][0] : a[0] <=> b[0]
    end
    # Creates Sorted List
    lst = []
    nested.each do |x|
      next unless @enabled[x[0]]
      x.flatten!
      lst << ((sort_type == 0 ? [x[1], x[0]] : [x[0], x[1]]) << x[2] << x[3])
    end
    # Return List
    return lst
  end
  #--------------------------------------------------------------------------
  # * Sort Alias List
  #--------------------------------------------------------------------------
  def self.sorted_alias_log
    # Creates Sorted List
    lst = []
    for sname in @aliases.keys.sort
      for a in @aliases[sname]
        c, o, n = "Class: #{a[0]}", "Old Name: #{a[1]}", "New Name: #{a[2]}"
        lst << "#{sname} -  #{c} - #{o} - #{n}"
      end
    end
    # Return List
    return lst
  end
  #--------------------------------------------------------------------------
  # * Sort Overwrite List
  #--------------------------------------------------------------------------
  def self.sorted_overwrite_log
    # Creates Sorted List
    lst = []
    for sname in @overwrites.keys.sort
      lst << "#{sname} -  Class: #{o[0]} - Method:#{o[1]}"
    end
    # Return List
    return lst
  end
  #--------------------------------------------------------------------------
  # * Show Auto Disable Error Message
  #
  #   Missing Reqs = { type => parameters }
  #
  #   Type 0 : Not High Enough Version
  #    Parameters : [version_required]
  #
  #   Type 1 : SDK Parts Missing
  #    Parameters : [part, ...]
  #
  #   Type 2 : Missing Script
  #    Parameters : [script, ...]
  #
  #   Type 3 : Not High Enough Script Version
  #    Parameters : {script => version, ...}
  #--------------------------------------------------------------------------
  def self.auto_disable_script_message(script, missing_reqs)
    # Start Message Text
    t = 'The following script has been disabled : ' + script
    # If Missing Reqs Specified
    unless missing_reqs.size == 0
      # Adds Message Text
      t += ' for the following reasons : '
      ta = []
      # Pass Through Missing Reqs
      missing_reqs.each do |type, parameters|
        # Branch By Type
        case type
        when 0 # Not High Enough SDK Version
          ta << 'SDK version not high enough version. Please update to ' +
               'at least version ' + parameters.to_s
        when 1 # Missing SDK Part
          ta << 'You are missing part of the SDK. Please add the following ' +
               'parts - ' + parameters.join(' & ')
        when 2 # Missing Scripts
          parameters.each do |script|
            ta << 'Script missing - ' + script
          end
        when 3 # Not High Enough Version
          parameters.each do |script, v|
            ta << 'Script not high enough version - ' + script + 
                 ' (Required ' + v.to_s + ' or higher)'
          end
        end
      end
      # Add Message Text
      t += ta.join(' ; ')
    end
    # Print Error Message
    p t
  end
  #--------------------------------------------------------------------------
  # * Check for Overwrites
  #
  #   Value = [classname, oldmethodname, newmethodname]
  #--------------------------------------------------------------------------
  def self.check_for_overwrites(value)
    # Pass Through All Method Branches
    @method_branch_log.each do |classmethod, submethods|
      # If Class name matches & Sub Methods Include Method
      if classmethod[0] == value[0] && submethods.include?(value[1])
        # Pass Throug All Script Overwrites
        @overwrites.each do |script, overwrites|
          # Pass Through Overwrite List
          overwrites.each do |cm|
            # If Method Matches
            if classmethod == cm
              # Print Error
              p 'The following script will not work : ' + @last_script,
                'Reason : The (' + script + ') overwrites the ' + 
                'method ' + cm[1].to_s + ' erasing the branched method ' +
                value[1].to_s + ' branched from ' + value[0].to_s + ' that ' +
                'the ' + script + ' uses'
              return
            end
          end
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Check for Aliases
  #
  #   Value = [classname, methodname]
  #--------------------------------------------------------------------------
  def self.check_for_aliases(value)
    # Check If Method Ever Aliased
    @aliases.each do |script, list|
      # Pass Through Alias List
      list.each do |con|
        # If Class & Method Match
        if con[0] == value[0] && con[1] == value[1]
          # Print Error
          p 'The following script will not work : ' + script,
            'Reason : The (' + @last_script + ') overwrites the method ' +
            value[1].to_s + ' aliased from ' + "#{con[1]} to #{con[2]}" +
            'found in class ' + value[0]
        end
      end
    end
    # Pass Through All Method Branches
    @method_branch_log.each do |classmethod, submethods|
      # If Class name matches & Sub Methods Include Method
      if classmethod == value
        # Pass Through Aliases
        @aliases.each do |script, list|
          # Pass Through Alias List
          list.each do |con|
            # If Sub Methods Include Old Method
            if submethods.include?(con[1])
              # Print Error
              p 'The following script will not work : ' + script,
                'Reason : The (' + @last_script + ') overwrites the ' + 
                'method ' + con[1].to_s + ' erasing the branched method ' +
                value[1].to_s + ' branched from ' + value[0].to_s + ' that '+
                'the ' + script + ' uses'
            end
          end
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Evals text from an input source
  #--------------------------------------------------------------------------
  def self.text_box_input(element, index)
    return if index == 0
    commands = element.split('|')
    eval(commands[index])
  end
  #--------------------------------------------------------------------------
  # * Returns a list of parameters from an event's comments
  #--------------------------------------------------------------------------
  def self.event_comment_input(*args)
    parameters = []
    list = *args[0].list
    elements = *args[1]
    trigger = *args[2]
    return nil if list == nil
    return nil unless list.is_a?(Array)
    for item in list
      next unless item.code == 108 || item.code == 408
      if item.parameters[0] == trigger
        start = list.index(item) + 1
        finish = start + elements
        for id in start...finish
          next if !list[id]
          parameters.push(list[id].parameters[0])
        end
        return parameters
      end
    end
    return nil
  end
end

#==============================================================================
# ** SDK::Scene Base
#==============================================================================

class SDK::Scene_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    @previous_scene = $scene.class
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    main_variable                 # Main Variable Initialization
    main_spriteset                # Main Spriteset Initialization
    main_sprite                   # Main Sprite Initialization
    main_window                   # Main Window Initialization
    main_audio                    # Main Audio Initialization
    main_transition               # Main Transition Initialization
    loop do                       # Scene Loop
      main_loop                   # Main Loop
      break if main_break?        # Break If Breakloop Test 
    end                           # End Scene Loop
    Graphics.freeze               # Prepare for transition
    main_dispose                  # Main Dispose
    main_end                      # Main End
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable   ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Spriteset Initialization
  #--------------------------------------------------------------------------
  def main_spriteset  ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Sprite Initialization
  #--------------------------------------------------------------------------
  def main_sprite     ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window     ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Audio Initialization
  #--------------------------------------------------------------------------
  def main_audio      ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Transition
  #--------------------------------------------------------------------------
  def main_transition
    Graphics.transition
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Loop
  #--------------------------------------------------------------------------
  def main_loop
    Graphics.update             # Update game screen
    Input.update                # Update input information
    main_update                 # Update scene objects
    update                      # Update Processing
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Break Loop Test
  #--------------------------------------------------------------------------
  def main_break?
    return $scene != self # Abort loop if sceen is changed
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Disposal
  #--------------------------------------------------------------------------
  def main_dispose
    # Passes Through All Instance Variables
    self.instance_variables.each do |object_name|
      # Evaluates Object
      object = eval object_name
      # Pass Object To Auto Dispose
      auto_dispose(object)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Ending
  #--------------------------------------------------------------------------
  def main_end        ; end
  #--------------------------------------------------------------------------
  # * Main Processing : Update
  #--------------------------------------------------------------------------
  def main_update
    # Passes Through All Instance Variables
    self.instance_variables.each do |object_name|
      # Evaluates Object
      object = eval object_name
      # Pass Object To Auto Update
      auto_update(object)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Auto Update
  #--------------------------------------------------------------------------
  def auto_update(object)
    # Return If Object isn't a Hash, Array or Respond to Update
    return unless object.is_a?(Hash) || object.is_a?(Array) || 
                  object.respond_to?(:update)
    # If Hash Object
    if object.is_a?(Hash)
      object.each do |key, value|
        # Pass Key & Value to Auto Update
        auto_update(key) ; auto_update(value)
      end
      return
    end
    # If Array Object
    if object.is_a?(Array)
      # Pass All Object to Auto Update
      object.each {|obj| auto_update(obj)}
      return
    end
    # If Responds to Dispose
    if object.respond_to?(:dispose)
      # If Responds to Disposed? && is Disposed or Responds to Disable
      # Dispose and dispose is disabled
      if (object.respond_to?(:disposed?) && object.disposed?) ||
         (object.respond_to?(:disable_dispose?) && object.disable_dispose?)
        # Return
        return
      end
    end
    # If Responds to Update
    if object.respond_to?(:update)
      # If Responds to Disable Update & Update Disabled
      if object.respond_to?(:disable_update?) && object.disable_update?
        # Return
        return
      end
      # Update Object
      object.update
    end
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Auto Dispose
  #--------------------------------------------------------------------------
  def auto_dispose(object)
    # Return If Object isn't a Hash, Array or Respond to Dispose
    return unless object.is_a?(Hash) || object.is_a?(Array) || 
                  object.respond_to?(:dispose)
    # If Hash Object
    if object.is_a?(Hash)
      object.each do |key, value|
        # Pass Key & Value to Auto Dispose
        auto_dispose(key) ; auto_dispose(value)
      end
      return
    end
    # If Array Object
    if object.is_a?(Array)
      # Pass All Object to Auto Dispose
      object.each {|obj| auto_dispose(obj)}
      return
    end
    # If Responds to Dispose
    if object.respond_to?(:dispose)
      # If Responds to Disposed? && is Disposed or Responds to Disable
      # Dispose and dispose is disabled
      if (object.respond_to?(:disposed?) && object.disposed?) ||
         (object.respond_to?(:disable_dispose?) && object.disable_dispose?)
        # Return
        return
      end
      # Dispose Object
      object.dispose
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update          ; end
end

#==============================================================================
# ** Module
#==============================================================================

class Module
  #--------------------------------------------------------------------------
  # * Alias Log
  #--------------------------------------------------------------------------
  @@aliases = {}
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sdk_aliaslog_aliasmethod, :alias_method
  #--------------------------------------------------------------------------
  # * Alias Method
  #--------------------------------------------------------------------------
  def alias_method(newmethodname, oldmethodname, prevent_stack = true)
    # Create Key If not already created
    @@aliases[self] = [] unless @@aliases.has_key?(self)
    # Return if new method name included
    return if @@aliases[self].include?(newmethodname) && prevent_stack
    # Add new method name
    @@aliases[self] << newmethodname
    # Log Alias
    SDK.log_alias(self, oldmethodname, newmethodname)
    # Original Alias Method
    sdk_aliaslog_aliasmethod(newmethodname, oldmethodname)
  end
end

#==============================================================================
# ** Object
#==============================================================================

class Object
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :disable_dispose, :disable_update
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sdk_disableupdate_object_init, :initialize
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    # Original Initialization
    sdk_disableupdate_object_init
    # Turn Disable Flags Off
    @disable_dispose, @disable_update = false, false
  end
  #--------------------------------------------------------------------------
  # * Disable Dispose
  #--------------------------------------------------------------------------
  def disable_dispose?
    return @disable_dispose
  end
  #--------------------------------------------------------------------------
  # * Disable Update
  #--------------------------------------------------------------------------
  def disable_update?
    return @disable_update
  end
end

#==============================================================================
# ** Bitmap
#==============================================================================

class Bitmap
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_accessor :disable_dispose
  #--------------------------------------------------------------------------
  # * Alias Listings
  #--------------------------------------------------------------------------
  alias_method :sdk_bitmap_init, :initialize
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(*args)
    # Original Initialization
    sdk_bitmap_init(*args)
    # Turn Disable Dispose ON
    @disable_dispose = true
  end
end

#==============================================================================
# ** RPG::Event::Page::Condition
#==============================================================================

class RPG::Event::Page::Condition
  #--------------------------------------------------------------------------
  # * Conditions Met?
  #--------------------------------------------------------------------------
  def conditions_met?(map_id, event_id)
    # Switch 1 condition confirmation
    if @switch1_valid && $game_switches[@switch1_id] == false
      return false
    end
    # Switch 2 condition confirmation
    if @switch2_valid && $game_switches[@switch2_id] == false
      return false
    end
    # Variable condition confirmation
    if @variable_valid && $game_variables[@variable_id] < @variable_value
      return false
    end
    # Self switch condition confirmation
    if @self_switch_valid
      key = [map_id, event_id, @self_switch_ch]
      if $game_self_switches[key] == false
        return false
      end
    end
    # Returns True
    return true
  end
end

#==============================================================================
# ** RPG::Troop::Page::Condition
#==============================================================================

class RPG::Troop::Page::Condition
  #--------------------------------------------------------------------------
  # * Conditions Met?
  #--------------------------------------------------------------------------
  def conditions_met?(page_index)
    # Return False if no conditions appointed
    unless @turn_valid || @enemy_valid || @actor_valid || @switch_valid
      return false
    end
    # Return False if page already completed
    if $game_temp.battle_event_flags[page_index]
      return false
    end
    # Confirm turn conditions
    if @turn_valid
      n = $game_temp.battle_turn
      a = @turn_a
      b = @turn_b
      if (b == 0 && n != a) || (b > 0 && (n < 1 or n < a or n % b != a % b))
        return false
      end
    end
    # Confirm enemy conditions
    if @enemy_valid
      enemy = $game_troop.enemies[@enemy_index]
      if enemy == nil or enemy.hp * 100.0 / enemy.maxhp > @enemy_hp
        return false
      end
    end
    # Confirm actor conditions
    if @actor_valid
      actor = $game_actors[@actor_id]
      if actor == nil or actor.hp * 100.0 / actor.maxhp > @actor_hp
        return false
      end
    end
    # Confirm switch conditions
    if @switch_valid
      if $game_switches[@switch_id] == false
        return false
      end
    end
    # Return True
    return true
  end
end

#==============================================================================
# ** Window_Base
#------------------------------------------------------------------------------
#  This class is for all in-game windows.
#==============================================================================

class Window_Base
  #--------------------------------------------------------------------------
  # * Dispose
  #--------------------------------------------------------------------------
  def dispose
    return if self.disposed?
    # Dispose if window contents bit map is set
    if self.contents != nil
      self.contents.dispose
    end
    super
  end
end

#==============================================================================
# ** Window_Command
#------------------------------------------------------------------------------
#  This window deals with general command choices.
#==============================================================================

class Window_Command < Window_Selectable
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader :commands
  #--------------------------------------------------------------------------
  # * Command
  #--------------------------------------------------------------------------
  def command(index = self.index)
    return @commands[index]
  end
  #--------------------------------------------------------------------------
  # * Commands
  #--------------------------------------------------------------------------
  def commands=(commands)
    # Return if Commands Are Same
    return if @commands == commands
    # Reset Commands
    @commands = commands
    # Resets Item Max
    item_max = @item_max
    @item_max = @commands.size
    # If Item Max Changes
    unless item_max == @item_max
      # Deletes Existing Contents (If Exist)
      unless self.contents.nil?
        self.contents.dispose
        self.contents = nil
      end
      # Recreates Contents
      self.contents = Bitmap.new(width - 32, @item_max * 32)
    end
    # Refresh Window
    refresh
  end
end

#==============================================================================
# ** Window_HorizCommand
#------------------------------------------------------------------------------
#  This window deals with general command choices. (Horizontal)
#==============================================================================

class Window_HorizCommand < Window_Selectable
  #--------------------------------------------------------------------------
  # * Public Instance Variables
  #--------------------------------------------------------------------------
  attr_reader   :commands
  attr_accessor :c_spacing
  attr_accessor :alignment
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(width, commands, c_spacing = (width - 32) / commands.size)
    # Compute window height from command quantity
    super(0, 0, width, 64)
    @commands     = commands
    @item_max     = commands.size
    @column_max   = @item_max
    @c_spacing    = c_spacing
    @alignment    = 1
    self.contents = Bitmap.new(@item_max * @c_spacing, height - 32)
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # * Command
  #--------------------------------------------------------------------------
  def command(index = self.index)
    return @commands[index]
  end
  #--------------------------------------------------------------------------
  # * Commands
  #--------------------------------------------------------------------------
  def commands=(commands)
    # Return if Commands Are Same
    return if @commands == commands
    # Reset Commands
    @commands = commands
    # Resets Item Max
    item_max    = @item_max
    @item_max   = @commands.size
    @column_max = @item_max
    # If Item Max Changes
    unless item_max == @item_max
      # Deletes Existing Contents (If Exist)
      unless self.contents.nil?
        self.contents.dispose
        self.contents = nil
      end
      # Recreates Contents
    self.contents = Bitmap.new(@item_max * @c_spacing, height - 32)
    end
    # Refresh Window
    refresh
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0...@item_max
      draw_item(i, normal_color)
    end
  end
  #--------------------------------------------------------------------------
  # * Draw Item
  #--------------------------------------------------------------------------
  def draw_item(index, color)
    command = commands[index]
    x = index * @c_spacing + 4
    self.contents.font.color = color
    self.contents.draw_text(x, 0, @c_spacing - 8, 32, command, @alignment)
  end
  #--------------------------------------------------------------------------
  # * Disable Item
  #--------------------------------------------------------------------------
  def disable_item(index)
    draw_item(index, disabled_color)
  end
  #--------------------------------------------------------------------------
  # * Cursor Rectangle Update
  #--------------------------------------------------------------------------
  def update_cursor_rect
    if @index < 0
      self.cursor_rect.empty
    else
      self.cursor_rect.set(@c_spacing * @index, 0, @c_spacing, 32)
    end
  end
end

#==============================================================================
# ** Window_SaveFile
#------------------------------------------------------------------------------
#  This window displays save files on the save and load screens.
#==============================================================================

class Window_SaveFile < Window_Base
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     file_index : save file index (0-3)
  #     filename   : file name
  #--------------------------------------------------------------------------
  def initialize(file_index, filename)
    super(0, 64 + file_index % 4 * 104, 640, 104)
    self.contents = Bitmap.new(width - 32, height - 32)
    @file_index = file_index
    @filename = filename
    @time_stamp = Time.at(0)
    @file_exist = FileTest.exist?(@filename)
    if @file_exist
      file = File.open(@filename, "r")
      @time_stamp = file.mtime
      @characters = Marshal.load(file)
      @frame_count = Marshal.load(file)
      @game_system = Marshal.load(file)
      @game_switches = Marshal.load(file)
      @game_variables = Marshal.load(file)
      @total_sec = @frame_count / Graphics.frame_rate
      file.close
    end
    refresh
    @selected = false
  end
end

#==============================================================================
# ** Interpreter
#------------------------------------------------------------------------------
#  This interpreter runs event commands. This class is used within the
#  Game_System class and the Game_Event class.
#==============================================================================

class Interpreter
 #--------------------------------------------------------------------------
 # * Script
 #--------------------------------------------------------------------------
 def command_355
   # Set first line to script
   script = @list[@index].parameters[0] + "\n"
   # Loop
   loop do
     # If next event command is second line of script or after
     if @list[@index+1].code == 655
       # Add second line or after to script
       script += @list[@index+1].parameters[0] + "\n"
     # If event command is not second line or after
     else
       # Abort loop
       break
     end
     # Advance index
     @index += 1
   end
   # Evaluation
   result = eval(script)
   # If return value is false
   if result == FalseClass
     # End
     return false
   end
   # Continue
   return true
 end
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('RPG::SPRITE#UPDATE')

#==============================================================================
# ** RPG::Sprite
#==============================================================================

class RPG::Sprite
  #--------------------------------------------------------------------------
  SDK.log_branch(RPG::Sprite.to_s.to_sym, :update, :update_whiten, 
    :update_appear, :update_escape, :update_collapse, :update_damage, 
    :update_animation_duration, :update_loop_animation_index, :update_blink)
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    super
    update_whiten                       # Update Whiten
    update_appear                       # Update Appear
    update_escape                       # Update Escape
    update_collapse                     # Update Collapse
    update_damage                       # Update Damage
    update_animation_duration           # Update Animation Duration
    update_loop_animation_index         # Update Loop Animation
    update_blink                        # Update Blink
    @@_animations.clear                 # Clear Animations
  end
  #--------------------------------------------------------------------------
  # * Update Whiten
  #--------------------------------------------------------------------------
  def update_whiten
    if @_whiten_duration > 0
      @_whiten_duration -= 1
      self.color.alpha = 128 - (16 - @_whiten_duration) * 10
    end
  end
  #--------------------------------------------------------------------------
  # * Update Appear
  #--------------------------------------------------------------------------
  def update_appear
    if @_appear_duration > 0
      @_appear_duration -= 1
      self.opacity = (16 - @_appear_duration) * 16
    end
  end
  #--------------------------------------------------------------------------
  # * Update Escape
  #--------------------------------------------------------------------------
  def update_escape
    if @_escape_duration > 0
      @_escape_duration -= 1
      self.opacity = 256 - (32 - @_escape_duration) * 10
    end
  end
  #--------------------------------------------------------------------------
  # * Update Collapse
  #--------------------------------------------------------------------------
  def update_collapse
    if @_collapse_duration > 0
      @_collapse_duration -= 1
      self.opacity = 256 - (48 - @_collapse_duration) * 6
    end
  end
  #--------------------------------------------------------------------------
  # * Update Damage
  #--------------------------------------------------------------------------
  def update_damage
    if @_damage_duration > 0
      @_damage_duration -= 1
      case @_damage_duration
      when 38..39
        @_damage_sprite.y -= 4
      when 36..37
        @_damage_sprite.y -= 2
      when 34..35
        @_damage_sprite.y += 2
      when 28..33
        @_damage_sprite.y += 4
      end
      @_damage_sprite.opacity = 256 - (12 - @_damage_duration) * 32
      if @_damage_duration == 0
        dispose_damage
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Update Animation Duration
  #--------------------------------------------------------------------------
  def update_animation_duration
    if @_animation != nil and (Graphics.frame_count % 2 == 0)
      @_animation_duration -= 1
      update_animation
    end
  end
  #--------------------------------------------------------------------------
  # * Update Loop Animation Index
  #--------------------------------------------------------------------------
  def update_loop_animation_index
    if @_loop_animation != nil and (Graphics.frame_count % 2 == 0)
      update_loop_animation
      @_loop_animation_index += 1
      @_loop_animation_index %= @_loop_animation.frame_max
    end
  end
  #--------------------------------------------------------------------------
  # * Update Blink
  #--------------------------------------------------------------------------
  def update_blink
    if @_blink
      @_blink_count = (@_blink_count + 1) % 32
      if @_blink_count < 16
        alpha = (16 - @_blink_count) * 6
      else
        alpha = (@_blink_count - 16) * 6
      end
      self.color.set(255, 255, 255, alpha)
    end
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('GAME_MAP#SETUP')

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  This class handles the map. It includes scrolling and passable determining
#  functions. Refer to "$game_map" for the instance of this class.
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Map, :setup, :setup_map_id, :setup_load, 
    :setup_tileset, :setup_display, :setup_refresh, :setup_events,
    :setup_common_events, :setup_fog, :setup_scroll)
  #--------------------------------------------------------------------------
  # * Setup
  #     map_id : map ID
  #--------------------------------------------------------------------------
  def setup(map_id)
    setup_map_id(map_id)                      # Setup Map ID       
    setup_load                                # Setup Map Data
    setup_tileset                             # Setup Tileset Data
    setup_display                             # Setup Display
    setup_refresh                             # Setup Refresh
    setup_events                              # Setup Events
    setup_common_events                       # Setup Common Events
    setup_fog                                 # Setup Fog
    setup_scroll                              # Setup Scroll
  end
  #--------------------------------------------------------------------------
  # * Setup Map ID
  #--------------------------------------------------------------------------
  def setup_map_id(map_id)
    # Put map ID in @map_id memory
    @map_id = map_id
  end
  #--------------------------------------------------------------------------
  # * Load Map Data
  #--------------------------------------------------------------------------
  def setup_load
    # Load map from file and set @map
    @map = load_data(sprintf("Data/Map%03d.rxdata", @map_id))
  end
  #--------------------------------------------------------------------------
  # * Setup Tileset
  #--------------------------------------------------------------------------
  def setup_tileset
    # set tile set information in opening instance variables
    tileset = $data_tilesets[@map.tileset_id]
    @tileset_name = tileset.tileset_name
    @autotile_names = tileset.autotile_names
    @panorama_name = tileset.panorama_name
    @panorama_hue = tileset.panorama_hue
    @fog_name = tileset.fog_name
    @fog_hue = tileset.fog_hue
    @fog_opacity = tileset.fog_opacity
    @fog_blend_type = tileset.fog_blend_type
    @fog_zoom = tileset.fog_zoom
    @fog_sx = tileset.fog_sx
    @fog_sy = tileset.fog_sy
    @battleback_name = tileset.battleback_name
    @passages = tileset.passages
    @priorities = tileset.priorities
    @terrain_tags = tileset.terrain_tags
  end
  #--------------------------------------------------------------------------
  # * Setup Display
  #--------------------------------------------------------------------------
  def setup_display
    # Initialize displayed coordinates
    @display_x = 0
    @display_y = 0
  end
  #--------------------------------------------------------------------------
  # * Setup Refresh
  #--------------------------------------------------------------------------
  def setup_refresh
    # Clear refresh request flag
    @need_refresh = false
  end
  #--------------------------------------------------------------------------
  # * Setup Events
  #--------------------------------------------------------------------------
  def setup_events
    # Set map event data
    @events = {}
    for i in @map.events.keys
      @events[i] = Game_Event.new(@map_id, @map.events[i])
    end
  end
  #--------------------------------------------------------------------------
  # * Setup Common Events
  #--------------------------------------------------------------------------
  def setup_common_events
    # Set common event data
    @common_events = {}
    for i in 1...$data_common_events.size
      @common_events[i] = Game_CommonEvent.new(i)
    end
  end
  #--------------------------------------------------------------------------
  # * Setup Fog
  #--------------------------------------------------------------------------
  def setup_fog
    # Initialize all fog information
    @fog_ox = 0
    @fog_oy = 0
    @fog_tone = Tone.new(0, 0, 0, 0)
    @fog_tone_target = Tone.new(0, 0, 0, 0)
    @fog_tone_duration = 0
    @fog_opacity_duration = 0
    @fog_opacity_target = 0
  end
  #--------------------------------------------------------------------------
  # * Setup Scroll
  #--------------------------------------------------------------------------
  def setup_scroll
    # Initialize scroll information
    @scroll_direction = 2
    @scroll_rest = 0
    @scroll_speed = 4
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('GAME_MAP#UPDATE')

#==============================================================================
# ** Game_Map
#------------------------------------------------------------------------------
#  This class handles the map. It includes scrolling and passable determining
#  functions. Refer to "$game_map" for the instance of this class.
#==============================================================================

class Game_Map
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Map, :update, :update_refresh, :update_scrolling, 
    :update_events, :update_common_events, :update_fog_scroll, 
    :update_fog_color, :update_fog)
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_refresh                            # Update Refresh Flag
    update_scrolling                          # Update Scrolling
    update_events                             # Update Events
    update_common_events                      # Update Common Events
    update_fog_scroll                         # Update Fog Scrolling
    update_fog_color                          # Update Fog Color
    update_fog                                # Update Fog
  end
  #--------------------------------------------------------------------------
  # * Refresh Game Map
  #--------------------------------------------------------------------------
  def update_refresh
    # Refresh map if necessary
    if $game_map.need_refresh
      refresh
    end
  end
  #--------------------------------------------------------------------------
  # * Update Scrolling
  #--------------------------------------------------------------------------
  def update_scrolling
    # If scrolling
    if @scroll_rest > 0
      # Change from scroll speed to distance in map coordinates
      distance = 2 ** @scroll_speed
      # Execute scrolling
      case @scroll_direction
      when 2  # Down
        scroll_down(distance)
      when 4  # Left
        scroll_left(distance)
      when 6  # Right
        scroll_right(distance)
      when 8  # Up
        scroll_up(distance)
      end
      # Subtract distance scrolled
      @scroll_rest -= distance
    end
  end
  #--------------------------------------------------------------------------
  # * Update Events
  #--------------------------------------------------------------------------
  def update_events
    # Update map event
    for event in @events.values
      event.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Common Events
  #--------------------------------------------------------------------------
  def update_common_events
    # Update common event
    for common_event in @common_events.values
      common_event.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog Scroll
  #--------------------------------------------------------------------------
  def update_fog_scroll
    # Manage fog scrolling
    @fog_ox -= @fog_sx / 8.0
    @fog_oy -= @fog_sy / 8.0
  end
  #--------------------------------------------------------------------------
  # * Update Fog Color
  #--------------------------------------------------------------------------
  def update_fog_color
    # Manage change in fog color tone
    if @fog_tone_duration >= 1
      d = @fog_tone_duration
      target = @fog_tone_target
      @fog_tone.red = (@fog_tone.red * (d - 1) + target.red) / d
      @fog_tone.green = (@fog_tone.green * (d - 1) + target.green) / d
      @fog_tone.blue = (@fog_tone.blue * (d - 1) + target.blue) / d
      @fog_tone.gray = (@fog_tone.gray * (d - 1) + target.gray) / d
      @fog_tone_duration -= 1
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog
  #--------------------------------------------------------------------------
  def update_fog
    # Manage change in fog opacity level
    if @fog_opacity_duration >= 1
      d = @fog_opacity_duration
      @fog_opacity = (@fog_opacity * (d - 1) + @fog_opacity_target) / d
      @fog_opacity_duration -= 1
    end
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('GAME_BATTLER#ATTACK_EFFECT')

#==============================================================================
# ** Game_Battler (part 3)
#------------------------------------------------------------------------------
#  This class deals with battlers. It's used as a superclass for the Game_Actor
#  and Game_Enemy classes.
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Battler, :attack_effect, :attack_effect_setup, 
    :attack_effect_first_hit_result, :attack_effect_base_damage,
    :attack_effect_element_correction, :attack_effect_critical_correction,
    :attack_effect_guard_correction, :attack_effect_dispersion, 
    :attack_effect_second_hit_result, :attack_effect_damage, 
    :attack_effect_miss)
  #--------------------------------------------------------------------------
  # * Applying Normal Attack Effects
  #--------------------------------------------------------------------------
  def attack_effect(attacker)
    # Setup Attack Effect
    attack_effect_setup
    # First Hit Detection
    hit_result = attack_effect_first_hit_result(attacker)
    # If hit occurs
    if hit_result
      # Calculate Basic Damage
      attack_effect_base_damage(attacker)
      # Element Correction
      attack_effect_element_correction(attacker)
      # If damage value is strictly positive
      if self.damage > 0
        # Critical correction
        attack_effect_critical_correction(attacker)
        # Guard correction
        attack_effect_guard_correction
      end
      # Dispersion
      attack_effect_dispersion
      # Second Hit Detection
      hit_result = attack_effect_second_hit_result(attacker)
    end
    # If hit occurs
    if hit_result
      # State Removed by Shock
      remove_states_shock
      # Substract damage from HP
      attack_effect_damage
      # State change
      @state_changed = false
      states_plus(attacker.plus_state_set)
      states_minus(attacker.minus_state_set)
    # When missing
    else
      # Apply Miss Results
      attack_effect_miss
    end
    # End Method
    return true
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Setup
  #--------------------------------------------------------------------------
  def attack_effect_setup
    self.critical = false
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : First Hit Detection
  #--------------------------------------------------------------------------
  def attack_effect_first_hit_result(attacker)
    return (rand(100) < attacker.hit)
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Base Damage
  #--------------------------------------------------------------------------
  def attack_effect_base_damage(attacker)
    atk = [attacker.atk - self.pdef / 2, 0].max
    self.damage = atk * (20 + attacker.str) / 20
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Element Correction
  #--------------------------------------------------------------------------
  def attack_effect_element_correction(attacker)
    self.damage *= elements_correct(attacker.element_set)
    self.damage /= 100
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Critical Correction
  #--------------------------------------------------------------------------
  def attack_effect_critical_correction(attacker)
    if rand(100) < 4 * attacker.dex / self.agi
      self.damage *= 2
      self.critical = true
    end
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Guard Correction
  #--------------------------------------------------------------------------
  def attack_effect_guard_correction
    self.damage /= 2 if self.guarding?
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Dispersion
  #--------------------------------------------------------------------------
  def attack_effect_dispersion
    if self.damage.abs > 0
      amp = [self.damage.abs * 15 / 100, 1].max
      self.damage += rand(amp+1) + rand(amp+1) - amp
    end
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Second Hit Detection
  #--------------------------------------------------------------------------
  def attack_effect_second_hit_result(attacker)
    eva = 8 * self.agi / attacker.dex + self.eva
    hit = self.damage < 0 ? 100 : 100 - eva
    hit = self.cant_evade? ? 100 : hit
    return (rand(100) < hit)
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Deal Damage
  #--------------------------------------------------------------------------
  def attack_effect_damage
    self.hp -= self.damage
  end
  #--------------------------------------------------------------------------
  # * Attack Effect : Miss
  #--------------------------------------------------------------------------
  def attack_effect_miss
    self.damage = 'Miss'
    self.critical = false
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('GAME_BATTLER#SKILL_EFFECT')

#==============================================================================
# ** Game_Battler (part 3)
#------------------------------------------------------------------------------
#  This class deals with battlers. It's used as a superclass for the Game_Actor
#  and Game_Enemy classes.
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Battler, :skill_effect, :skill_effect_setup, 
    :skill_effect_scope, :skill_effect_effective_setup, 
    :skill_effect_first_hit_result, :skill_effect_effective_correction, 
    :skill_effect_power, :skill_effect_rate, :skill_effect_base_damage, 
    :skill_effect_element_correction, :skill_effect_guard_correction, 
    :skill_effect_disperation, :skill_effect_second_hit_result, 
    :skill_effect_physical_hit_result, :skill_effect_damage, 
    :skill_effect_power0, :skill_effect_miss, :skill_effect_damagefix)
  #--------------------------------------------------------------------------
  # * Apply Skill Effects
  #--------------------------------------------------------------------------
  def skill_effect(user, skill)
    # Skill Effects Setup
    skill_effect_setup
    # Return False If Out of Scope
    return false if skill_effect_scope(skill)
    # Setup Effective
    effective = skill_effect_effective_setup(skill)
    # First hit detection
    hit, hit_result = skill_effect_first_hit_result(user, skill)
    # Set effective flag if skill is uncertain
    effective = skill_effect_effective_correction(effective, hit)
    # If hit occurs
    if hit_result
      # Calculate power
      power = skill_effect_power(user, skill)
      # Calculate rate
      rate = skill_effect_rate(user, skill)
      # Calculate basic damage
      skill_effect_base_damage(power, rate)
      # Element correction
      skill_effect_element_correction(skill)
      # If damage value is strictly positive
      if self.damage > 0
        # Guard correction
        skill_effect_guard_correction
      end
      # Dispersion
      skill_effect_disperation(skill)
      # Second hit detection
      hit, hit_result = skill_effect_second_hit_result(user, skill)
      # Set effective flag if skill is uncertain
      effective = skill_effect_effective_correction(effective, hit)
    end
    # If hit occurs
    if hit_result
      # Physical Hit Detection
      effective = true if skill_effect_physical_hit_result(skill)
      # Deal Damage
      effective = skill_effect_damage
      # State change
      @state_changed = false
      effective |= states_plus(skill.plus_state_set)
      effective |= states_minus(skill.minus_state_set)
      # Skill Effect 0 Power Test
      skill_effect_power0(skill)
    # If miss occurs
    else
      # Apply Miss Effects
      skill_effect_miss
    end
    # Skill Effect Damage Fix
    skill_effect_damagefix
    # End Method
    return effective
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Setup
  #--------------------------------------------------------------------------
  def skill_effect_setup
    self.critical = false
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Scope Test
  #--------------------------------------------------------------------------
  def skill_effect_scope(skill)
    # If skill scope is for ally with 1 or more HP, and your own HP = 0,
    # or skill scope is for ally with 0, and your own HP = 1 or more
    return (((skill.scope == 3 or skill.scope == 4) and self.hp == 0) or
            ((skill.scope == 5 or skill.scope == 6) and self.hp >= 1))
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Effective Setup
  #--------------------------------------------------------------------------
  def skill_effect_effective_setup(skill)
    effective = false
    return effective |= skill.common_event_id > 0
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : First Hit Result
  #--------------------------------------------------------------------------
  def skill_effect_first_hit_result(user, skill)
    hit = skill.hit
    if skill.atk_f > 0
      hit *= user.hit / 100
    end
    return hit, (rand(100) < hit)
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Skill Effective
  #--------------------------------------------------------------------------
  def skill_effect_effective_correction(effective, hit)
    return effective |= hit < 100
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Power
  #--------------------------------------------------------------------------
  def skill_effect_power(user, skill)
    power = skill.power + user.atk * skill.atk_f / 100
    if power > 0
      power -= self.pdef * skill.pdef_f / 200
      power -= self.mdef * skill.mdef_f / 200
      power = [power, 0].max
    end
    return power
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Rate
  #--------------------------------------------------------------------------
  def skill_effect_rate(user, skill)
    # Calculate rate
    rate = 20
    rate += (user.str * skill.str_f / 100)
    rate += (user.dex * skill.dex_f / 100)
    rate += (user.agi * skill.agi_f / 100)
    rate += (user.int * skill.int_f / 100)
    # Return Rate
    return rate
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Base Damage
  #--------------------------------------------------------------------------
  def skill_effect_base_damage(power, rate)
    self.damage = power * rate / 20
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Element Correction
  #--------------------------------------------------------------------------
  def skill_effect_element_correction(skill)
    self.damage *= elements_correct(skill.element_set)
    self.damage /= 100
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Guard Correction
  #--------------------------------------------------------------------------
  def skill_effect_guard_correction
    self.damage /= 2 if self.guarding?
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Disperation
  #--------------------------------------------------------------------------
  def skill_effect_disperation(skill)
    if skill.variance > 0 and self.damage.abs > 0
      amp = [self.damage.abs * skill.variance / 100, 1].max
      self.damage += rand(amp+1) + rand(amp+1) - amp
    end
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Second Hit Detection
  #--------------------------------------------------------------------------
  def skill_effect_second_hit_result(user, skill)
    eva = 8 * self.agi / user.dex + self.eva
    hit = self.damage < 0 ? 100 : 100 - eva * skill.eva_f / 100
    hit = self.cant_evade? ? 100 : hit
    return hit, (rand(100) < hit)
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Physical Hit Result
  #--------------------------------------------------------------------------
  def skill_effect_physical_hit_result(skill)
    # If physical attack has power other than 0
    if skill.power != 0 and skill.atk_f > 0
      # State Removed by Shock
      remove_states_shock
      # Return True
      return true
    end
    # Return False
    return false
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Damage
  #--------------------------------------------------------------------------
  def skill_effect_damage
    # Substract damage from HP
    last_hp = self.hp
    self.hp -= self.damage
    return self.hp != last_hp
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Power 0 Test
  #--------------------------------------------------------------------------
  def skill_effect_power0(skill)
    # If power is 0
    if skill.power == 0
      # Set damage to an empty string
      self.damage = ""
      # If state is unchanged
      unless @state_changed
        # Set damage to "Miss"
        self.damage = 'Miss'
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Miss
  #--------------------------------------------------------------------------
  def skill_effect_miss
    self.damage = 'Miss'
  end
  #--------------------------------------------------------------------------
  # * Skill Effect : Damage Fix
  #--------------------------------------------------------------------------
  def skill_effect_damagefix
    self.damage = nil unless $game_temp.in_battle
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('GAME_BATTLER#ITEM_EFFECT')

#==============================================================================
# ** Game_Battler (part 3)
#------------------------------------------------------------------------------
#  This class deals with battlers. It's used as a superclass for the Game_Actor
#  and Game_Enemy classes.
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Battler, :item_effect, :item_effect_setup, 
    :item_effect_scope, :item_effect_effective_setup, 
    :item_effect_hit_result, :item_effect_effective_correction, 
    :item_effect_recovery, :item_effect_element_correction, 
    :item_effect_guard_correction, :item_effect_dispersion, 
    :item_effect_damage, :item_effect_parameter_points, 
    :item_effect_no_recovery, :item_effect_miss, :item_effect_damagefix)
  #--------------------------------------------------------------------------
  # * Application of Item Effects
  #--------------------------------------------------------------------------
  def item_effect(item)
    # Item Effect Setup
    item_effect_setup
    # Return False If Out of Scope
    return false if item_effect_scope(item)
    # Setup Effective
    effective = item_effect_effective_setup(item)
    # First hit detection
    hit_result = item_effect_hit_result(item)
    # Set effective flag if skill is uncertain
    effective = item_effect_effective_correction(effective, item)
    # If hit occurs
    if hit_result
      # Calculate amount of recovery
      recover_hp, recover_sp = item_effect_recovery(item)
      # Element correction
      recover_hp, recover_sp = item_effect_element_correction(recover_hp, 
        recover_sp, item)
      # If recovery code is negative
      if recover_hp < 0
        # Guard correction
        recover_hp = item_effect_guard_correction(recover_hp)
      end
      # Dispersion
      recover_hp, recover_sp = item_effect_dispersion(recover_hp, 
        recover_sp, item)
      # Damage & Recovery
      effective = item_effect_damage(recover_hp, recover_sp, effective)
      # State change
      @state_changed = false
      effective |= states_plus(item.plus_state_set)
      effective |= states_minus(item.minus_state_set)
      # If parameter value increase is effective
      if item.parameter_type > 0 and item.parameter_points != 0
        # Item Effect Parameter Points
        item_effect_parameter_points(item)
        # Set to effective flag
        effective = true
      end
      # Item effect no recovery
      item_effect_no_recovery(item)
    # If miss occurs
    else
      # Item effect miss
      item_effect_miss
    end
    # Item effect damage fix
    item_effect_damagefix
    # End Method
    return effective
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Setup
  #--------------------------------------------------------------------------
  def item_effect_setup
    self.critical = false
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Scope
  #--------------------------------------------------------------------------
  def item_effect_scope(item)
    return (((item.scope == 3 or item.scope == 4) and self.hp == 0) or
            ((item.scope == 5 or item.scope == 6) and self.hp >= 1))
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Effective
  #--------------------------------------------------------------------------
  def item_effect_effective_setup(item)
    effective = false
    return effective |= item.common_event_id > 0
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Hit Result
  #--------------------------------------------------------------------------
  def item_effect_hit_result(item)      
    return (rand(100) < item.hit)
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Item Effective
  #--------------------------------------------------------------------------
  def item_effect_effective_correction(effective, item)
    return effective |= item.hit < 100
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Recovery
  #--------------------------------------------------------------------------
  def item_effect_recovery(item)
    recover_hp = maxhp * item.recover_hp_rate / 100 + item.recover_hp
    recover_sp = maxsp * item.recover_sp_rate / 100 + item.recover_sp
    if recover_hp < 0
      recover_hp += self.pdef * item.pdef_f / 20
      recover_hp += self.mdef * item.mdef_f / 20
      recover_hp = [recover_hp, 0].min
    end
    return recover_hp, recover_sp
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Element Correction
  #--------------------------------------------------------------------------
  def item_effect_element_correction(recover_hp, recover_sp, item)
    # Element correction
    recover_hp *= elements_correct(item.element_set)
    recover_hp /= 100
    recover_sp *= elements_correct(item.element_set)
    recover_sp /= 100
    return recover_hp, recover_sp
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Guard Correction
  #--------------------------------------------------------------------------
  def item_effect_guard_correction(recover_hp)
    return self.guarding? ? recover_hp /= 2 : recover_hp
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Disperation
  #--------------------------------------------------------------------------
  def item_effect_dispersion(recover_hp, recover_sp, item)
    if item.variance > 0 and recover_hp.abs > 0
      amp = [recover_hp.abs * item.variance / 100, 1].max
      recover_hp += rand(amp+1) + rand(amp+1) - amp
    end
    if item.variance > 0 and recover_sp.abs > 0
      amp = [recover_sp.abs * item.variance / 100, 1].max
      recover_sp += rand(amp+1) + rand(amp+1) - amp
    end
    return recover_hp, recover_sp
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Damage
  #--------------------------------------------------------------------------
  def item_effect_damage(recover_hp, recover_sp, effective)
    # Set Damage
    self.damage = -recover_hp
    # HP and SP recovery
    last_hp = self.hp
    last_sp = self.sp
    self.hp += recover_hp
    self.sp += recover_sp
    effective |= self.hp != last_hp
    effective |= self.sp != last_sp
    # Return Effectiveness
    return effective
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Parameter Points
  #--------------------------------------------------------------------------
  def item_effect_parameter_points(item)
    # Branch by parameter
    case item.parameter_type
    when 1  # Max HP
      @maxhp_plus += item.parameter_points
    when 2  # Max SP
      @maxsp_plus += item.parameter_points
    when 3  # Strength
      @str_plus += item.parameter_points
    when 4  # Dexterity
      @dex_plus += item.parameter_points
    when 5  # Agility
      @agi_plus += item.parameter_points
    when 6  # Intelligence
      @int_plus += item.parameter_points
    end
  end
  #--------------------------------------------------------------------------
  # * Item Effect : No Recovery
  #--------------------------------------------------------------------------
  def item_effect_no_recovery(item)
    # If HP recovery rate and recovery amount are 0
    if item.recover_hp_rate == 0 and item.recover_hp == 0
      # Set damage to empty string
      self.damage = ''
      # If SP recovery rate / recovery amount are 0, and parameter increase
      # value is ineffective.
      if item.recover_sp_rate == 0 and item.recover_sp == 0 and
         (item.parameter_type == 0 or item.parameter_points == 0)
        # If state is unchanged
        unless @state_changed
          # Set damage to "Miss"
          self.damage = 'Miss'
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Miss
  #--------------------------------------------------------------------------
  def item_effect_miss
    self.damage = 'Miss'
  end
  #--------------------------------------------------------------------------
  # * Item Effect : Damage Fix
  #--------------------------------------------------------------------------
  def item_effect_damagefix
    self.damage = nil unless $game_temp.in_battle
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('GAME_BATTLER#SLIP_DAMAGE_EFFECT')

#==============================================================================
# ** Game_Battler (part 3)
#------------------------------------------------------------------------------
#  This class deals with battlers. It's used as a superclass for the Game_Actor
#  and Game_Enemy classes.
#==============================================================================

class Game_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Battler, :slip_damage_effect, 
    :slip_damage_effect_base_damage, :slip_damage_effect_dispersion,
    :slip_damage_effect_damage)
  #--------------------------------------------------------------------------
  # * Application of Slip Damage Effects
  #--------------------------------------------------------------------------
  def slip_damage_effect
    # Set damage
    slip_damage_effect_base_damage
    # Dispersion
    slip_damage_effect_dispersion
    # Subtract damage from HP
    slip_damage_effect_damage
    # End Method
    return true
  end
  #--------------------------------------------------------------------------
  # * Slip Damage Effects : Base Damage
  #--------------------------------------------------------------------------
  def slip_damage_effect_base_damage
    self.damage = self.maxhp / 10
  end
  #--------------------------------------------------------------------------
  # * Slip Damage Effects : Dispersion
  #--------------------------------------------------------------------------
  def slip_damage_effect_dispersion
    # Dispersion
    if self.damage.abs > 0
      amp = [self.damage.abs * 15 / 100, 1].max
      self.damage += rand(amp+1) + rand(amp+1) - amp
    end
  end
  #--------------------------------------------------------------------------
  # * Slip Damage Effects : Damage
  #--------------------------------------------------------------------------
  def slip_damage_effect_damage
    self.hp -= self.damage
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('GAME_ACTOR#EXP=')

#==============================================================================
# ** Game_Actor
#------------------------------------------------------------------------------
#  This class handles the actor. It's used within the Game_Actors class
#  ($game_actors) and refers to the Game_Party class ($game_party).
#==============================================================================

class Game_Actor < Game_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Actor, :exp=, :level_up, :level_down)
  #--------------------------------------------------------------------------
  # * Change EXP
  #--------------------------------------------------------------------------
  def exp=(exp)
    @exp = [[exp, 9999999].min, 0].max
    # Level up
    while @exp >= @exp_list[@level+1] and @exp_list[@level+1] > 0
      level_up
    end
    # Level down
    while @exp < @exp_list[@level]
      level_down
    end
    # Correction if exceeding current max HP and max SP
    @hp = [@hp, self.maxhp].min
    @sp = [@sp, self.maxsp].min
  end
  #--------------------------------------------------------------------------
  # * Level Up
  #--------------------------------------------------------------------------
  def level_up
    @level += 1
    # Learn skill
    for j in $data_classes[@class_id].learnings
      if j.level == @level
        learn_skill(j.skill_id)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Level Down
  #--------------------------------------------------------------------------
  def level_down
    @level -= 1
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('GAME_CHARACTER#UPDATE')

#==============================================================================
# ** Game_Character
#------------------------------------------------------------------------------
#  This class deals with characters. It's used as a superclass for the
#  Game_Player and Game_Event classes.
#==============================================================================

class Game_Character
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Character, :update, :update_movement_type, 
    :update_animation, :update_wait?, :update_force?, :update_startlock?, 
    :update_movement)
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_movement_type                      # Update Movement Type
    update_animation                          # Update Animation Counters
    return if update_wait?                    # Update Wait Test
    return if update_force?                   # Update Force Route Test
    return if update_startlock?               # Update Start/Lock Test
    update_movement                           # Update Movement
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Movement Type
  #--------------------------------------------------------------------------
  def update_movement_type
    # Branch with jumping, moving, and stopping
    if jumping?
      update_jump
    elsif moving?
      update_move
    else
      update_stop
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Animation Counters
  #--------------------------------------------------------------------------
  def update_animation
    # If animation count exceeds maximum value
    # * Maximum value is move speed * 1 taken from basic value 18
    if @anime_count > 18 - @move_speed * 2
      # If stop animation is OFF when stopping
      if not @step_anime and @stop_count > 0
        # Return to original pattern
        @pattern = @original_pattern
      # If stop animation is ON when moving
      else
        # Update pattern
        @pattern = (@pattern + 1) % 4
      end
      # Clear animation count
      @anime_count = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Wait Test
  #--------------------------------------------------------------------------
  def update_wait?
    # If waiting
    if @wait_count > 0
      # Reduce wait count
      @wait_count -= 1
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Force Route Test
  #--------------------------------------------------------------------------
  def update_force?
    # If move route is forced
    if @move_route_forcing
      # Custom move
      move_type_custom
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Starting or Lock Test
  #--------------------------------------------------------------------------
  def update_startlock?
    # When waiting for event execution or locked
    return (@starting or lock?)
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Movement
  #--------------------------------------------------------------------------
  def update_movement
    # If stop count exceeds a certain value (computed from move frequency)
    if @stop_count > (40 - @move_frequency * 2) * (6 - @move_frequency)
      # Branch by move type
      case @move_type
      when 1  # Random
        move_type_random
      when 2  # Approach
        move_type_toward_player
      when 3  # Custom
        move_type_custom
      end
    end
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('GAME_EVENT#REFRESH')

#==============================================================================
# ** Game_Event
#------------------------------------------------------------------------------
#  This class deals with events. It handles functions including event page 
#  switching via condition determinants, and running parallel process events.
#  It's used within the Game_Map class.
#==============================================================================

class Game_Event < Game_Character
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Event, :refresh, :refresh_new_page, 
    :refresh_page_change?, :refresh_page_reset?, :refresh_set_page, 
    :refresh_check_process)
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    new_page = refresh_new_page               # Get New Page
    return if refresh_page_change?(new_page)  # Return if No Page Change
    clear_starting                            # Clear starting flag
    return if refresh_page_reset?             # Return if Nil Page Reset
    refresh_set_page                          # Set page variables
    refresh_check_process                     # Check parallel processing
    check_event_trigger_auto                  # Auto event start determinant
  end
  #--------------------------------------------------------------------------
  # * Refresh : New Page
  #--------------------------------------------------------------------------
  def refresh_new_page
    return @erased ? nil : refresh_trigger_conditions
  end
  #--------------------------------------------------------------------------
  # * Refresh Trigger Conditions
  #--------------------------------------------------------------------------
  def refresh_trigger_conditions
    # Check in order of large event pages
    for page in @event.pages.reverse
      # Skips If Page Conditions Not Met
      next unless page.condition.conditions_met?(@map_id, @id)
      # Set local variable: new_page
      new_page = page
      # Remove loop
      break
    end
    # Return new page
    return new_page
  end
  #--------------------------------------------------------------------------
  # * Refresh : Page Change
  #--------------------------------------------------------------------------
  def refresh_page_change?(new_page)
    # If event page is the same as last time
    if new_page == @page
      # End method
      return true
    end
    # Set @page as current event page
    @page = new_page
    return false
  end
  #--------------------------------------------------------------------------
  # * Refresh : Page Reset
  #--------------------------------------------------------------------------
  def refresh_page_reset?
    # If no page fulfills conditions
    if @page == nil
      # Reset values
      refresh_reset
      # End method
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Refresh Reset
  #--------------------------------------------------------------------------
  def refresh_reset
    # Set each instance variable
    @tile_id = 0
    @character_name = ""
    @character_hue = 0
    @move_type = 0
    @through = true
    @trigger = nil
    @list = nil
    @interpreter = nil
  end
  #--------------------------------------------------------------------------
  # * Refresh Set Page
  #--------------------------------------------------------------------------
  def refresh_set_page
    # Set each instance variable
    @tile_id = @page.graphic.tile_id
    @character_name = @page.graphic.character_name
    @character_hue = @page.graphic.character_hue
    if @original_direction != @page.graphic.direction
      @direction = @page.graphic.direction
      @original_direction = @direction
      @prelock_direction = 0
    end
    if @original_pattern != @page.graphic.pattern
      @pattern = @page.graphic.pattern
      @original_pattern = @pattern
    end
    @opacity = @page.graphic.opacity
    @blend_type = @page.graphic.blend_type
    @move_type = @page.move_type
    @move_speed = @page.move_speed
    @move_frequency = @page.move_frequency
    @move_route = @page.move_route
    @move_route_index = 0
    @move_route_forcing = false
    @walk_anime = @page.walk_anime
    @step_anime = @page.step_anime
    @direction_fix = @page.direction_fix
    @through = @page.through
    @always_on_top = @page.always_on_top
    @trigger = @page.trigger
    @list = @page.list
    @interpreter = nil
  end
  #--------------------------------------------------------------------------
  # * Refresh Check Process
  #--------------------------------------------------------------------------
  def refresh_check_process
    # If trigger is [parallel process]
    if @trigger == 4
      # Create parallel process interpreter
      @interpreter = Interpreter.new
    end
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || SDK::Indidual_Parts.include?('GAME_PLAYER#UPDATE')

#==============================================================================
# ** Game_Player
#------------------------------------------------------------------------------
#  This class handles the player. Its functions include event starting
#  determinants and map scrolling. Refer to "$game_player" for the one
#  instance of this class.
#==============================================================================

class Game_Player < Game_Character
  #--------------------------------------------------------------------------
  SDK.log_branch(:Game_Player, :update, :update_player_movement, 
    :update_plyrmvttest?, :update_scroll_down, :update_scroll_left, 
    :update_scroll_right, :update_scroll_up, :update_nonmoving)
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    last_moving = moving?                         # Remember moving flag
    update_player_movement if update_plyrmvttest? # Update Player Movement
    last_real_x = @real_x                         # Remember Real X
    last_real_y = @real_y                         # Remember Real Y
    super                                         # Parent Update Call
    update_scroll_down(last_real_y)               # Scroll Down
    update_scroll_left(last_real_x)               # Scroll Left
    update_scroll_right(last_real_x)              # Scroll Right
    update_scroll_up(last_real_y)                 # Scroll Up
    update_nonmoving(last_moving)                 # Update Non-Moving
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Player Movement Test
  #--------------------------------------------------------------------------
  def update_plyrmvttest?
    # If moving, event running, move route forcing, and message window
    # display are all not occurring
    unless moving? or $game_system.map_interpreter.running? or
           @move_route_forcing or $game_temp.message_window_showing
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Player Movement
  #--------------------------------------------------------------------------
  def update_player_movement
    # Move player in the direction the directional button is being pressed
    case Input.dir4
    when 2
      move_down
    when 4
      move_left
    when 6
      move_right
    when 8
      move_up
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Scroll Down
  #--------------------------------------------------------------------------
  def update_scroll_down(last_real_y)
    # If character moves down and is positioned lower than the center
    # of the screen
    if @real_y > last_real_y and @real_y - $game_map.display_y > CENTER_Y
      # Scroll map down
      $game_map.scroll_down(@real_y - last_real_y)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Left
  #--------------------------------------------------------------------------
  def update_scroll_left(last_real_x)
    # If character moves left and is positioned more let on-screen than
    # center
    if @real_x < last_real_x and @real_x - $game_map.display_x < CENTER_X
      # Scroll map left
      $game_map.scroll_left(last_real_x - @real_x)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Right
  #--------------------------------------------------------------------------
  def update_scroll_right(last_real_x)
    # If character moves right and is positioned more right on-screen than
    # center
    if @real_x > last_real_x and @real_x - $game_map.display_x > CENTER_X
      # Scroll map right
      $game_map.scroll_right(@real_x - last_real_x)
    end
  end
  #--------------------------------------------------------------------------
  # * Scroll Up
  #--------------------------------------------------------------------------
  def update_scroll_up(last_real_y)
    # If character moves up and is positioned higher than the center
    # of the screen
    if @real_y < last_real_y and @real_y - $game_map.display_y < CENTER_Y
      # Scroll map up
      $game_map.scroll_up(last_real_y - @real_y)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Non-Moving
  #--------------------------------------------------------------------------
  def update_nonmoving(last_moving)
    # If not moving
    unless moving?
      # If player was moving last time
      if last_moving
        update_encounter
      end
      update_action_trigger
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Encounter
  #--------------------------------------------------------------------------
  def update_encounter
    # Event determinant is via touch of same position event
    result = check_event_trigger_here([1,2])
    # If event which started does not exist
    if result == false
      # Disregard if debug mode is ON and ctrl key was pressed
      unless $DEBUG and Input.press?(Input::CTRL)
        # Encounter countdown
        if @encounter_count > 0
          @encounter_count -= 1
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update :  Action Trigger
  #--------------------------------------------------------------------------
  def update_action_trigger
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Same position and front event determinant
      check_event_trigger_here([0])
      check_event_trigger_there([0,1,2])
    end
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('SPRITE_BATTLER#UPDATE')

#==============================================================================
# ** Sprite_Battler
#------------------------------------------------------------------------------
#  This sprite is used to display the battler.It observes the Game_Character
#  class and automatically changes sprite conditions.
#==============================================================================

class Sprite_Battler
  #--------------------------------------------------------------------------
  SDK.log_branch(:Sprite_Battler, :update, :remove_battler, :redraw_battler,
    :loop_anim, :adjust_actor_opacity, :adjust_blink, :adjust_visibility,
    :sprite_escape, :sprite_white_flash, :sprite_animation, :sprite_damage,
    :sprite_collapse, :sprite_position)
  #--------------------------------------------------------------------------
  # * Update
  #--------------------------------------------------------------------------
  def update
    super
    # If battler is nil
    if @battler == nil
      remove_battler
      return
    end
    # If file name or hue are different than current ones
    redraw_battler
    # If animation ID is different than current one
    loop_anim
    # If actor which should be displayed
    adjust_actor_opacity
    # Blink
    adjust_blink
    # If invisible
    adjust_visibility
    # If visible
    if @battler_visible
      # Escape
      sprite_escape
      # White flash
      sprite_white_flash
      # Animation
      sprite_animation
      # Damage
      sprite_damage
      # Collapse
      sprite_collapse
    end
    # Set sprite coordinates
    sprite_position
  end
  #--------------------------------------------------------------------------
  # * Remove Battler
  #--------------------------------------------------------------------------
  def remove_battler      
    self.bitmap = nil
    loop_animation(nil)
  end
  #--------------------------------------------------------------------------
  # * Redraw Battler
  #--------------------------------------------------------------------------
  def redraw_battler
    if @battler.battler_name != @battler_name or
        @battler.battler_hue != @battler_hue
      # Get and set bitmap
      @battler_name = @battler.battler_name
      @battler_hue = @battler.battler_hue
      self.bitmap = RPG::Cache.battler(@battler_name, @battler_hue)
      @width = bitmap.width
      @height = bitmap.height
      self.ox = @width / 2
      self.oy = @height
      # Change opacity level to 0 when dead or hidden
      if @battler.dead? or @battler.hidden
        self.opacity = 0
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Loop Sprite Animation
  #--------------------------------------------------------------------------
  def loop_anim
    if @battler.damage == nil and
        @battler.state_animation_id != @state_animation_id
      @state_animation_id = @battler.state_animation_id
      loop_animation($data_animations[@state_animation_id])
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Actor Opacity
  #--------------------------------------------------------------------------
  def adjust_actor_opacity
    if @battler.is_a?(Game_Actor) and @battler_visible
      # Bring opacity level down a bit when not in main phase
      if $game_temp.battle_main_phase
        self.opacity += 3 if self.opacity < 255
      else
        self.opacity -= 3 if self.opacity > 207
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Blink
  #--------------------------------------------------------------------------
  def adjust_blink
    if @battler.blink
      blink_on
    else
      blink_off
    end
  end
  #--------------------------------------------------------------------------
  # * Adjust Visibility
  #--------------------------------------------------------------------------
  def adjust_visibility
    unless @battler_visible
      # Appear
      if not @battler.hidden and not @battler.dead? and
         (@battler.damage == nil or @battler.damage_pop)
        appear
        @battler_visible = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Escape
  #--------------------------------------------------------------------------
  def sprite_escape
    if @battler.hidden
      $game_system.se_play($data_system.escape_se)
      escape
      @battler_visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: White Flash
  #--------------------------------------------------------------------------
  def sprite_white_flash
    if @battler.white_flash
      whiten
      @battler.white_flash = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Animation
  #--------------------------------------------------------------------------
  def sprite_animation
    if @battler.animation_id != 0
      animation = $data_animations[@battler.animation_id]
      animation(animation, @battler.animation_hit)
      @battler.animation_id = 0
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Damage
  #--------------------------------------------------------------------------
  def sprite_damage
    if @battler.damage_pop
      damage(@battler.damage, @battler.critical)
      @battler.damage = nil
      @battler.critical = false
      @battler.damage_pop = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Collapse
  #--------------------------------------------------------------------------
  def sprite_collapse
    if @battler.damage == nil and @battler.dead?
      if @battler.is_a?(Game_Enemy)
        $game_system.se_play($data_system.enemy_collapse_se)
      else
        $game_system.se_play($data_system.actor_collapse_se)
      end
      collapse
      @battler_visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * Sprite: Position
  #--------------------------------------------------------------------------
  def sprite_position
    self.x = @battler.screen_x
    self.y = @battler.screen_y
    self.z = @battler.screen_z
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('SPRITESET_MAP#INITIALIZE')
  
#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  SDK.log_branch(:Spriteset_Map, :initialize, :init_viewports, :init_tilemap, 
    :init_panorama, :init_fog, :init_characters, :init_player, :init_weather,
    :init_pictures, :init_timer)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    init_viewports                            # Initialize Viewports
    init_tilemap                              # Initialize Tilemap
    init_panorama                             # Initialize Panorama
    init_fog                                  # Initialize Fog
    init_characters                           # Initialize Characters
    init_player                               # Initialize Player
    init_weather                              # Initialize Weather
    init_pictures                             # Initialize Pictures
    init_timer                                # Initialize Timer
    update                                    # Frame update
  end
  #--------------------------------------------------------------------------
  # * Viewport Initialization
  #--------------------------------------------------------------------------
  def init_viewports
    # Make viewports
    @viewport1 = Viewport.new(0, 0, 640, 480)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 200
    @viewport3.z = 5000
  end
  #--------------------------------------------------------------------------
  # * Tilemap Initialization
  #--------------------------------------------------------------------------
  def init_tilemap
    # Make tilemap
    @tilemap = Tilemap.new(@viewport1)
    @tilemap.tileset = RPG::Cache.tileset($game_map.tileset_name)
    for i in 0..6
      autotile_name = $game_map.autotile_names[i]
      @tilemap.autotiles[i] = RPG::Cache.autotile(autotile_name)
    end
    @tilemap.map_data = $game_map.data.dup
    @tilemap.priorities = $game_map.priorities
  end
  #--------------------------------------------------------------------------
  # * Panorama Initialization
  #--------------------------------------------------------------------------
  def init_panorama
    # Make panorama plane
    @panorama = Plane.new(@viewport1)
    @panorama.z = -1000
  end
  #--------------------------------------------------------------------------
  # * Fog Initialization
  #--------------------------------------------------------------------------
  def init_fog
    # Make fog plane
    @fog = Plane.new(@viewport1)
    @fog.z = 3000
  end
  #--------------------------------------------------------------------------
  # * Character Sprite Initialization
  #--------------------------------------------------------------------------
  def init_characters
    # Make character sprites
    @character_sprites = []
    for i in $game_map.events.keys.sort
      sprite = Sprite_Character.new(@viewport1, $game_map.events[i])
      @character_sprites.push(sprite)
    end
  end
  #--------------------------------------------------------------------------
  # * Player Initialization
  #--------------------------------------------------------------------------
  def init_player
    @character_sprites.push(Sprite_Character.new(@viewport1, $game_player))
  end
  #--------------------------------------------------------------------------
  # * Weather Initialization
  #--------------------------------------------------------------------------
  def init_weather
    # Make weather
    @weather = RPG::Weather.new(@viewport1)
  end
  #--------------------------------------------------------------------------
  # * Picture Initialization
  #--------------------------------------------------------------------------
  def init_pictures
    # Make picture sprites
    @picture_sprites = []
    for i in 1..80
      @picture_sprites.push(Sprite_Picture.new(@viewport2,
        $game_screen.pictures[i]))
    end
  end
  #--------------------------------------------------------------------------
  # * Timer Initialization
  #--------------------------------------------------------------------------
  def init_timer
    # Make timer sprite
    @timer_sprite = Sprite_Timer.new
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('SPRITESET_MAP#UPDATE')

#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  SDK.log_branch(:Spriteset_Map, :update, :update_panorama, :update_fog, 
    :update_tilemap, :update_panorama_plane, :update_fog_plane, 
    :update_character_sprites, :update_weather, :update_picture_sprites, 
    :update_timer, :update_viewports)
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_panorama                           # Update Panorama
    update_fog                                # Update Fog
    update_tilemap                            # Update Tilemap
    update_panorama_plane                     # Update Panorama Plane
    update_fog_plane                          # Update Fog Plane
    update_character_sprites                  # Update Character Sprites
    update_weather                            # Update Weather
    update_picture_sprites                    # Update Picture Sprites
    update_timer                              # Update Timer Sprite
    update_viewports                          # Update Viewports
  end
  #--------------------------------------------------------------------------
  # * Update Panorama
  #--------------------------------------------------------------------------
  def update_panorama
    # If panorama is different from current one
    if @panorama_name != $game_map.panorama_name or
       @panorama_hue != $game_map.panorama_hue
      @panorama_name = $game_map.panorama_name
      @panorama_hue = $game_map.panorama_hue
      if @panorama.bitmap != nil
        @panorama.bitmap.dispose
        @panorama.bitmap = nil
      end
      if @panorama_name != ""
        @panorama.bitmap = RPG::Cache.panorama(@panorama_name, @panorama_hue)
      end
      Graphics.frame_reset
    end
  end
  #--------------------------------------------------------------------------
  # * Update Fog
  #--------------------------------------------------------------------------
  def update_fog
    # If fog is different than current fog
    if @fog_name != $game_map.fog_name or @fog_hue != $game_map.fog_hue
      @fog_name = $game_map.fog_name
      @fog_hue = $game_map.fog_hue
      if @fog.bitmap != nil
        @fog.bitmap.dispose
        @fog.bitmap = nil
      end
      if @fog_name != ""
        @fog.bitmap = RPG::Cache.fog(@fog_name, @fog_hue)
      end
      Graphics.frame_reset
    end
  end
  #--------------------------------------------------------------------------
  # * Update Tilemap
  #--------------------------------------------------------------------------
  def update_tilemap
    # Update tilemap
    @tilemap.ox = $game_map.display_x / 4
    @tilemap.oy = $game_map.display_y / 4
    @tilemap.update
  end
  #--------------------------------------------------------------------------
  # * Update Panorama Plane
  #--------------------------------------------------------------------------
  def update_panorama_plane
    # Update panorama plane
    @panorama.ox = $game_map.display_x / 8
    @panorama.oy = $game_map.display_y / 8
  end
  #--------------------------------------------------------------------------
  # * Update Fog Plane
  #--------------------------------------------------------------------------
  def update_fog_plane
    # Update fog plane
    @fog.zoom_x = $game_map.fog_zoom / 100.0
    @fog.zoom_y = $game_map.fog_zoom / 100.0
    @fog.opacity = $game_map.fog_opacity
    @fog.blend_type = $game_map.fog_blend_type
    @fog.ox = $game_map.display_x / 4 + $game_map.fog_ox
    @fog.oy = $game_map.display_y / 4 + $game_map.fog_oy
    @fog.tone = $game_map.fog_tone
  end
  #--------------------------------------------------------------------------
  # * Update Character Sprites
  #--------------------------------------------------------------------------
  def update_character_sprites
    # Update character sprites
    for sprite in @character_sprites
      sprite.update
    end
  end
  #--------------------------------------------------------------------------
  # * Update Weather
  #--------------------------------------------------------------------------
  def update_weather
    # Update weather graphic
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.ox = $game_map.display_x / 4
    @weather.oy = $game_map.display_y / 4
    @weather.update
  end
  #--------------------------------------------------------------------------
  # * Update Picture Sprites
  #--------------------------------------------------------------------------
  def update_picture_sprites
    # Update picture sprites
    for sprite in @picture_sprites
      sprite.update
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Timer
  #--------------------------------------------------------------------------
  def update_timer
    # Update timer sprite
    @timer_sprite.update
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Viewports
  #--------------------------------------------------------------------------
  def update_viewports
    # Set screen color tone and shake position
    @viewport1.tone = $game_screen.tone 
    @viewport1.ox = $game_screen.shake
    # Set screen flash color
    @viewport3.color = $game_screen.flash_color 
    # Update viewports
    @viewport1.update     
    @viewport3.update
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('SPRITESET_BATTLE#INITIALIZE')

#==============================================================================
# ** Spriteset_Battle
#------------------------------------------------------------------------------
#  This class brings together battle screen sprites. It's used within
#  the Scene_Battle class.
#==============================================================================

class Spriteset_Battle
  #--------------------------------------------------------------------------
  SDK.log_branch(:Spriteset_Battle, :initialize, :init_viewport, 
    :init_battleback, :init_enemysprites, :init_actorsprites, 
    :init_picturesprites, :init_weather, :init_timer)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    init_viewport                             # Initialize Viewports
    init_battleback                           # Initialize Battleback
    init_enemysprites                         # Initialize Enemy Sprites
    init_actorsprites                         # Initialize Actor Sprites
    init_picturesprites                       # Initialize Picture Sprites
    init_weather                              # Initialize Weather
    init_timer                                # Initialize Timer
    update                                    # Frame update
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Viewports
  #--------------------------------------------------------------------------
  def init_viewport
    # Make viewports
    @viewport1 = Viewport.new(0, 0, 640, 320)
    @viewport2 = Viewport.new(0, 0, 640, 480)
    @viewport3 = Viewport.new(0, 0, 640, 480)
    @viewport4 = Viewport.new(0, 0, 640, 480)
    @viewport2.z = 101
    @viewport3.z = 200
    @viewport4.z = 5000
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Battleback Sprite
  #--------------------------------------------------------------------------
  def init_battleback
    # Make battleback sprite
    @battleback_sprite = Sprite.new(@viewport1)
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Enemy Sprites
  #--------------------------------------------------------------------------
  def init_enemysprites
    # Make enemy sprites
    @enemy_sprites = []
    for enemy in $game_troop.enemies.reverse
      @enemy_sprites.push(Sprite_Battler.new(@viewport1, enemy))
    end
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Actor Sprites
  #--------------------------------------------------------------------------
  def init_actorsprites
    # Make actor sprites
    @actor_sprites = []
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
    @actor_sprites.push(Sprite_Battler.new(@viewport2))
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Pictures
  #--------------------------------------------------------------------------
  def init_picturesprites
    # Make picture sprites
    @picture_sprites = []
    for i in 81..100
      @picture_sprites.push(Sprite_Picture.new(@viewport3,
        $game_screen.pictures[i]))
    end
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Weather
  #--------------------------------------------------------------------------
  def init_weather
    # Make weather
    @weather = RPG::Weather.new(@viewport1)
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Timer
  #--------------------------------------------------------------------------
  def init_timer
    # Make timer sprite
    @timer_sprite = Sprite_Timer.new
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('SPRITESET_BATTLE#UPDATE')

#==============================================================================
# ** Spriteset_Battle
#------------------------------------------------------------------------------
#  This class brings together battle screen sprites. It's used within
#  the Scene_Battle class.
#==============================================================================

class Spriteset_Battle
  #--------------------------------------------------------------------------
  SDK.log_branch(:Spriteset_Battle, :update, :update_battleback, 
    :update_battlers, :update_sprites, :update_weather, :update_timer, 
    :update_viewports)
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    update_battleback                         # Update Battleback
    update_battlers                           # Update Actor Battlers
    update_sprites                            # Update Sprites
    update_weather                            # Update Weather
    update_timer                              # Update Timer
    update_viewports                          # Update Viewports
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Battleback
  #--------------------------------------------------------------------------
  def update_battleback
    # If battleback file name is different from current one
    if @battleback_name != $game_temp.battleback_name
      @battleback_name = $game_temp.battleback_name
      if @battleback_sprite.bitmap != nil
        @battleback_sprite.bitmap.dispose
      end
      @battleback_sprite.bitmap = RPG::Cache.battleback(@battleback_name)
      @battleback_sprite.src_rect.set(0, 0, 640, 320)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Actor Battlers
  #--------------------------------------------------------------------------
  def update_battlers
    # Update actor sprite contents (corresponds with actor switching)
    @actor_sprites[0].battler = $game_party.actors[0]
    @actor_sprites[1].battler = $game_party.actors[1]
    @actor_sprites[2].battler = $game_party.actors[2]
    @actor_sprites[3].battler = $game_party.actors[3]
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Sprites
  #--------------------------------------------------------------------------
  def update_sprites
    # Update battler sprites
    for sprite in @enemy_sprites + @actor_sprites + @picture_sprites
      sprite.update
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Weather
  #--------------------------------------------------------------------------
  def update_weather
    # Update weather graphic
    @weather.type = $game_screen.weather_type
    @weather.max = $game_screen.weather_max
    @weather.update
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Timer
  #--------------------------------------------------------------------------
  def update_timer
    # Update timer sprite
    @timer_sprite.update
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Viewports
  #--------------------------------------------------------------------------
  def update_viewports
    # Set screen color tone and shake position
    @viewport1.tone = $game_screen.tone
    @viewport1.ox = $game_screen.shake
    # Set screen flash color
    @viewport4.color = $game_screen.flash_color
    # Update viewports
    @viewport1.update
    @viewport2.update
    @viewport4.update
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part II Check
#==============================================================================
if SDK::Parts.include?(2) || 
   SDK::Indidual_Parts.include?('WINDOW_SAVEFILE#INITIIALIZE')

#==============================================================================
# ** Window_SaveFile
#==============================================================================

class Window_SaveFile < Window_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Window_SaveFile, :initialize, :init_filename, 
    :init_filedata, :init_gamedata)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize(file_index, filename)
    super(0, 64 + file_index % 4 * 104, 640, 104)
    self.contents = Bitmap.new(width - 32, height - 32)
    init_filename(file_index, filename)
    init_filedata(file_index)
    init_gamedata if @file_exist
    refresh
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Filename
  #--------------------------------------------------------------------------
  def init_filename(file_index, filename)
    @file_index = file_index
    @filename = filename
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : File Data
  #--------------------------------------------------------------------------
  def init_filedata(file_index)
    @file_index = file_index
    @time_stamp = Time.at(0)
    @file_exist = FileTest.exist?(@filename)
    @selected   = false
  end
  #--------------------------------------------------------------------------
  # * Object Initialization : Game Data
  #--------------------------------------------------------------------------
  def init_gamedata
    file = File.open(@filename, "r")
    @time_stamp = file.mtime
    @characters = Marshal.load(file)
    @frame_count = Marshal.load(file)
    @game_system = Marshal.load(file)
    @game_switches = Marshal.load(file)
    @game_variables = Marshal.load(file)
    @total_sec = @frame_count / Graphics.frame_rate
    file.close
  end
end

#==============================================================================
# ** Ends Enable Part II Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_TITLE')

#==============================================================================
# ** Scene_Title
#------------------------------------------------------------------------------
#  This class performs title screen processing.
#==============================================================================

class Scene_Title < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Title, :main, :main_variable, :main_sprite, 
    :main_window, :main_audio)
  SDK.log_branch(:Scene_Title, :main_variable, :main_database, 
    :main_test_continue)
  SDK.log_branch(:Scene_Title, :command_new_game, :commandnewgame_audio, 
    :commandnewgame_gamedata, :commandnewgame_partysetup, 
    :commandnewgame_mapsetup, :commandnewgame_sceneswitch)
  SDK.log_branch(:Scene_Title, :battle_test, :battletest_database, 
    :commandnewgame_gamedata, :battletest_setup, :battletest_sceneswitch)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    return if main_battle_test? # Battle Test & Return if in Battle Test Mode
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Battle Test Check
  #--------------------------------------------------------------------------
  def main_battle_test?
    # If battle test
    if $BTEST
      battle_test
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Load Database
    main_database
    # Continue Enabled Test
    main_test_continue
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Database Initialization
  #--------------------------------------------------------------------------
  def main_database
    # Load database
    $data_actors        = load_data("Data/Actors.rxdata")
    $data_classes       = load_data("Data/Classes.rxdata")
    $data_skills        = load_data("Data/Skills.rxdata")
    $data_items         = load_data("Data/Items.rxdata")
    $data_weapons       = load_data("Data/Weapons.rxdata")
    $data_armors        = load_data("Data/Armors.rxdata")
    $data_enemies       = load_data("Data/Enemies.rxdata")
    $data_troops        = load_data("Data/Troops.rxdata")
    $data_states        = load_data("Data/States.rxdata")
    $data_animations    = load_data("Data/Animations.rxdata")
    $data_tilesets      = load_data("Data/Tilesets.rxdata")
    $data_common_events = load_data("Data/CommonEvents.rxdata")
    $data_system        = load_data("Data/System.rxdata")
    # Make system object
    $game_system = Game_System.new
  end
  #--------------------------------------------------------------------------
  # * Main Test Initialization
  #--------------------------------------------------------------------------
  def main_test_continue
    # Set Continued Enabled Flag Off
    @continue_enabled = false
    # Checks For Save Files
    for i in 0..3
      if FileTest.exist?("Save#{i+1}.rxdata")
        # Sets Continued Enable Flag On
        @continue_enabled = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Sprite Initialization
  #--------------------------------------------------------------------------
  def main_sprite
    super
    # Make title graphic
    @sprite = Sprite.new
    @sprite.bitmap = RPG::Cache.title($data_system.title_name)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make command window
    s1 = "New Game"
    s2 = "Continue"
    s3 = "Shutdown"
    @command_window = Window_Command.new(192, [s1, s2, s3])
    @command_window.back_opacity = 160
    @command_window.x = 320 - @command_window.width / 2
    @command_window.y = 288
    # If continue is enabled, move cursor to "Continue"
    # If disabled, display "Continue" text in gray
    if @continue_enabled
      @command_window.index = 1
    else
      @command_window.disable_item(1)
    end
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Audio Initialization
  #--------------------------------------------------------------------------
  def main_audio
    super
    # Play title BGM
    $game_system.bgm_play($data_system.title_bgm)
    # Stop playing ME and BGS
    Audio.me_stop
    Audio.bgs_stop
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by command window cursor position
      case @command_window.index
      when 0  # New game
        command_new_game
      when 1  # Continue
        command_continue
      when 2  # Shutdown
        command_shutdown
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Command: New Game
  #--------------------------------------------------------------------------
  def command_new_game
    commandnewgame_audio        # Audio Control
    commandnewgame_gamedata     # Game Data Setup
    commandnewgame_partysetup   # Party Setup
    commandnewgame_mapsetup     # Map Setup
    commandnewgame_sceneswitch  # Scene Switch
  end
  #--------------------------------------------------------------------------
  # * Command: New Game : Audio Control
  #--------------------------------------------------------------------------
  def commandnewgame_audio
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Stop BGM
    Audio.bgm_stop
  end
  #--------------------------------------------------------------------------
  # * Command: New Game : Game Data Setup
  #--------------------------------------------------------------------------
  def commandnewgame_gamedata
    # Reset frame count for measuring play time
    Graphics.frame_count = 0
    # Make each type of game object
    $game_temp          = Game_Temp.new
    $game_system        = Game_System.new
    $game_switches      = Game_Switches.new
    $game_variables     = Game_Variables.new
    $game_self_switches = Game_SelfSwitches.new
    $game_screen        = Game_Screen.new
    $game_actors        = Game_Actors.new
    $game_party         = Game_Party.new
    $game_troop         = Game_Troop.new
    $game_map           = Game_Map.new
    $game_player        = Game_Player.new
  end
  #--------------------------------------------------------------------------
  # * Command: New Game : Party Setup
  #--------------------------------------------------------------------------
  def commandnewgame_partysetup
    # Set up initial party
    $game_party.setup_starting_members
  end
  #--------------------------------------------------------------------------
  # * Command: New Game : Map Setup
  #--------------------------------------------------------------------------
  def commandnewgame_mapsetup
    # Set up initial map position
    $game_map.setup($data_system.start_map_id)
    # Move player to initial position
    $game_player.moveto($data_system.start_x, $data_system.start_y)
    # Refresh player
    $game_player.refresh
    # Run automatic change for BGM and BGS set with map
    $game_map.autoplay
    # Update map (run parallel process event)
    $game_map.update
  end
  #--------------------------------------------------------------------------
  # * Command: New Game : Scene Switch
  #--------------------------------------------------------------------------
  def commandnewgame_sceneswitch
    # Switch to map screen
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # * Command: Continue
  #--------------------------------------------------------------------------
  def command_continue
    # If continue is disabled
    unless @continue_enabled
      # Play buzzer SE
      $game_system.se_play($data_system.buzzer_se)
      return
    end
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to load screen
    $scene = Scene_Load.new
  end
  #--------------------------------------------------------------------------
  # * Command: Shutdown
  #--------------------------------------------------------------------------
  def command_shutdown
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Fade out BGM, BGS, and ME
    Audio.bgm_fade(800)
    Audio.bgs_fade(800)
    Audio.me_fade(800)
    # Shutdown
    $scene = nil
  end
  #--------------------------------------------------------------------------
  # * Battle Test
  #--------------------------------------------------------------------------
  def battle_test
    battletest_database
    commandnewgame_gamedata
    battletest_setup
    battletest_sceneswitch
  end
  #--------------------------------------------------------------------------
  # * Battle Test : Load Database
  #--------------------------------------------------------------------------
  def battletest_database
    # Load database (for battle test)
    $data_actors        = load_data("Data/BT_Actors.rxdata")
    $data_classes       = load_data("Data/BT_Classes.rxdata")
    $data_skills        = load_data("Data/BT_Skills.rxdata")
    $data_items         = load_data("Data/BT_Items.rxdata")
    $data_weapons       = load_data("Data/BT_Weapons.rxdata")
    $data_armors        = load_data("Data/BT_Armors.rxdata")
    $data_enemies       = load_data("Data/BT_Enemies.rxdata")
    $data_troops        = load_data("Data/BT_Troops.rxdata")
    $data_states        = load_data("Data/BT_States.rxdata")
    $data_animations    = load_data("Data/BT_Animations.rxdata")
    $data_tilesets      = load_data("Data/BT_Tilesets.rxdata")
    $data_common_events = load_data("Data/BT_CommonEvents.rxdata")
    $data_system        = load_data("Data/BT_System.rxdata")
  end
  #--------------------------------------------------------------------------
  # * Battle Test : Setup
  #--------------------------------------------------------------------------
  def battletest_setup
    # Set up party for battle test
    $game_party.setup_battle_test_members
    # Set troop ID, can escape flag, and battleback
    $game_temp.battle_troop_id = $data_system.test_troop_id
    $game_temp.battle_can_escape = true
    $game_map.battleback_name = $data_system.battleback_name
  end
  #--------------------------------------------------------------------------
  # * Battle Test : Scene Switch
  #--------------------------------------------------------------------------
  def battletest_sceneswitch
    # Play battle start SE
    $game_system.se_play($data_system.battle_start_se)
    # Play battle BGM
    $game_system.bgm_play($game_system.battle_bgm)
    # Switch to battle screen
    $scene = Scene_Battle.new
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_MAP')

#==============================================================================
# ** Window_Message
#------------------------------------------------------------------------------
#  This message window is used to display text.
#==============================================================================

class Window_Message < Window_Selectable
  #--------------------------------------------------------------------------
  # * Disable Update
  #--------------------------------------------------------------------------
  def disable_update?
    return $scene.is_a?(Scene_Map)
  end
end
  
#==============================================================================
# ** Spriteset_Map
#------------------------------------------------------------------------------
#  This class brings together map screen sprites, tilemaps, etc.
#  It's used within the Scene_Map class.
#==============================================================================

class Spriteset_Map
  #--------------------------------------------------------------------------
  # * Disable Update
  #--------------------------------------------------------------------------
  def disable_update?
    return $scene.is_a?(Scene_Map)
  end
end

#==============================================================================
# ** Scene_Map
#------------------------------------------------------------------------------
#  This class performs map screen processing.
#==============================================================================

class Scene_Map < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Map, :main, :main_spriteset, :main_window, 
    :main_end)
  SDK.log_branch(:Scene_Map, :update, :update_systems, 
    :update_transferplayer?, :update_transition?, :update_game_over?,
    :update_to_title?, :update_transition, :update_encounter, 
    :update_call_menu, :update_call_debug, :update_calling)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Spriteset Initialization
  #--------------------------------------------------------------------------
  def main_spriteset
    super
    # Make sprite set
    @spriteset = Spriteset_Map.new
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make message window
    @message_window = Window_Message.new
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Ending
  #--------------------------------------------------------------------------
  def main_end
    super
    # If switching to title screen
    if $scene.is_a?(Scene_Title)
      # Fade out screen
      Graphics.transition
      Graphics.freeze
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    loop do                                        # Loop
      update_systems                               # Update Systems
      break if update_transferplayer?              # Break if Transfer Player
      break if update_transition?                  # Break if Transition
    end                                            # End Loop
    @message_window.update                         # Update message window
    @spriteset.update                              # Update Spriteset
    return if update_game_over?                    # Exit If Gameover
    return if update_to_title?                     # Exit if Title
    update_transition                              # Update Transition
    return if update_message?                      # Exit If Message
    update_encounter                               # Update Encounter
    update_call_menu                               # Update Menu Call
    update_call_debug                              # Update Debug Call
    update_calling                                 # Update Calls
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Systems
  #--------------------------------------------------------------------------
  def update_systems
    # Update map, interpreter, and player order
    # (this update order is important for when conditions are fulfilled 
    # to run any event, and the player isn't provided the opportunity to
    # move in an instant)
    $game_map.update
    $game_system.map_interpreter.update
    $game_player.update
    # Update system (timer), screen
    $game_system.update
    $game_screen.update
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Transfer Player
  #--------------------------------------------------------------------------
  def update_transferplayer?
    # Abort loop if player isn't place moving
    unless $game_temp.player_transferring
      return true
    end
    # Run place move
    transfer_player
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Transition
  #--------------------------------------------------------------------------
  def update_transition?
    # Abort loop if transition processing
    if $game_temp.transition_processing
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Gameover Test
  #--------------------------------------------------------------------------
  def update_game_over?
    # If game over
    if $game_temp.gameover
      # Switch to game over screen
      $scene = Scene_Gameover.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Title Test
  #--------------------------------------------------------------------------
  def update_to_title?
    # If returning to title screen
    if $game_temp.to_title
      # Change to title screen
      $scene = Scene_Title.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Transition
  #--------------------------------------------------------------------------
  def update_transition
    # If transition processing
    if $game_temp.transition_processing
      # Clear transition processing flag
      $game_temp.transition_processing = false
      # Execute transition
      if $game_temp.transition_name == ''
        Graphics.transition(20)
      else
        Graphics.transition(40, 'Graphics/Transitions/' +
                                $game_temp.transition_name)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Message Test
  #--------------------------------------------------------------------------
  def update_message?
    # If showing message window
    if $game_temp.message_window_showing
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Encounter
  #--------------------------------------------------------------------------
  def update_encounter
    # If encounter list isn't empty, and encounter count is 0
    if $game_player.encounter_count == 0 and $game_map.encounter_list != []
      # If event is running or encounter is not forbidden
      unless $game_system.map_interpreter.running? or
             $game_system.encounter_disabled
        # Confirm troop
        n = rand($game_map.encounter_list.size)
        troop_id = $game_map.encounter_list[n]
        # If troop is valid
        if $data_troops[troop_id] != nil
          # Set battle calling flag
          $game_temp.battle_calling = true
          $game_temp.battle_troop_id = troop_id
          $game_temp.battle_can_escape = true
          $game_temp.battle_can_lose = false
          $game_temp.battle_proc = nil
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Menu Call
  #--------------------------------------------------------------------------
  def update_call_menu
    # If B button was pressed
    if Input.trigger?(Input::B)
      # If event is running, or menu is not forbidden
      unless $game_system.map_interpreter.running? or
             $game_system.menu_disabled
        # Set menu calling flag or beep flag
        $game_temp.menu_calling = true
        $game_temp.menu_beep = true
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Debug Call
  #--------------------------------------------------------------------------
  def update_call_debug
    # If debug mode is ON and F9 key was pressed
    if $DEBUG and Input.press?(Input::F9)
      # Set debug calling flag
      $game_temp.debug_calling = true
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Calling
  #--------------------------------------------------------------------------
  def update_calling
    # If player is not moving
    unless $game_player.moving?
      # Run calling of each screen
      if $game_temp.battle_calling
        call_battle
      elsif $game_temp.shop_calling
        call_shop
      elsif $game_temp.name_calling
        call_name
      elsif $game_temp.menu_calling
        call_menu

      elsif $game_temp.save_calling
        call_save
      elsif $game_temp.debug_calling
        call_debug
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Battle Call
  #--------------------------------------------------------------------------
  def call_battle
    # Clear battle calling flag
    $game_temp.battle_calling = false
    # Clear menu calling flag
    $game_temp.menu_calling = false
    $game_temp.menu_beep = false
    # Make encounter count
    $game_player.make_encounter_count
    # Memorize map BGM and stop BGM
    $game_temp.map_bgm = $game_system.playing_bgm
    $game_system.bgm_stop
    # Play battle start SE
    $game_system.se_play($data_system.battle_start_se)
    # Play battle BGM
    $game_system.bgm_play($game_system.battle_bgm)
    # Straighten player position
    $game_player.straighten
    # Switch to battle screen
    $scene = Scene_Battle.new
  end
  #--------------------------------------------------------------------------
  # * Shop Call
  #--------------------------------------------------------------------------
  def call_shop
    # Clear shop call flag
    $game_temp.shop_calling = false
    # Straighten player position
    $game_player.straighten
    # Switch to shop screen
    $scene = Scene_Shop.new
  end
  #--------------------------------------------------------------------------
  # * Name Input Call
  #--------------------------------------------------------------------------
  def call_name
    # Clear name input call flag
    $game_temp.name_calling = false
    # Straighten player position
    $game_player.straighten
    # Switch to name input screen
    $scene = Scene_Name.new
  end
  #--------------------------------------------------------------------------
  # * Menu Call
  #--------------------------------------------------------------------------
  def call_menu
    # Clear menu call flag
    $game_temp.menu_calling = false
    # If menu beep flag is set
    if $game_temp.menu_beep
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Clear menu beep flag
      $game_temp.menu_beep = false
    end
    # Straighten player position
    $game_player.straighten
    # Switch to menu screen
    $scene = Scene_Menu.new
  end
  #--------------------------------------------------------------------------
  # * Save Call
  #--------------------------------------------------------------------------
  def call_save
    # Straighten player position
    $game_player.straighten
    # Switch to save screen
    $scene = Scene_Save.new
  end
  #--------------------------------------------------------------------------
  # * Debug Call
  #--------------------------------------------------------------------------
  def call_debug
    # Clear debug call flag
    $game_temp.debug_calling = false
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Straighten player position
    $game_player.straighten
    # Switch to debug screen
    $scene = Scene_Debug.new
  end
  #--------------------------------------------------------------------------
  # * Player Place Move
  #--------------------------------------------------------------------------
  def transfer_player
    # Clear player place move call flag
    $game_temp.player_transferring = false
    # If move destination is different than current map
    if $game_map.map_id != $game_temp.player_new_map_id
      # Set up a new map
      $game_map.setup($game_temp.player_new_map_id)
    end
    # Set up player position
    $game_player.moveto($game_temp.player_new_x, $game_temp.player_new_y)
    # Set player direction
    case $game_temp.player_new_direction
    when 2  # down
      $game_player.turn_down
    when 4  # left
      $game_player.turn_left
    when 6  # right
      $game_player.turn_right
    when 8  # up
      $game_player.turn_up
    end
    # Straighten player position
    $game_player.straighten
    # Update map (run parallel process event)
    $game_map.update
    # Remake sprite set
    @spriteset.dispose
    @spriteset = Spriteset_Map.new
    # If processing transition
    if $game_temp.transition_processing
      # Clear transition processing flag
      $game_temp.transition_processing = false
      # Execute transition
      Graphics.transition(20)
    end
    # Run automatic change for BGM and BGS set on the map
    $game_map.autoplay
    # Frame reset
    Graphics.frame_reset
    # Update input information
    Input.update
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_MENU')

#==============================================================================
# ** Scene_Menu
#------------------------------------------------------------------------------
#  This class performs menu screen processing.
#==============================================================================

class Scene_Menu < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Menu, :main, :main_window)
  SDK.log_branch(:Scene_Menu, :main_window, :main_command_window)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     menu_index : command cursor's initial position
  #--------------------------------------------------------------------------
  def initialize(menu_index = 0)
    @menu_index = menu_index
    super()
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make main command window
    main_command_window
    # Make play time window
    @playtime_window = Window_PlayTime.new
    @playtime_window.x = 0
    @playtime_window.y = 224
    # Make steps window
    @steps_window = Window_Steps.new
    @steps_window.x = 0
    @steps_window.y = 320
    # Make gold window
    @gold_window = Window_Gold.new
    @gold_window.x = 0
    @gold_window.y = 416
    # Make status window
    @status_window = Window_MenuStatus.new
    @status_window.x = 160
    @status_window.y = 0
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization : Main Command
  #--------------------------------------------------------------------------
  def main_command_window
    # Make command window
    s1 = $data_system.words.item
    s2 = $data_system.words.skill
    s3 = $data_system.words.equip
    s4 = "Status"
    s5 = "Save"
    s6 = "End Game"
    @command_window = Window_Command.new(160, [s1, s2, s3, s4, s5, s6])
    @command_window.index = @menu_index
    # If number of party members is 0
    if $game_party.actors.size == 0
      # Disable items, skills, equipment, and status
      @command_window.disable_item(0)
      @command_window.disable_item(1)
      @command_window.disable_item(2)
      @command_window.disable_item(3)
    end
    # If save is forbidden
    if $game_system.save_disabled
      # Disable save
      @command_window.disable_item(4)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If command window is active: call update_command
    if @command_window.active
      update_command
      return
    # If status window is active: call update_status
    elsif @status_window.active
      update_status
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If command other than save or end game, and party members = 0
      if $game_party.actors.size == 0 and @command_window.index < 4
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Branch by command window cursor position
      case @command_window.index
      when 0  # item
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to item screen
        $scene = Scene_Item.new
      when 1  # skill
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Make status window active
        @command_window.active = false
        @status_window.active = true
        @status_window.index = 0
      when 2  # equipment
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Make status window active
        @command_window.active = false
        @status_window.active = true
        @status_window.index = 0
      when 3  # status
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Make status window active
        @command_window.active = false
        @status_window.active = true
        @status_window.index = 0
      when 4  # save
        # If saving is forbidden
        if $game_system.save_disabled
          # Play buzzer SE
          $game_system.se_play($data_system.buzzer_se)
          return
        end
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to save screen
        $scene = Scene_Save.new
      when 5  # end game
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to end game screen
        $scene = Scene_End.new
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when status window is active)
  #--------------------------------------------------------------------------
  def update_status
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Make command window active
      @command_window.active = true
      @status_window.active = false
      @status_window.index = -1
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by command window cursor position
      case @command_window.index
      when 1  # skill
        # If this actor's action limit is 2 or more
        if $game_party.actors[@status_window.index].restriction >= 2
          # Play buzzer SE
          $game_system.se_play($data_system.buzzer_se)
          return
        end
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to skill screen
        $scene = Scene_Skill.new(@status_window.index)
      when 2  # equipment
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to equipment screen
        $scene = Scene_Equip.new(@status_window.index)
      when 3  # status
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to status screen
        $scene = Scene_Status.new(@status_window.index)
      end
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_ITEM')

#==============================================================================
# ** Scene_Item
#------------------------------------------------------------------------------
#  This class performs item screen processing.
#==============================================================================

class Scene_Item < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Item, :main, :main_window)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make help window, item window
    @help_window = Window_Help.new
    @item_window = Window_Item.new
    # Associate help window
    @item_window.help_window = @help_window
    # Make target window (set to invisible / inactive)
    @target_window = Window_Target.new
    @target_window.visible = false
    @target_window.active = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If item window is active: call update_item
    if @item_window.active
      update_item
      return
    # If target window is active: call update_target
    elsif @target_window.active
      update_target
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when item window is active)
  #--------------------------------------------------------------------------
  def update_item
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(0)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get currently selected data on the item window
      @item = @item_window.item
      # If not a use item
      unless @item.is_a?(RPG::Item)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # If it can't be used
      unless $game_party.item_can_use?(@item.id)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # If effect scope is an ally
      if @item.scope >= 3
        # Activate target window
        @item_window.active = false
        @target_window.x = (@item_window.index + 1) % 2 * 304
        @target_window.visible = true
        @target_window.active = true
        # Set cursor position to effect scope (single / all)
        if @item.scope == 4 || @item.scope == 6
          @target_window.index = -1
        else
          @target_window.index = 0
        end
      # If effect scope is other than an ally
      else
        # If command event ID is valid
        if @item.common_event_id > 0
          # Command event call reservation
          $game_temp.common_event_id = @item.common_event_id
          # Play item use SE
          $game_system.se_play(@item.menu_se)
          # If consumable
          if @item.consumable
            # Decrease used items by 1
            $game_party.lose_item(@item.id, 1)
            # Draw item window item
            @item_window.draw_item(@item_window.index)
          end
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when target window is active)
  #--------------------------------------------------------------------------
  def update_target
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # If unable to use because items ran out
      unless $game_party.item_can_use?(@item.id)
        # Remake item window contents
        @item_window.refresh
      end
      # Erase target window
      @item_window.active = true
      @target_window.visible = false
      @target_window.active = false
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If items are used up
      if $game_party.item_number(@item.id) == 0
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # If target is all
      if @target_window.index == -1
        # Apply item effects to entire party
        used = false
        for i in $game_party.actors
          used |= i.item_effect(@item)
        end
      end
      # If single target
      if @target_window.index >= 0
        # Apply item use effects to target actor
        target = $game_party.actors[@target_window.index]
        used = target.item_effect(@item)
      end
      # If an item was used
      if used
        # Play item use SE
        $game_system.se_play(@item.menu_se)
        # If consumable
        if @item.consumable
          # Decrease used items by 1
          $game_party.lose_item(@item.id, 1)
          # Redraw item window item
          @item_window.draw_item(@item_window.index)
        end
        # Remake target window contents
        @target_window.refresh
        # If all party members are dead
        if $game_party.all_dead?
          # Switch to game over screen
          $scene = Scene_Gameover.new
          return
        end
        # If common event ID is valid
        if @item.common_event_id > 0
          # Common event call reservation
          $game_temp.common_event_id = @item.common_event_id
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
      end
      # If item wasn't used
      unless used
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
      end
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_SKILL')

#==============================================================================
# ** Scene_Skill
#------------------------------------------------------------------------------
#  This class performs skill screen processing.
#==============================================================================

class Scene_Skill < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Skill, :main, :main_variable, :main_window)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor_index : actor index
  #--------------------------------------------------------------------------
  def initialize(actor_index = 0)
    @actor_index = actor_index
    super()
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Get actor
    @actor = $game_party.actors[@actor_index]
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make help window, status window, and skill window
    @help_window = Window_Help.new
    @status_window = Window_SkillStatus.new(@actor)
    @skill_window = Window_Skill.new(@actor)
    # Associate help window
    @skill_window.help_window = @help_window
    # Make target window (set to invisible / inactive)
    @target_window = Window_Target.new
    @target_window.visible = false
    @target_window.active = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If skill window is active: call update_skill
    if @skill_window.active
      update_skill
      return
    # If skill target is active: call update_target
    elsif @target_window.active
      update_target
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (if skill window is active)
  #--------------------------------------------------------------------------
  def update_skill
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(1)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get currently selected data on the skill window
      @skill = @skill_window.skill
      # If unable to use
      if @skill == nil or not @actor.skill_can_use?(@skill.id)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # If effect scope is ally
      if @skill.scope >= 3
        # Activate target window
        @skill_window.active = false
        @target_window.x = (@skill_window.index + 1) % 2 * 304
        @target_window.visible = true
        @target_window.active = true
        # Set cursor position to effect scope (single / all)
        if @skill.scope == 4 || @skill.scope == 6
          @target_window.index = -1
        elsif @skill.scope == 7
          @target_window.index = @actor_index - 10
        else
          @target_window.index = 0
        end
      # If effect scope is other than ally
      else
        # If common event ID is valid
        if @skill.common_event_id > 0
          # Common event call reservation
          $game_temp.common_event_id = @skill.common_event_id
          # Play use skill SE
          $game_system.se_play(@skill.menu_se)
          # Use up SP
          @actor.sp -= @skill.sp_cost
          # Remake each window content
          @status_window.refresh
          @skill_window.refresh
          @target_window.refresh
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
      end
      return
    end
    # If R button was pressed
    if Input.trigger?(Input::R)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To next actor
      @actor_index += 1
      @actor_index %= $game_party.actors.size
      # Switch to different skill screen
      $scene = Scene_Skill.new(@actor_index)
      return
    end
    # If L button was pressed
    if Input.trigger?(Input::L)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To previous actor
      @actor_index += $game_party.actors.size - 1
      @actor_index %= $game_party.actors.size
      # Switch to different skill screen
      $scene = Scene_Skill.new(@actor_index)
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when target window is active)
  #--------------------------------------------------------------------------
  def update_target
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Erase target window
      @skill_window.active = true
      @target_window.visible = false
      @target_window.active = false
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If unable to use because SP ran out
      unless @actor.skill_can_use?(@skill.id)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # If target is all
      if @target_window.index == -1
        # Apply skill use effects to entire party
        used = false
        for i in $game_party.actors
          used |= i.skill_effect(@actor, @skill)
        end
      end
      # If target is user
      if @target_window.index <= -2
        # Apply skill use effects to target actor
        target = $game_party.actors[@target_window.index + 10]
        used = target.skill_effect(@actor, @skill)
      end
      # If single target
      if @target_window.index >= 0
        # Apply skill use effects to target actor
        target = $game_party.actors[@target_window.index]
        used = target.skill_effect(@actor, @skill)
      end
      # If skill was used
      if used
        # Play skill use SE
        $game_system.se_play(@skill.menu_se)
        # Use up SP
        @actor.sp -= @skill.sp_cost
        # Remake each window content
        @status_window.refresh
        @skill_window.refresh
        @target_window.refresh
        # If entire party is dead
        if $game_party.all_dead?
          # Switch to game over screen
          $scene = Scene_Gameover.new
          return
        end
        # If command event ID is valid
        if @skill.common_event_id > 0
          # Command event call reservation
          $game_temp.common_event_id = @skill.common_event_id
          # Switch to map screen
          $scene = Scene_Map.new
          return
        end
      end
      # If skill wasn't used
      unless used
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
      end
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_EQUIP')

#==============================================================================
# ** Window_EquipItem
#------------------------------------------------------------------------------
#  This window displays choices when opting to change equipment on the
#  equipment screen.
#==============================================================================

class Window_EquipItem < Window_Selectable
  #--------------------------------------------------------------------------
  # * Disable Update
  #--------------------------------------------------------------------------
  def disable_update?
    return true
  end
end
  
#==============================================================================
# ** Scene_Equip
#------------------------------------------------------------------------------
#  This class performs equipment screen processing.
#==============================================================================

class Scene_Equip < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Equip, :main, :main_variable, :main_window)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor_index : actor index
  #     equip_index : equipment index
  #--------------------------------------------------------------------------
  def initialize(actor_index = 0, equip_index = 0)
    @actor_index = actor_index
    @equip_index = equip_index
    super()
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Get actor
    @actor = $game_party.actors[@actor_index]
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make windows
    @help_window = Window_Help.new
    @left_window = Window_EquipLeft.new(@actor)
    @right_window = Window_EquipRight.new(@actor)
    @item_window1 = Window_EquipItem.new(@actor, 0)
    @item_window2 = Window_EquipItem.new(@actor, 1)
    @item_window3 = Window_EquipItem.new(@actor, 2)
    @item_window4 = Window_EquipItem.new(@actor, 3)
    @item_window5 = Window_EquipItem.new(@actor, 4)
    # Associate help window
    @right_window.help_window = @help_window
    @item_window1.help_window = @help_window
    @item_window2.help_window = @help_window
    @item_window3.help_window = @help_window
    @item_window4.help_window = @help_window
    @item_window5.help_window = @help_window
    # Set cursor position
    @right_window.index = @equip_index
    refresh
  end
  #--------------------------------------------------------------------------
  # * Main Update
  #--------------------------------------------------------------------------
  def main_update
    super
    @item_window.update
  end
  #--------------------------------------------------------------------------
  # * Refresh
  #--------------------------------------------------------------------------
  def refresh
    # Set item window to visible
    @item_window1.visible = (@right_window.index == 0)
    @item_window2.visible = (@right_window.index == 1)
    @item_window3.visible = (@right_window.index == 2)
    @item_window4.visible = (@right_window.index == 3)
    @item_window5.visible = (@right_window.index == 4)
    # Get currently equipped item
    item1 = @right_window.item
    # Set current item window to @item_window
    case @right_window.index
    when 0
      @item_window = @item_window1
    when 1
      @item_window = @item_window2
    when 2
      @item_window = @item_window3
    when 3
      @item_window = @item_window4
    when 4
      @item_window = @item_window5
    end
    # If right window is active
    if @right_window.active
      # Erase parameters for after equipment change
      @left_window.set_new_parameters(nil, nil, nil)
    end
    # If item window is active
    if @item_window.active
      # Get currently selected item
      item2 = @item_window.item
      # Change equipment
      last_hp = @actor.hp
      last_sp = @actor.sp
      @actor.equip(@right_window.index, item2 == nil ? 0 : item2.id)
      # Get parameters for after equipment change
      new_atk = @actor.atk
      new_pdef = @actor.pdef
      new_mdef = @actor.mdef
      # Return equipment
      @actor.equip(@right_window.index, item1 == nil ? 0 : item1.id)
      @actor.hp = last_hp
      @actor.sp = last_sp
      # Draw in left window
      @left_window.set_new_parameters(new_atk, new_pdef, new_mdef)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # Refresh Windows
    refresh
    # If right window is active: call update_right
    if @right_window.active
      update_right
      return
    # If item window is active: call update_item
    elsif @item_window.active
      update_item
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when right window is active)
  #--------------------------------------------------------------------------
  def update_right
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(2)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If equipment is fixed
      if @actor.equip_fix?(@right_window.index)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Activate item window
      @right_window.active = false
      @item_window.active = true
      @item_window.index = 0
      return
    end
    # If R button was pressed
    if Input.trigger?(Input::R)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To next actor
      @actor_index += 1
      @actor_index %= $game_party.actors.size
      # Switch to different equipment screen
      $scene = Scene_Equip.new(@actor_index, @right_window.index)
      return
    end
    # If L button was pressed
    if Input.trigger?(Input::L)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To previous actor
      @actor_index += $game_party.actors.size - 1
      @actor_index %= $game_party.actors.size
      # Switch to different equipment screen
      $scene = Scene_Equip.new(@actor_index, @right_window.index)
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when item window is active)
  #--------------------------------------------------------------------------
  def update_item
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Activate right window
      @right_window.active = true
      @item_window.active = false
      @item_window.index = -1
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play equip SE
      $game_system.se_play($data_system.equip_se)
      # Get currently selected data on the item window
      item = @item_window.item
      # Change equipment
      @actor.equip(@right_window.index, item == nil ? 0 : item.id)
      # Activate right window
      @right_window.active = true
      @item_window.active = false
      @item_window.index = -1
      # Remake right window and item window contents
      @right_window.refresh
      @item_window.refresh
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || 
   SDK::Indidual_Parts.include?('PART 3#SCENE_STATUS')

#==============================================================================
# ** Scene_Status
#------------------------------------------------------------------------------
#  This class performs status screen processing.
#==============================================================================

class Scene_Status < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Status, :main, :main_variable, :main_window)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     actor_index : actor index
  #--------------------------------------------------------------------------
  def initialize(actor_index = 0)
    @actor_index = actor_index
    super()
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Get actor
    @actor = $game_party.actors[@actor_index]
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make status window
    @status_window = Window_Status.new(@actor)
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(3)
      return
    end
    # If R button was pressed
    if Input.trigger?(Input::R)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To next actor
      @actor_index += 1
      @actor_index %= $game_party.actors.size
      # Switch to different status screen
      $scene = Scene_Status.new(@actor_index)
      return
    end
    # If L button was pressed
    if Input.trigger?(Input::L)
      # Play cursor SE
      $game_system.se_play($data_system.cursor_se)
      # To previous actor
      @actor_index += $game_party.actors.size - 1
      @actor_index %= $game_party.actors.size
      # Switch to different status screen
      $scene = Scene_Status.new(@actor_index)
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_FILE')

#==============================================================================
# ** Scene_File
#------------------------------------------------------------------------------
#  This is a superclass for the save screen and load screen.
#==============================================================================

class Scene_File < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_File, :main, :main_variable, :main_window)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #     help_text : text string shown in the help window
  #--------------------------------------------------------------------------
  def initialize(help_text)
    @help_text = help_text
    super()
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Select last file to be operated
    @file_index = $game_temp.last_file_index
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make help window
    @help_window = Window_Help.new
    @help_window.set_text(@help_text)
    # Make save file window
    @savefile_windows = []
    for i in 0..3
      @savefile_windows.push(Window_SaveFile.new(i, make_filename(i)))
    end
    @savefile_windows[@file_index].selected = true
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Call method: on_decision (defined by the subclasses)
      on_decision(make_filename(@file_index))
      $game_temp.last_file_index = @file_index
      return
    end
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Call method: on_cancel (defined by the subclasses)
      on_cancel
      return
    end
    # If the down directional button was pressed
    if Input.repeat?(Input::DOWN)
      # If the down directional button pressed down is not a repeat,
      # or cursor position is more in front than 3
      if Input.trigger?(Input::DOWN) or @file_index < 3
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Move cursor down
        @savefile_windows[@file_index].selected = false
        @file_index = (@file_index + 1) % 4
        @savefile_windows[@file_index].selected = true
        return
      end
    end
    # If the up directional button was pressed
    if Input.repeat?(Input::UP)
      # If the up directional button pressed down is not a repeat?
      # or cursor position is more in back than 0
      if Input.trigger?(Input::UP) or @file_index > 0
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Move cursor up
        @savefile_windows[@file_index].selected = false
        @file_index = (@file_index + 3) % 4
        @savefile_windows[@file_index].selected = true
        return
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Make File Name
  #     file_index : save file index (0-3)
  #--------------------------------------------------------------------------
  def make_filename(file_index)
    return "Save#{file_index + 1}.rxdata"
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_SAVE')

#==============================================================================
# ** Scene_Save
#------------------------------------------------------------------------------
#  This class performs save screen processing.
#==============================================================================

class Scene_Save < Scene_File
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Save, :write_save_data, :write_characters, 
    :write_frame, :write_setup, :write_data)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    super("Which file would you like to save to?")
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Decision Processing
  #--------------------------------------------------------------------------
  def on_decision(filename)
    # Play save SE
    $game_system.se_play($data_system.save_se)
    # Write save data
    file = File.open(filename, "wb")
    write_save_data(file)
    file.close
    # If called from event
    if $game_temp.save_calling
      # Clear save call flag
      $game_temp.save_calling = false
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # Switch to menu screen
    $scene = Scene_Menu.new(4)
  end
  #--------------------------------------------------------------------------
  # * Cancel Processing
  #--------------------------------------------------------------------------
  def on_cancel
    # Play cancel SE
    $game_system.se_play($data_system.cancel_se)
    # If called from event
    if $game_temp.save_calling
      # Clear save call flag
      $game_temp.save_calling = false
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # Switch to menu screen
    $scene = Scene_Map.new #$scene = Scene_Menu.new(4)
  end
  #--------------------------------------------------------------------------
  # * Write Save Data
  #     file : write file object (opened)
  #--------------------------------------------------------------------------
  def write_save_data(file)
    write_characters(file)
    write_frame(file)
    write_setup(file)
    write_data(file)
  end
  #--------------------------------------------------------------------------
  # * Make Character Data
  #--------------------------------------------------------------------------
  def write_characters(file)
    # Make character data for drawing save file
    characters = []
    for i in 0...$game_party.actors.size
      actor = $game_party.actors[i]
      characters.push([actor.character_name, actor.character_hue])
    end
    # Write character data for drawing save file
    Marshal.dump(characters, file)
  end
  #--------------------------------------------------------------------------
  # * Write Frame Count
  #--------------------------------------------------------------------------
  def write_frame(file)
    # Wrire frame count for measuring play time
    Marshal.dump(Graphics.frame_count, file)
  end
  #--------------------------------------------------------------------------
  # * Write Setup
  #--------------------------------------------------------------------------
  def write_setup(file)
    # Increase save count by 1
    $game_system.save_count += 1
    # Save magic number
    # (A random value will be written each time saving with editor)
    $game_system.magic_number = $data_system.magic_number
  end
  #--------------------------------------------------------------------------
  # * Write Data
  #--------------------------------------------------------------------------
  def write_data(file)
    # Write each type of game object
    Marshal.dump($game_system, file)
    Marshal.dump($game_switches, file)
    Marshal.dump($game_variables, file)
    Marshal.dump($game_self_switches, file)
    Marshal.dump($game_screen, file)
    Marshal.dump($game_actors, file)
    Marshal.dump($game_party, file)
    Marshal.dump($game_troop, file)
    Marshal.dump($game_map, file)
    Marshal.dump($game_player, file)
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_LOAD')

#==============================================================================
# ** Scene_Load
#------------------------------------------------------------------------------
#  This class performs load screen processing.
#==============================================================================

class Scene_Load < Scene_File
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Load, :read_save_data, :read_characters, 
    :read_frame, :read_data, :read_edit, :read_refresh)
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    # Remake temporary object
    $game_temp = Game_Temp.new
    # Timestamp selects new file
    $game_temp.last_file_index = 0
    latest_time = Time.at(0)
    for i in 0..3
      filename = make_filename(i)
      if FileTest.exist?(filename)
        file = File.open(filename, "r")
        if file.mtime > latest_time
          latest_time = file.mtime
          $game_temp.last_file_index = i
        end
        file.close
      end
    end
    super("Honnan szeretnél tölteni?")
  end
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Decision Processing
  #--------------------------------------------------------------------------
  def on_decision(filename)
    # If file doesn't exist
    unless FileTest.exist?(filename)
      # Play buzzer SE
      $game_system.se_play($data_system.buzzer_se)
      return
    end
    # Play load SE
    $game_system.se_play($data_system.load_se)
    # Read save data
    file = File.open(filename, "rb")
    read_save_data(file)
    file.close
    # Restore BGM and BGS
    $game_system.bgm_play($game_system.playing_bgm)
    $game_system.bgs_play($game_system.playing_bgs)
    # Update map (run parallel process event)
    $game_map.update
    # Switch to map screen
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # * Cancel Processing
  #--------------------------------------------------------------------------
  def on_cancel
    # Play cancel SE
    $game_system.se_play($data_system.cancel_se)
    # Switch to title screen
    $scene = Scene_Map.new # $scene = Scene_Title.new
  end
  #--------------------------------------------------------------------------
  # * Read Save Data
  #     file : file object for reading (opened)
  #--------------------------------------------------------------------------
  def read_save_data(file)
    read_characters(file)
    read_frame(file)
    read_data(file)
    read_edit
    read_refresh
  end
  #--------------------------------------------------------------------------
  # * Read Character Data
  #--------------------------------------------------------------------------
  def read_characters(file)
    # Read character data for drawing save file
    characters = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Frame Count
  #--------------------------------------------------------------------------
  def read_frame(file)
    # Read frame count for measuring play time
    Graphics.frame_count = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Data
  #--------------------------------------------------------------------------
  def read_data(file)
    # Read each type of game object
    $game_system        = Marshal.load(file)
    $game_switches      = Marshal.load(file)
    $game_variables     = Marshal.load(file)
    $game_self_switches = Marshal.load(file)
    $game_screen        = Marshal.load(file)
    $game_actors        = Marshal.load(file)
    $game_party         = Marshal.load(file)
    $game_troop         = Marshal.load(file)
    $game_map           = Marshal.load(file)
    $game_player        = Marshal.load(file)
  end
  #--------------------------------------------------------------------------
  # * Read Edit
  #--------------------------------------------------------------------------
  def read_edit
    # If magic number is different from when saving
    # (if editing was added with editor)
    if $game_system.magic_number != $data_system.magic_number
      # Load map
      $game_map.setup($game_map.map_id)
      $game_player.center($game_player.x, $game_player.y)
    end
  end
  #--------------------------------------------------------------------------
  # * Refresh Game Party
  #--------------------------------------------------------------------------
  def read_refresh
    # Refresh party members
    $game_party.refresh
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_END')

#==============================================================================
# ** Scene_End
#------------------------------------------------------------------------------
#  This class performs game end screen processing.
#==============================================================================

class Scene_End < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_End, :main, :main_window, :main_end)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make command window
    s1 = "To Title"
    s2 = "Shutdown"
    s3 = "Cancel"
    @command_window = Window_Command.new(192, [s1, s2, s3])
    @command_window.x = 320 - @command_window.width / 2
    @command_window.y = 240 - @command_window.height / 2
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Ending
  #--------------------------------------------------------------------------
  def main_end
    # If switching to title screen
    if $scene.is_a?(Scene_Title)
      # Fade out screen
      Graphics.transition
      Graphics.freeze
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(5)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by command window cursor position
      case @command_window.index
      when 0  # to title
        command_to_title
      when 1  # shutdown
        command_shutdown
      when 2  # quit
        command_cancel
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Process When Choosing [To Title] Command
  #--------------------------------------------------------------------------
  def command_to_title
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Fade out BGM, BGS, and ME
    Audio.bgm_fade(800)
    Audio.bgs_fade(800)
    Audio.me_fade(800)
    # Switch to title screen
    $scene = Scene_Title.new
  end
  #--------------------------------------------------------------------------
  # * Process When Choosing [Shutdown] Command
  #--------------------------------------------------------------------------
  def command_shutdown
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Fade out BGM, BGS, and ME
    Audio.bgm_fade(800)
    Audio.bgs_fade(800)
    Audio.me_fade(800)
    # Shutdown
    $scene = nil
  end
  #--------------------------------------------------------------------------
  # *  Process When Choosing [Cancel] Command
  #--------------------------------------------------------------------------
  def command_cancel
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Switch to menu screen
    $scene = Scene_Menu.new(5)
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || 
   SDK::Indidual_Parts.include?('PART 3#SCENE_BATTLE')

#==============================================================================
# ** Window_PartyCommand
#------------------------------------------------------------------------------
#  This window is used to select whether to fight or escape on the battle
#  screen.
#==============================================================================

class Window_PartyCommand < Window_HorizCommand
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    s1 = SDK::Scene_Commands::Scene_Battle::Fight
    s2 = SDK::Scene_Commands::Scene_Battle::Escape
    super(640, [s1, s2])
    self.back_opacity = 160
    disable_item(1) unless $game_temp.battle_can_escape
    self.active = false
    self.visible = false
  end
end
  
#==============================================================================
# ** Scene_Battle
#------------------------------------------------------------------------------
#  This class performs battle screen processing.
#==============================================================================

class Scene_Battle < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Battle, :main, :main_variable, :main_spriteset, 
    :main_window, :main_transition, :main_end)
  SDK.log_branch(:Scene_Battle, :main_variable, :main_battledata, 
    :main_troopdata)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    main_battledata         # Setup Battle Temp Data & Interpreter
    main_troopdata          # Setup Troop Data
    # Initialize wait count
    @wait_count = 0
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Battle Data Initialization
  #--------------------------------------------------------------------------
  def main_battledata
    # Initialize each kind of temporary battle data
    $game_temp.in_battle = true
    $game_temp.battle_turn = 0
    $game_temp.battle_event_flags.clear
    $game_temp.battle_abort = false
    $game_temp.battle_main_phase = false
    $game_temp.battleback_name = $game_map.battleback_name
    $game_temp.forcing_battler = nil
    # Initialize battle event interpreter
    $game_system.battle_interpreter.setup(nil, 0)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Troop Data Initialization
  #--------------------------------------------------------------------------
  def main_troopdata
    # Prepare troop
    @troop_id = $game_temp.battle_troop_id
    $game_troop.setup(@troop_id)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Spriteset Initialization
  #--------------------------------------------------------------------------
  def main_spriteset
    super
    # Make sprite set
    @spriteset = Spriteset_Battle.new
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make actor command window
    s1 = $data_system.words.attack
    s2 = $data_system.words.skill
    s3 = $data_system.words.guard
    s4 = $data_system.words.item
    @actor_command_window = Window_Command.new(160, [s1, s2, s3, s4])
    @actor_command_window.y = 160
    @actor_command_window.back_opacity = 160
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # Make other windows
    @party_command_window = Window_PartyCommand.new
    @help_window = Window_Help.new
    @help_window.back_opacity = 160
    @help_window.visible = false
    @status_window = Window_BattleStatus.new
    @message_window = Window_Message.new
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Transition
  #--------------------------------------------------------------------------
  def main_transition
    # Execute transition
    if $data_system.battle_transition == ""
      Graphics.transition(20)
    else
      Graphics.transition(40, "Graphics/Transitions/" +
        $data_system.battle_transition)
    end
    # Start pre-battle phase
    start_phase1
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Ending
  #--------------------------------------------------------------------------
  def main_end
    # Refresh map
    $game_map.refresh
    # If switching to title screen
    if $scene.is_a?(Scene_Title)
      # Fade out screen
      Graphics.transition
      Graphics.freeze
    end
    # If switching from battle test to any screen other than game over screen
    if $BTEST and not $scene.is_a?(Scene_Gameover)
      $scene = nil
    end
  end
  #--------------------------------------------------------------------------
  # * Determine Battle Win/Loss Results
  #--------------------------------------------------------------------------
  def judge
    # If all dead determinant is true, or number of members in party is 0
    if $game_party.all_dead? or $game_party.actors.size == 0
      # If possible to lose
      if $game_temp.battle_can_lose
        # Return to BGM before battle starts
        $game_system.bgm_play($game_temp.map_bgm)
        # Battle ends
        battle_end(2)
        # Return true
        return true
      end
      # Set game over flag
      $game_temp.gameover = true
      # Return true
      return true
    end
    # Return false if even 1 enemy exists
    for enemy in $game_troop.enemies
      if enemy.exist?
        return false
      end
    end
    # Start after battle phase (win)
    start_phase5
    # Return true
    return true
  end
  #--------------------------------------------------------------------------
  # * Battle Ends
  #     result : results (0:win 1:lose 2:escape)
  #--------------------------------------------------------------------------
  def battle_end(result)
    # Clear in battle flag
    $game_temp.in_battle = false
    # Clear entire party actions flag
    $game_party.clear_actions
    # Remove battle states
    for actor in $game_party.actors
      actor.remove_states_battle
    end
    # Clear enemies
    $game_troop.enemies.clear
    # Call battle callback
    if $game_temp.battle_proc != nil
      $game_temp.battle_proc.call(result)
      $game_temp.battle_proc = nil
    end
    # Switch to map screen
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # * Battle Event Setup
  #--------------------------------------------------------------------------
  def setup_battle_event
    # If battle event is running
    if $game_system.battle_interpreter.running?
      return
    end
    # Search for all battle event pages
    for index in 0...$data_troops[@troop_id].pages.size
      # Get event pages
      page = $data_troops[@troop_id].pages[index]
      # Make event conditions possible for reference with c
      c = page.condition
      # Next if Page Condition Not Met
      next unless c.conditions_met?(index)
      # Set up event
      $game_system.battle_interpreter.setup(page.list, 0)
      # If this page span is [battle] or [turn]
      if page.span <= 1
        # Set action completed flag
        $game_temp.battle_event_flags[index] = true
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    update_interpreter                # Update Battle Interpreter
    update_systems                    # Update Screen & Timer
    update_transition                 # Update Transition
    return if update_message?         # Update Message Test
    return if update_sseffect?        # Update Spriteset Effect Test
    return if update_gameover?        # Update Gameover Test
    return if update_title?           # Update Title Test
    return if update_abort?           # Update Abort Test
    return if update_wait?            # Update Wait Test
    return if update_forcing?         # Update Forcing Test
    update_battlephase                # Update Battle Phase
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Interpreter
  #--------------------------------------------------------------------------
  def update_interpreter
    # If battle event is running
    if $game_system.battle_interpreter.running?
      # Update interpreter
      $game_system.battle_interpreter.update
      # If a battler which is forcing actions doesn't exist
      if $game_temp.forcing_battler == nil
        # If battle event has finished running
        unless $game_system.battle_interpreter.running?
          # Rerun battle event set up if battle continues
          unless judge
            setup_battle_event
          end
        end
        # If not after battle phase
        if @phase != 5
          # Refresh status window
          @status_window.refresh
        end
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Systems
  #--------------------------------------------------------------------------
  def update_systems
    # Update system (timer) and screen
    $game_system.update
    $game_screen.update
    # If timer has reached 0
    if $game_system.timer_working and $game_system.timer == 0
      # Abort battle
      $game_temp.battle_abort = true
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Transition
  #--------------------------------------------------------------------------
  def update_transition
    # If transition is processing
    if $game_temp.transition_processing
      # Clear transition processing flag
      $game_temp.transition_processing = false
      # Execute transition
      if $game_temp.transition_name == ""
        Graphics.transition(20)
      else
        Graphics.transition(40, "Graphics/Transitions/" +
          $game_temp.transition_name)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Message Test
  #--------------------------------------------------------------------------
  def update_message?
    # If message window is showing
    return $game_temp.message_window_showing
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Spriteset Effect Test
  #--------------------------------------------------------------------------
  def update_sseffect?
    # If effect is showing
    return @spriteset.effect?
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Gamevoer Test
  #--------------------------------------------------------------------------
  def update_gameover?
    # If game over
    if $game_temp.gameover
      # Switch to game over screen
      $scene = Scene_Gameover.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Title Test
  #--------------------------------------------------------------------------
  def update_title?
    # If returning to title screen
    if $game_temp.to_title
      # Switch to title screen
      $scene = Scene_Title.new
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Abort Test
  #--------------------------------------------------------------------------
  def update_abort?
    # If battle is aborted
    if $game_temp.battle_abort
      # Return to BGM used before battle started
      $game_system.bgm_play($game_temp.map_bgm)
      # Battle ends
      battle_end(1)
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Wait Test
  #--------------------------------------------------------------------------
  def update_wait?
    # If waiting
    if @wait_count > 0
      # Decrease wait count
      @wait_count -= 1
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Forcing Test
  #--------------------------------------------------------------------------
  def update_forcing?
    # If battler forcing an action doesn't exist,
    # and battle event is running
    if $game_temp.forcing_battler == nil and
       $game_system.battle_interpreter.running?
      return true
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Frame Update : Battle Phase
  #--------------------------------------------------------------------------
  def update_battlephase
    # Branch according to phase
    case @phase
    when 1  # pre-battle phase
      update_phase1
    when 2  # party command phase
      update_phase2
    when 3  # actor command phase
      update_phase3
    when 4  # main phase
      update_phase4
    when 5  # after battle phase
      update_phase5
    end
  end
  #--------------------------------------------------------------------------
  # * Start Pre-Battle Phase
  #--------------------------------------------------------------------------
  def start_phase1
    # Shift to phase 1
    @phase = 1
    # Clear all party member actions
    $game_party.clear_actions
    # Set up battle event
    setup_battle_event
  end
  #--------------------------------------------------------------------------
  # * Frame Update (pre-battle phase)
  #--------------------------------------------------------------------------
  def update_phase1
    # Determine win/loss situation
    if judge
      # If won or lost: end method
      return
    end
    # Start party command phase
    start_phase2
  end
  #--------------------------------------------------------------------------
  # * Start Party Command Phase
  #--------------------------------------------------------------------------
  def start_phase2
    # Shift to phase 2
    @phase = 2
    # Set actor to non-selecting
    @actor_index = -1
    @active_battler = nil
    # Enable party command window
    @party_command_window.active = true
    @party_command_window.visible = true
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # Clear main phase flag
    $game_temp.battle_main_phase = false
    # Clear all party member actions
    $game_party.clear_actions
    # If impossible to input command
    unless $game_party.inputable?
      # Start main phase
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (party command phase)
  #--------------------------------------------------------------------------
  def update_phase2
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by party command window cursor position
      case @party_command_window.index
      when 0  # fight
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Start actor command phase
        start_phase3
      when 1  # escape
        # If it's not possible to escape
        if $game_temp.battle_can_escape == false
          # Play buzzer SE
          $game_system.se_play($data_system.buzzer_se)
          return
        end
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Escape processing
        update_phase2_escape
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (party command phase: escape)
  #--------------------------------------------------------------------------
  def update_phase2_escape
    # Calculate enemy agility average
    enemies_agi = 0
    enemies_number = 0
    for enemy in $game_troop.enemies
      if enemy.exist?
        enemies_agi += enemy.agi
        enemies_number += 1
      end
    end
    if enemies_number > 0
      enemies_agi /= enemies_number
    end
    # Calculate actor agility average
    actors_agi = 0
    actors_number = 0
    for actor in $game_party.actors
      if actor.exist?
        actors_agi += actor.agi
        actors_number += 1
      end
    end
    if actors_number > 0
      actors_agi /= actors_number
    end
    # Determine if escape is successful
    success = rand(100) < 50 * actors_agi / enemies_agi
    # If escape is successful
    if success
      # Play escape SE
      $game_system.se_play($data_system.escape_se)
      # Return to BGM before battle started
      $game_system.bgm_play($game_temp.map_bgm)
      # Battle ends
      battle_end(1)
    # If escape is failure
    else
      # Clear all party member actions
      $game_party.clear_actions
      # Start main phase
      start_phase4
    end
  end
  #--------------------------------------------------------------------------
  # * Start After Battle Phase
  #--------------------------------------------------------------------------
  def start_phase5
    # Shift to phase 5
    @phase = 5
    # Play battle end ME
    $game_system.me_play($game_system.battle_end_me)
    # Return to BGM before battle started
    $game_system.bgm_play($game_temp.map_bgm)
    # Initialize EXP, amount of gold, and treasure
    exp = 0
    gold = 0
    treasures = []
    # Loop
    for enemy in $game_troop.enemies
      # If enemy is not hidden
      unless enemy.hidden
        # Add EXP and amount of gold obtained
        exp += enemy.exp
        gold += enemy.gold
        # Determine if treasure appears
        if rand(100) < enemy.treasure_prob
          if enemy.item_id > 0
            treasures.push($data_items[enemy.item_id])
          end
          if enemy.weapon_id > 0
            treasures.push($data_weapons[enemy.weapon_id])
          end
          if enemy.armor_id > 0
            treasures.push($data_armors[enemy.armor_id])
          end
        end
      end
    end
    # Treasure is limited to a maximum of 6 items
    treasures = treasures[0..5]
    # Obtaining EXP
    for i in 0...$game_party.actors.size
      actor = $game_party.actors[i]
      if actor.cant_get_exp? == false
        last_level = actor.level
        actor.exp += exp
        if actor.level > last_level
          @status_window.level_up(i)
        end
      end
    end
    # Obtaining gold
    $game_party.gain_gold(gold)
    # Obtaining treasure
    for item in treasures
      case item
      when RPG::Item
        $game_party.gain_item(item.id, 1)
      when RPG::Weapon
        $game_party.gain_weapon(item.id, 1)
      when RPG::Armor
        $game_party.gain_armor(item.id, 1)
      end
    end
    # Make battle result window
    @result_window = Window_BattleResult.new(exp, gold, treasures)
    # Set wait count
    @phase5_wait_count = 100
  end
  #--------------------------------------------------------------------------
  # * Frame Update (after battle phase)
  #--------------------------------------------------------------------------
  def update_phase5
    # If wait count is larger than 0
    if @phase5_wait_count > 0
      # Decrease wait count
      @phase5_wait_count -= 1
      # If wait count reaches 0
      if @phase5_wait_count == 0
        # Show result window
        @result_window.visible = true
        # Clear main phase flag
        $game_temp.battle_main_phase = false
        # Refresh status window
        @status_window.refresh
      end
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Battle ends
      battle_end(0)
    end
  end
  #--------------------------------------------------------------------------
  # * Start Actor Command Phase
  #--------------------------------------------------------------------------
  def start_phase3
    # Shift to phase 3
    @phase = 3
    # Set actor as unselectable
    @actor_index = -1
    @active_battler = nil
    # Go to command input for next actor
    phase3_next_actor
  end
  #--------------------------------------------------------------------------
  # * Go to Command Input for Next Actor
  #--------------------------------------------------------------------------
  def phase3_next_actor
    # Loop
    begin
      # Actor blink effect OFF
      if @active_battler != nil
        @active_battler.blink = false
      end
      # If last actor
      if @actor_index == $game_party.actors.size-1
        # Start main phase
        start_phase4
        return
      end
      # Advance actor index
      @actor_index += 1
      @active_battler = $game_party.actors[@actor_index]
      @active_battler.blink = true
    # Once more if actor refuses command input
    end until @active_battler.inputable?
    # Set up actor command window
    phase3_setup_command_window
  end
  #--------------------------------------------------------------------------
  # * Go to Command Input of Previous Actor
  #--------------------------------------------------------------------------
  def phase3_prior_actor
    # Loop
    begin
      # Actor blink effect OFF
      if @active_battler != nil
        @active_battler.blink = false
      end
      # If first actor
      if @actor_index == 0
        # Start party command phase
        start_phase2
        return
      end
      # Return to actor index
      @actor_index -= 1
      @active_battler = $game_party.actors[@actor_index]
      @active_battler.blink = true
    # Once more if actor refuses command input
    end until @active_battler.inputable?
    # Set up actor command window
    phase3_setup_command_window
  end
  #--------------------------------------------------------------------------
  # * Actor Command Window Setup
  #--------------------------------------------------------------------------
  def phase3_setup_command_window
    # Disable party command window
    @party_command_window.active = false
    @party_command_window.visible = false
    # Enable actor command window
    @actor_command_window.active = true
    @actor_command_window.visible = true
    # Set actor command window position
    @actor_command_window.x = @actor_index * 160
    # Set index to 0
    @actor_command_window.index = 0
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase)
  #--------------------------------------------------------------------------
  def update_phase3
    # If enemy arrow is enabled
    if @enemy_arrow != nil
      update_phase3_enemy_select
    # If actor arrow is enabled
    elsif @actor_arrow != nil
      update_phase3_actor_select
    # If skill window is enabled
    elsif @skill_window != nil
      update_phase3_skill_select
    # If item window is enabled
    elsif @item_window != nil
      update_phase3_item_select
    # If actor command window is enabled
    elsif @actor_command_window.active
      update_phase3_basic_command
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : basic command)
  #--------------------------------------------------------------------------
  def update_phase3_basic_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Go to command input for previous actor
      phase3_prior_actor
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by actor command window cursor position
      case @actor_command_window.index
      when 0  # attack
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Set action
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
        # Start enemy selection
        start_enemy_select
      when 1  # skill
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Set action
        @active_battler.current_action.kind = 1
        # Start skill selection
        start_skill_select
      when 2  # guard
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Set action
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 1
        # Go to command input for next actor
        phase3_next_actor
      when 3  # item
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Set action
        @active_battler.current_action.kind = 2
        # Start item selection
        start_item_select
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : skill selection)
  #--------------------------------------------------------------------------
  def update_phase3_skill_select
    # Make skill window visible
    @skill_window.visible = true
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # End skill selection
      end_skill_select
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get currently selected data on the skill window
      @skill = @skill_window.skill
      # If it can't be used
      if @skill == nil or not @active_battler.skill_can_use?(@skill.id)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Set action
      @active_battler.current_action.skill_id = @skill.id
      # Make skill window invisible
      @skill_window.visible = false
      @skill_window.active  = false
      # If effect scope is single enemy
      if @skill.scope == 1
        # Start enemy selection
        start_enemy_select
      # If effect scope is single ally
      elsif @skill.scope == 3 or @skill.scope == 5
        # Start actor selection
        start_actor_select
      # If effect scope is not single
      else
        # End skill selection
        end_skill_select
        # Go to command input for next actor
        phase3_next_actor
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : item selection)
  #--------------------------------------------------------------------------
  def update_phase3_item_select
    # Make item window visible
    @item_window.visible = true
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # End item selection
      end_item_select
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get currently selected data on the item window
      @item = @item_window.item
      # If it can't be used
      unless $game_party.item_can_use?(@item.id)
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Set action
      @active_battler.current_action.item_id = @item.id
      # Make item window invisible
      @item_window.visible = false
      @item_window.active  = false
      # If effect scope is single enemy
      if @item.scope == 1
        # Start enemy selection
        start_enemy_select
      # If effect scope is single ally
      elsif @item.scope == 3 or @item.scope == 5
        # Start actor selection
        start_actor_select
      # If effect scope is not single
      else
        # End item selection
        end_item_select
        # Go to command input for next actor
        phase3_next_actor
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : enemy selection)
  #--------------------------------------------------------------------------
  def update_phase3_enemy_select
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # End enemy selection
      end_enemy_select
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Set action
      @active_battler.current_action.target_index = @enemy_arrow.index
      # End enemy selection
      end_enemy_select
      # If skill window is showing
      if @skill_window != nil
        # End skill selection
        end_skill_select
      end
      # If item window is showing
      if @item_window != nil
        # End item selection
        end_item_select
      end
      # Go to command input for next actor
      phase3_next_actor
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : actor selection)
  #--------------------------------------------------------------------------
  def update_phase3_actor_select
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # End actor selection
      end_actor_select
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Set action
      @active_battler.current_action.target_index = @actor_arrow.index
      # End actor selection
      end_actor_select
      # If skill window is showing
      if @skill_window != nil
        # End skill selection
        end_skill_select
      end
      # If item window is showing
      if @item_window != nil
        # End item selection
        end_item_select
      end
      # Go to command input for next actor
      phase3_next_actor
    end
  end
  #--------------------------------------------------------------------------
  # * Start Enemy Selection
  #--------------------------------------------------------------------------
  def start_enemy_select
    # Make enemy arrow
    @enemy_arrow = Arrow_Enemy.new(@spriteset.viewport1)
    # Associate help window
    @enemy_arrow.help_window = @help_window
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * End Enemy Selection
  #--------------------------------------------------------------------------
  def end_enemy_select
    # Dispose of enemy arrow
    @enemy_arrow.dispose
    @enemy_arrow = nil
    # If command is [fight]
    if @actor_command_window.index == 0
      # Enable actor command window
      @actor_command_window.active = true
      @actor_command_window.visible = true
      # Hide help window
      @help_window.visible = false
    end
    # If Skill Window Exist
    unless @skill_window.nil?
      # Enable Skill Window
      @skill_window.active = true
    end
    # If Item Window Exist
    unless @item_window.nil?
      # Enable Skill Window
      @item_window.active = true
    end
  end
  #--------------------------------------------------------------------------
  # * Start Actor Selection
  #--------------------------------------------------------------------------
  def start_actor_select
    # Make actor arrow
    @actor_arrow = Arrow_Actor.new(@spriteset.viewport2)
    @actor_arrow.index = @actor_index
    # Associate help window
    @actor_arrow.help_window = @help_window
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * End Actor Selection
  #--------------------------------------------------------------------------
  def end_actor_select
    # Dispose of actor arrow
    @actor_arrow.dispose
    @actor_arrow = nil
    # If Skill Window Exist
    unless @skill_window.nil?
      # Enable Skill Window
      @skill_window.active = true
    end
    # If Item Window Exist
    unless @item_window.nil?
      # Enable Skill Window
      @item_window.active = true
    end
  end
  #--------------------------------------------------------------------------
  # * Start Skill Selection
  #--------------------------------------------------------------------------
  def start_skill_select
    # Make skill window
    @skill_window = Window_Skill.new(@active_battler)
    # Associate help window
    @skill_window.help_window = @help_window
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * End Skill Selection
  #--------------------------------------------------------------------------
  def end_skill_select
    # Dispose of skill window
    @skill_window.dispose
    @skill_window = nil
    # Hide help window
    @help_window.visible = false
    # Enable actor command window
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
  #--------------------------------------------------------------------------
  # * Start Item Selection
  #--------------------------------------------------------------------------
  def start_item_select
    # Make item window
    @item_window = Window_Item.new
    # Associate help window
    @item_window.help_window = @help_window
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * End Item Selection
  #--------------------------------------------------------------------------
  def end_item_select
    # Dispose of item window
    @item_window.dispose
    @item_window = nil
    # Hide help window
    @help_window.visible = false
    # Enable actor command window
    @actor_command_window.active = true
    @actor_command_window.visible = true
  end
  #--------------------------------------------------------------------------
  # * Start Main Phase
  #--------------------------------------------------------------------------
  def start_phase4
    # Shift to phase 4
    @phase = 4
    # Turn count
    $game_temp.battle_turn += 1
    # Search all battle event pages
    for index in 0...$data_troops[@troop_id].pages.size
      # Get event page
      page = $data_troops[@troop_id].pages[index]
      # If this page span is [turn]
      if page.span == 1
        # Clear action completed flags
        $game_temp.battle_event_flags[index] = false
      end
    end
    # Set actor as unselectable
    @actor_index = -1
    @active_battler = nil
    # Enable party command window
    @party_command_window.active = false
    @party_command_window.visible = false
    # Disable actor command window
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # Set main phase flag
    $game_temp.battle_main_phase = true
    # Make enemy action
    for enemy in $game_troop.enemies
      enemy.make_action
    end
    # Make action orders
    make_action_orders
    # Shift to step 1
    @phase4_step = 1
  end
  #--------------------------------------------------------------------------
  # * Make Action Orders
  #--------------------------------------------------------------------------
  def make_action_orders
    # Initialize @action_battlers array
    @action_battlers = []
    # Add enemy to @action_battlers array
    for enemy in $game_troop.enemies
      @action_battlers.push(enemy)
    end
    # Add actor to @action_battlers array
    for actor in $game_party.actors
      @action_battlers.push(actor)
    end
    # Decide action speed for all
    for battler in @action_battlers
      battler.make_action_speed
    end
    # Line up action speed in order from greatest to least
    @action_battlers.sort! {|a,b|
      b.current_action.speed - a.current_action.speed }
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase)
  #--------------------------------------------------------------------------
  def update_phase4
    case @phase4_step
    when 1
      update_phase4_step1
    when 2
      update_phase4_step2
    when 3
      update_phase4_step3
    when 4
      update_phase4_step4
    when 5
      update_phase4_step5
    when 6
      update_phase4_step6
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 1 : action preparation)
  #--------------------------------------------------------------------------
  def update_phase4_step1
    # Hide help window
    @help_window.visible = false
    # Determine win/loss
    if judge
      # If won, or if lost : end method
      return
    end
    # If an action forcing battler doesn't exist
    if $game_temp.forcing_battler == nil
      # Set up battle event
      setup_battle_event
      # If battle event is running
      if $game_system.battle_interpreter.running?
        return
      end
    end
    # If an action forcing battler exists
    if $game_temp.forcing_battler != nil
      # Add to head, or move
      @action_battlers.delete($game_temp.forcing_battler)
      @action_battlers.unshift($game_temp.forcing_battler)
    end
    # If no actionless battlers exist (all have performed an action)
    if @action_battlers.size == 0
      # Start party command phase
      start_phase2
      return
    end
    # Initialize animation ID and common event ID
    @animation1_id = 0
    @animation2_id = 0
    @common_event_id = 0
    # Shift from head of actionless battlers
    @active_battler = @action_battlers.shift
    # If already removed from battle
    if @active_battler.index == nil
      return
    end
    # Slip damage
    if @active_battler.hp > 0 and @active_battler.slip_damage?
      @active_battler.slip_damage_effect
      @active_battler.damage_pop = true
    end
    # Natural removal of states
    @active_battler.remove_states_auto
    # Refresh status window
    @status_window.refresh
    # Shift to step 2
    @phase4_step = 2
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 2 : start action)
  #--------------------------------------------------------------------------
  def update_phase4_step2
    # If not a forcing action
    unless @active_battler.current_action.forcing
      # If restriction is [normal attack enemy] or [normal attack ally]
      if @active_battler.restriction == 2 or @active_battler.restriction == 3
        # Set attack as an action
        @active_battler.current_action.kind = 0
        @active_battler.current_action.basic = 0
      end
      # If restriction is [cannot perform action]
      if @active_battler.restriction == 4
        # Clear battler being forced into action
        $game_temp.forcing_battler = nil
        # Shift to step 1
        @phase4_step = 1
        return
      end
    end
    # Clear target battlers
    @target_battlers = []
    # Branch according to each action
    case @active_battler.current_action.kind
    when 0  # basic
      make_basic_action_result
    when 1  # skill
      make_skill_action_result
    when 2  # item
      make_item_action_result
    end
    # Shift to step 3
    if @phase4_step == 2
      @phase4_step = 3
    end
  end
  #--------------------------------------------------------------------------
  # * Make Basic Action Results
  #--------------------------------------------------------------------------
  def make_basic_action_result
    # If attack
    if @active_battler.current_action.basic == 0
      # Set anaimation ID
      @animation1_id = @active_battler.animation1_id
      @animation2_id = @active_battler.animation2_id
      # If action battler is enemy
      if @active_battler.is_a?(Game_Enemy)
        if @active_battler.restriction == 3
          target = $game_troop.random_target_enemy
        elsif @active_battler.restriction == 2
          target = $game_party.random_target_actor
        else
          index = @active_battler.current_action.target_index
          target = $game_party.smooth_target_actor(index)
        end
      end
      # If action battler is actor
      if @active_battler.is_a?(Game_Actor)
        if @active_battler.restriction == 3
          target = $game_party.random_target_actor
        elsif @active_battler.restriction == 2
          target = $game_troop.random_target_enemy
        else
          index = @active_battler.current_action.target_index
          target = $game_troop.smooth_target_enemy(index)
        end
      end
      # Set array of targeted battlers
      @target_battlers = [target]
      # Apply normal attack results
      for target in @target_battlers
        target.attack_effect(@active_battler)
      end
      return
    end
    # If guard
    if @active_battler.current_action.basic == 1
      # Display "Guard" in help window
      @help_window.set_text($data_system.words.guard, 1)
      return
    end
    # If escape
    if @active_battler.is_a?(Game_Enemy) and
       @active_battler.current_action.basic == 2
      # Display "Escape" in help window
      @help_window.set_text("Escape", 1)
      # Escape
      @active_battler.escape
      return
    end
    # If doing nothing
    if @active_battler.current_action.basic == 3
      # Clear battler being forced into action
      $game_temp.forcing_battler = nil
      # Shift to step 1
      @phase4_step = 1
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Set Targeted Battler for Skill or Item
  #     scope : effect scope for skill or item
  #--------------------------------------------------------------------------
  def set_target_battlers(scope)
    # If battler performing action is enemy
    if @active_battler.is_a?(Game_Enemy)
      # Branch by effect scope
      case scope
      when 1  # single enemy
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_party.smooth_target_actor(index))
      when 2  # all enemies
        for actor in $game_party.actors
          if actor.exist?
            @target_battlers.push(actor)
          end
        end
      when 3  # single ally
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_troop.smooth_target_enemy(index))
      when 4  # all allies
        for enemy in $game_troop.enemies
          if enemy.exist?
            @target_battlers.push(enemy)
          end
        end
      when 5  # single ally (HP 0) 
        index = @active_battler.current_action.target_index
        enemy = $game_troop.enemies[index]
        if enemy != nil and enemy.hp0?
          @target_battlers.push(enemy)
        end
      when 6  # all allies (HP 0) 
        for enemy in $game_troop.enemies
          if enemy != nil and enemy.hp0?
            @target_battlers.push(enemy)
          end
        end
      when 7  # user
        @target_battlers.push(@active_battler)
      end
    end
    # If battler performing action is actor
    if @active_battler.is_a?(Game_Actor)
      # Branch by effect scope
      case scope
      when 1  # single enemy
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_troop.smooth_target_enemy(index))
      when 2  # all enemies
        for enemy in $game_troop.enemies
          if enemy.exist?
            @target_battlers.push(enemy)
          end
        end
      when 3  # single ally
        index = @active_battler.current_action.target_index
        @target_battlers.push($game_party.smooth_target_actor(index))
      when 4  # all allies
        for actor in $game_party.actors
          if actor.exist?
            @target_battlers.push(actor)
          end
        end
      when 5  # single ally (HP 0) 
        index = @active_battler.current_action.target_index
        actor = $game_party.actors[index]
        if actor != nil and actor.hp0?
          @target_battlers.push(actor)
        end
      when 6  # all allies (HP 0) 
        for actor in $game_party.actors
          if actor != nil and actor.hp0?
            @target_battlers.push(actor)
          end
        end
      when 7  # user
        @target_battlers.push(@active_battler)
      end
    end
  end
  #--------------------------------------------------------------------------
  # * Make Skill Action Results
  #--------------------------------------------------------------------------
  def make_skill_action_result
    # Get skill
    @skill = $data_skills[@active_battler.current_action.skill_id]
    # If not a forcing action
    unless @active_battler.current_action.forcing
      # If unable to use due to SP running out
      unless @active_battler.skill_can_use?(@skill.id)
        # Clear battler being forced into action
        $game_temp.forcing_battler = nil
        # Shift to step 1
        @phase4_step = 1
        return
      end
    end
    # Use up SP
    @active_battler.sp -= @skill.sp_cost
    # Refresh status window
    @status_window.refresh
    # Show skill name on help window
    @help_window.set_text(@skill.name, 1)
    # Set animation ID
    @animation1_id = @skill.animation1_id
    @animation2_id = @skill.animation2_id
    # Set command event ID
    @common_event_id = @skill.common_event_id
    # Set target battlers
    set_target_battlers(@skill.scope)
    # Apply skill effect
    for target in @target_battlers
      target.skill_effect(@active_battler, @skill)
    end
  end
  #--------------------------------------------------------------------------
  # * Make Item Action Results
  #--------------------------------------------------------------------------
  def make_item_action_result
    # Get item
    @item = $data_items[@active_battler.current_action.item_id]
    # If unable to use due to items running out
    unless $game_party.item_can_use?(@item.id)
      # Shift to step 1
      @phase4_step = 1
      return
    end
    # If consumable
    if @item.consumable
      # Decrease used item by 1
      $game_party.lose_item(@item.id, 1)
    end
    # Display item name on help window
    @help_window.set_text(@item.name, 1)
    # Set animation ID
    @animation1_id = @item.animation1_id
    @animation2_id = @item.animation2_id
    # Set common event ID
    @common_event_id = @item.common_event_id
    # Decide on target
    index = @active_battler.current_action.target_index
    target = $game_party.smooth_target_actor(index)
    # Set targeted battlers
    set_target_battlers(@item.scope)
    # Apply item effect
    for target in @target_battlers
      target.item_effect(@item)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 3 : animation for action performer)
  #--------------------------------------------------------------------------
  def update_phase4_step3
    # Animation for action performer (if ID is 0, then white flash)
    if @animation1_id == 0
      @active_battler.white_flash = true
    else
      @active_battler.animation_id = @animation1_id
      @active_battler.animation_hit = true
    end
    # Shift to step 4
    @phase4_step = 4
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 4 : animation for target)
  #--------------------------------------------------------------------------
  def update_phase4_step4
    # Animation for target
    for target in @target_battlers
      target.animation_id = @animation2_id
      target.animation_hit = (target.damage != "Miss")
    end
    # Animation has at least 8 frames, regardless of its length
    @wait_count = 8
    # Shift to step 5
    @phase4_step = 5
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 5 : damage display)
  #--------------------------------------------------------------------------
  def update_phase4_step5
    # Hide help window
    @help_window.visible = false
    # Refresh status window
    @status_window.refresh
    # Display damage
    for target in @target_battlers
      if target.damage != nil
        target.damage_pop = true
      end
    end
    # Animation has at least 8 frames, regardless of its length
    @wait_count = 8
    # Shift to step 6
    @phase4_step = 6
  end
  #--------------------------------------------------------------------------
  # * Frame Update (main phase step 6 : refresh)
  #--------------------------------------------------------------------------
  def update_phase4_step6
    # Clear battler being forced into action
    $game_temp.forcing_battler = nil
    # If common event ID is valid
    if @common_event_id > 0
      # Set up event
      common_event = $data_common_events[@common_event_id]
      $game_system.battle_interpreter.setup(common_event.list, 0)
    end
    # Shift to step 1
    @phase4_step = 1
  end
end  

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_SHOP')

#==============================================================================
# ** Window_ShopCommand
#------------------------------------------------------------------------------
#  This window is used to choose your business on the shop screen.
#==============================================================================

class Window_ShopCommand < Window_HorizCommand
  #--------------------------------------------------------------------------
  # * Object Initialization
  #--------------------------------------------------------------------------
  def initialize
    s1 = SDK::Scene_Commands::Scene_Shop::Buy
    s2 = SDK::Scene_Commands::Scene_Shop::Sell
    s3 = SDK::Scene_Commands::Scene_Shop::Exit
    super(480, [s1, s2, s3])
    self.y = 64
    @alignment = 0
    refresh
  end
end
  
#==============================================================================
# ** Scene_Shop
#------------------------------------------------------------------------------
#  This class performs shop screen processing.
#==============================================================================

class Scene_Shop < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Shop, :main, :main_window)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make help window
    @help_window = Window_Help.new
    # Make command window
    @command_window = Window_ShopCommand.new
    # Make gold window
    @gold_window = Window_Gold.new
    @gold_window.x = 480
    @gold_window.y = 64
    # Make dummy window
    @dummy_window = Window_Base.new(0, 128, 640, 352)
    # Make buy window
    @buy_window = Window_ShopBuy.new($game_temp.shop_goods)
    @buy_window.active = false
    @buy_window.visible = false
    @buy_window.help_window = @help_window
    # Make sell window
    @sell_window = Window_ShopSell.new
    @sell_window.active = false
    @sell_window.visible = false
    @sell_window.help_window = @help_window
    # Make quantity input window
    @number_window = Window_ShopNumber.new
    @number_window.active = false
    @number_window.visible = false
    # Make status window
    @status_window = Window_ShopStatus.new
    @status_window.visible = false
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If command window is active: call update_command
    if @command_window.active
      update_command
      return
    # If buy window is active: call update_buy
    elsif @buy_window.active
      update_buy
      return
    # If sell window is active: call update_sell
    elsif @sell_window.active
      update_sell
      return
    # If quantity input window is active: call update_number
    elsif @number_window.active
      update_number
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Change windows to buy mode
        @command_window.active = false
        @dummy_window.visible = false
        @buy_window.active = true
        @buy_window.visible = true
        @buy_window.refresh
        @status_window.visible = true
      when 1  # sell
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Change windows to sell mode
        @command_window.active = false
        @dummy_window.visible = false
        @sell_window.active = true
        @sell_window.visible = true
        @sell_window.refresh
      when 2  # quit
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to map screen
        $scene = Scene_Map.new
      end
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when buy window is active)
  #--------------------------------------------------------------------------
  def update_buy
    # Set status window item
    @status_window.item = @buy_window.item
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Change windows to initial mode
      @command_window.active = true
      @dummy_window.visible = true
      @buy_window.active = false
      @buy_window.visible = false
      @status_window.visible = false
      @status_window.item = nil
      # Erase help text
      @help_window.set_text("")
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get item
      @item = @buy_window.item
      # If item is invalid, or price is higher than money possessed
      if @item == nil or @item.price > $game_party.gold
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Get items in possession count
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      # If 99 items are already in possession
      if number == 99
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Calculate maximum amount possible to buy
      max = @item.price == 0 ? 99 : $game_party.gold / @item.price
      max = [max, 99 - number].min
      # Change windows to quantity input mode
      @buy_window.active = false
      @buy_window.visible = false
      @number_window.set(@item, max, @item.price)
      @number_window.active = true
      @number_window.visible = true
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when sell window is active)
  #--------------------------------------------------------------------------
  def update_sell
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Change windows to initial mode
      @command_window.active = true
      @dummy_window.visible = true
      @sell_window.active = false
      @sell_window.visible = false
      @status_window.item = nil
      # Erase help text
      @help_window.set_text("")
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Get item
      @item = @sell_window.item
      # Set status window item
      @status_window.item = @item
      # If item is invalid, or item price is 0 (unable to sell)
      if @item == nil or @item.price == 0
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Get items in possession count
      case @item
      when RPG::Item
        number = $game_party.item_number(@item.id)
      when RPG::Weapon
        number = $game_party.weapon_number(@item.id)
      when RPG::Armor
        number = $game_party.armor_number(@item.id)
      end
      # Maximum quanitity to sell = number of items in possession
      max = number
      # Change windows to quantity input mode
      @sell_window.active = false
      @sell_window.visible = false
      @number_window.set(@item, max, @item.price / 2)
      @number_window.active = true
      @number_window.visible = true
      @status_window.visible = true
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when quantity input window is active)
  #--------------------------------------------------------------------------
  def update_number
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
      when 1  # sell
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play shop SE
      $game_system.se_play($data_system.shop_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Branch by command window cursor position
      case @command_window.index
      when 0  # buy
        # Buy process
        $game_party.lose_gold(@number_window.number * @item.price)
        case @item
        when RPG::Item
          $game_party.gain_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.gain_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.gain_armor(@item.id, @number_window.number)
        end
        # Refresh each window
        @gold_window.refresh
        @buy_window.refresh
        @status_window.refresh
        # Change windows to buy mode
        @buy_window.active = true
        @buy_window.visible = true
      when 1  # sell
        # Sell process
        $game_party.gain_gold(@number_window.number * (@item.price / 2))
        case @item
        when RPG::Item
          $game_party.lose_item(@item.id, @number_window.number)
        when RPG::Weapon
          $game_party.lose_weapon(@item.id, @number_window.number)
        when RPG::Armor
          $game_party.lose_armor(@item.id, @number_window.number)
        end
        # Refresh each window
        @gold_window.refresh
        @sell_window.refresh
        @status_window.refresh
        # Change windows to sell mode
        @sell_window.active = true
        @sell_window.visible = true
        @status_window.visible = false
      end
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_NAME')

#==============================================================================
# ** Scene_Name
#------------------------------------------------------------------------------
#  This class performs name input screen processing.
#==============================================================================

class Scene_Name < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Name, :main, :main_variable, :main_window)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Variable Initialization
  #--------------------------------------------------------------------------
  def main_variable
    super
    # Get actor
    @actor = $game_actors[$game_temp.name_actor_id]
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make windows
    @edit_window = Window_NameEdit.new(@actor, $game_temp.name_max_char)
    @input_window = Window_NameInput.new
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If B button was pressed
    if Input.repeat?(Input::B)
      # If cursor position is at 0
      if @edit_window.index == 0
        return
      end
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Delete text
      @edit_window.back
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # If cursor position is at [OK]
      if @input_window.character == nil
        # If name is empty
        if @edit_window.name == ""
          # Return to default name
          @edit_window.restore_default
          # If name is empty
          if @edit_window.name == ""
            # Play buzzer SE
            $game_system.se_play($data_system.buzzer_se)
            return
          end
          # Play decision SE
          $game_system.se_play($data_system.decision_se)
          return
        end
        # Change actor name
        @actor.name = @edit_window.name
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Switch to map screen
        $scene = Scene_Map.new
        return
      end
      # If cursor position is at maximum
      if @edit_window.index == $game_temp.name_max_char
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # If text character is empty
      if @input_window.character == ""
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Add text character
      @edit_window.add(@input_window.character)
      return
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || 
   SDK::Indidual_Parts.include?('PART 3#SCENE_GAMEOVER')

#==============================================================================
# ** Scene_Gameover
#------------------------------------------------------------------------------
#  This class performs game over screen processing.
#==============================================================================

class Scene_Gameover < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Gameover, :main, :main_sprite, :main_audio, 
    :main_transition, :main_end)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Sprite Initialization
  #--------------------------------------------------------------------------
  def main_sprite
    super
    # Make game over graphic
    @sprite = Sprite.new
    @sprite.bitmap = RPG::Cache.gameover($data_system.gameover_name)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Audio Initialization
  #--------------------------------------------------------------------------
  def main_audio
    super
    # Stop BGM and BGS
    $game_system.bgm_play(nil)
    $game_system.bgs_play(nil)
    # Play game over ME
    $game_system.me_play($data_system.gameover_me)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Transition
  #--------------------------------------------------------------------------
  def main_transition
    Graphics.transition(120)
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Ending
  #--------------------------------------------------------------------------
  def main_end
    super
    # Execute transition
    Graphics.transition(40)
    # Prepare for transition
    Graphics.freeze
    # If battle test
    if $BTEST
      $scene = nil
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Switch to title screen
      $scene = Scene_Title.new
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part III Check
#==============================================================================
if SDK::Parts.include?(3) || SDK::Indidual_Parts.include?('PART 3#SCENE_DEBUG')

#==============================================================================
# ** Scene_Debug
#------------------------------------------------------------------------------
#  This class performs debug screen processing.
#==============================================================================

class Scene_Debug < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Debug, :main, :main_window)
  #--------------------------------------------------------------------------
  # * Main Processing
  #--------------------------------------------------------------------------
  def main
    super
  end
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make windows
    @left_window = Window_DebugLeft.new
    @right_window = Window_DebugRight.new
    @help_window = Window_Base.new(192, 352, 448, 128)
    @help_window.contents = Bitmap.new(406, 96)
    # Restore previously selected item
    @left_window.top_row = $game_temp.debug_top_row
    @left_window.index = $game_temp.debug_index
    @right_window.mode = @left_window.mode
    @right_window.top_id = @left_window.top_id
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # Update windows
    @right_window.mode = @left_window.mode
    @right_window.top_id = @left_window.top_id
    # Memorize selected item
    $game_temp.debug_top_row = @left_window.top_row
    $game_temp.debug_index = @left_window.index
    # If left window is active: call update_left
    if @left_window.active
      update_left
      return
    end
    # If right window is active: call update_right
    if @right_window.active
      update_right
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when left window is active)
  #--------------------------------------------------------------------------
  def update_left
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play decision SE
      $game_system.se_play($data_system.decision_se)
      # Display help
      if @left_window.mode == 0
        text1 = "C (Enter) : ON / OFF"
        @help_window.contents.draw_text(4, 0, 406, 32, text1)
      else
        text1 = "Left : -1   Right : +1"
        text2 = "L (Pageup) : -10"
        text3 = "R (Pagedown) : +10"
        @help_window.contents.draw_text(4, 0, 406, 32, text1)
        @help_window.contents.draw_text(4, 32, 406, 32, text2)
        @help_window.contents.draw_text(4, 64, 406, 32, text3)
      end
      # Activate right window
      @left_window.active = false
      @right_window.active = true
      @right_window.index = 0
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when right window is active)
  #--------------------------------------------------------------------------
  def update_right
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Activate left window
      @left_window.active = true
      @right_window.active = false
      @right_window.index = -1
      # Erase help
      @help_window.contents.clear
      return
    end
    # Get selected switch / variable ID
    current_id = @right_window.top_id + @right_window.index
    # If switch
    if @right_window.mode == 0
      # If C button was pressed
      if Input.trigger?(Input::C)
        # Play decision SE
        $game_system.se_play($data_system.decision_se)
        # Reverse ON / OFF
        $game_switches[current_id] = (not $game_switches[current_id])
        @right_window.refresh
        return
      end
    end
    # If variable
    if @right_window.mode == 1
      # If right button was pressed
      if Input.repeat?(Input::RIGHT)
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Increase variables by 1
        $game_variables[current_id] += 1
        # Maximum limit check
        if $game_variables[current_id] > 99999999
          $game_variables[current_id] = 99999999
        end
        @right_window.refresh
        return
      end
      # If left button was pressed
      if Input.repeat?(Input::LEFT)
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Decrease variables by 1
        $game_variables[current_id] -= 1
        # Minimum limit check
        if $game_variables[current_id] < -99999999
          $game_variables[current_id] = -99999999
        end
        @right_window.refresh
        return
      end
      # If R button was pressed
      if Input.repeat?(Input::R)
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Increase variables by 10
        $game_variables[current_id] += 10
        # Maximum limit check
        if $game_variables[current_id] > 99999999
          $game_variables[current_id] = 99999999
        end
        @right_window.refresh
        return
      end
      # If L button was pressed
      if Input.repeat?(Input::L)
        # Play cursor SE
        $game_system.se_play($data_system.cursor_se)
        # Decrease variables by 10
        $game_variables[current_id] -= 10
        # Minimum limit check
        if $game_variables[current_id] < -99999999
          $game_variables[current_id] = -99999999
        end
        @right_window.refresh
        return
      end
    end
  end
end

#==============================================================================
# ** Ends Enable Part III Check
#==============================================================================
end

#==============================================================================
# ** Enable Part IV Check
#==============================================================================
if SDK::Parts.include?(4) || 
  (SDK::Indidual_Parts.include?('PART 3#SCENE_TITLE') &&
   SDK::Indidual_Parts.include?('PART 4#SCENE_TITLE'))

#==============================================================================
# ** Scene_Title
#------------------------------------------------------------------------------
#  This class performs title screen processing.
#==============================================================================

class Scene_Title < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Title, :update, :disabled_main_command?, 
    :main_command_input)
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make command window
    s1 = SDK::Scene_Commands::Scene_Title::New_Game
    s2 = SDK::Scene_Commands::Scene_Title::Continue
    s3 = SDK::Scene_Commands::Scene_Title::Shutdown
    @command_window = Window_Command.new(192, [s1, s2, s3])
    @command_window.back_opacity = 160
    @command_window.x = 320 - @command_window.width / 2
    @command_window.y = 288
    # If continue is enabled, move cursor to "Continue"
    # If disabled, display "Continue" text in gray
    if @continue_enabled
      @command_window.index = 1
    else
      @command_window.disable_item(1)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if disabled_main_command?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      main_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Disabled Main Command? Test
  #--------------------------------------------------------------------------
  def disabled_main_command?
    # If Continue is Selected
    if @command_window.command == SDK::Scene_Commands::Scene_Title::Continue
      return true unless @continue_enabled
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Command Input
  #--------------------------------------------------------------------------
  def main_command_input
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Title::New_Game  # New game
      command_new_game
    when SDK::Scene_Commands::Scene_Title::Continue  # Continue
      command_continue
    when SDK::Scene_Commands::Scene_Title::Shutdown  # Shutdown
      command_shutdown
    end
  end
end

#==============================================================================
# ** Ends Enable Part IV Check
#==============================================================================
end

#==============================================================================
# ** Enable Part IV Check
#==============================================================================
if SDK::Parts.include?(4) || 
  (SDK::Indidual_Parts.include?('PART 3#SCENE_MENU') &&
   SDK::Indidual_Parts.include?('PART 4#SCENE_MENU'))

#==============================================================================
# ** Scene_Menu
#------------------------------------------------------------------------------
#  This class performs menu screen processing.
#==============================================================================

class Scene_Menu < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Menu, :update_command, :disabled_main_command?,
    :main_command_input)
  SDK.log_branch(:Scene_Menu, :update_status, :disabled_main_command?,
    :sub_command_input)
  SDK.log_branch(:Scene_Menu, :main_command_input, :command_item, 
    :command_skill, :command_equip, :command_status, :command_save,
    :command_endgame)
  SDK.log_branch(:Scene_Menu, :sub_command_input, :command_skill,
    :command_equip, :command_status)
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization : Main Command
  #--------------------------------------------------------------------------
  def main_command_window
    # Make command window
    s1 = SDK::Scene_Commands::Scene_Menu::Item
    s2 = SDK::Scene_Commands::Scene_Menu::Skill
    s3 = SDK::Scene_Commands::Scene_Menu::Equip
    s4 = SDK::Scene_Commands::Scene_Menu::Status
    s5 = SDK::Scene_Commands::Scene_Menu::Save
    s6 = SDK::Scene_Commands::Scene_Menu::End_Game
    @command_window = Window_Command.new(160, [s1, s2, s3, s4, s5, s6])
    @command_window.index = @menu_index
    # If number of party members is 0
    if $game_party.actors.size == 0
      # Disable items, skills, equipment, and status
      @command_window.disable_item(0)
      @command_window.disable_item(1)
      @command_window.disable_item(2)
      @command_window.disable_item(3)
    end
    # If save is forbidden
    if $game_system.save_disabled
      # Disable save
      @command_window.disable_item(4)
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if disabled_main_command?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      main_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when status window is active)
  #--------------------------------------------------------------------------
  def update_status
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Make command window active
      @command_window.active = true
      @status_window.active = false
      @status_window.index = -1
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if disabled_main_command?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      sub_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Disabled Main Command? Test
  #--------------------------------------------------------------------------
  def disabled_main_command?
    # Gets Current Command
    command = @command_window.command
    # Gets SDK Scene_Menu Commands
    c = SDK::Scene_Commands::Scene_Menu
    # If 0 Party Size
    if $game_party.actors.size == 0
      # If Item, Skill, Equip or Status Selected
      if [c::Item, c::Skill, c::Equip, c::Status].include?(command)
        return true
      end
    end
    # If Save Disabled && Command is Save
    return true if $game_system.save_disabled && command == c::Save
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Command Input
  #--------------------------------------------------------------------------
  def main_command_input
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Menu::Item      # item
      command_item
    when SDK::Scene_Commands::Scene_Menu::Skill     # skill
      command_skill
    when SDK::Scene_Commands::Scene_Menu::Equip     # equipment
      command_equip
    when SDK::Scene_Commands::Scene_Menu::Status    # status
      command_status
    when SDK::Scene_Commands::Scene_Menu::Save      # save
      command_save
    when SDK::Scene_Commands::Scene_Menu::End_Game  # end game
      command_endgame
    end
  end
  #--------------------------------------------------------------------------
  # * Disabled Sub Command? Test
  #--------------------------------------------------------------------------
  def disabled_sub_command?
    # If Skill Selected
    if @command_window.command == SDK::Scene_Commands::Scene_Menu::Skill
      # If this actor's action limit is 2 or more
      if $game_party.actors[@status_window.index].restriction >= 2
        return true
      end
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Sub Command Input
  #--------------------------------------------------------------------------
  def sub_command_input
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Menu::Skill     # skill
      command_skill
    when SDK::Scene_Commands::Scene_Menu::Equip     # equipment
      command_equip
    when SDK::Scene_Commands::Scene_Menu::Status    # status
      command_status
    end
  end
  #--------------------------------------------------------------------------
  # * Command : Item
  #--------------------------------------------------------------------------
  def command_item
    # Switch to item screen
    $scene = Scene_Item.new
  end
  #--------------------------------------------------------------------------
  # * Command : Skill
  #--------------------------------------------------------------------------
  def command_skill
    # If Main Command Active
    if @command_window.active
      # Activate Status Window
      active_status_window
      return
    end
    # Switch to skill screen
    $scene = Scene_Skill.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command : Equip
  #--------------------------------------------------------------------------
  def command_equip
    # If Main Command Active
    if @command_window.active
      # Activate Status Window
      active_status_window
      return
    end
    # Switch to equipment screen
    $scene = Scene_Equip.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command : Status
  #--------------------------------------------------------------------------
  def command_status
    # If Main Command Active
    if @command_window.active
      # Activate Status Window
      active_status_window
      return
    end
    # Switch to status screen
    $scene = Scene_Status.new(@status_window.index)
  end
  #--------------------------------------------------------------------------
  # * Command : Save
  #--------------------------------------------------------------------------
  def command_save
    # Switch to save screen
    $scene = Scene_Save.new
  end
  #--------------------------------------------------------------------------
  # * Command : End Game
  #--------------------------------------------------------------------------
  def command_endgame
    # Switch to end game screen
    $scene = Scene_End.new
  end
  #--------------------------------------------------------------------------
  # * Activate Status Window
  #--------------------------------------------------------------------------
  def active_status_window
    # Make status window active
    @command_window.active = false
    @status_window.active = true
    @status_window.index = 0
  end
end

#==============================================================================
# ** Ends Enable Part IV Check
#==============================================================================
end

#==============================================================================
# ** Enable Part IV Check
#==============================================================================
if SDK::Parts.include?(4) || 
  (SDK::Indidual_Parts.include?('PART 3#SCENE_END') &&
   SDK::Indidual_Parts.include?('PART 4#SCENE_END'))

#==============================================================================
# ** Scene_End
#------------------------------------------------------------------------------
#  This class performs game end screen processing.
#==============================================================================

class Scene_End < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_End, :disabled_main_command?, 
    :main_command_input)
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make command window
    s1 = SDK::Scene_Commands::Scene_End::To_Title
    s2 = SDK::Scene_Commands::Scene_End::Shutdown
    s3 = SDK::Scene_Commands::Scene_End::Cancel
    @command_window = Window_Command.new(192, [s1, s2, s3])
    @command_window.x = 320 - @command_window.width / 2
    @command_window.y = 240 - @command_window.height / 2
  end
  #--------------------------------------------------------------------------
  # * Frame Update
  #--------------------------------------------------------------------------
  def update
    super
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to menu screen
      $scene = Scene_Menu.new(5)
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if disabled_main_command?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      main_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Disabled Main Command? Test
  #--------------------------------------------------------------------------
  def disabled_main_command?
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Command Input
  #--------------------------------------------------------------------------
  def main_command_input
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_End::To_Title  # to title
      command_to_title
    when SDK::Scene_Commands::Scene_End::Shutdown  # shutdown
      command_shutdown
    when SDK::Scene_Commands::Scene_End::Cancel    # cancel
      command_cancel
    end
  end
end

#==============================================================================
# ** Ends Enable Part IV Check
#==============================================================================
end

#==============================================================================
# ** Enable Part IV Check
#==============================================================================
if SDK::Parts.include?(4) || 
  (SDK::Indidual_Parts.include?('PART 3#SCENE_BATTLE') &&
   SDK::Indidual_Parts.include?('PART 4#SCENE_BATTLE'))

#==============================================================================
# ** Scene_Battle
#------------------------------------------------------------------------------
#  This class performs battle screen processing.
#==============================================================================

class Scene_Battle < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Battle, :update_phase2, :phase2_command_disabled?,
    :phase2_command_input)
  SDK.log_branch(:Scene_Battle, :update_phase3_basic_command, 
    :phase3_basic_command_disabled?, :phase3_basic_command_input)
  SDK.log_branch(:Scene_Battle, :phase2_command_input, 
    :phase2_command_fight, :phase2_command_escape)
  SDK.log_branch(:Scene_Battle, :phase3_basic_command_input, 
    :phase3_command_attack, :phase3_command_skill, :phase3_command_guard, 
    :phase3_command_item)
  #--------------------------------------------------------------------------
  # * Main Processing : Window Initialization
  #--------------------------------------------------------------------------
  def main_window
    super
    # Make actor command window
    s1 = SDK::Scene_Commands::Scene_Battle::Attack
    s2 = SDK::Scene_Commands::Scene_Battle::Skill
    s3 = SDK::Scene_Commands::Scene_Battle::Guard
    s4 = SDK::Scene_Commands::Scene_Battle::Item
    @actor_command_window = Window_Command.new(160, [s1, s2, s3, s4])
    @actor_command_window.y = 160
    @actor_command_window.back_opacity = 160
    @actor_command_window.active = false
    @actor_command_window.visible = false
    # Make other windows
    @party_command_window = Window_PartyCommand.new
    @help_window = Window_Help.new
    @help_window.back_opacity = 160
    @help_window.visible = false
    @status_window = Window_BattleStatus.new
    @message_window = Window_Message.new
  end
  #--------------------------------------------------------------------------
  # * Frame Update (party command phase)
  #--------------------------------------------------------------------------
  def update_phase2
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if phase2_command_disabled?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      phase2_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (actor command phase : basic command)
  #--------------------------------------------------------------------------
  def update_phase3_basic_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Go to command input for previous actor
      phase3_prior_actor
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if phase3_basic_command_disabled?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      # Command Input
      phase3_basic_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Phase 2 : Command Disabled? Test
  #--------------------------------------------------------------------------
  def phase2_command_disabled?
    # If Escape Selected
    if @party_command_window.command == 
       SDK::Scene_Commands::Scene_Battle::Escape
      # If it's not possible to escape
      return true unless $game_temp.battle_can_escape
    end
    return false
  end
  #--------------------------------------------------------------------------
  # * Phase 2 : Command Input
  #--------------------------------------------------------------------------
  def phase2_command_input   
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Branch by party command window cursor position
    case @party_command_window.command
    when SDK::Scene_Commands::Scene_Battle::Fight  # fight
      phase2_command_fight
    when SDK::Scene_Commands::Scene_Battle::Escape  # escape
      phase2_command_escape
    end
  end
  #--------------------------------------------------------------------------
  # * Phase 3 - Basic : Command Disabled? Test
  #--------------------------------------------------------------------------
  def phase3_basic_command_disabled?
    return false
  end
  #--------------------------------------------------------------------------
  # * Phase 3 Basic : Command Input
  #--------------------------------------------------------------------------
  def phase3_basic_command_input
    # Play decision SE
    $game_system.se_play($data_system.decision_se)
    # Branch by actor command window cursor position
    case @actor_command_window.command
    when SDK::Scene_Commands::Scene_Battle::Attack  # attack
      phase3_command_attack
    when SDK::Scene_Commands::Scene_Battle::Skill  # skill
      phase3_command_skill
    when SDK::Scene_Commands::Scene_Battle::Guard  # guard
      phase3_command_guard
    when SDK::Scene_Commands::Scene_Battle::Item  # item
      phase3_command_item
    end
  end
  #--------------------------------------------------------------------------
  # * Phase 2 : Command - Fight
  #--------------------------------------------------------------------------
  def phase2_command_fight
    # Start actor command phase
    start_phase3
  end
  #--------------------------------------------------------------------------
  # * Phase 2 : Command - Escape
  #--------------------------------------------------------------------------
  def phase2_command_escape
    # Escape processing
    update_phase2_escape
  end
  #--------------------------------------------------------------------------
  # * Phase 3 - Basic : Command - Attack
  #--------------------------------------------------------------------------
  def phase3_command_attack
    # Set action
    @active_battler.current_action.kind = 0
    @active_battler.current_action.basic = 0
    # Start enemy selection
    start_enemy_select
  end
  #--------------------------------------------------------------------------
  # * Phase 3 - Basic : Command - Skill
  #--------------------------------------------------------------------------
  def phase3_command_skill
    # Set action
    @active_battler.current_action.kind = 1
    # Start skill selection
    start_skill_select
  end
  #--------------------------------------------------------------------------
  # * Phase 3 - Basic : Command - Guard
  #--------------------------------------------------------------------------
  def phase3_command_guard
    # Set action
    @active_battler.current_action.kind = 0
    @active_battler.current_action.basic = 1
    # Go to command input for next actor
    phase3_next_actor
  end
  #--------------------------------------------------------------------------
  # * Phase 3 - Basic : Command - Item
  #--------------------------------------------------------------------------
  def phase3_command_item
    # Set action
    @active_battler.current_action.kind = 2
    # Start item selection
    start_item_select
  end
end  

#==============================================================================
# ** Ends Enable Part IV Check
#==============================================================================
end

#==============================================================================
# ** Enable Part IV Check
#==============================================================================
if SDK::Parts.include?(4) || 
  (SDK::Indidual_Parts.include?('PART 3#SCENE_SHOP') &&
   SDK::Indidual_Parts.include?('PART 4#SCENE_SHOP'))

#==============================================================================
# ** Scene_Shop
#------------------------------------------------------------------------------
#  This class performs shop screen processing.
#==============================================================================

class Scene_Shop < SDK::Scene_Base
  #--------------------------------------------------------------------------
  SDK.log_branch(:Scene_Shop, :update_command, :disabled_main_command?,
    :main_command_input)
  SDK.log_branch(:Scene_Shop, :update_number, 
    :number_cancel_command_input, :number_command_input)
  SDK.log_branch(:Scene_Shop, :main_command_input, :command_main_buy, 
    :command_main_sell, :command_exit)
  SDK.log_branch(:Scene_Shop, :number_command_input, 
    :command_number_buy, :command_number_sell)
  #--------------------------------------------------------------------------
  # * Frame Update (when command window is active)
  #--------------------------------------------------------------------------
  def update_command
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Switch to map screen
      $scene = Scene_Map.new
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Return if Disabled Command
      if disabled_main_command?
        # Play buzzer SE
        $game_system.se_play($data_system.buzzer_se)
        return
      end
      main_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Frame Update (when quantity input window is active)
  #--------------------------------------------------------------------------
  def update_number
    # If B button was pressed
    if Input.trigger?(Input::B)
      # Play cancel SE
      $game_system.se_play($data_system.cancel_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Number Cancel Command
      number_cancel_command_input
      return
    end
    # If C button was pressed
    if Input.trigger?(Input::C)
      # Play shop SE
      $game_system.se_play($data_system.shop_se)
      # Set quantity input window to inactive / invisible
      @number_window.active = false
      @number_window.visible = false
      # Number Command Input
      number_command_input
      return
    end
  end
  #--------------------------------------------------------------------------
  # * Disabled Main Command? Test
  #--------------------------------------------------------------------------
  def disabled_main_command?
    return false
  end
  #--------------------------------------------------------------------------
  # * Main Command Input
  #--------------------------------------------------------------------------
  def main_command_input
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Shop::Buy
      command_main_buy
    when SDK::Scene_Commands::Scene_Shop::Sell
      command_main_sell
    when SDK::Scene_Commands::Scene_Shop::Exit
      command_exit
    end
  end
  #--------------------------------------------------------------------------
  # * Update Number Cancel Command
  #--------------------------------------------------------------------------
  def number_cancel_command_input
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Shop::Buy   # buy
      # Change windows to buy mode
      @buy_window.active = true
      @buy_window.visible = true
    when SDK::Scene_Commands::Scene_Shop::Sell  # sell
      # Change windows to sell mode
      @sell_window.active = true
      @sell_window.visible = true
      @status_window.visible = false
    end
  end
  #--------------------------------------------------------------------------
  # * Update Number Command
  #--------------------------------------------------------------------------
  def number_command_input
    # Branch by command window cursor position
    case @command_window.command
    when SDK::Scene_Commands::Scene_Shop::Buy    # buy
      command_number_buy
    when SDK::Scene_Commands::Scene_Shop::Sell   # sell  
      command_number_sell
    end
  end
  #--------------------------------------------------------------------------
  # * Command : Main Buy
  #--------------------------------------------------------------------------
  def command_main_buy    
    # Change windows to buy mode
    @command_window.active = false
    @dummy_window.visible = false
    @buy_window.active = true
    @buy_window.visible = true
    @buy_window.refresh
    @status_window.visible = true
  end
  #--------------------------------------------------------------------------
  # * Command : Main Sell
  #--------------------------------------------------------------------------
  def command_main_sell
    # Change windows to sell mode
    @command_window.active = false
    @dummy_window.visible = false
    @sell_window.active = true
    @sell_window.visible = true
    @sell_window.refresh
  end
  #--------------------------------------------------------------------------
  # * Command : Exit
  #--------------------------------------------------------------------------
  def command_exit 
    # Switch to map screen
    $scene = Scene_Map.new
  end
  #--------------------------------------------------------------------------
  # * Command : Number Buy
  #--------------------------------------------------------------------------
  def command_number_buy
    # Buy process
    $game_party.lose_gold(@number_window.number * @item.price)
    case @item
    when RPG::Item
      $game_party.gain_item(@item.id, @number_window.number)
    when RPG::Weapon
      $game_party.gain_weapon(@item.id, @number_window.number)
    when RPG::Armor
      $game_party.gain_armor(@item.id, @number_window.number)
    end
    # Refresh each window
    @gold_window.refresh
    @buy_window.refresh
    @status_window.refresh
    # Change windows to buy mode
    @buy_window.active = true
    @buy_window.visible = true
  end
  #--------------------------------------------------------------------------
  # * Command : Number Sell
  #--------------------------------------------------------------------------
  def command_number_sell
    # Sell process
    $game_party.gain_gold(@number_window.number * (@item.price / 2))
    case @item
    when RPG::Item
      $game_party.lose_item(@item.id, @number_window.number)
    when RPG::Weapon
      $game_party.lose_weapon(@item.id, @number_window.number)
    when RPG::Armor
      $game_party.lose_armor(@item.id, @number_window.number)
    end
    # Refresh each window
    @gold_window.refresh
    @sell_window.refresh
    @status_window.refresh
    # Change windows to sell mode
    @sell_window.active = true
    @sell_window.visible = true
    @status_window.visible = false
  end
end

#==============================================================================
# ** Ends Enable Part IV Check
#==============================================================================
end