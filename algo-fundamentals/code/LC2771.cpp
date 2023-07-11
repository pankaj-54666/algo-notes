//https:https://leetcode.com/problems/longest-non-decreasing-subarray-from-two-arrays/discuss/3740071/Java-oror-DP-oror-Memoization
#define MAX_N 100005
#define STATE 4
#define cc if(1)

#define INF INT_MIN/2

int mem[MAX_N][STATE];
void mswap(int& a,int& b)
{
    int c = a;
    a = b;
    b = a;
}
class Solution {
    
    /* successfully submitted*/
    int findIterative(const vector<int>&A,const vector<int>&B)
    {
        int size = A.size();
        int dp[size][2];
        dp[0][0] = dp[0][1] = 1; //ideally all set to 1
        
        
        for(int i=1;i<size;i++)
        {
            /* finding the maximum lenght of subarray that end at idx*/
            int val1=1; //option1: extend the previous subarray with A (also as they are 1substring in themself, so 1 by default)
            int val2=1; //option2: extend the previous subarray with B
            
            
            int t1 = dp[i-1][0]; //findAns(n-1,0,A,B); //dp[n-1][0] == maximum length of subarray that ends at A[n-1] (no swapping)
            int t2 = dp[i-1][1] ;//findAns(n-1,1,A,B); //dp[n-1][1] == maximum length of subarray that ends at B[n-1]
        /* ending with A state=0, ending with B state=0*/
    
            
        /* now our task is to find dp[n][0] & dp[n][1] */
        /* finding dp[n][0] */
        if(A[i-1]<=A[i])
            val1 = max(val1,1+t1);
        if(B[i-1] <= A[i])
            val1 = max(val1,1+t2);
        
        /* finding dp[n][1]*/
        if(B[i-1] <= B[i])
            val2 = max(val2,1+t2);
        if(A[i-1] <= B[i])
            val2 = max(val2,1+t1);
            
            dp[i][0] = val1;
            dp[i][1] = val2;
        }
        
        // for(int i=0;i<size;i++)
        //     printf("(%d,%d) ->",dp[i][0],dp[i][1]);
        
        int mx = 1;
        for(int i=0;i<size;i++)
            mx = max({mx,dp[i][0],dp[i][1]});
        
        return mx;
    }
    
    /* type1: right to left (<-) recursion. Left subproblems answer if found using recursion*/
    /* type2: left to right (->) recursion. Right subproblems answers should be know first*/
    /* issue with some test case*/
    int findAns(int n,int state,const vector<int>&A,const vector<int>&B)
    {
        printf("   [%d,%d]: \n",n,state);
        if(n<=0) return 1;
        int &mans = mem[n][state];
        
        
        /* finding the maximum lenght of subarray that end at idx*/
            int val1=1; //option1: extend the previous subarray with A
            int val2=1; //option2: extend the previous subarray with B
            int val3 = 1; //do not extend the subarray with any of these
        
            int t1 = findAns(n-1,0,A,B); //dp[n-1][0] == maximum length of subarray that ends at A[n-1] (no swapping)
            int t2 = findAns(n-1,1,A,B); //dp[n-1][1] == maximum length of subarray that ends at B[n-1]
        /* ending with A state=0, ending with B state=0*/
        
        int &i = n;
        /* now our task is to find dp[n][0] & dp[n][1] */
        /* finding dp[n][0] */
        if(A[i-1]<=A[i])
            val1 = max(val1,1+t1);
        if(B[i-1] <= A[i])
            val1 = max(val1,1+t2);
        
        /* finding dp[n][1]*/
        if(B[i-1] <= B[i])
            val2 = max(val2,1+t2);
        if(A[i-1] <= B[i])
            val2 = max(val2,1+t1);
        
       
    
        mem[n][0] = val1;
        mem[n][1] = val2;

        
    cc    printf("[%d,%d]:(%d,%d) :(%d,%d) (%d,%d)\n",n,state,val1,val2,t1,t2,A[i-1],A[i]);
        
        return mans = max(val1,val2);
    }
    
    /* state is left or the created array at n+1*/ //it will help us take decision at current
    int solve(int n,int state,const vector<int>&A,const vector<int>&B)
    {
        if(n==0) return 0; 
        
        /* we need top left element of our solutionarray beign created, we must find it before taking decision at current step*/
        int lelement =( state == 0) ? -1 : 
                                            (state==1)?A[n+1]:B[n+1];
        
        int val1 = 0; //extend the solution subarray to left with A[i]
        int val2 = 0; //extend the solution subarray to left with B[i]
        int val3 = 0; //do not select any element at this idx
        
        if(state == 0)
            val3 = solve(n-1,0,A,B);
        if(A[n]<=lelement)
            val1 = 1 + 0;
        return {};
        
        
    }
    
    int gmx = 0;
    int findAnsTwo(int idx,int state,int last, vector<int>&A, vector<int>&B)
    {
  cc      printf("\t::[%d,%d,%d] %d\n",idx,state,last,A[idx]);
        
        if(idx>1  && !(A[idx-2]<=A[idx-1])) return 1; //invalid case
        
        if(idx >= A.size()) return 0;
        
        
        int val1 = 1+findAnsTwo(idx+1,0,A[idx],A,B); //do not swap idx
        
        
        mswap(A[idx],B[idx]);
        int val2 = 1 + findAnsTwo(idx+1,1,B[idx],A,B); // swap idx
        mswap(A[idx],B[idx]);
        
        
        int t = A[idx];
        A[idx] = INT_MIN;
        int val3 = 1;
        A[idx] = t;
        
        gmx = max({val1,val2,gmx});
  cc      printf("[%d,%d]: (%d,%d,%d)\n",idx,state,val1,val2,val3);
        return max({1,val1,val2,val3,val3});
    }
    
    vector<int> C;
    int findAnsFour(int idx,int state,int last,vector<int>&A,vector<int>&B)
    {
        if(idx-2>=0  && !(C[idx-2] <= C[idx-1])) return INF;
        
        // if(C.size()>=2 && !(C[C.size()-2] <= C[C.size()-1])) return INF;
            
  cc      printf("\t[%d,%d]::",idx,state);
  cc      for(auto k:C) cout<<k<<" ";
  cc      cout<<endl;
        
         
        if(idx>=A.size()) return 0;
        
         
        int &mans = mem[idx][state];
        if(mans != -1) return mans;
       
        
        /* all sequence start at idx*/
        int val1 = 0; //extend the subarray on left when current elemtn is taken from A
        int val2 = 0; //extend the subarray on left when current elemtn is taken from B
        int val3 = 0; //Do not start at idx
       
        int &i = idx;
        C.push_back(A[i]);
        int t1 = findAnsFour(idx+1,0,A[i],A,B); //extend with A[i]
        C.pop_back();
        
        
        C.push_back(B[i]);
        int t2 = findAnsFour(idx+1,1,B[i],A,B);  //extend with B[i]
        C.pop_back();
        
        C.push_back(INF);
        int t3 = findAnsFour(idx+1,2,INF,A,B);
        C.pop_back();
        
        if(t1 != INF) /* if the extension was valid*/
            val1 = 1+t1;
        if(t2 != INF)
            val2 = 1+t2;
        
       // if(t3 != INF)
           // val3 = t3;
        
        gmx = max({gmx,val1,val2,val3});
        
  cc      printf("[%d,%d]:(%d,%d)(%d,%d)\n",idx,state,t1,t2,val1,val2);
        
        return mans = max({val1,val2,val3});
    }
    
    /* state=0 := no previous element was selected, state=1:= previous element was selected from A, state=:= previous element was selected from B*/
    /* pstate = previous state & NOT the current state, VERY important to make this observation*/
    int findAnsFive(int idx,int pstate,vector<int>& A, vector<int>& B) 
    {
        if(idx >= A.size()) return 0;
        
        int &mans = mem[idx][pstate];
        if(mans != -1) return mans;
        
        /* at this time we have three options:
            (a) take from A
            (b) take from B
            (c) do not take (for subsequence this is always valid: but for subarray, this is only valid if we MUST HAVE  NOT PICKED any element previously)
        */
        /* Imp for subset sum, we was having two options: take from array , do not array*/
        
        int val1 = 0,val2=0,val3=0;
        
        int pelement = (pstate == 0) ? -1 :((pstate==1) ? A[idx-1]:B[idx-1]);
        
         if(pstate == 0) /* for subarray we can skip taking current element only if we have not taken any previous element*/
            val3 = findAnsFive(idx+1,0,A,B);
        
        if(pelement <= A[idx])
            val1 = 1 + findAnsFive(idx+1,1,A,B);
        if(pelement <= B[idx])
            val2 = 1 + findAnsFive(idx+1,2,A,B);
        
       
        
        return mans = max({val1,val2,val3});
    }
    
    /* this is direct translation of findAnsFive*/
    int findAnsSix(int n,int pstate,vector<int>& A, vector<int>& B) /* pstate = previous state & NOT the current state, VERY important to make this observation*/
    {
        if(n<0) return 0;
        
        int &mans = mem[n][pstate];
        if(mans != -1) return mans;
        
        /* at this time we have three options:
            (a) take from A
            (b) take from B
            (c) do not take (for subsequence this is always valid: but for subarray, this is only valid if we MUST HAVE  NOT PICKED any element previously)
        */
        /* Imp for subset sum, we was having two options: take from array , do not array*/
        
        int val1 = 0,val2=0,val3=0;
        
        int pelement = (pstate == 0) ? INT_MAX :((pstate==1) ? A[n+1]:B[n+1]);
        
         if(pstate == 0) /* for subarray we can skip taking current element only if we have not taken any previous element*/
            val3 = findAnsSix(n-1,0,A,B);
        
        if(pelement >= A[n])
            val1 = 1 + findAnsSix(n-1,1,A,B);
        if(pelement >= B[n])
            val2 = 1 + findAnsSix(n-1,2,A,B);
        
       
        
        return mans = max({val1,val2,val3});
    }
    
public:
    int maxNonDecreasingLength(vector<int>& A, vector<int>& B) 
    {
        // return findIterative(A,B);
       #if 0 
        findAns(A.size()-1,0,A,B);
        findAns(B.size()-1,1,A,B);
        
        for(int i=0;i<A.size();i++)
            gmx = max({gmx,mem[i][0],mem[i][1]});
        return gmx;
       #endif 
        
    #if 1
        memset(mem,-1,sizeof(mem));
        // return findAnsFive(0,0,A,B);
        return findAnsSix(A.size()-1,0,A,B);
        #endif
        
        // int val1= findAnsTwo(0,0,INT_MIN,A,B);
        // int val2 = findAnsTwo(1,1,INT_MIN,A,B);
        // memset(mem,-1,sizeof(mem));
        // findAnsFour(0,0,0,A,B);
        // return gmx;
    #if 0    
       return gmx;
        
        A.insert(A.begin(),INT_MIN);
        B.insert(B.begin(),INT_MIN);
        int size = A.size();
        
        
        
        memset(mem,-1,sizeof(mem));
        findAns(A.size()-1,0,A,B);
        int mx = 1;
        for(int i=0;i<A.size();i++)
            mx = max({mx,mem[i][0],mem[i][1]});
        
        memset(mem,-1,sizeof(mem));
        swap(A[size-1],B[size-1]);
        findAns(A.size()-1,0,A,B);

        for(int i=0;i<A.size();i++)
            mx = max({mx,mem[i][0],mem[i][1]});
        
        return mx;
        #endif
    }
};
/*
[4,2]
[10,4]

Expected 2

[5,16,15]
[12,1,14]
Expected: 2
*/
/*
[5,16,15]
[12,1,14]
[8,7,4]
[13,4,4]
[3,19,13,19]
[20,18,7,14]
[5,16,15]
[12,1,14]
[4,2]
[10,4]
*/