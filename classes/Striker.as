package classes {
	
	import classes.Piece;
	
	public class Striker extends Piece{		
		public function Striker(X:Number,Y:Number){
			x = X;
			y = Y;
			vx = 0;
			vy = 0;
			r = 41/2;
			m = 15;
			type = "Striker";
		}
	}
} 