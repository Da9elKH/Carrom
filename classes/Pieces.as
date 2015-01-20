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
			for each(var piece:CarromPiece in this) {
				piece.x += piece.vx;
				piece.y += piece.vy;
			}
			
		}
		
		public function Collider():void{
			p1:CarromPiece = new CarromPiece();
			
		}
	}
}