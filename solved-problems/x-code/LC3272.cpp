/*
    Tryout1: f(idx,k,n) = count of all integers that satisifes the contraiint
    at idx, we have option to put 0-9 integer.

        => issue is that, we need exactly n integers. And trying out all option at idx, will lead us TLE
    
    Tryout2: How about start from first 9 digit palindrome and start from there?

    Tryout3: How about taking palindrome contraint into account, ans instead of s[1..9] just find s[1..5] string , ans assume rest to be duplicate!!
            This was the total integer count the recursion can generate (when its not proned with k) is 10^5

            => which is within acceptable limit!

    Appraoch1:
        Intution:  as 10^9 crosses the limit, how about shrinking out problem space as 10^5 as,the rest number will be fixed once the palindrom first half is known.

        Now there are two case , EVEN = _ _ _ _, ODD = _ _ _
        Solve for simple EVEN case first via recursion, then extend to ODD case.

        As the s[1..5] even if you enumerate and take decision check the corretness, it is withing time limit!

        challenge: FOR 1 find s, how to rearrange the s to make sure its divisable by k??
        Hint: we don't need to!!

            How about counting all number from which this k divisible number be reached!! (REVERSE)

    Hard Problem Insight:
        As we know, hard problem can be thought of mixure of 2 medium problem + implemention & debug difficulty added up

        This can be though of as follwing two subproble in incremental fasion:
        (a) list down all 5 char long string, (which made to x by by 1st part of palindrome repeat) ,which  are divisibl by k
        (b) For every such palindrome, can you count FROM how many number can be rearranged to reach this same exact number?! All number should be n digits long.
        (c) For any palindrome target ss, if its digit gets repeated, then that will count as duplict, so skip those.
*/

typedef long long int lli;
#define cc if(0)

//can memoize if needed
lli fact(int num) {
    long result = 1;
    for (int i = 1; i <= num; i++) {
        result *= i;
    }
    return result;
}

class Solution {
    vector<string> vec;

    lli findAns(int idx,string& s, const int k,const int n){
        // printf("[%d]:: %s\n",idx,s.c_str());
        if(idx >= ((n+1)/2)){
            string ss(n,'a');

            for(int i=0;i<s.size();i++){
                ss[i] = s[i];
                ss[n-i-1] = s[i];
            }
            lli num = stoll(ss);

            if(num %k == 0) vec.push_back(ss);
            if(num%k == 0) return 1;
            return 0;
        }

        //ways at idx? <= how many ways we can fill idx

        lli val = 0;

        for(int i=0;i<=9;i++){
            if(idx == 0 && i == 0) continue; //we are not allowed to put 0 at start

            s.push_back(i+'0');
            lli tval = findAns(idx+1,s,k,n);
            val += tval;
            s.pop_back();
        }

        return val;
    }
public:
    long long countGoodIntegers(int n, int k) {
        
        string s;
        findAns(0,s,k,n);
        
        map<vector<int>,int> mMap;
        lli ans = 0;

        for(auto ss:vec){

            vector<int> fcnt(10,0);
            for(auto ch:ss){
                fcnt[ch-'0']++;
            }

            if(mMap.find(fcnt) != mMap.end() ) continue;
            mMap[fcnt]++;

            lli tpermutation = fact(n);
            for(int i=0;i<=9;i++) 
            {
                if(fcnt[i] == 0) continue;
                tpermutation /= fact(fcnt[i]);
            }

            lli startWithZeroPermutationCount = fact(n-1);
 
            startWithZeroPermutationCount /= fact(fcnt[0]-1);
            for(int i=1;i<=9;i++)
            {
                if(fcnt[i] == 0) continue;
                startWithZeroPermutationCount /= fact(fcnt[i]);
            }
            
            if(fcnt[0] == 0)
                startWithZeroPermutationCount = 0;

            lli totalCnt = tpermutation - startWithZeroPermutationCount;

     cc       printf("%s: %lld\n",ss.c_str(),totalCnt);
            ans += totalCnt;
        }


        return ans;
    }
};