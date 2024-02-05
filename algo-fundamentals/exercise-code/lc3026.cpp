typedef long long int lli;
#define INF LLONG_MIN
#define cc if(0)

#define cc if(0)

class Solution {
public:
    long long maximumSubarraySum(vector<int>& arr, int k) 
    {
        
        lli csum = 0;
        
        unordered_map<int,lli> mMap;
        
        lli msum = INF;
        
        for(int i=0;i<arr.size();i++)
        {
            int x = arr[i];
            
            csum += x;
            
            int y1 = x - k; /* abs(y-x) = k */
            int y2 = x + k;
            
            lli sum1 = INF;
            lli sum2  = INF;
            
      cc      printf("%d:(%d,%d)\n",x,y1,y2);
            if(mMap.find(y1) != mMap.end())
            {
                sum1 = csum - mMap[y1];
            }
            
            if(mMap.find(y2) != mMap.end())
            {
                sum2 = csum - mMap[y2];
            }
            
      cc      printf("sum1 = %d,sum2 =%d\n",sum1,sum2);
            msum = max(msum,max(sum1,sum2));
            
            if(mMap.find(x) != mMap.end())
                mMap[x] = min(mMap[x],csum-x);
            else
                mMap[x] = csum - x;
        
                
        }
        
        return msum == INF ? 0 : msum;
       
        
    }
};
