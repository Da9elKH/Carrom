package classes {
	
	import flash.display.MovieClip;
	import classes.Pieces;
	
	public class CarromPiece extends MovieClip {
		protected var vX:Number;
		protected var vY:Number;
		protected var team:int;
		
		// teamColor har verdier fra 0-2. 0 = hvit, 1 = sort, 2 = rød/"queen"
		public function CarromPiece(startX:Number, startY:Number, teamColor:int){
			x = startX;
			y = startY;
			vX = 0;
			vY = 0;
			team = teamColor;
		}
		
		public function set vx(newValue:Number):void{
			vX = newValue;
		}
		public function set vy(newValue:Number):void{
			vY = newValue;
		}
		public function get vx():Number{
			return vX;
		}
		public function get vy():Number{
			return vY;
		}
		
		// Tester funksjonalitet
		public function plus(a:int, b:int):int{
			return (a+b);
		}
	}
}