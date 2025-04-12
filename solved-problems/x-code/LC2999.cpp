
#define cc if(0)
typedef long long int lli;
string ts;
string suffix;

#define MAX_IDX 17
#define MAX_STATE 2
lli mem[MAX_IDX][MAX_STATE];

// state1 = is maximun number being picked continously?
// state2 = is zero being picked continously?
lli findAns(int idx, int state1, string& end,
            const int& limit, const int& sz) {
    if (idx >= end.size()) return 1;

    lli &mans = mem[idx][state1];
    if(mans != -1) return mans;

    int istart = 0;
    int iend = (state1 == 1) ? end[idx]-'0': 9;


    //if the idx goes inside the suffix region (then suffix will also decide the start & end constraint)
    //basically, in this region start and end should be suffix[idxds]
    // int suffixStartIdx = end.size() - suffix.size();
    // if(idx>=suffixStartIdx){
    //     istart = suffix[idx-suffixStartIdx] - '0';
    //     iend = min(iend, suffix[idx-suffixStartIdx] - '0');

    // }
    if(suffix[idx] != 'X'){
        istart = suffix[idx] - '0';
        iend = min(iend, suffix[idx] - '0');
    }

  cc  printf("[%d,%s]: (%d,%d)\n",idx,ts.c_str(),istart,iend);
    
    lli cnt = 0;
    for (int i = istart; i <= iend; i++) {

        if (i > limit) break;

        ts.push_back(i + '0');
        int nstate1 = state1 && (end[idx] == (i + '0'));

        lli tval = findAns(idx + 1, nstate1, end, limit, sz);
    cc  printf("\t\t::[%d,%d]: %lld\n", idx, i, tval);
        cnt += tval;
        ts.pop_back();
    }
  cc  printf("\t[%d]: (%lld)\n", idx, cnt);
    return mans = cnt;
}

class Solution {


public:
    long long numberOfPowerfulInt(long long istart, long long iend, int limit,
                                  string s) {
       

        istart = istart-1;
        
        string end = to_string(iend);
        string start = to_string(istart);
        s = string(end.size()-s.size(),'X') + s;
        suffix = s;
        
        int sz1 = start.size();
        int sz2 = end.size();

        start = string(sz2-sz1,'0') + start;
        printf("%s-%s-%s\n", start.c_str(),s.c_str(),end.c_str());
        // if(!(stoi(start) <= stoi(s) && stoi(s)  <= stoi(end))) return 0;

        
        memset(mem,-1,sizeof(mem));
        lli val1 =  findAns(0, 1,end, limit, end.size()-s.size());

        memset(mem,-1,sizeof(mem));
        lli val2 =  findAns(0,1,start,limit,end.size()-s.size());

        return val1-val2;
    }
};