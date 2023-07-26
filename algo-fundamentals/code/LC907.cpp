#define tidx st.end()[-1]
#define cc if(0)

#define MOD 1000000007
typedef long long int lli;

//or st.back()
class Solution {
    #define tidx st.end()[-1]
    #define cc if(0)
     int solve2(vector<int> &arr)
    {
        vector<int> st;
        lli sum = 0;
        
        /* monotonic increasing stack: /\ */
        //push for first half, pop for 2nd half of diagram
        //popped element will be minium amoung range
        for(int i=0;i<=arr.size();i++)
        {
            while(!st.empty() && (i==arr.size() || arr[tidx] >= arr[i]))
            {
                int e = tidx;
                int l = (st.size()>=2) ? st.end()[-2]:-1;
                int r = i;
                
                lli scount = (e-l)*(r-e)%MOD;
                
                sum += scount*arr[e];
                sum %= MOD;
                
                st.pop_back();
            }
            st.push_back(i);
        }  
        return sum;
    }
    
    int solve(vector<int> &arr)
    {
        
        vector<int> st;
        
        lli sum = 0;
        
        for(int i=0;i<arr.size();i++)
        {
            
            /*    /\   : monotonic increasing stack (this question)
                 /  \
                 
                 \  /  :monotonic decreasing stack
                  \/
            */
            while(!st.empty() && arr[tidx] >= arr[i])
            {
                int e = tidx;
                int l = (st.size()>=2) ? st.end()[-2] : -1;
                int r = i;
                
                lli subarrayCount = (e-l)*(r-e) % MOD ;
                // int subarrayCount = ();
                sum += (subarrayCount*arr[e]);
                sum %= MOD;
                
           cc     printf("[%d,%d,%d][%d,%d,%d]:%d\n",l,e,r,l==-1?-1:arr[l],arr[e],arr[r],subarrayCount);
                
                st.pop_back();
                
            }
            
            st.push_back(i);
        }
  #if 0      
        printf("st after all operation(%d)\n",st.size());
        for(auto k:st) cout<<k<<" ";
        cout<<endl;
    #endif
        
        while(!st.empty())
        {
            int e = tidx;
            int l = (st.size()>=2) ? st.end()[-2] : -1;
            int r = arr.size();

            lli subarrayCount = (e-l)*(r-e)%MOD;
             // int subarrayCount = (r-l+1);
            sum += (subarrayCount*arr[e]);
            sum %= MOD;
              // printf("[%d,%d,%d][%d,%d,%d]:%d\n",l,e,r,l==-1?-1:arr[l],arr[e],arr[r],subarrayCount);

            // printf("[%d,%d,%d][%d,%d,%d]:%d\n",l,e,r,arr[l],arr[e],arr[r],subarrayCount);

            st.pop_back();
        }
        
        
        return sum;
    }
    
public:
    int sumSubarrayMins(vector<int>& arr)
    {
        // return solve(arr);
        return solve2(arr);
    }
};