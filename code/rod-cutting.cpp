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

/*
Rod-Cutting:  n, cost[]

let f(idx,_) :: optimal cost to cut the rod, when we are allowed to pick cost[0...idx]

now, at idx: we have following option
(a) take the profit. f(idx,_) = arr[idx] + f(idx,_) //pass idx to function as cost[idx] is avaialble to be taken infinite time! (same as unbounded knapsack)
(b) do not take the profit.
*/
int findAns(int idx,int n ,const vector<int>& arr)
{
    if(idx >= arr.size()) return 0;
    
    int val1 = INF; //inclusive : keep getting profit arr[idx] if its possible
    
    int val2 = INF; //exclusive: do not get profit arr[idx]
    
    int cut_length = idx+1;
    if(n-cut_length>=0)
        val1 = arr[idx] + findAns(idx,n-cut_length,arr); //rod-lenght is reduced, + similary to unbounded knapsac we can make profit cost[idx] again.
        
    val2 = findAns(idx+1,n,arr);
    
    printf("[%d,%d]: (%d,%d)\n",idx,n,val1,val2);
    return max(val1,val2);
}

int memt[MAX_N];
/*
    f(n,_) :: total ways to cut rod of lenght n.
    hence at n, we have the following option: 
    cut the rod with lenght (1,n-1), (2,n-2), (3,n-3) ... (n,0); we will take the best of all.
*/
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

/*
    first solution consider the primary constrain as cost[] & hence define recurrance relation in term of cost.
    for the second solution we consider the primary constrain as rod-lenght, hence we define the recurrance relation in term of rod-lenght.

    in both case _ represent the secondary constrain. & firt parameter represent the primary constrain.
    f(idx,_) :: cost[] is primary constrain, rest all is secondary constrain
    f(n,_) :: n is primary constrain
*/

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