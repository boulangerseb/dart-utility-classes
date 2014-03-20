import 'package:stagexl/stagexl.dart';
import 'dart:math';

/*
This class is useful to work with Shape and Graphics classes from StageXL Library. 
It contains a bunch of methods to get coordinates of point on bezier path.
(http://stackoverflow.com/questions/17083580/i-want-to-do-animation-of-an-object-along-a-particular-path)
*/
class GraphicsTools {

  static Point getLineXYatPercent(Point startPt, Point endPt, double percent) {
    double dx = endPt.x-startPt.x;
    double dy = endPt.y-startPt.y;
    double X = startPt.x + dx*percent;
    double Y = startPt.y + dy*percent;
    return( new Point(X,Y) );
  }  
  
  // quadratic bezier: percent is 0-1
  static Point getQuadraticBezierXYatPercent(Point startPt, Point controlPt, Point endPt, double percent) {
      double x = pow(1-percent,2) * startPt.x + 2 * (1-percent) * percent * controlPt.x + pow(percent,2) * endPt.x; 
      double y = pow(1-percent,2) * startPt.y + 2 * (1-percent) * percent * controlPt.y + pow(percent,2) * endPt.y; 
      return( new Point(x,y) );
  }  

  // cubic bezier percent is 0-1
  static Point getCubicBezierXYatPercent(Point startPt, Point controlPt1, Point controlPt2, Point endPt, double percent){
    double x = CubicN(percent,startPt.x,controlPt1.x,controlPt2.x,endPt.x);
    double y = CubicN(percent,startPt.y,controlPt1.y,controlPt2.y,endPt.y);
    return( new Point(x,y) );
  }
  
  // cubic helper formula at percent distance
  static num CubicN(num pct, num a, num b, num c, num d) {
      var t2 = pct * pct;
      var t3 = t2 * pct;
      return a + (-a * 3 + pct * (3 * a - a * pct)) * pct
      + (3 * b + pct * (-6 * b + b * 3 * pct)) * pct
      + (c * 3 - c * 3 * pct) * t2
      + d * t3;
  }   
  
}