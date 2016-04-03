#include <stdio.h>

int fac_tailrec(int acc, int n) {
	if (n < 2) return acc;
	return fac_tailrec(n * acc, n - 1);
}

int fac(int n) {
	return fac_tailrec(1, n);
}

int main() {
	int res = fac(5);
	printf("%d\n",res);
	return 0;
}
