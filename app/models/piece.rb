class Piece < ActiveRecord::Base
	belongs_to :game
	
	# method accepts destination coordinates & returns a boolean
	# returning 'true' means there is a piece b/t the origin and destination
	def is_obstructed?(destination_x, destination_y)
		# check if there is a piece on the destination square
		other_piece = game.pieces.where(x_coordinate: destination_x, y_coordinate: destination_y ).first
		if other_piece.present? 
			return true
		end
		
		# default return false 
		found = false  

		# Psuedocode
		# create integer range from origin.to.destination
		# query database through entire range

		# horizontal movement: left => right
		(self.x_coordinate + 1).upto(destination_x - 1).each do |x|
			between_squares = game.pieces.where(x_coordinate: x, y_coordinate: destination_y).first
			if between_squares.present? 
				found = true
				break 
			end
		end
		found

		# horizontal movement: right => left 
		(self.x_coordinate - 1).downto(destination_x - 1).each do |x|
		between_squares = game.pieces.where(x_coordinate: x, y_coordinate: destination_y).first
			if between_squares.present? 
				found = true
				break 
			end
		end
		found

		# vertical movement: bottom => top 
		(self.y_coordinate + 1).upto(destination_y - 1).each do |y|
			between_squares = game.pieces.where(x_coordinate: destination_x, y_coordinate: y).first
			if between_squares.present? 
				found = true
				break 
			end
		end
		found

		# vertical movement: top => bottom
		(self.y_coordinate - 1).downto(destination_y - 1).each do |y|
			between_squares = game.pieces.where(x_coordinate: destination_x, y_coordinate: y).first
			if between_squares.present? 
				found = true
				break 
			end
		end
		found

	end
end