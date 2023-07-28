#include <iostream>
#include <unordered_map>
#include <algorithm>
#include <stdio.h>
#include <string.h>
#include <memory.h>
#include <math.h>
#define MAX_KEY 64
#define MAX_TABLE 12005
using namespace std;
 
typedef struct
{
    char key[MAX_KEY + 1];
    int data;
} Hash;
Hash tb[MAX_TABLE];
 
unsigned long Hashe(const char *str)
{
    unsigned long hash = 5381;
    int c;
 
    while (c = *str++)
    {
        hash = (((hash << 5) + hash) + c) % MAX_TABLE;
    }
 
    return hash % MAX_TABLE;
}
 
int findmap(const char *key)
{
    unsigned long h = Hashe(key);
    int cnt = MAX_TABLE;
 
    while (tb[h].key[0] != 0 && cnt--)
    {
        if (strcmp(tb[h].key, key) == 0)
        {
            return tb[h].data;
        }
        h = (h + 1) % MAX_TABLE;
    }
    return -1;
}
 
int addmap(const char *key, int *data)
{
    unsigned long h = Hashe(key);
 
    while (tb[h].key[0] != 0)
    {
        if (strcmp(tb[h].key, key) == 0)
        {
            return 0;
        }
 
        h = (h + 1) % MAX_TABLE;
    }
    strcpy(tb[h].key, key);
    tb[h].data = *data;
    return 1;
}
 
struct node
{
    int parent;
    int level;
    int jumpparent;
} arr[12005];
int cnt;
 
const int n = 1000020;
 
/*
struct treeNode
{
    int mx;
    int lazy;
};
class ST
{
    vector<treeNode> tree;
    int arraySize,treeSize;
 
public:
    ST(int size)
    {
        this->arraySize = size;
        this->treeSize = 4*size + 10;
 
        tree = vector<treeNode>(treeSize);
    }
 
    void push_down(int idx, int left, int right)
    {
        if (tree[idx].lazy != 0)
        {
            tree[idx].mx += tree[idx].lazy;
            if (left != right)
            {
                tree[2 * idx + 1].lazy += tree[idx].lazy;
                tree[2 * idx + 2].lazy += tree[idx].lazy;
            }
            tree[idx].lazy = 0;
        }
    }
 
    // update(0, 0, n, 0, mDeathday,1);
    void update(int idx, int left, int right, int start, int end, int value)
    {
 
        if (right < start || end < left)
        {
            return;
        }
        push_down(idx, left, right);
        if (start <= left && right <= end)
        {
            tree[idx].lazy += value;
            return;
        }
        update(2 * idx + 1, left, left + ((right - left) >> 1), start, end, value);
        update(2 * idx + 2, left + ((right - left) >> 1) + 1, right, start, end, value);
 
        tree[idx].mx = max(tree[2 * idx + 1].mx, tree[2 * idx + 2].mx);
    }
 
    // query(0,0,n,mDay,mDay);
    int query(int idx, int left, int right, int start, int end)
    {
 
        if (right < start || end < left)
        {
            return -1;
        }
        push_down(idx, left, right);
        if (start <= left && right <= end)
        {
            return tree[idx].mx;
        }
        int q1 = query(2 * idx + 1, left, left + ((right - left) >> 1), start, end);
        int q2 = query(2 * idx + 2, left + ((right - left) >> 1) + 1, right, start, end);
        return max(q1, q2);
    }
};
*/
 
 
 
class ST
{
    struct treeNode
    {
        int mx;
        int lazy;
    };
    vector<treeNode> tree;
    int arraySize, treeSize;
 
public:
    ST(int size)
    {
        this->arraySize = size;
        this->treeSize = 4 * arraySize + 10;
        tree = vector<treeNode>(treeSize);
    }
 
    void update(int idx, int left, int right, const int START, const int END, int value)
    {
 
        if (right < START || END < left)
        {
            return;
        }
        push_down(idx, left, right);
        if (START <= left && right <= END)
        {
            tree[idx].lazy += value;
            return;
        }
        update(2 * idx + 1, left, left + ((right - left) >> 1), START, END, value);
        update(2 * idx + 2, left + ((right - left) >> 1) + 1, right, START, END, value);
 
        tree[idx].mx = max(tree[2 * idx + 1].mx, tree[2 * idx + 2].mx);
    }
 
    int query(int idx, int left, int right, const int START, const int END)
    {
 
        if (right < START || END < left)
        {
            return -1;
        }
        push_down(idx, left, right);
        if (START <= left && right <= END)
        {
            return tree[idx].mx;
        }
        int q1 = query(2 * idx + 1, left, left + ((right - left) >> 1), START, END);
        int q2 = query(2 * idx + 2, left + ((right - left) >> 1) + 1, right, START, END);
        return max(q1, q2);
    }
 
private:
    void push_down(int idx, int left, int right)
    {
        if (tree[idx].lazy != 0)
        {
            tree[idx].mx += tree[idx].lazy;
            if (left != right)
            {
                tree[2 * idx + 1].lazy += tree[idx].lazy;
                tree[2 * idx + 2].lazy += tree[idx].lazy;
            }
            tree[idx].lazy = 0;
        }
    }
};
 
class STN
{
    struct treeNode
    {
        int mx;
        int lazy;
 
        treeNode *lson{};
        treeNode *rson{};
    };
 
public:
    treeNode *root;
    int arraySize, treeSize;
 
 
    STN(int size)
    {
        this->arraySize = size;
        this->treeSize = 4 * arraySize + 10;
        root = new treeNode();
    }
 
    void update(treeNode *node, int left, int right, const int START, const int END, int value)
    {
 
        if (right < START || END < left)
        {
            return;
        }
       
        push_down(node, left, right);
        if (START <= left && right <= END)
        {
            node->lazy += value;
            return;
        }
       
        update(node->lson, left, left + ((right - left) >> 1), START, END, value);
        update(node->rson, left + ((right - left) >> 1) + 1, right, START, END, value);
 
        node->mx = max(node->lson->mx, node->rson->mx);
    }
    int query(treeNode *node, int left, int right, const int START, const int END)
    {
 
        if (right < START || END < left)
        {
            return -1;
        }
        push_down(node, left, right);
        if (START <= left && right <= END)
        {
            return node->mx;
        }
        int q1 = query(node->lson, left, left + ((right - left) >> 1), START, END);
        int q2 = query(node->rson, left + ((right - left) >> 1) + 1, right, START, END);
        return max(q1, q2);
    }
    treeNode* update_two(treeNode *node, int left, int right, const int START, const int END, int value)
    {
        if(node == nullptr) return  new treeNode(); //return neutral node
 
        if (right < START || END < left) return new treeNode(); //return neutral node
        
        push_down(node, left, right);
        if (START <= left && right <= END)
        {
            node->lazy += value;
            return node;
        }
 
        auto lhs = update_two(node->lson, left, left + ((right - left) >> 1), START, END, value);
        auto rhs = update_two(node->rson, left + ((right - left) >> 1) + 1, right, START, END, value);
 
        // printf("(%d,%d)\n",lhs->mx,rsh->mx);
        auto res = combine(node->lson,node->rson);
        // OR auto res = combine(lhs,rhs);
        node->mx = res->mx;
        return node;
    }
 
    treeNode *query_two(treeNode *node, int left, int right, const int START, const int END)
    {
        if (node == nullptr)
            return new treeNode(); // return neutral node
        if(right < START || END<left) return new treeNode({-1,0,nullptr,nullptr});
 
        push_down(node, left, right);
        if (START <= left && right <= END)
        {
            return node;
        }

        auto lhs = query_two(node->lson, left, left + ((right - left) >> 1), START, END);
        auto rhs = query_two(node->rson, left + ((right - left) >> 1) + 1, right, START, END);
 
        return combine(lhs, rhs);
    }
 
private:
    void push_down(treeNode *node, int left, int right)
    {
        if(node->lson  == nullptr)
            node->lson = new treeNode();
        if(node->rson == nullptr)
            node->rson = new treeNode();
 
        if (node->lazy != 0) 
        {
           node->mx += node->lazy;
            if (left != right)
            {
                node->lson->lazy += node->lazy;
                node->rson->lazy += node->lazy;
            }
           node->lazy = 0;
        }
    }
 
    treeNode* combine(treeNode *lhs, treeNode *rhs)
    {
        treeNode *res = new treeNode();
        res->mx = max(lhs->mx,rhs->mx);
        return res;
    }
};
 
 
int blksize;
 
// ST st = ST(n);
STN *stn =  nullptr;
void init(char mAncestor[], int mDeathday)
{
    blksize = sqrt(2000);
    memset(tb, 0, sizeof(tb));
    cnt = 0;
    // memset(tree, 0, sizeof(tree));
    addmap(mAncestor, &cnt);
    arr[cnt].parent = 0;
    arr[cnt].level = 0;
    arr[cnt].jumpparent = cnt;
 
    // st = ST(n); // TO-DO: we will do memmory optimized later
    stn = new STN(n);
    // st.update(0, 0, n, 0, mDeathday, 1);
  cc  printf("\n\t\t::INIT\n");
    // stn->update(stn->root, 0, n, 0, mDeathday, 1);
    stn->update_two(stn->root, 0, n, 0, mDeathday, 1);
 
    cnt++;
    return;
}
 
int add(char mName[], char mParent[], int mBirthday, int mDeathday)
{
 cc   printf("\n\t\t::ADD\n");
    addmap(mName, &cnt);
    int parent = findmap(mParent);
    arr[cnt].parent = parent;
    arr[cnt].level = arr[parent].level + 1;
    if (arr[cnt].level % blksize == 0)
    {
        arr[cnt].jumpparent = parent;
    }
    else
    {
        arr[cnt].jumpparent = arr[parent].jumpparent;
    }
    // st.update(0, 0, n, mBirthday, mDeathday, 1);
    // stn->update(stn->root,0,n,mBirthday,mDeathday,1);
    stn->update_two(stn->root,0,n,mBirthday,mDeathday,1);
    return arr[cnt++].level;
}
 
int distance(char mName1[], char mName2[])
{
    register int temp1 = findmap(mName1);
    register int temp2 = findmap(mName2);
    register int ans = 0;
    if (temp1 == 0)
    {
        return arr[temp2].level;
    }
    if (temp2 == 0)
    {
        return arr[temp1].level;
    }
 
    while (arr[temp1].jumpparent != arr[temp2].jumpparent)
    {
        if (arr[temp1].level < arr[temp2].level)
        {
            int count = (arr[temp2].level % blksize) + 1;
            ans += count;
            temp2 = arr[temp2].jumpparent;
        }
        else
        {
            int count = (arr[temp1].level % blksize) + 1;
            ans += count;
            temp1 = arr[temp1].jumpparent;
        }
    }
    while (temp1 != temp2)
    {
        if (arr[temp1].level == arr[temp2].level)
        {
            temp2 = arr[temp2].parent;
            temp1 = arr[temp1].parent;
            ans += 2;
        }
        else if (arr[temp1].level < arr[temp2].level)
        {
            temp2 = arr[temp2].parent;
            ans++;
        }
        else
        {
            temp1 = arr[temp1].parent;
            ans++;
        }
    }
    return ans;
}
 
int count(int mDay)
{
 cc   printf("\n\t\t::QUERY\n");
    // return st.query(0, 0, n, mDay, mDay);
    // return stn->query(stn->root, 0, n, mDay, mDay);
    return stn->query_two(stn->root, 0, n, mDay, mDay)->mx;
}