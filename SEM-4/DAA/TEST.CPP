#include <iostream>
#include <climits>

class Rod {
private:
    int length;

public:
    Rod(int len) : length(len) {}

    int getLength() const {
        return length;
    }

    int cut(int cutLength) const {
        return length - cutLength;
    }
};

int maxProfit(const Rod &rod, int prices[], int n) {
    if (n == 0) return 0;

    int maxProfitValue = INT_MIN;

    for (int i = 1; i <= n; i++) {
        int currentProfit = prices[i - 1] + maxProfit(rod, prices, rod.cut(i));
        maxProfitValue = std::max(maxProfitValue, currentProfit);
    }

    return maxProfitValue;
}

int main() {
    int prices[] = {1, 5, 8, 9, 10, 17, 17, 20};
    int rodLength = sizeof(prices) / sizeof(prices[0]);

    Rod rod(rodLength);

    int maximumValue = maxProfit(rod, prices, rod.getLength());

    std::cout << "Maximum Obtainable Value is " << maximumValue << std::endl;

    return 0;
}

