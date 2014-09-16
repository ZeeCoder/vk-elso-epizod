#==============================================================================
# ■ Window_ShopCommand
#------------------------------------------------------------------------------
# 　ショップ画面で、用件を選択するウィンドウです。
#==============================================================================

class Window_ShopCommand < Window_Selectable
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(0, 64, 480, 64)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.contents.font.name = $defaultfonttype  # "Shop Commands" window font
    self.contents.font.size = $defaultfontsize
    @item_max = 3
    @column_max = 3
    @commands = ["Vesz", "Elad", "Távoz"]
    refresh
    self.index = 0
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0...@item_max
      draw_item(i)
    end
  end
  #--------------------------------------------------------------------------
  # ● 項目の描画
  #     index : 項目番号
  #--------------------------------------------------------------------------
  def draw_item(index)
    x = 4 + index * 160
    self.contents.draw_text(x, 0, 128, 32, @commands[index])
  end
end
