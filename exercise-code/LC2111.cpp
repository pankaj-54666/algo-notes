//Pratice Link: https://leetcode.com/problems/minimum-operations-to-make-the-array-k-increasing/

class Solution {
    int LISviaPatienceSorting(vector<int>&arr)
    {
        
        vector<int> stackList;
        for(int i=0;i<arr.size();i++)
        {
            auto it = upper_bound(stackList.begin(),stackList.end(),arr[i]);
            if(it == stackList.end())
            {
                stackList.push_back(arr[i]);
            }
            else
            {
                int idx = it-stackList.begin();
                
                stackList[idx] = arr[i];
            }
        }
//        cout<<"sList.size() = "<<stackList.size()<<endl;
        return arr.size() - stackList.size();
    }
public:
    int kIncreasing(vector<int>& arr, int k) {
        int count = 0;
        
        for(int i=0;i<k;i++)
        {
            vector<int> tArr;
            for(int j=i;j<arr.size();j=j+k)
            {
                tArr.push_back(arr[j]);
            }
            
            int tans = LISviaPatienceSorting(tArr);
            count += tans;
        }
        
        return count;
    }
};