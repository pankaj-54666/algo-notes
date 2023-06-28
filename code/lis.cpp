//pratice link: https://leetcode.com/problems/longest-increasing-subsequence/

class Solution {
    /* 
        lets try to create the sarr.
        let sarr[idx] == f(idx,_) :=  max lenght of lis when we are allowed to chose element from arr[0...idx].
        
        considerting we have answer for our subproblem.
        Then at index idx, we can fill up sarr[idx] in following ways:
        (a) pick arr[idx] if it satify the constrain
        (b) do not pick arr[idx]
    */
    /* working code from other person*/
    int lis(int prev,int curr,vector<int>& arr){
        if(curr==arr.size()){
            return 0;
        }
        int first=0;
        if( prev != -1 && arr[prev]<arr[curr]){
            first=1+lis(curr,curr+1,arr);
        }
        int sec=lis(prev,curr+1,arr);
        return max(first,sec);
    }
    /* my code: reason why its not working */
    int findAns(int idx,int last,vector<int> &sarr,const vector<int>&arr)
    {
        if(idx >= arr.size()) return 0;
        
        // cout<<"\t::"<<idx<<" : ";
        // for(auto k:sarr) cout<<k<<" ";
        // cout<<endl;
        
        
        int inc = 1;
        int exc = 0;
        
        if(last < arr[idx])
        {
            sarr.push_back(arr[idx]);
            inc = 1 + findAns(idx+1,arr[idx],sarr,arr);
            sarr.pop_back();
        }
        
        exc = findAns(idx+1,last,sarr,arr);
        
        printf("[%d]: last(%d) (%d,%d)\t:",idx,last,inc,exc);
        for(auto k:sarr) cout<<k<<" ";
        cout<<endl;
       
        return max(inc,exc);
            
    }
public:
    int LISViaDP(vector<int>& arr)
    {
        int size = arr.size();
        
        vector<int> dp(size,1); //dp[idx] := lenght of longest lis which is ending at idx.
        
        for(int i=1;i<size;i++)
        {
            for(int j=0;j<i;j++)
            {
                if(arr[i] > arr[j])
                    dp[i] = max(dp[i] , dp[j] + 1);
            }
        }
        
        int mx = 0;
        for(int i=0;i<dp.size();i++)
            mx = max(mx,dp[i]); 
        
        return mx;
    }
    
    int LICPatienceSorting(vector<int> &vec1)
    {
        vector<int> vec2;
        int size = vec1.size();
        
        for(int i=0;i<size;i++)
        {
            int val = vec1[i];
            
            auto it = lower_bound(vec2.begin(),vec2.end(),val);
            if(it == vec2.end())
            {
                vec2.push_back(val);
            }
            else
            {
                int idx = it - vec2.begin();
            
                vec2[idx] = val;
            }
        }//for loop ends here
        
        return vec2.size();
    }
    
    
    int lengthOfLIS(vector<int>& vec1)
    {
        return LISViaDP(vec1);
        // return LICPatienceSorting(vec1);
        
        vector<int> carr;
        // return lis(-1,0,vec1);
        
        // return findAns(0,-1,carr,vec1); //pass last as something which previously smallest than all vec1[i]
    }
};