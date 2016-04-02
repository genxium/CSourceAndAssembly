#include <stdio.h>

void boo(int p) {
	int q = p + 2;
	printf("%d\n", q);
}

void foo(int a, int b) {
	int x = (3 * a + b); 
	boo(x);
}

int main() {
	int u = 5;
	int v = 13;
	foo(u, v);	
}
