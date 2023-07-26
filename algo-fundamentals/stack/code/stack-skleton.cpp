#include<iostream>
#include<vector>

using namespace std;

    
#define tidx st.end()[-1]
vector<int> findGreatorStack(vector<int> arr)
{
    int size = arr.size();
    vector<int> ans(size,-1);
    
    vector<int> st;  
    for(int i=0;i<size;i++)
    {
        /*step(a):prepare stack for the insertion of arr[i]
            for a monotonic decreasing stack, delete all element from stack which are less than arr[i]
        */
        
        while(!st.empty() && arr[tidx]<arr[i])
        {
            int l = (st.size()>=2) ? st.end()[-2] : -1;
            ans[tidx] = arr[i];
            st.pop_back();
        }
        
        //step(b): insert
        st.push_back(i);
    }
    
    return ans;
    
}

    int main()
    {


        return 0;
    }