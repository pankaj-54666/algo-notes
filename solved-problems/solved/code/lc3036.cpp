#define cc if(0)
class Solution {
    vector<int> find_kmp_prefix(const vector<int> &s)
    {
        int n = s.size();
        vector<int> pi(n,0);
        
        
        for(int i=1;i<n;i++)
        {
            int  j = pi[i-1];
            
            while(j>0 && s[i] != s[j])
                j = pi[j-1];
            
            if(s[j] == s[i])
                j++;
            
            pi[i] = j;
        }
        
        return pi;
    }
    
    string getString(vector<int> &arr)
    {
        string s;
        for(auto k:arr)
        {
            s.push_back(k+'0');
        }
        
        return s;
    }
public:
    int countMatchingSubarrays(vector<int>& s, vector<int>& pat) 
    {
        for(int i=0;i<s.size()-1;i++)
        {
            int a = s[i];
            int b = s[i+1];
            
            if(a<b)
                s[i] = 1;
            if(a == b)
                s[i] = 0;
            if(a>b)
                s[i] = -1;
           
        } //convert s[i] to {-1,0,1}
        
        /* Standard KMP below*/
        vector<int> ns(pat);
        ns.push_back(4); //add seperator
       for(auto p:s)
           ns.push_back(p);
    
        vector<int> pi = find_kmp_prefix(ns);
        
        int count = 0 ;
        for(int i=0;i<pi.size();i++)
        {
            if(pi[i] >= pat.size())
                count++;
        }
        
        return count;
    }
    
    
};