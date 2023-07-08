//Pratice Line: LC72 https://leetcode.com/problems/edit-distance/
#define MAX_IDX 505
#define cc if(0)

int mem[MAX_IDX][MAX_IDX];
class Solution {
    
    
    int findAns(int i,int j,const string &s1,const string &s2)
    {
        cc printf("[%d,%d]\n",i,j);
        if(i==s1.size() && j==s2.size()) return 0;
        if(i>=s1.size()) return s2.size()-j; //add this much entry to s1
        if(j>=s2.size()) return s1.size()-i;  //delete this much entry from s1
        
        int &mans = mem[i][j];
        if(mans != -1) return mans;
        
        //now try to create new ansString.
        //to populate idx of answer string, you can have three operations
        
        int val1 = 1 + findAns(i,j+1,s1,s2); //insertion 
        int val2 = 1+ findAns(i+1,j,s1,s2); //deletion
        int val3 = 1 + findAns(i+1,j+1,s1,s2); //replacement
        int val4 = INT_MAX; //do nothing
        
        if(s1[i] == s2[j])
            val4 = findAns(i+1,j+1,s1,s2);
        
        return mans= min({val1,val2,val3,val4});
    }
    
public:
    int minDistance(string s1, string s2) {
        memset(mem,-1,sizeof(mem));
        
        return findAns(0,0,s1,s2);
    }
};