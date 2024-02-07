#define MAX_IDX 2003
#define INF -2003

#define cc if(0)

int mem[MAX_IDX][MAX_IDX];
int bmem[MAX_IDX];
class Solution {
    
    int findAns(int l,int r,const string &s)
    {
        if(l==r) return 1;
        if(l>r) return 0;
        int &mans = mem[l][r];
        if(mans != -1) return mans;
        
        int val1= INF;
        int t = findAns(l+1,r-1,s);
        if(s[l] == s[r])
        {
            
            if(t!= INF)
                val1 = 2 +t;
        }
        
        return mans = val1; //val1 being infinity => [l,r] range cannot be palindroic subarray
    }
    
    int jumpCount(int idx,const int k,const string &s)
    {
        int &l = idx;
        if(idx>=s.size()) return 0;
        int &mans = bmem[idx];
        
        if(mans != -1) return mans;
        
        int val1 = jumpCount(l+1,k,s); //excluding current
        
        int val2 = 0; //including current
        /* from where you could jump from this position?*/
        for(int r=l+k-1;r<s.size();r++)
        {
     cc       printf("(%d,%d):%d\n",l,r,mem[l][r]);
           
            if(mem[l][r] == INF)
                continue;
            
             
            int t = 1 + jumpCount(r+1,k,s);
            
            // printf("[%d,%d:%s]: %d\n",l,r,s.substr(l,r-l+1).c_str(),t);
            val2 = max(val2,t);
            
        }
        
   cc     printf("[%d]: I(%d),NI(%d)\n",l,val2,val1);
        return mans = max(val1,val2);
    }
public:
    int maxPalindromes(string s, int k) 
    {
        memset(mem,-1,sizeof(mem));
        
        for(int i=0;i<s.size();i++)
        {
            for(int j=i;j<s.size();j++)
            {
                int t = findAns(i,j,s);
    cc           printf("%s:%d\n",s.substr(i,j-i+1).c_str(),t);
            }
        }
        
        memset(bmem,-1,sizeof(bmem));
        int mx = 0;
        for(int i=0;i<s.size();i++)
        {
            int t = jumpCount(i,k,s);
            mx = max(t,mx);
        }
        
        return mx;
    }
};