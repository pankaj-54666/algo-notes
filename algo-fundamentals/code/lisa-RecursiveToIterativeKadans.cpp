//https://leetcode.com/problems/maximum-subarray/
#define cc if(0)
#define MAX_IDX 100005
#define MAX_STATE 2

#define INF INT_MIN/2

int mem[MAX_IDX][MAX_STATE];

class Solution {
    int gmx = INT_MIN;
    
    /* f(idx,_) :=  maximum subarray lenght that end at idx. & MUST include idx.
                :=  maximum subarray length when you are allowed to use array arr[idx...last]. Here arr[idx] use is COMPLUSARY*/
    /* this is the form which has been translated to iterative kadan's algorithm*/
    /* val2 removal requires us to find gmx amoung all answer. */
    int findAnsThree(int idx,vector<int>&arr)
    {

        if(idx>= arr.size() ) return  0; 
   
        int &mans = mem[idx][0];
        if(mans != -1) return mans;
        
        /* options at idx*/
        int val1=arr[idx]; //subarray length that start at idx

        int t = findAnsThree(idx+1,arr);
        if(t>=0)
            val1 = arr[idx] + findAnsTwo(idx+1,arr);
        
        gmx = max({gmx,val1});
    cc  printf("[%d]: (%d)\n",idx,val1);
        return mans = val1;
    }
    
        /* sequence start at idx & must include idx*/ /* need go scan for gmx*/pas
    /* val2 removal requires us to find gmx amoung all answer. */
    int findAnsTwo(int idx,vector<int>&arr)
    {

        if(idx>= arr.size() ) return  0; 
   
        int &mans = mem[idx][0];
        if(mans != -1) return mans;
        
        /* considerating that we have solution of idx+1.
        At idx we have follwing option
        (a) start a subarray from this point & extend for f(idx+1,arr) (if we consider left to right) OR extend the subarray from dp[idx+1] on left side by including the current element (if we consider how we are processing the recursion result) <= whatever way we consider the end result is same.
        */
        int val1=INT_MIN; //subarray length that start at idx

        val1 = arr[idx] + findAns(idx+1,1,arr);
        val1 = max(arr[idx],val1);
        
        gmx = max({gmx,val1});
    cc  printf("[%d]: (%d)\n",idx,val1);
        return mans = val1;
    }
    
    vector<int> sarr;
    /* not woring & will not work as base condition cannot be written well*
    Same logic will work with LC2771*/
     int findAnsV3(int idx,int pstate,vector<int>&arr)
    { 
        if(idx>= arr.size() ) return pstate == 0? INT_MIN : 0; /* correct way*/
        
        int &mans = mem[idx][pstate];
        if(mans != -1) return mans;
        
        /* at each idx we have two option */
        int val1=INT_MIN; //include the element //maximum subarray length that start at idx
        int val2=INT_MIN; //do not include the element. //find maximum subarray length that do not start at idx   {only possible if we have previously not included it}
        
         sarr.push_back(INT_MIN);
         int t2= findAnsV3(idx+1,0,arr);
         sarr.pop_back();
        
        sarr.push_back(arr[idx]);
        int t1 = findAnsV3(idx+1,1,arr);  
        sarr.pop_back();
         
         if(t1 != INT_MAX)
             val1 = max(arr[idx],arr[idx]+t1);
         
         if(t2 != INT_MAX)
             t2 = t2;
         
        // val1 = (t1 >=0 ) ? arr[idx] + t1 : arr[idx]; //you would not want to have the sum decreased 
        
        gmx = max({gmx,val1,val2}); //gmx need is not here. As this function return the opimal answer by itself
    cc    printf("[%d,%d]: (%d,%d)\n",idx,pstate,val1,val2);
        return mans = max({val1,val2});
    }
    
    
    int findAnsV2(int idx,int pstate,vector<int>&arr)
    { 
        if(idx>= arr.size() ) return pstate == 0? INT_MIN : 0; /* correct way*/
        
        int &mans = mem[idx][pstate];
        if(mans != -1) return mans;
        
        /* at each idx we have two option */
        int val1=INT_MIN; //include the element //maximum subarray length that start at idx
        int val2=INT_MIN; //do not include the element. //find maximum subarray length that do not start at idx   {only possible if we have previously not included it}
        
        if(pstate == 0)
            val2 = findAnsV2(idx+1,0,arr);
        
        int t = findAnsV2(idx+1,1,arr);        
        val1 = (t >=0 ) ? arr[idx] + t : arr[idx]; //you would not want to have the sum decreased 
        
        gmx = max({gmx,val1,val2}); //gmx need is not here. As this function return the opimal answer by itself
    cc    printf("[%d,%d]: (%d,%d)\n",idx,pstate,val1,val2);
        return mans = max({val1,val2});
    }
    
    /* f(idx,_) := maximum subarray length when you are allowed to use array arr[idx...last]. Here arr[idx] use is not compulsury.*/
    int findAns(int idx,int pstate,vector<int>&arr)
    {
                // if(idx == arr.size()-1) return arr.back(); /* you are forcing to include the last element always. when there is just one element. THIS seemss wrong*/
        
        
        if(idx>= arr.size() ) return pstate == 0? INT_MIN : 0; /* correct way*/
        
        // if(idx>=arr.size()) return 0; //explain what is wrong in this
        // if(idx>=arr.size()) return INT_MIN; //explain what is wrong in this
        // if(idx == arr.size()-1) return arr.back(); //explain what is wrong
        
        int &mans = mem[idx][pstate];
        if(mans != -1) return mans;
        
        /* at each idx we have two option */
        int val1=INT_MIN; //include the element //subarray length that start at idx
        int val2=INT_MIN; //do not include the element. (only possible if we have previously not included it)
        //best value amoung all subarray that do not start at idx. (& are at right side of idx)

        
        if(pstate == 0)
            val2 = findAns(idx+1,0,arr);
        
        val1 = arr[idx] + findAns(idx+1,1,arr); //include the arr[idx] & MUST extend to right
        val1 = max(arr[idx],val1); //it may happend that findAns(idx+1,1,_) is -ve. in which case you do not want to add it
        /* finially val1 := maximum lenght when you can either extend it to right or can not extend it to right*/
        
        gmx = max({gmx,val1,val2}); //gmx need is not here. As this function return the opimal answer by itself
    cc  printf("[%d,%d]: (%d,%d)\n",idx,pstate,val1,val2);
        return mans = max({val1,val2});
    }
public:
    int maxSubArray(vector<int>& arr) 
    {
        memset(mem,-1,sizeof(mem));
     
        // return findAns(0,0,arr); //no gmx need
        return findAnsV2(0,0,arr); //no gmx need
        // return findAnsV3(0,0,arr); //no gmx need
         // findAnsTwo(0,arr); //gmx need
        // findAnsThree(0,arr);
        // return gmx;
        // return gmx-arr.back();
        // return max(findAns(0,0,arr),findAns(0,1,arr));
    }
};
/*
[-2,1,-3,4,-1,2,1,-5,4]
[1]
[5,4,-1,7,8]
[-1]
[1]
[-2,-1]
[-1,-2]
*/