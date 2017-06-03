class Card
  attr_reader :face_value
  attr_accessor :face_up

  def initialize(face_value, face_up = false)
    @face_value = face_value
    @face_up = face_up
  end

  def hide
    @face_up = false
  end

  def reveal
    @face_up = true
  end

  def ==(card)
    face_value == card.face_value if face_up && card.face_up
  end

  def to_s

  end
end
