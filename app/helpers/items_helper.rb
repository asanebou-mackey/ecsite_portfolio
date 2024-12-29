module ItemsHelper
  def size_to_size_label(size)
    if size == 1
      "S"
    elsif size == 2
      "M"
    elsif size == 3
      "L"
    else
      "XL"
    end
  end

  def color_to_color_label(color)
    if color == 1
      "ホワイト"
    elsif color == 2
      "グレー"
    elsif color == 3
      "ネイビー"
    elsif color == 4
      "ベージュ"
    elsif color == 5
      "レッド"
    elsif color == 6
      "ブルー"
    elsif color == 7
      "グリーン"
    elsif color == 8
      "イエロー"
    elsif color == 9
      "オレンジ"
    elsif color == 10
      "ピンク"
    elsif color == 11
      "パープル"
    end
  end

  def gender_to_gender_label(gender)
    if gender == 1
      "男性"
    elsif gender == 2
      "女性"
    elsif gender == 9
      "その他"
    end
  end
end
