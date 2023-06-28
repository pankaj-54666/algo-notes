//pratice link: https://leetcode.com/problems/longest-common-subsequence/
#include<iostream>
#include<string>
using namespace std;

 #define cc if(1)
 #define MAX_S1 1001
 #define MAX_S2 1001

 int mem[MAX_S1][MAX_S2];       
        
        int findAns(int i,int j,string as, const string &s1, const string &s2)
        {
            if(i>= s1.size() || j>= s2.size())  //if one is empty => we cannot find anything common now
                return 0; 
                
            //visualize the answer being created
            cc printf("\t:: [%s] (%s,%s)\n",as.c_str(),s1.substr(i).c_str(),s2.substr(j).c_str()); 
            
            int &mans = mem[i][j];
            int val1 = 0,val2=0,val3=0;
            
            if(s1[i] == s2[j])
            {
                val1 = 1 + findAns(i+1,j+1,as+s1[i],s1,s2);
            }
            else
            {
                val2 =  findAns(i+1,j,as+s1[i],s1,s2);
                val3 = findAns(i,j+1,as+s2[j],s1,s2);
            }
            
            //view all path computed at idx
            cc printf("[%s,%d,%d]: (%d,%d,%d)\n",as.c_str(),i,j,val1,val2,val3); 
            
            return mans = max({val1,val2,val3});
        }

        //small footprint code
        int findAns(int i,int j, const string &s1, const string &s2)
        {
            if(i>= s1.size() || j>= s2.size())  return 0; 

            
            int &mans = mem[i][j];
            int val1 = 0,val2=0,val3=0;
            
            if(s1[i] == s2[j])
            {
                val1 = 1 + findAns(i+1,j+1,s1,s2);
            }
            else
            {
                val2 =  findAns(i+1,j,s1,s2);
                val3 = findAns(i,j+1,s1,s2);
            }
            return mans = max({val1,val2,val3});
        }

int main()
{
    return 0;
}