class Pawn < Piece

	def valid_move?(x,y)
		return false if obstructed_vertically?(x,y)
		return false if off_board?(x,y)
		return false if backward_move?(x,y)
		return false if horizontal_move?(x,y)
		return false if diagonal_move?(x,y)
		# return true if capture_possible?(x,y)

		if first_move?
			return false if (y-y_coordinate).abs > 2 || (y-y_coordinate).abs < 1
		else
			return false if (y-y_coordinate).abs > 1
		end
		true
	end

	def first_move?
		if (y_coordinate == 2 && is_white?(self)) || (y_coordinate == 7 && !is_white?(self))
			return true
		else
			return false
		end
	end

	def enemy_piece?(x, y)
    piece = piece_at(x, y)
    return false if piece.nil?
    return true if color != piece.color
    false
  end

	def backward_move?(x,y)
		if (is_white?(self) && (y<y_coordinate)) || (!is_white?(self) && (y>y_coordinate))
			return true
		else
			return false
		end
	end

	# def capture_possible?(x,y)
	# 	x_diff = (x-x_coordinate).abs
	# 	y_diff = (y-y_coordinate).abs
	# 	return false if piece_at(x,y).nil?
	# 	return false if piece_at(x,y).color == self.color
	# 	return true if x_diff == 1 && y_diff == 1
	# end
end
