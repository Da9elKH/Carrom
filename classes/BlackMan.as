package classes {
	
	import classes.Piece;
	
	public class BlackMan extends Piece{
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
		}
		
		/*public function BlackMan(){
			x = 0;
			y = 0;
			vx = 0;
			vy = 0;
			r = 31 / 2;
			m = 5;
		}*/
			type = "BlackMan";
		}
	}
}