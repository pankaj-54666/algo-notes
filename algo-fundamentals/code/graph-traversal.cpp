#include<iostream>
#include<vector>
using namespace std;

enum{
    WHITE,GRAY,BLACK
};

struct graphNode{
    int v;
    int wt;
};

class Graph{
    int V;
    vector<vector<graphNode>> adj;

public:
    Graph(int V)
    {
        this->V = V;
        adj = vector<vector<graphNode>>(V,vector<graphNode>());
    }

    void addEdge(int u,int v,int wt)
    {
        adj[u].push_back({v,wt});
    }


    void dfs(int u,int& time,vector<int>&visited,vector<int>&stime,vector<int>&etime,vector<int>&parent)
    {
        if(visited[u] != WHITE) 
            return;

        visited[u] = GRAY;
        stime[u] = time++; 

        for(auto [v,wt]:adj[u])
        {
           if(visited[v] == WHITE) /*v not yet visited*/
           {
                parent[v] = u; //track the dfs forest
                dfs(v,time,visited,stime,etime,parent);
           }
           else if(visited[v] == GRAY) /*v is still exploring*/
           {
                //it's a cross-edge 
           }
           else /*v is already explored*/
           {
                //its a back-edge 
           }
        }

        visited[u] = BLACK;
        etime[u] = time++; 
    }

};
/* Observe:
(a) time is ++ each time its recorded, and not when dfs is called.
*/

int main()
{
    return 0;
}