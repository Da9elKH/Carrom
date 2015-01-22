package classes {
	
	import flash.display.MovieClip;
	//import classes.Pieces;
	
	public class CarromPiece extends MovieClip {
		protected var vx:Number;
		protected var vy:Number;
		protected var type:String;
		protected var m:Number;
		
		public function CarromPiece() {
			x = 0;
			y = 0;
			vx = 0;
			vy = 0;
			type = 
		}
		
		public function CarromPiece(startX:Number, startY:Number, pieceType:String){
			x = startX;
			y = startY;
			vx = 0;
			vy = 0;
			type = pieceType;
			
			if (type == "Striker") 
				m = 15;  
			else 
				m = 5; 
		}
		
		public function set vX(newValue:Number):void{
			vx = newValue;
		}
		public function set vY(newValue:Number):void{
			vy = newValue;
		}
		public function set mass(newValue:Number):void{
			m = newValue;
		}
		public function get vX():Number{
			return vx;
		}
		public function get vY():Number{
			return vy;
		}
		public function get mass():Number{
			return m;
		}
	}
}