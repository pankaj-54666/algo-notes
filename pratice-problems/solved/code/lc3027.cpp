#define cc if(0)
// #define DEBUG
struct Point{
    int x,y;
};

#define INF INT_MIN

class Solution {
public:
    int numberOfPairs(vector<vector<int>>& arr) 
    {
        int size =arr.size();
        vector<Point> vec;
        for(int i=0;i<arr.size();i++)
        {
            vec.push_back({arr[i][0],arr[i][1]});
        }
        
        sort(vec.begin(),vec.end(),
            [](Point &lhs,Point &rhs){
                if(lhs.x < rhs.x) return true;
                if(lhs.x > rhs.x) return false;
                return lhs.y > rhs.y;
            });
        
        int count = 0;
#ifdef DEBUG
        cout<<"Sorted data is\n";
        for(auto k:vec)
            printf("(%d,%d) ",k.x,k.y);
        cout<<endl<<endl;
#endif
        
        for(int i=0;i<size;i++)
        {
            Point p1 = vec[i];
            
            int my = INF; //max y
            for(int j=i+1;j<size;j++)
            {
                Point p2 = vec[j];
                
     cc           printf("(%d,%d),(%d,%d)\n",p1.x,p1.y,p2.x,p2.y);
                if(p2.y > p1.y)
                    continue;
                if(p2.y <= my)
                    continue;
                
                // printf("(%d,%d),(%d,%d)\n",p1.x,p1.y,p2.x,p2.y);
                
                count++;
                my = p2.y;
            }
        }
        
        return count;

    }
};