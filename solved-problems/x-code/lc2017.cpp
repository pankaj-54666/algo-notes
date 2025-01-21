/* 
    Approach1: Tried to use DP, to predict the optimal path.
     

    Approach2: (pattern recoginition)
        DIAGRAM:                             
                player1 path       ◄───sum2────►   
                ┌───┬───┬───┬───┬───┬───┬───┬───┐   
                │ xxxxxxxxxxxxxxxxx │   │   │   │   
                ┼───┼───┼───┼───┼──x┼───┼───┼───┼   
                │   │   │   │   │  xxxxxxxxxxxx │   
                └───┴───┴───┴───┴───┴───┴───┴───┘   
                ◄────sum1──────►   
        
        If we consider the path traversed by player1, it follows above pattern.
        So, player2 can only chose from sum1 or sum2. 

        Hence, we should consider all inflection point. and take best of sum1,sum2 amoung all.               
                                                   
*/


typedef long long int lli;

class Solution{
    
    public:
    long long gridGame(vector<vector<int>>& mat) {
        int sz = mat[0].size();
        lli sum1 = 0,sum2=0;

        for(int i=0;i<sz;i++)
            sum2+= mat[0][i];

        lli mn = LLONG_MAX;
        for(int i=0;i<sz;i++){
            cout<<"i: "<<i<<endl;

            // i is the inflection point
            //so sum1 =~ 0..i-1 , sum2 ~= i+1...s-1
            sum2 -= mat[0][i];

            mn = min(mn,max(sum1,sum2));
            sum1 += mat[1][i];

        }
        
        return mn;
    }
};


/* class Solution {
    int NRow,NCol;
    // Approach1 -> failed 
    lli findAns(int r,int c,vector<vector<int>>& mat,vector<vector<int>>& dir){
        if(r>=NRow || c>=NCol) return 0;

        if(r==1){
            dir[r][c] = 0; //0 horizontal, 1 vertical down
            return mat[r][c] + findAns(r,c+1,mat,dir);
        }

        int val1 = findAns(r,c+1,mat,dir);
        int val2 = findAns(r+1,c,mat,dir);

        dir[r][c] = (val1>val2)?0:1;
        printf("[%d,%d]: val1(%d), val2(%d) dir(%d)\n",r,c,val1,val2,dir[r][c]);
        return mat[r][c] + max(val1,val2);
    }

    

public:
    long long gridGame(vector<vector<int>>& mat) {
        NRow = 2;
        NCol = mat[0].size();

        vector<vector<int>> dir(NRow,vector<int>(NCol,0));

        findAns(0,0,mat,dir);;
        cout<<"path taken by player1 is\n";

        int r=0,c=0;

        mat[0][0] = mat[NRow-1][NCol-1] = 0;
        
        cout<<"dir mat is\n";
        for(int i=0;i<NRow;i++){
            for(int j=0;j<NCol;j++){
                if(dir[i][j]==0) cout<<"→ ";
                else cout<<"↓ ";
            }
            cout<<endl;
        }

        while(!(r==1 && c == NCol-1)){
            printf("(%d,%d): %d,%c\n",r,c,mat[r][c],dir[r][c]==0?'>':'d');
            if(dir[r][c] == 0)
                c++;
            else
                r++;
            
            //mark as 0 all visited value
            mat[r][c] = 0;
        }
        return findAns(0,0,mat,dir);
    }
};
*/
