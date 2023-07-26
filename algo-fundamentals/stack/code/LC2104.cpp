#define tidx st.end()[-1]

typedef long long int lli;
class Solution {
    
    lli solve(vector<int> &arr)
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
                
                lli scount = (e-l)*(r-e);
                
                sum += scount*arr[e];
                st.pop_back();
            }
            st.push_back(i);
        }
    
        return sum;
    }
    
    lli solve2(vector<int> &arr)
    {
        vector<int> st;
        
        lli sum = 0;
        for(int i=0;i<=arr.size();i++)
        {
            //monotonic decreasing stack \/
            //popped element be maximum amoung range (as seen from diagram also)
            while(!st.empty() && (i==arr.size() || arr[tidx] <= arr[i]))
            {
                int e = tidx;
                int l = (st.size()>=2) ? st.end()[-2]:-1;
                int r = i;
                
               lli scount = (e-l)*(r-e);
                
                sum += scount*arr[e];
                st.pop_back();
            }
            st.push_back(i);
        }
        
        return sum;
    }
    
    
public:
    long long subArrayRanges(vector<int>& arr)
    {
        return -solve(arr) + solve2(arr);
    }
};