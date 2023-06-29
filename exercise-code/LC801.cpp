//Problem Pratice Link: https://leetcode.com/problems/minimum-swaps-to-make-sequences-increasing/

#define INF INT_MAX/2

void mswap(int &a,int &b)
{
    int t = a;
    a = b;
    b = t;
}

#define MAX_IDX 100005

int mem[MAX_IDX][2];
/*
 we can think of problem as normal knapsack problem.
let f(idx,_) := minimum number of swap required to make both array strictly increasing when we are allowed to use A[0..idx] and B[0..idx] array only.

Now, at idx we have the following choice:
(a) swap the array
(b) Do not swap the array

For memoization, if we do not use swapped variable, then we would have to use prevA and prevB in memoization. (where prevA=A[idx-1] and prevB = B[idx-1])

To simplify the code, we swapped the original array itself && encoded this swapping operation in an independent variable swapped.
This way for memoization we can use this swapped variable itself instead of using preA and preB, which greatly simplify the code.
*/

class Solution {
    int findAns(int idx, bool swapped,vector<int>& A, vector<int>&B)
    {
        if(idx>1  && A[idx-2] >= A[idx-1]) return INF;
        if(idx>1 && B[idx-2] >= B[idx-1]) return INF;
        
        if(idx>= A.size()) return 0;
        
        
     //   printf("\t::[%d]: ",idx);
      //  for(auto k:sarr) cout<<k<<" ";
      //  cout<<endl;
        
        int &mans = mem[idx][swapped];
        if(mans != -1) return mans;
        //number of ways to fill sarr[idx]
        
        int val1 = 0; //no not swap
        int val2 = 0; //swap it
        
        val1 = findAns(idx+1,0,A,B);
        
        mswap(A[idx],B[idx]);
        val2 = 1+ findAns(idx+1,1,A,B);
        mswap(A[idx],B[idx]);
        
        
        
    //    printf("[%d]: (%d,%d)\n",idx,val1,val2);
        return mans = min(val1,val2);
    }
    
public:
    int minSwap(vector<int>& A, vector<int>& B) {
        
        memset(mem,-1,sizeof(mem));
        return findAns(0,0,A,B);
    }
};
