/*
Pratice Link: https://practice.geeksforgeeks.org/problems/rod-cutting0840/1

*/

#include <iostream>
#include<vector>
using namespace std;

#define INF INT_MIN/2
#define MAX_IDX 1003
#define MAX_N 1003
int mem[MAX_IDX][MAX_N];

int findAns(int idx,int n ,const vector<int>& arr)
{
    if(idx >= arr.size()) return 0;
    
    int val1 = INF; //inclusive : keep getting profit arr[idx] if its possible
    
    int val2 = INF; //exclusive: do not get profit arr[idx]
    
    int cut_length = idx+1;
    if(n-cut_length>=0)
        val1 = arr[idx] + findAns(idx,n-cut_length,arr); //rod-lenght is reduced
        
    val2 = findAns(idx+1,n,arr);
    
    printf("[%d,%d]: (%d,%d)\n",idx,n,val1,val2);
    return max(val1,val2);
}

int memt[MAX_N];
int findAnsTwo(int n,const vector<int>& arr)
{
    if(n<=0) return 0;
    int &mans = memt[n];
    if(mans != -1) return mans;

    int profit = INF;
    for(int k=1;k<=n;k++) //try to cut the rod in all possible way := cut the rod at 1, cut the rod at 2, ...
    {
        int tprofit = arr[k-1] + findAnsTwo(n-k,arr); /* question has 1 based index , so we do arr[k-1]*/
        profit = max(profit,tprofit);
    }

    return mans = profit;
}


class Solution{
  public:
    int cutRod(int price[], int n)
    {
        vector<int> arr;
        for(int i=0;i<n;i++)
        {
            arr.push_back(price[i]);
        }

        //return findAns(0,n,arr);

        memset(memt,-1,sizeof(memt));
        return findAnsTwo(n,arr);
    }
};


//{ Driver Code Starts.

int main() {
    int t;
    cin >> t;
    while (t--) {
        int n;
        cin >> n;
        int a[n];
        for (int i = 0; i < n; i++) 
            cin >> a[i];
            
        Solution ob;

        cout << ob.cutRod(a, n) << endl;
    }
    return 0;
}
// } Driver Code Ends