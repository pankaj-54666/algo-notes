/*
    Hint1: try to complete the smaller word first
    Hint2: for xxyxx, we need to find y which occurr odd numner of times in entire cnt[26]
    
    Hint3(pragmatic): If you can count total possible pairs with help of cnt[26]. Then if words[i].size()/2 is less than pcount => words[i] can be made palindrpme sccessfully.
    
    
Solution: If you observe, any two character can be swapped with any other.
    we will first count occurrance of all characters. Then we will find out total number of pairs that can be made.
    
    Now, words[i] can be made palindrome, if we have at least words[i]/2 number of pair available.
    
    Now, to make the most number of palindrome => we need to start making palindrome with smallest string fist!
        


*/
class Solution {
public:
    int maxPalindromesAfterOperations(vector<string>& words)
    {
        vector<int> cnt(26,0);
        
         vector<int> arr;
        
        for(int i=0;i<words.size();i++)
        {
            arr.push_back(words[i].size());
            for(auto ch:words[i])
            {
                cnt[ch-'a']++;
            }
        }
        
        sort(arr.begin(),arr.end());
        
        int pcount = 0; //pair count
        
        for(int i=0;i<cnt.size();i++)
        {
            pcount += cnt[i]/2;
        }
        
        for(int i=0;i<arr.size();i++)
        {
            pcount = pcount - arr[i]/2;
            if(pcount < 0)
                return i;
        }
        
        return words.size(); //all words converted to palindrome successfully.
    }
};