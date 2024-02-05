class Solution {
public:
    int minimumTimeToInitialState(string s, int k) 
    {
        int n  = s.length();
        int pmax = ceil(n*1.0/k);
        
        for(int p=1;p< pmax;p++) //A1
        {
            string s1 = s.substr(p*k); //s[p*k_n]
            string s2 = s.substr(0,(n-p*k)); //s[0_(n-p*k)]
            
            // cout<<s1<<" "<<s2<<endl;
            
            if(s1 == s2) return p;
        }
        
        return pmax;
    }
};

//A1: NOTE: p <= pmax can also be done, but in that case for aab and k = 2. s.substr(2*2) case will be edge, and need to take care seperetly. So, we skip it and return that number when all less value not satisfied.