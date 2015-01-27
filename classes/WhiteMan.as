package classes {
	
	import classes.Piece;
	
	public class WhiteMan extends Piece{
		protected var s:MovieClip;
		
		public function WhiteMan(){
			x = 0;
			y = 0;
			vx = 0;
			vy = 0;
			r = 31 / 2;
			m = 5;
			type = "WhiteMan";
		}
	}
}