﻿package classes {
	
	import classes.Piece;
	import classes.WhiteMan;
	import classes.BlackMan;
	import classes.Queen;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	
	public dynamic class PieceEngine extends Array {
		protected var timer:Timer = new Timer(0);
		
		public function PieceEngine(){
			timer.addEventListener(TimerEvent.TIMER, update);
		}
		
		public function start():void {
			timer.start();
		}
		
		public function stop():void{
			timer.stop();
		}
		
		public function getPieceAt(x:Number, y:Number){
			var temp = null;
			for each(var piece in this){
				if(piece.x == x && piece.y == y){
					temp = piece;
				}
			}
			return temp;
		}
		
		public function update(e:TimerEvent):void {
			for each(var piece in this) {
				piece.vX *= 0.9975;
				piece.vY *= 0.9975;
				piece.x += piece.vX;
				piece.y += piece.vY;
			}
			
			CheckAndPerformWallCollision();
			CheckForCarromPieceCollision();
		}
		
		private function CheckAndPerformWallCollision():void {
			for each(var piece in this) {
				if (piece.x >= 740) piece.vX = - Math.abs(piece.vX);
				if (piece.x <= 0) piece.vX = Math.abs(piece.vX);
				if (piece.y <= 0) piece.vY = Math.abs(piece.vY);
				if (piece.y >= 740) piece.vY = - Math.abs(piece.vY);
			}
		}
			
		private function CheckForCarromPieceCollision():void {
			for (var i:int = 1; i < this.length; i++ ) {
				for (var j:int = 0; j < i; j++ ) {
					var dX:Number = this[i].x - this[j].x;
					var dY:Number = this[i].y - this[j].y;
					var maxD:Number = this[i].radius + this[j].radius;
				
					if (dX * dX + dY * dY <= maxD * maxD) {
						PerformCarromPieceCollision(this[i], this[j]);
					}
				}
			}
		}	
		// Da fikk jeg omsider gjenoppdaget formlene for å omkomponere fartsvektorene, og ball-mot-ball kollisjoner skal nå fungere plettfritt.
		// Den eneste eventuelle bekymringen jeg har er dersom ved bruk av friksjon, brikkene bremser ned og etter en kollisjon i neste 'tick'
		// ikke er utenfor ballen den kolliderte med, vil nok en kollisjon bli utført, og ballene vil henge fast i hverandre. 
		// Dersom dette blir et problem (lite sannsynlig), har jeg en idè om hvordan jeg kan fikse det!
		
		private function PerformCarromPieceCollision(obj1, obj2):void {
			
			
			var vX1:Number = obj1.vX;
			var vY1:Number = obj1.vY;
			var vX2:Number = obj2.vX;
			var vY2:Number = obj2.vY;
			
			var dX:Number = obj1.x - obj2.x;
			var dY:Number = obj1.y - obj2.y
			var d:Number = Math.sqrt(dX * dX + dY * dY);
			
			var vP1:Number = (vX1 * dX + vY1 * dY) / d;
			var vP2:Number = (vX2 * dX + vY2 * dY) / d;
			var vN1:Number = (vX1 * dY - vY1 * dX) / d;
			var vN2:Number = (vX2 * dY - vY2 * dX) / d;
			
			var vP1_New:Number = vP2;
			var vP2_New:Number = vP1;
			
			obj1.vX = (vP1_New*dX + vN1*dY)/d;
			obj2.vX = (vP2_New*dX + vN2*dY)/d;
			obj1.vY = (vP1_New*dY - vN1*dX)/d;
			obj2.vY = (vP2_New*dY - vN2*dX)/d;
			
			
			/*var dX:Number = obj1.x - obj2.x;
			var dY:Number = obj1.y - obj2.y;
			var d:Number = Math.sqrt(dX * dX + dY * dY);
			
			var m1:Number = obj1.mass;
			var m2:Number = obj2.mass;
			
			var vX1:Number = obj1.vX;
			var vX2:Number = obj2.vX;
			var vY1:Number = obj1.vY;
			var vY2:Number = obj2.vY;
			
			var vP1:Number = (vX1 * dX + vY1 * dY) / d;
			var vP2:Number = (vX2 * dX + vY2 * dY) / d;
			var vN1:Number = (vX1 * dY - vY1 * dX) / d;
			var vN2:Number = (vX2 * dY - vY2 * dX) / d;
			
			//var vP1_New:Number = (m1 * vP1 - m2 * vP1 + 2 * m2 * vP2) / (m1 + m2);
			//var vP2_New:Number = (m2 * vP2 - m1 * vP2 + 2 * m1 * vP1) / (m1 + m2);
			var vP1_New:Number = vP2;
			var vP2_New:Number = vP1;

			obj1.vX = (vP1_New*dX + vN1*dY)/d;
			obj2.vX = (vP2_New*dX + vN2*dY)/d;
			obj1.vY = (vP1_New*dY - vN1*dX)/d;
			obj2.vY = (vP2_New*dY - vN2*dX)/d;*/
		}
		
		public function Collider():void{
			
		}
	}
}