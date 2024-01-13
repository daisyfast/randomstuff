#include <iostream>
#include <vector>
using namespace std;

int main() {
    int num = 10;
    vector<vector<int>> ans;
    for (int i = 1; i <= num; i++) {
        vector<int> temp(i);
        if (i == 1) {
            temp[0] = 1;
            ans.push_back(temp);
        }
        else if (i == 2) {
            temp[0] = 1;
            temp[1] = 1;
            ans.push_back(temp);
        }
        else if (i % 2 == 0) {
            // i is 4

            //0000
            temp[0] = 1;
            temp[i - 1] = 1;
            temp[i / 2] = ans[i - 2][i / 2] + ans[i - 2][i / 2 -1];
            temp[i / 2 - 1] = temp[i / 2];
            for (int j = 1; j < i / 2 - 1; j ++) {
                temp[j] = ans[i-2][j] + ans[i-2][j-1];
                temp[i - j - 1] = temp[j];
            }
            ans.push_back(temp);
        }
        else if (i % 2 != 0) {
            // i is 3
            temp[0] = 1;
            temp[i - 1] = 1;
            temp[i / 2] = ans[i-2][(i-1) / 2] * 2;
            for (int j = 1; j < i / 2; j++) {
                temp[j] = ans[i-2][j] + ans[i-2][j-1];
                temp[i - j - 1] = temp[j];
            }
            ans.push_back(temp);
        }
    }

    for (int n = 0; n < num; n ++) {
        for (int k = 0; k <= n; k++) {
            cout << ans[n][k] << ",";
        }
        cout << endl;
    }

}
