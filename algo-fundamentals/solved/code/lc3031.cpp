/* testing other user solution*/
class Solution {
    public:
int minimumTimeToInitialState(const string &word, int k) {
    int res = 1, n = word.size();
    auto z = zcompute(word);
    for (; k * res < n; ++res)
        if (z[k * res] >= n - k * res)
            break;
    return res;
}

/* O(n^2) zcompute*/  
/*https://cp-algorithms.com/string/z-function.html*/
vector<int> zcompute(const string& s)
{
    int n = s.size();
    vector<int> z(n,0);

    for(int i=1;i<n;i++)
    {
        for(int j=0;j<n-i;j++)
        {
            if(s[i + z[i]] == s[j])
                z[i]++;
            else
                break;
        }
    }
    return z;
}

//TO-DO: O(n) z compute
};