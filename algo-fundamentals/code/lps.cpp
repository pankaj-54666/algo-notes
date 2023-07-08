//Pratice Link: LC516 https://leetcode.com/problems/longest-palindromic-subsequence/
class Solution {   
    int findLongestPalindrome(int l, int r, string s1)
    {
        if(l==r)
            return 1;
        if(l>r)
            return 0;
        
        if(s1[l] == s1[r])
            return 2+findLongestPalindrome(l+1,r-1,s1);
        else
        {
            int iLeft = findLongestPalindrome(l+1,r,s1);
            int iRight = findLongestPalindrome(l,r-1,s1);
            return max(iLeft,iRight);
        }
    }
    
    int longestPalindromeSubsequenceDP(string s1)
{
     //   if(s1.size()<=1)
     //       return 1;
    int NRow = s1.length();
    int NCol = s1.length();

    vector<vector<int> > dp(NRow,vector<int>(NCol,0));

    //Length 1 string is always valid palindrome withlength 1  
    for(int i=0;i<NRow;i++)
        dp[i][i] = 1;

    for(int l=2;l<=NRow;l++) //lenght = l
    {
        
        for(int i=0;i<NRow-l+1;i++) 
        {
            int j = i+l-1; //r-l+1 = interval_size => j-i+1 = l => j = l+1-1
                
            int val=0;
            if(s1[i] == s1[j]) //Recursion Translation
            {
                val = 2 + dp[i+1][j-1];
            }
            else
            {
                int iLeft = dp[i+1][j];
                int iRight = dp[i][j-1];
                val = max(iLeft,iRight);
            }
            dp[i][j] = val;
        }
    }      
    return dp[0][NCol-1];
}

public:
    int longestPalindromeSubseq(string s) 
    
    {
       // return findLongestPalindrome(0,s.length()-1,s);
        return longestPalindromeSubsequenceDP(s);
    }
};