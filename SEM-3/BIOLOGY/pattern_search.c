#include <stdio.h>
#include <stdbool.h>
#include <string.h>

bool pattern_search(const char *str, const char *pattern) {
    int n = strlen(str);
    int m = strlen(pattern);

    int i = 0;
    int j = m - 1;

    while (j < n) {
        int k = 0;
        while (k < m && str[i + k] == pattern[k]) {
            k++;
        }
        if (k == m) {
            return true;
        } else {
            i++;
            j++;
        }
    }

    return false;
}

int main() {
    if (pattern_search("mithindev", "dev")) {
        printf("Pattern found.\n");
    } else {
        printf("Pattern not found.\n");
    }

    return 0;
}
