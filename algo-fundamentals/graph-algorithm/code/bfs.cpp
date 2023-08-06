#include<iostream>
#include<vector>
#include<queue>
#define INF INT_MAX/2

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

    void bfs(int start)
    {
        queue<int> q;
        vector<int> visited(V,0);

        q.push(start);

        while(!q.empty())
        {
            for(int i=0;i<q.size();i++)//process level by level
            {
                int u = q.front();
                q.pop();
                visited[u] = true;

                for(auto [v,wt]:adj[u])
                {
                    if(visited[v] == false)
                    {
                        q.push(v);
                    }
                }
            }
        }
    }

    void dijkastra(int s)
    {
        struct queueNode{
            int v;
            int dis;

            bool operator < (const queueNode& rhs) const{
                if(this->dis < rhs.dis) return true;
                return this->v < rhs.v;
            }
        };

        priority_queue<queueNode,vector<queueNode>> pq;

        vector<int> dis(V,INF);
        vector<int> parent(V,-1);

        pq.push({s,0});
        dis[s] = 0;
        parent[s] = -1;

        while(!pq.empty())
        {
            for(int i=0;i<pq.size();i++)
            {
                auto [u,tdist] = pq.top();
                pq.pop();

                if(tdist > dis[u]) //less distance option is already found & and inserted to pq, skip processing of u this time, and processs when they both match.
                    continue; 

                for(auto [v,wt]:adj[u])
                {
                    if(dis[u]+wt < dis[v]) //time to revisit this node
                    {
                        dis[v] = dis[u] + wt;
                        pq.push({v,dis[v]});
                    }
                }
            }
        }
    }
};

int main()
{


    return 0;
}