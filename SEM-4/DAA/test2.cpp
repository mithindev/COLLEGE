#include <iostream>
#include <climits>

using namespace std;

class Rod {
private:
    int n;
public:
    Rod(int length) : n(length) {}
    int size_rod() const { return n; }
};

int max(int a, int b) { return (a > b) ? a : b; }

int cutRod(const int price[], const Rod& rod)
{
    int n = rod.size_rod();
    int val[n + 1];
    val[0] = 0;
    int i, j;

    for (i = 1; i <= n; i++)
    {
        int max_val = INT_MIN;
        for (j = 0; j < i; j++)
            max_val = max(max_val, price[j] + val[i - j - 1]);
        val[i] = max_val;
    }

    return val[n];
}

int main()
{
    int arr[] = {1, 5, 8, 9, 10, 17, 17, 20};
    int size = sizeof(arr) / sizeof(arr[0]);
    Rod rod(size);
    cout << "Maximum Obtainable Value is " << cutRod(arr, rod);
    getchar();
    return 0;
}