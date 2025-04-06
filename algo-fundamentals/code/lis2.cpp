#define MAX_IDX 2505
int mem[MAX_IDX];
int memb[MAX_IDX][MAX_IDX];

class Solution {

    //aka ways at idx
        //(a) when you are allowed to use [idx,sz) element range only {botton-up, as last one need to be found first}
        //(b) when you are allowee to use [0,idx] element range only {top-down, as first one need to be found first}
    
    //inclusion of idx in answer set is OPTIONAL
    int findAnsAtIdx(int idx,int pidx,vector<int> &arr){
        if(idx >= arr.size()) return 0;

        int &mans = memb[idx][pidx+1];
        if(mans != -1) return mans;

        int in = 0, ex = 0;
        //now can include idx, only if it fit in the current set OR no element is picked previously
        if(pidx == -1 || arr[pidx] < arr[idx]){
            in = 1 + findAnsAtIdx(idx+1,idx,arr);
        }

        ex = findAnsAtIdx(idx+1,pidx,arr);

        return mans = max(in,ex);
    }


int findAnsStartAtInxRec(int idx,vector<int> &arr){
    if(idx>=arr.size()) return 0;

    int &mans = mem[idx];
    if(mans != -1) return mans;

    int mx = 1; //single element
    for(int j=idx+1;j<arr.size();j++){
        if(!(arr[idx]<arr[j])) continue;

        mx = max(mx,1 + findAnsStartAtInxRec(j,arr));
    }

    return mans = mx;

}

int findAnsStartAtInxIte(vector<int> &arr){
    int sz = arr.size();

    vector<int> dp(sz,1);


    for(int i=sz-1; i>=0; i--){ //when finding ans startint at idx => we must have precomputed the subprpblems (which is starting at > idx)
        for(int j=i+1;j<sz;j++){
            if(!(arr[i]<arr[j])) continue;

            dp[i] = max(dp[i],1 + dp[j]);
        }
    }

    return *max_element(dp.begin(),dp.end());
}

int findAnsEndAtInxRec(int idx,vector<int> &arr){
    if(idx < 0 ) return 0;

    int mx = 1;
    int &mans = mem[idx];
    if(mans != -1) return mans;

    for(int j=idx-1;j>=0;j--){
        if(!(arr[j]<arr[idx])) continue;
        
        int tmax = 1+findAnsEndAtInxRec(j,arr);

        mx = max(mx,tmax);
    }

    printf("\t[%d]: %d\n",idx,mx);

    return mans = mx;
}


int findAnsEndAtInxIte(vector<int> &arr){
    int sz = arr.size();

    vector<int> dp(sz,1);


    for(int i=0;i<sz;i++){ //when finding ans startint at idx => we must have precomputed the subprpblems (which is starting at > idx)
        for(int j=i-1;j>=0;j--){
            if(!(arr[j]<arr[i])) continue;

            dp[i] = max(dp[i],1 + dp[j]);
        }
    }

    return *max_element(dp.begin(),dp.end());
}

public:
    int lengthOfLIS(vector<int>& arr) {
        memset(mem,-1,sizeof(mem));
        
        int mx = 0;
#if 0
        for(int i=0;i<arr.size();i++){
            int tmx = findAnsStartAtInxRec(i,arr);
            mx = max(tmx,mx);
        }
#endif
#if 0
        for(int i=arr.size()-1;i>=0;i--){
            int tmx = findAnsEndAtInxRec(i,arr);
            mx = max(tmx,mx);
        }
#endif

        mx = findAnsStartAtInxIte(arr);
        mx= findAnsEndAtInxIte(arr);

        memset(memb,-1,sizeof(memb));
        mx = findAnsAtIdx(0,-1,arr);

        return mx;
    }
};