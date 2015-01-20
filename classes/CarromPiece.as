package classes {
	
	import flash.display.MovieClip;
	import classes.Pieces;
	
	public class CarromPiece extends MovieClip {
		protected var vX:Number;
		protected var vY:Number;
		protected var type:int;
		protected var mass:Number;
		
		public function CarromPiece(startX:Number, startY:Number, pieceType:String){
			x = startX;
			y = startY;
			vX = 0;
			vY = 0;
			type = pieceType;
			
			if (type == "Striker") 
				mass = 15;  
			else 
				mass = 5; 
		}
		
		public function set vX(newValue:Number):void{
			vX = newValue;
		}
		public function set vY(newValue:Number):void{
			vY = newValue;
		}
		public function set mass(newValue:Number):void{
			mass = newValue;
		}
		public function get vX():Number{
			return vX;
		}
		public function get vY():Number{
			return vY;
		}
		public function get mass():Number{
			return mass;
		}
	}
}