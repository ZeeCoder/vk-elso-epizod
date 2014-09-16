#==============================================================================
# ■ Window_SkillStatus
#------------------------------------------------------------------------------
# 　スキル画面で、スキル使用者のステータスを表示するウィンドウです。
#==============================================================================

class Window_SkillStatus < Window_Base
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #     actor : アクター
  #--------------------------------------------------------------------------
  def initialize(actor)
    super(0, 64, 640, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.contents.font.name = $defaultfonttype  # "Skill" status window font
    self.contents.font.size = $defaultfontsize
    @actor = actor
    refresh
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    draw_actor_name(@actor, 4, 0)
    draw_actor_state(@actor, 140, 0)
    draw_actor_hp(@actor, 284, 0)
    draw_actor_sp(@actor, 460, 0)
  end
end
