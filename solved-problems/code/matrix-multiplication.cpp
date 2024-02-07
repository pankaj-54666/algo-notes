//Pratice Link: https://practice.geeksforgeeks.org/problems/matrix-chain-multiplication0303/1

// User function Template for C++

#include<iostream>
#include<vector>
using namespace std;
#define cc if(0)

#define INF 100000;
const int MAX_ARR_SIZE = 100+ 10;
int mem[MAX_ARR_SIZE][MAX_ARR_SIZE];

int findAnsTwo(int idx,const vector<int>&arr)
{
    if(idx >= arr.size()) return 0 ;//not matrix =, hence no cost to multiply

    /*we know multiplicagion cosst for matric arr[0..idx-1]
    When we include current matrix arr[idx]. On what factors sarr[idx] will depedent?
    
    one obivious way is to try all split again.
    
    for k = 1 to idx-1
    {
        lcost = arr[k-1];
        rcost = f(id)
    }
    */ 
    for(int i=0;i<idx;i++)
    {

    }
}

int matrixChainMultiplicatino(int l, int r, const vector<int>&arr)
{
    if(l>=r)
        return 0; //no element exist in arrr
    
    if(mem[l][r] != -1)
        return mem[l][r];
    int bCost = INT_MAX; //best cost
    //Try out all possible place
    for(int k=l;k<r;k++)
    {
        int leftCost =  matrixChainMultiplicatino(l,k,arr);
        int rightCost = matrixChainMultiplicatino(k+1,r,arr);

cc printf("(%d,%d):: LeftCost = %d, RightCost = %d\n",l,r,leftCost,rightCost);

        int splittingCost = (arr[l-1] * arr[k] * arr[r]) + leftCost + rightCost;

        bCost = min(bCost,splittingCost);
    }
  //  printf("Best Cost to Multiply %d = %d\n",l,bCost);
    int rVal =  bCost;
    mem[l][r] = rVal;
    return rVal;
}

void printVector(const vector<vector<int>>& vec);
int matrixChainMultiplicationDP(const vector<int>& arr)
{
    int NRow = arr.size();
    int NCol = arr.size();

#if 0
    printf("input is(size = %d)\n",arr.size());
    for(int i=0;i<arr.size();i++)
        printf("%d ",arr[i]);
    printf("\n");
#endif
    vector<vector<int>> dp(NRow,vector<int>(NCol,INT_MAX));
    for(int i=0;i<NRow;i++)
        dp[i][i] = 0; //Base Case: Single matrix multiplication cost is ZERO
    dp[0][0] = 0;

    for(int l=2;l<=NRow-1;l++)
    {
        for(int i=1;i<NRow-l+1;i++) //OBSERVE: same as reusion , we are starting 'l' from 1 [ as else l-1 would not be valid]
        {
            int j = i+l-1;

     cc       printf("(%d,%d) :: ",i,j);
            for(int k=i;k<j;k++)
            {
     cc           printf("-> %d",k);
                int leftCost = dp[i][k];
                int rightCost = dp[k+1][j];

                int multiplicatinoCostAtK = leftCost + rightCost
                                            + arr[i-1] * arr[k] *arr[j];
      cc          printf("L(%d), R(%d), C(%d)\n",leftCost,rightCost,multiplicatinoCostAtK);
                dp[i][j] = min(dp[i][j],multiplicatinoCostAtK);
            }
      cc      printf("\n");
        }
    cc    printf("\n");
    }
//  cc  cout<<"PrintDP Vector\n";
// cc   printVector(dp);

    int ans = dp[1][NCol-1]; //OBSERVE: our anser exist at l==1, r = NCol-1 EVEN though we have not NRow++,NCol++
    return ans;

}

class Solution{
public:
    int matrixMultiplication(int N, int arr[])
    {
        int size = N;
        memset(mem,-1,sizeof(int)*MAX_ARR_SIZE*MAX_ARR_SIZE);
      //  return matrixChainMultiplicatino(1,N-1,vector<int>(arr,arr+N)); //OBSERVE the  (1,vec.size()-1
        return matrixChainMultiplicationDP(vector<int>(arr,arr+N));
    }
};