#define cc if(0)
class Solution {
    
    int findAns(vector<int>&arr,int target)
    {
        int size = arr.size();
        
        int sum1 = 0;
        
        int ans = INT_MAX;
        for(int i=0;i<size;i++)
        {
            sum1 += arr[i];
            
            int sum2 = 0;
            for(int j=0;j<=i;j++)
            {
               
                
                int range_sum = sum1-sum2;
          //      printf("sum(%d,%d)=%d\n",j,i,range_sum);
                
                if(range_sum >= target)
                    ans = min(ans,i-j+1);
                
                 sum2 += arr[j];
            }
        }
        
        return ans == INT_MAX?0:ans;
    }
    
    int findAnsTwo(vector<int>&arr,int target)
    {
        int size = arr.size();
        
        int ans = INT_MAX;
        for(int i=0;i<size;i++)
        {
            int sum = 0;
            for(int j=i;j<size;j++)
            {
                sum += arr[j];
                
         //       printf("[%d,%d] = %d\n",i,j,sum);
                if(sum>=target)
                {
                    ans = min(ans,j-i+1);
                }
            }
        }
        return ans == INT_MAX?0:ans;
    }

    
    int findAnsThree(vector<int>& arr,int target)
    {
        int size = arr.size();
        vector<int> csum(size,0);
        csum[0] = arr[0];
        
        for(int i=1;i<size;i++)
            csum[i] = csum[i-1] + arr[i];
      #if 0  
        cout<<"compulative array\n";
        for(auto k:csum) cout<<k<<" ";
        cout<<endl;
    #endif
        int ans = INT_MAX;
        for(int i=0;i<size;i++)
        {
            int sum1 = csum[i];
            int sum2 = sum1+target-arr[i];
            
            
            int j = lower_bound(csum.begin(),csum.end(),sum2) - csum.begin();
    cc        printf("range_sum(%d,%d) = %d\n",i,j,sum2);
            if(j<=size-1)
            {
                //this mark the presence of one valid range
                
                // printf("range_sum(%d,%d) = %d\n",i,j,sum2);
                ans = min(ans,j-i+1);
            }
        }
        
        return ans==INT_MAX?0:ans;
    }
    
    int findAnsFour(vector<int>&arr,int target)
    {
        int size = arr.size();
        int l=0,r=0;
        
        int sum = 0;
        int ans = INT_MAX;
        
        for(;r<size;)
        {
            sum += arr[r];
            
            while(l<=r && sum >= target) //shrink
            {
                ans = min(ans,r-l+1);
    cc            printf("range_sum(%d,%d)=%d [%d]\n",l,r,sum,ans);
                
                sum -= arr[l];
                l++;
            }
 
            r++; //grow
        }
        
        return  ans==INT_MAX?0:ans;
    }
public:
    int minSubArrayLen(int target, vector<int>& arr) 
    {
        // return findAns(arr,target);
        
        // return findAnsTwo(arr,target);
        
        // return findAnsThree(arr,target);
        return findAnsFour(arr,target);
        
    }
};