//pratice link: https://leetcode.com/problems/trapping-rain-water/

#define tidx st.back()
//TWO Pointer Approach_TWO
int findWaterArea(vector<int> vec1){
    int sum =0;
    //size must be greator than 2
    int size = vec1.size();
    if(vec1.size() <=2) return 0;
    
    int l=1,r =size-2;
    
    int left_max =0;
    int right_max = size-1;
    
    while(l<=r){
       
        if(vec1[l] >= vec1[left_max] ) left_max = l;
        if(vec1[r] >= vec1[right_max] ) right_max = r;
        
        if(vec1[left_max] < vec1[right_max] ){
            sum = sum + max(0,vec1[left_max] - vec1[l]);
            l++;
        }
        else{
            sum = sum + max(0,vec1[right_max] - vec1[r]);
                            r--;
        }
        
        
    }

    return sum;
}

    int trapStack(vector<int>& arr) 
    {
        vector<int> st;
       
        int sum = 0;
        for(int i=0;i<arr.size();i++)
        {
            while(!st.empty() && arr[tidx]<arr[i])
            {
                int eidx = tidx; //popped element
                st.pop_back();
                
                if(st.empty() == true)
                    continue;
                
                /* for popped stack element*/
                int pgei = tidx; //previous greator element
                int ngei = i; //next greator element
 
                int water = min(arr[pgei],arr[ngei]) - arr[eidx];
                water = water*(ngei-pgei-1);
                             
                sum += water;
                
    //            printf("%d,%d,%d: %d\n",arr[pgei],arr[eidx],arr[ngei],water);
            }
            
            st.push_back(i);
        }
        
        return sum;
    }

//time: O(n)
//space: O(1) 
//BETTER
int twoPointerLogical(vector<int> height)
{
    int size = height.size();
    int left = 0,right = size-1;
    int leftMax = 0,rightMax = 0;
    
    int totalWater = 0;
    
    while(left < right)
    {
        if(leftMax < height[left] ) leftMax = height[left];
        if(height[right] > rightMax) rightMax = height[right];
        
        if(leftMax < rightMax)
        {
            totalWater += max(0,leftMax - height[left]);
            left++;
        }
        else
        {
            totalWater += max(0,rightMax - height[right]);
            right--;
        }
    }
    
    return totalWater; 
}
    
    
    
class Solution {
public:
    int trap(vector<int>& vec1) {
        if(vec1.size() <= 1) return 0;
        
        //int ans1 = findWaterArea(vec1);
        int ans1 = twoPointerLogical(vec1);
        
        return ans1;
        
        
    }
};