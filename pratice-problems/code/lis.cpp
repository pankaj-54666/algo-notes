//pratice link: https://leetcode.com/problems/longest-increasing-subsequence/

#define cc if(0)
#define MAX_IDX 2505
int mem[MAX_IDX][MAX_IDX];

class Solution {
    /* 
        lets try to create the sarr.
        let sarr[idx] == f(idx,_) :=  max lenght of lis when we are allowed to chose element from arr[0...idx].
        
        considerting we have answer for our subproblem.
        Then at index idx, we can fill up sarr[idx] in following ways:
        (a) pick arr[idx] if it satify the constrain
        (b) do not pick arr[idx]
    */
    int findAns(int idx,int last,vector<int> &sarr,const vector<int>&arr)
    {
        if(idx >= arr.size())
            return 0;
            
cc        printf("\t::[%d]: last(%d)\t",idx,last);
cc        for(auto k:sarr) cout<<k<<" ";
cc      cout<<endl;
              
        int inc = 0; //Explain: why inc=1 is not the defult value?
        int exc = 0;
        
        if(last < arr[idx])
        {
            sarr.push_back(arr[idx]);
            inc = 1 + findAns(idx+1,arr[idx],sarr,arr);
            sarr.pop_back();
        }
        
        exc = findAns(idx+1,last,sarr,arr);       
cc      printf("[%d]:(%d,%d)\n",idx,inc,exc);
        
        return max(inc,exc);           
    }
    
    int findAnsTwo(int idx,int lidx,vector<int> &sarr,const vector<int>&arr)
    {
        if(idx >= arr.size())
            return 0;
            
cc      printf("\t::[%d]: lidx(%d)\t",idx,lidx);
cc      for(auto k:sarr) cout<<k<<" ";
cc      cout<<endl;
        
        int &mans = mem[idx][lidx+1]; //important: notice the offset lidx+1(this is to avoid the array access at -1).  Even better you can use unordered_map with key!
        if(mans != -1) return mans;
              
        int inc = 0; //Explain: why inc=1 is not the defult value?
        int exc = 0;
        
        if(lidx == -1 || arr[lidx] < arr[idx]) //important: base condition is arr[lidx]<arr[idx], but we have to execute this case also when lidx is not valid. Hence we take idx == -1 || condition , so that if idx is not valid => first one will shortcircuit the condition & 2nd will not be checked (& still the total result in if passed)
        {
            sarr.push_back(arr[idx]);
            inc = 1 + findAnsTwo(idx+1,idx,sarr,arr);
            sarr.pop_back();
        }
        
        exc = findAnsTwo(idx+1,lidx,sarr,arr);       
cc      printf("[%d]:(%d,%d)\n",idx,inc,exc);
        
        return mans = max(inc,exc);           
    }
    
    
#define INF INT_MIN //for this question 0 is infinite (as the least value we can have is 1). Reason why we cannot put it as 0 here
    int findAnsThree(int idx,int lidx,vector<int> &sarr,const vector<int>&arr)
    {
        
        if(sarr.size()>=2 && !(sarr.end()[-2] < sarr.end()[-1])) return INF; 
        /*above: we placed last entry at end, which might be invalid => to check if sarr is valid or not we use above condition */
        
        if(idx >= arr.size())
            return 0;

        
        int &mans = mem[idx][lidx+1];
        if(mans != -1) return mans;
              
        int inc = 0; 
        int exc = 0;
        
        sarr.push_back(arr[idx]);
        inc = 1 + findAnsThree(idx+1,idx,sarr,arr);  //Error-Prone: f(idx) can return INT_MIN. In that case inc also becomes INT_MIN instead of INT_MIN+1 which we are doing here.
        /* This become more obivious if we were returnign INT_MAX in invalid case. In that case. you have following option:
        (a) Change the function defination as t=f(idx+1); inc = (t ==INF)?INF:1+t
        (b) change int inc to long int inc. <= this way overflow can be avoided
        */
        sarr.pop_back();
        
        exc = findAnsThree(idx+1,lidx,sarr,arr);       

        return mans = max(inc,exc);           
    }

    int memf [MAX_IDX];
    int findAnsFour(int idx,vector<int>&arr)
    {
        if(idx>=arr.size()) return 0;
        int &mans = memf[idx];
        if(mans != -1)
            return mans;
        
        int mxlen = 1;
        for(int j=0;j<idx;j++)
        {
            findAnsFour(j,arr); //if we skip this line, then some of the subproblems might not be called, which will result in wrong answer (ex: [1,3,6,7,9,4,10,5,6])
            if(arr[j] < arr[idx])
            {
                int tlen = 1 + findAnsFour(j,arr);
                mxlen = max(mxlen,tlen);
            }
        }     
  cc      printf("[%d] %d\n",idx,mxlen);
        return mans = mxlen;
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
        // return LISViaDP(vec1);
        // return LICPatienceSorting(vec1);
        
        vector<int> carr;
        // return lis(-1,0,vec1);
        
        // return findAns(0,INT_MIN,carr,vec1); //pass last as something which previously smallest than all vec1[i]
        
        memset(mem,-1,sizeof(mem));
        // return findAnsTwo(0,-1,carr,vec1);
        
        // return findAnsThree(0,-1,carr,vec1);

        for(int i=0;i<vec1.size();i++)
            memf[i] = -1;
        
        findAnsFour(vec1.size()-1,vec1);
        for(int i =0;i<vec1.size();i++)
            cout<<memf[i]<<" ";
        cout<<endl;
        
        return *max_element(memf,memf+vec1.size());
    }
};