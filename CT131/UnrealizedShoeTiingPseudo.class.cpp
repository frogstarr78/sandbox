Scott Noel-Hemming
Fri 03/31/2006
Shoe Tiing Excersize;

Function wrapString(obj string)

endFunction 

Function createLoop(obj string)

endFunction

Assuming String Objects are equal fixed length.
Assuming coordinate where-in the strings are contained.
Coordinate is made up of 3 Axis object which mimic a 3 dimensional
cartesian plan.

        |+z    /+y
        |     /
        |    /
        |   /
        |  /
        | /
        |/
--------/-------
-x     /|     +x
      / |
     /  |
    /   |
   /    |
  /     |
 /      |
/-y     |-z

const POSITIVE;
const NEGATIVE;
String::Bend(point jointPoint, point bendIntersection){
	String::setJoint(jointPoint)
	String::Bend::BendTo(bendIntersection)
	String::Bend::doBend()
}

String LeftString;
LeftString.StartOn(new Point(-2, 0, 0))
LeftString.AlignWith(Axis z)

String RightString;
RightString.StartOn(new Point(2, 0, 0))
RightString.AlignWith(Axis z)


LeftString.Bend(new Point(-2, 0, 2), new Point(-1, 1, 3))
LeftString.Bend(new Point(-1, 1, 3), new Point(0, 1, 3))
LeftString.Bend(new Point(1, 1, 3), new Point(2, 1, 3))

RightString.Bend(new Point(2, 0, 2), new Point(1, -1, 3))
RightString.Bend(new Point(1, -1, 3), new Point(0, -1, 3))
RightString.Bend(new Point(0, -1, 3), new Point(-1, -1, 3))


