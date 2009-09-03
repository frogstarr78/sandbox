
/****************************
*
*	Scott Noel-Hemming
*	CT131
*	Thursday 2006-05-04 00:39:54
*	Project	#*	IP Converter	(P.?)
*
****************************/


#include <iostream>
#include <StandardFunctions.h>
#include <string>
using namespace std;

class ipConverter {
public:
	void convertSimpleOut() {
		string result = ""
		for bit in self.ip.split("."):
			byt = []
			for n in range(0, 8):
				byt.insert(0, str(int(bit)%2))
				bit = int(bit)/2
			result += "".join(byt) + " "
		print result.strip()
	}
private: 

}

int main()
{
	int classA[8], classB[8], classC[8], classD[8];
	int ip[32];

	

}
