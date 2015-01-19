package classes {
	
	import classes.CarromPiece;
	
	public class Pieces extends Array {
		
		public function Pieces(){
			
		}
		
		public function getPieceAt(x:Number, y:Number):CarromPiece{
			var temp:CarraomPiece = null;
			for each(var piece:CarromPiece in this){
				if(piece.x == x && piece.y == y){
					temp = piece;
				}
			return temp:
			}
		}
		
		public function Collider():void{
			//vY = newValue;
		}
	}
}