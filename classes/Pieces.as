package classes {
	
	import classes.CarromPiece;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public class Pieces extends Array {
		protected var timer:Timer = new Timer(0, 0);
		
		public function Pieces(){
			timer.addEventListener(TimerEvent.TIMER, update);
			newGame();
		}
		
		public function newGame():void{
			//PLASSERING AV BRIKKER
			//RESETTING AV SCORE
			//ROTER BRETT TIL UTGANGSSTILLING
			//SKRIV INN NAVN PÅ BRUKER KANSKJE???
		}
		public function start():void {
			timer.start();
		}
		
		public function stop():void{
			timer.stop();
		}
		public function getPieceAt(x:Number, y:Number):CarromPiece{
			var temp:CarromPiece = null;
			for each(var piece:CarromPiece in this){
				if(piece.x == x && piece.y == y){
					temp = piece;
				}
			}
			return temp;
		}
		
		public function update():void {
			CheckForWallCollision();
			CheckForCarromPieceCollision();
			
			for each(var piece:CarromPiece in this) {
				piece.x += piece.vx;
				piece.y += piece.vy;
			}
			
			protected function CheckForWallCollision():void {
				
			}
			
			protected function CheckForCarromPieceCollision():void {
				
			}
			public function PerformCarromPieceCollision(obj1:CarromPiece, obj2:CarromPiece):void {
			
			var dX:Number = obj1.x - obj2.x;
			var dY:Number = obj1.y - obj2.y;
			var d:Number = Math.sqrt(dX * dX + dY * dY);
			
			var m1:Number = obj1.mass;
			var m2:Number = obj2.mass;
			
			var vX1:Number = obj1.vX;
			var vX2:Number = obj2.vX;
			var vY1:Number = obj1.vY;
			var vY2:Number = obj2.vY;
			
			var vN1:Number = (vX1 * dY + vY1 * dX) / d;
			var vN2:Number = (vX1 * dY + vY1 * dX) / d;
			var vP1:Number = (vX1 * dX - vY1 * dY) / d;
			var vP2:Number = (vX2 * dX - vY2 * dY) / d;
			
			var vP1_New:Number = (m1 * vP1 - m2 * vP1 + 2 * m2 * vP2) / (m1 + m2);
			var vP2_New:Number = (m2 * vP2 - m1 * vP2 + 2 * m1 * vP1) / (m1 + m2);
			trace("vN1=", vN1, " , vP1=", vP1, " , vP1_New=", vP1_New);
			trace("vN2=", vN2, " , vP2=", vP2, " , vP2_New=", vP2_New);
		}
		}
		
		public function Collider():void{
			p1:CarromPiece = new CarromPiece();
			
		}
	}
}