#==============================================================================
# ■ Window_NameInput
#------------------------------------------------------------------------------
# 　名前入力画面で、文字を選択するウィンドウです。
#==============================================================================

class Window_NameInput < Window_Base
  CHARACTER_TABLE =
  [
    "A",  "B",  "C",  "D",  "E",
    "F",  "G",  "H",  "I",  "J",
    "K",  "L",  "M",  "N",  "O",
    "P",  "Q",  "R",  "S",  "T",
    "U",  "V",  "W",  "X",  "Y",
    "Z",  " ",  "1",  "2",  "3",
    "4",  "5",  "6",  "7",  "8",
    "9",  "0",  " ",  "+",  "-",
    ";",  ":",  "'",  ",",  ".",

    "a",  "b",  "c",  "d",  "e",
    "f",  "g",  "h",  "i",  "j",
    "k",  "l",  "m",  "n",  "o",
    "p",  "q",  "r",  "s",  "t",
    "u",  "v",  "w",  "x",  "y",
    "z",  " ",  "!",  "@",  "#",
    "$",  "%",  "^",  "&",  "*",
    "(",  ")",  " ",  "[",  "]",
    "{",  "}",  "<",  ">",  "?",
  ]
  #--------------------------------------------------------------------------
  # ● オブジェクト初期化
  #--------------------------------------------------------------------------
  def initialize
    super(160, 128, 320, 352)
    self.contents = Bitmap.new(width - 32, height - 32)
    self.contents.font.name = $defaultfonttype  # "Name Input" window font
    self.contents.font.size = $defaultfontsize
    @index = 0
    refresh
    update_cursor_rect
  end
  #--------------------------------------------------------------------------
  # ● 文字の取得
  #--------------------------------------------------------------------------
  def character
    return CHARACTER_TABLE[@index]
  end
  #--------------------------------------------------------------------------
  # ● リフレッシュ
  #--------------------------------------------------------------------------
  def refresh
    self.contents.clear
    for i in 0..89
      x = 4 + i / 5 / 9 * 152 + i % 5 * 28
      y = i / 5 % 9 * 32
      self.contents.draw_text(x, y, 28, 32, CHARACTER_TABLE[i], 1)
    end
    self.contents.draw_text(225, 9 * 32, 64, 32, "Accept", 1)
  end
  #--------------------------------------------------------------------------
  # ● カーソルの矩形更新
  #--------------------------------------------------------------------------
  def update_cursor_rect
    # カーソル位置が [決定] の場合
    if @index >= 90
      self.cursor_rect.set(225, 9 * 32, 64, 32)
    # カーソル位置が [決定] 以外の場合
    else
      x = 4 + @index / 5 / 9 * 152 + @index % 5 * 28
      y = @index / 5 % 9 * 32
      self.cursor_rect.set(x, y, 28, 32)
    end
  end
  #--------------------------------------------------------------------------
  # ● フレーム更新
  #--------------------------------------------------------------------------
  def update
    super
    # カーソル位置が [決定] の場合
    if @index >= 90
      # カーソル下
      if Input.trigger?(Input::DOWN)
        $game_system.se_play($data_system.cursor_se)
        @index -= 90
      end
      # カーソル上
      if Input.repeat?(Input::UP)
        $game_system.se_play($data_system.cursor_se)
        @index -= 90 - 40
      end
    # カーソル位置が [決定] 以外の場合
    else
      # 方向ボタンの右が押された場合
      if Input.repeat?(Input::RIGHT)
        # 押下状態がリピートでない場合か、
        # カーソル位置が右端ではない場合
        if Input.trigger?(Input::RIGHT) or
           @index / 45 < 3 or @index % 5 < 4
          # カーソルを右に移動
          $game_system.se_play($data_system.cursor_se)
          if @index % 5 < 4
            @index += 1
          else
            @index += 45 - 4
          end
          if @index >= 90
            @index -= 90
          end
        end
      end
      # 方向ボタンの左が押された場合
      if Input.repeat?(Input::LEFT)
        # 押下状態がリピートでない場合か、
        # カーソル位置が左端ではない場合
        if Input.trigger?(Input::LEFT) or
           @index / 45 > 0 or @index % 5 > 0
          # カーソルを左に移動
          $game_system.se_play($data_system.cursor_se)
          if @index % 5 > 0
            @index -= 1
          else
            @index -= 45 - 4
          end
          if @index < 0
            @index += 90
          end
        end
      end
      # 方向ボタンの下が押された場合
      if Input.repeat?(Input::DOWN)
        # カーソルを下に移動
        $game_system.se_play($data_system.cursor_se)
        if @index % 45 < 40
          @index += 5
        else
          @index += 90 - 40
        end
      end
      # 方向ボタンの上が押された場合
      if Input.repeat?(Input::UP)
        # 押下状態がリピートでない場合か、
        # カーソル位置が上端ではない場合
        if Input.trigger?(Input::UP) or @index % 45 >= 5
          # カーソルを上に移動
          $game_system.se_play($data_system.cursor_se)
          if @index % 45 >= 5
            @index -= 5
          else
            @index += 90
          end
        end
      end
      # L ボタンか R ボタンが押された場合
      if Input.repeat?(Input::L) or Input.repeat?(Input::R)
        # ひらがな / カタカナ 移動
        $game_system.se_play($data_system.cursor_se)
        if @index / 45 < 2
          @index += 90
        else
          @index -= 90
        end
      end
    end
    update_cursor_rect
  end
end
