package classes {
	
	import classes.Piece;
	
	public class BlackMan extends Piece{
<<<<<<< HEAD
		protected var s:MovieClip;
		
		public function BlackMan(startX:Number, startY:Number, pieceType:String, symbol:MovieClip){
			x = startX;
			y = startY;
			s = symbol;
			s.x = x;
			s.y = y;
			vx = 0;
			vy = 0;
			type = pieceType;
=======
		public function CarromPiece(){
			x = 0;
			y = 0;
			vX = 0;
			vY = 0;
			r = 31 / 2;
			m = 5;
>>>>>>> 80e66307a6baaf52cd8cf5dfc1bc7102c3b7f2de
		}
	}
}