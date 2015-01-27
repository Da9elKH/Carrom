package classes {
	
	import classes.Piece;
	
	public class BlackMan extends Piece{
		protected var vx:Number;
		protected var vy:Number;
		protected var type:String;
		protected var m:Number;
		protected var r:Number;
		protected var s:MovieClip;
		protected var X:Number;
		protected var Y:Number;
		
		
		public function CarromPiece(startX:Number, startY:Number, pieceType:String, symbol:MovieClip){
			x = startX;
			y = startY;
			s = symbol;
			s.x = x;
			s.y = y;
			vx = 0;
			vy = 0;
			type = pieceType;
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
		public function set radius(newValue:Number):void{
			r = newValue;
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
		public function get radius():Number {
			return r;
		}
	}
}