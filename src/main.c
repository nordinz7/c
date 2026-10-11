#include <stdio.h>
#include "add-math.h"


int main(void){
	int a = 10;
	int b = 5;
	printf("%d\n%d\n%d\n%d\n", add(a,b), subtract(a,b), multiply(a,b), divide(a,b));
	return 0;
}
