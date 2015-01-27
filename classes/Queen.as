package classes {
	
	import classes.Piece;
	
	public class Queen extends Piece{
		protected var s:MovieClip;
		
		public function Queen(startX:Number, startY:Number, pieceType:String, symbol:MovieClip){
			x = startX;
			y = startY;
			s = symbol;
			s.x = x;
			s.y = y;
			vx = 0;
			vy = 0;
			type = pieceType;
		}
	}
} 