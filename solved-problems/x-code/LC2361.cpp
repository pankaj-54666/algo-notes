typedef long long int lli;
#define INF LLONG_MAX/2
#define cc if(0)


#define MAX_IDX 100005
#define MAX_TRACK 2

lli mem[MAX_IDX][MAX_TRACK];
class Solution {
    
    
//     int findAns2(int idx,int ptrack,lli rcost,vector<int>& tA,vector<int>&tB,const int trackChangeCost)
//     {
//         if(idx >= tA.size()) return 0;
//         printf("[%d,%d]:%lld\n",idx,ptrack,rcost);
        
//         // int &mans = mem[idx][ptrack];
//         // if(mans != -1) return mans;
        
//         /* all options to reach this idx*/
//         lli val1; //reach from trackA
//         lli val2; //reach from trackB
        
//         if(ptrack == 0) //train was previously at tA
//         {
//             val1 = rcost + tA[idx]; 
//             val2 = rcost + tB[idx] + trackChangeCost; //change track then reach
//         }
//         else //train was previous on tB (on express route)
//         {
//             val1 = rcost + trackChangeCost + tA[idx]; //shift to trackA first
//             val2 = rcost + tB[idx];
//         }
        
//         return  min(val1,val2);
//     }
    
    lli findAns(int idx,int ptrack,vector<int>& tA,vector<int>&tB,const int trackChangeCost)
    {
        if(idx >= tA.size()) return 0;
        
        lli &mans = mem[idx][ptrack];
        if(mans != -1) return mans;
        
        /* all options to reach this idx*/
        lli val1; //continue one same track
        lli val2; //change track
        
        /* or: continue via trackA, continue via trackB*/
        
        if(ptrack == 0) //train was previously at tA
        {
            val1 =  tA[idx] + findAns(idx+1,0,tA,tB,trackChangeCost); 
            val2 =  tB[idx] + trackChangeCost
                            + findAns(idx+1,1,tA,tB,trackChangeCost); 
        }
        else //train was previous on tB (on express route)
        {
            val1 =  tB[idx] + findAns(idx+1,1,tA,tB,trackChangeCost); 
            val2 =  tA[idx] + findAns(idx+1,0,tA,tB,trackChangeCost);
        }
        
        // printf("[%d,%d]:(%d,%d)\n",idx,ptrack,val1,val2);
        return  mans = min(val1,val2);
    }
    
    
    lli findAnsThree(int idx,int ontrack,vector<int>& tA,vector<int>&tB,const int trackChangeCost)
    {
        const int &tcc = trackChangeCost;
        
        if( idx <0 ) return ontrack == 0 ? 0:INF;
        // printf("[%d,%d]:%lld\n",idx,ontrack,rcost);
        
        lli &mans = mem[idx][ontrack];
        if(mans != -1) return mans;
        
        /* all options to reach this (idx,trackNo)*/
        lli val1; //come from tA
        lli val2; //come from tB
        
        lli t1 = findAnsThree(idx-1,0,tA,tB,trackChangeCost); //coming from trackA (cost to reach tA for one previous position)
        lli t2 = findAnsThree(idx-1,1,tA,tB,trackChangeCost); //comding from trackB
        
        if(ontrack == 0) //we need to reach onto trackA
        {
            //tA->tA
            val1 = tA[idx] + t1;  //move
            val1 = min(val1,t1+tcc+tB[idx]+0); //change,move,change
            
            //tB->tA
            val2 = t2 + tB[idx] + 0; //move,change
            val2 = min(val2,t2 + 0+tA[idx]); //change,move
        }
        else //we need to reach onto trackB
        {
            //tA->tB
            val1 = t1 + tA[idx] + tcc;  //move,change
            val1 = min(val1,t1+tcc+tB[idx]); //change,move
            
            //tB->tB
            val2 = t2 + tB[idx]; //move
            val2 = min(val2,t2 + 0 +tA[idx]+tcc); //change,move,change
        }
        
  cc      printf("[%d,%d]:(%d,%d)\n",idx,ontrack,val1,val2);
        return  mans = min(val1,val2);
    }
    
    lli findAnsFour(int idx,int ontrack,vector<int>& tA, vector<int>& tB, int tcc)
    {
        if(idx<0) return ontrack == 0?0:tcc;
        
        lli &mans = mem[idx][ontrack];
        if(mans != -1) return mans;
        
        /* at this point we have two option: reach from same track as current or reach via different track*/
        lli val1; //do not change track (arrive from same track as current)
        lli val2; //change track 
        
        
        lli t1 = findAnsFour(idx-1,0,tA,tB,tcc); //arrive from tA
        lli t2 = findAnsFour(idx-1,1,tA,tB,tcc);  //arrive from tB
        
        if(ontrack == 0) //regular track
        {
            val1 = t1 + tA[idx]; //AA
            val2 = t2 + tB[idx]; //BA
        }
        else
        {
            val1 = t2 + tB[idx]; //BB
            val2 = t1 + tA[idx] + tcc; //AB
        }
        
     //   printf("[%d,%d]:(%d,%d)\n",idx,ontrack,val1,val2);
        return mans = min(val1,val2);
        
        
    }
    
    lli findAnsFive(int idx,int ontrack,vector<int>& tA, vector<int>& tB, int tcc)
    {
        if(idx<0) return ontrack == 0?0:tcc;
        
        lli &mans = mem[idx][ontrack];
        if(mans != -1) return mans;
        
        /* options at idx, you can think as other option also: reach via tA, reach via tB*/
        lli val1; //reach via tA
        lli val2; //reach via tB
        
       
        
        lli t1 = findAnsFive(idx-1,0,tA,tB,tcc); //arrive from tA (cost to reach tA[idx-1] on platform tA)
        lli t2 = findAnsFive(idx-1,1,tA,tB,tcc);  //arrive from tB
        
        if(ontrack == 0) //regular track
        {
            val1 = t1 + tA[idx]; //AA
            val2 = t2 + tB[idx]+0; //BA
        }
        else
        {
            val1 = t1 + tA[idx] + tcc; //AB
            val2 = t2 + tB[idx]; //BB
            
        }
        
     //   printf("[%d,%d]:(%d,%d)\n",idx,ontrack,val1,val2);
        return mans = min(val1,val2);
        
        
    }
public:
    vector<long long> minimumCosts(vector<int>& tA, vector<int>& tB, int expressCost) 
    {

        memset(mem,-1,sizeof(mem));
        
      //  findAnsThree(tA.size()-1,0,tA,tB,expressCost);
      //  findAnsThree(tA.size()-1,1,tA,tB,expressCost);
        
        // findAnsFour(tA.size()-1,0,tA,tB,expressCost);
        // findAnsFour(tA.size()-1,1,tA,tB,expressCost);
        
        findAnsFive(tA.size()-1,0,tA,tB,expressCost);
        findAnsFive(tA.size()-1,1,tA,tB,expressCost);
 #if 0       
        cout<<"Cost to reach end\n";
        for(int i=0;i<=tA.size();i++)
        {
            cout<<min(mem[i][0],mem[i][1])<<" ";
        }
        cout<<endl;
 #endif       
        vector<lli> ans;
        for(int i=0;i<tA.size();i++)
            ans.push_back(min(mem[i][0],mem[i][1]));
        
        return ans;
        
    }
};