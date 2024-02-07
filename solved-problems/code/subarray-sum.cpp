#define MAX_IDX 100005
#define INVALID INT_MIN

int mem[MAX_IDX];

#define INF INT_MIN/2
#define cc if(0)
class Solution {
    
/* this is divide & conquere*/
int findAnsFour(vector<int>& A, int L, int R){
        if(L > R) return INT_MIN;
        int mid = (L + R) / 2, leftSum = 0, rightSum = 0;
        // leftSum = max subarray sum in [L, mid-1] and starting from mid-1
        for(int i = mid-1, curSum = 0; i >= L; i--)
            curSum += A[i],
            leftSum=max(leftSum, curSum);
        // rightSum = max subarray sum in [mid+1, R] and starting from mid+1
        for(int i = mid+1, curSum = 0; i <= R; i++)
            curSum += A[i],
            rightSum = max(rightSum, curSum);        
		// return max of 3 cases 
        return max({ findAnsFour(A, L, mid-1), findAnsFour(A, mid+1, R), leftSum + A[mid] + rightSum });
    }	
    
    /* we will calculate dp[idx], where
    dp[idx]:= maximum subarray that starts at idx & MUST include idx.
    i.e idx is the starting point of the sequence*/
    int findAnsTwo(int idx,vector<int>& arr)
    {
        if(idx >= arr.size()) return 0; //no array => 0 sum
        
        if(mem[idx] != INVALID)
            return mem[idx];
        
        /* both start at arr[idx]*/
        int val1; // use dp[idx+1] to extend the subarray on left side
        int val2; //do not use dp[idx+1] to extend the subarray
        
        val1 = arr[idx] + findAnsTwo(idx+1,arr);
        val2 = arr[idx];
        
        return mem[idx] = max(val1,val2);
    }
    
    /* we will calculate dp[idx], which is .
    dp[idx] := maximum subarray lenght that ends at idx & MUST include idx*/
    int findAns(int idx,vector<int>& arr)
    {
        if(idx<0) return 0;
        
        if(mem[idx] != INVALID)
            return mem[idx];
        
        int val1 = arr[idx] + findAns(idx-1,arr); //extends the ongoing sub-array & end at idx [start,end] = [...,idx] //extend the subarray at right
        int val2 = arr[idx]; //start the new sub-arrary from this position [start,end] = [idx,ex]
        
      cc  printf("[%d]: (%d,%d)\n",idx,val1,val2);
        
        return mem[idx] = max({val1,val2});
        
    }
    
    int findAnsThree(int idx,bool taken,vector<int>&arr)
    {
        if(idx>=arr.size()) return INF;
        
        int inc=0; //take arr[idx] (if constrain allow)
        int exc=0; //do not take arr[idx]
        
        if(taken)
        {
            inc = arr[idx] + findAnsThree(idx+1,1,arr);
        }
        
        exc = findAnsThree(idx+1,0,arr);
        
        printf("[%d]:(%d,%d)\n",idx,inc,exc);
        
        return max({inc,exc,arr[idx]});
    }

    int maxSubArrayNonRecursive(vector<int>& arr) 
     {
        
        int size = arr.size();
        vector<int> dp(arr);
        
        for(int idx=1;idx<size;idx++)
        {
            dp[idx] = max(arr[idx]+dp[idx-1], arr[idx]);
        }
        
        cout<<"DP array is\n";
        for(auto k:dp)
            cout<<k<<" ";
        cout<<endl;
        
        return *max_element(dp.begin(),dp.end());

    }
public:
    int maxSubArray(vector<int>& arr) 
    {
        for(int i=0;i<arr.size();i++)
            mem[i] = INVALID;
            
         // findAns(arr.size()-1,arr);
        findAnsTwo(0,arr);
        return *max_element(mem,mem+arr.size());
        
         // return maxSubArray(nums, 0, size(nums)-1);

    }
};