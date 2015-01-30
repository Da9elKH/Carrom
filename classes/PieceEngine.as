package classes {
	
	import classes.Piece;
	import classes.WhiteMan;
	import classes.BlackMan;
	import classes.Queen;
	import classes.Striker;
	import flash.utils.Timer;
	import flash.events.TimerEvent;
	import flash.display.MovieClip;
	
	public dynamic class PieceEngine extends Array {
		protected var timer:Timer = new Timer(0);
		
		public function newGame(board):void {
			const r:Number = 31/2;
			for each(var piece in this) {
				board.removeChild(piece);
			}
			this.length = 0;
			
			push(new Striker(0, 250));
			
			push(new WhiteMan(0,	+2*Math.sqrt(3)*r	));
			push(new WhiteMan(0, 	-2*Math.sqrt(3)*r	));
			push(new WhiteMan(-3*r, +Math.sqrt(3)*r		));
			push(new WhiteMan(-3*r, -Math.sqrt(3)*r		));
			push(new WhiteMan(-2*r, 0					));
			push(new WhiteMan(r, 	+Math.sqrt(3)*r		));
			push(new WhiteMan(r, 	-Math.sqrt(3)*r		));
			push(new WhiteMan(3*r,	+Math.sqrt(3)*r		));
			push(new WhiteMan(3*r,	-Math.sqrt(3)*r		));
	
			push(new Queen(0,0));
	
			push(new BlackMan(-4*r,	0					));
			push(new BlackMan(-2*r,	2*Math.sqrt(3)*r	));
			push(new BlackMan(-2*r,	-2*Math.sqrt(3)*r	));
			push(new BlackMan(-r,	Math.sqrt(3)*r		));
			push(new BlackMan(-r,	-Math.sqrt(3)*r		));
			push(new BlackMan(2*r,	0					));
			push(new BlackMan(2*r,	2*Math.sqrt(3)*r	));
			push(new BlackMan(2*r,	-2*Math.sqrt(3)*r	));
			push(new BlackMan(4*r,	0					));
			
			for each(piece in this) {
				board.addChild(piece);
			}
			
			start();
		}
		
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
				applyFricition(piece);
				piece.x += piece.vX;
				piece.y += piece.vY;
			}
			
			CheckAndPerformWallCollision();
			CheckForCarromPieceCollision();
		}
		
		private function CheckAndPerformWallCollision():void {
			for each(var piece in this) {
				if (piece.x >= 370 - piece.radius) {
					piece.vX = - Math.abs(piece.vX);
					piece.x = 370 - piece.radius;
				} if (piece.x <= -370 + piece.radius) {
					piece.vX = Math.abs(piece.vX);
					piece.x = -370 + piece.radius;
				} if (piece.y <= -370 + piece.radius) {
					piece.vY = Math.abs(piece.vY);
					piece.y = -370 + piece.radius;
				} if (piece.y >= 370 - piece.radius) {
					piece.vY = - Math.abs(piece.vY);
					piece.y = 370 - piece.radius;
				}
			}
		}
			
		private function CheckForCarromPieceCollision():void {
			for (var i:int = 1; i < this.length; i++ ) {
				for (var j:int = 0; j < i; j++ ) {
					var dX:Number = this[i].x - this[j].x;
					var dY:Number = this[i].y - this[j].y;
					var minD:Number = this[i].radius + this[j].radius;
				
					if (dX * dX + dY * dY <= minD * minD) {
						PerformCarromPieceCollision(this[i], this[j]);
					}
				}
			}
		}
		
		private function applyFricition(piece:Piece):void {
			var vX:Number = piece.vX;
			var vY:Number = piece.vY;
			var v:Number = Math.sqrt(vX * vX + vY * vY);
			
			if (Math.abs(v) > piece.friction) {
				piece.vX -= piece.friction * (vX / v);
				piece.vY -= piece.friction * (vY / v);
			}else {
				piece.vX = 0;
				piece.vY = 0;
			}
			
			/*if (Math.abs(piece.vX) > piece.friction) {
				piece.vX -= piece.friction * piece.vX / Math.abs(piece.vX);
			} else {
				piece.vX = 0;
			}if (Math.abs(piece.vY) > piece.friction) {
				piece.vY -= piece.friction * piece.vY / Math.abs(piece.vY);
			} else {
				piece.vY = 0;
			}*/
		}
		
		private function PerformCarromPieceCollision(obj1, obj2):void {
			var m1:Number = obj1.mass;
			var m2:Number = obj2.mass;
			
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
			
			var vP1_New:Number = (m1 * vP1 - m2 * vP1 + 2 * m2 * vP2) / (m1 + m2);
			var vP2_New:Number = (m2 * vP2 - m1 * vP2 + 2 * m1 * vP1) / (m1 + m2);
			
			obj1.vX = (vP1_New * dX + vN1 * dY) / d;
			obj2.vX = (vP2_New * dX + vN2 * dY) / d;
			obj1.vY = (vP1_New * dY - vN1 * dX) / d;
			obj2.vY = (vP2_New * dY - vN2 * dX) / d;
			
			obj1.x += dX / (2 * d) * (obj1.radius + obj2.radius - d);
			obj2.x -= dX / (2 * d) * (obj1.radius + obj2.radius - d);
			obj1.y += dY / (2 * d) * (obj1.radius + obj2.radius - d);
			obj2.y -= dY / (2 * d) * (obj1.radius + obj2.radius - d);
		}
		
		public function Collider():void{
			
		}
	}
}