//Pratice Link: https://cses.fi/problemset/task/1648/ (Dynamic Range Sum Queries)
#include <iostream>
#include<vector>
#include<bitset>
using namespace std;
#define cc if(0)
 
typedef long long int lli;
 
struct treeNode
{
    lli idx; // index of this node in inorder traversal of the tree (Inorder = LrR)
    lli val;
    lli lsum;
 
    
 
    treeNode *lson, *rson;
};
 
class FTN
{
public:
    treeNode *root;
 
    FTN()
    {
        //HARDCODING of tree skeleton
        root = new treeNode({4,0,0});
        root->lson = new treeNode({2,0,0});
        root->rson = new treeNode({6,0,0});
        
        root->lson->lson = new treeNode({1,0,0});
        root->lson->rson = new treeNode({3,0,0});
        
        root->rson->lson = new treeNode({5,0,0});
        root->rson->rson = new treeNode({7,0,0});
 
        /*  TO-DO: you can create a balanced BST from sorted array. 
            We will use this to create BALANCED BT structure. (Actaully for our answer we can use any binary tree. But making it balanced will limit the worst case to O(log)
        */
    }
 
    // update arr[idx] = val
    treeNode *update(treeNode *root, const lli idx, const lli val)
    {
        printf("idx: %lld\n",idx);
 
        if( root == nullptr)
            return new treeNode({0,0,0}); //return neutral node
 
        if (root->idx == idx)
        {
            root->val += val; //original array index update
            root->lsum += val;
 
            return root;
        }
 
        treeNode *child = nullptr; // or just child (but not binary tree child)
        if (idx < root->idx)       // idx exist on the left subtree
        {
            child = update(root->lson, idx, val);
        }
        else if (idx > root->idx)
        {
            child = update(root->rson, idx, val);
        }
 
        // now for current node, we know its left & right child (here we need to know one side only)
        if (root->lson == child)
        {
            root->lsum += val;
        }
 
        return root;
    }
 
    lli query(treeNode *root, lli idx)
    {
        if (root->idx == idx)
            return root->lsum;
        if (idx < root->idx)
            return query(root->lson, idx);
        if (idx > root->idx)
            return root->lsum + query(root->rson, idx);
    }
 
    //print inorder (noraml order of fenwick tree)
    void print(treeNode *root)
    {
        if(root == nullptr) return;
 
        print(root->lson);
 
        printf("tree[%lld]=(%lld,%lld)\n",root->idx,root->val,root->lsum);
 
        print(root->rson);
    }
};
 
inline lli getFirstAncestorForWhichCurrentNodeIsInLeftSideOfTheSubtree(lli idx)
{
    return  idx + (idx & (-idx)); //increments (clearing, but with carry to higher bits) the lowest-set bit of i.
}
inline lli getInorderPredessorTreeIndex(lli idx)
{
    return idx - (idx & (-idx)); //clears the lowest-set bit of i.
    
}
 
inline lli find_root(lli arraySize)
{
    //TASK: will be the node with equal or previous power of two
    //ANS: clear all bit except the MSB
 
   const lli x = arraySize;
#if 0
   if(x & (x-1) == 0) // if x = 1000 then (x-1 = 0111) => x* (x-1) = 0
        return x;
#endif    
    lli pos = 0;
    for(lli i=31;i>=0;i--) //for a int32 number c++
    {
        if( x & (1<<i))
        {
            pos = i;
            break;
        }
    }
 
    return 1<<pos;//previous power of two can be obtaiened by clearing all set bit except the MSB 
    
}
 
//printing inorder
// #define lson  _HOOK_REALLOC
inline lli left_child(lli x)
{
    //TASK: find rightmost set bit -> SHIFT it to right  by 1 place
    //ex: x = 010100, lx = 0100100
 
    lli p = x &(-x); //calcualte the rightmost set bit  //p=000100
    lli q = p>>1; //move the bit to right side by 1 position  //q= 000010
 
    lli lx = (~p) & x; //clear the rightmost set bit from x //(~p) = 111011 , lx = 010000
    lx = lx | q; //lx = 010000 | 000010 = 010010
 
    return lx; 
}
 
inline lli right_child(lli x)
{
    //TASK: find the rightmost set bit -> set the immediate rigth bit of this position
    //ex: (x)010100 -> (rx)01010
    
    //NOTE: if the case is like 0101 => this is the leaf node.
 
    lli p = x & (-x);
    lli q = p>>1;
 
    lli rx = x | q;
 
    return rx; 
}
 
lli isLeaf(lli x)
{
    return x&1; //if last bit is set => its a leaf
}
 
class FT{
    struct treeNode
    {
        lli idx; // index of this node in inorder traversal of the tree (Inorder = LrR)
        lli val;
        lli lsum;
    };
 
    vector<treeNode> tree;
    lli treeSize;
public:
    FT(vector<lli>& arr)
    {
        treeSize = arr.size()+1;
        tree = vector<treeNode>(treeSize);
    }
 
    void update(lli idx, lli val)
    {
     cc printf("update[%lld]=%lld :: ",idx,val);
        tree[idx].val += val;
 
        while(idx <= treeSize)
        {
    cc      printf("%lld-> ",idx); //print node update sequence (for better debugging purpose)
            tree[idx].lsum += val;
            idx = getFirstAncestorForWhichCurrentNodeIsInLeftSideOfTheSubtree(idx);
        }
    cc    cout<<endl;
    }
 
    lli query(lli idx)
    {
 
        lli sum = 0;
        lli p = 0;
        while(idx>0)
        {
     cc       printf("%lld-> ",idx); //print node access sequence (for better debugging purpose)
            sum += tree[idx].lsum;
            idx = getInorderPredessorTreeIndex(idx);            
        }
        
        return sum;
    }
 
    lli range_query(lli left,lli right)
    {
        return query(right) - query(left-1);
    }
 
        //print inorder (noraml order of fenwick tree)
    void print()
    {
        for(lli i=0;i<treeSize;i++)
            printf("tree[%lld]=(%lld,%lld)\n",i,tree[i].val,tree[i].lsum);
    }
 
 
    //call example: printTreeSkleteon(find_root(arraySize))
    void printTreeSkleteon(lli x)
    {
        if(isLeaf(x)) //if last bit is set => this is root node
        {
            printf("(%lld):L\n",x);
            return;
        }
 
        printTreeSkleteon(left_child(x)); //find the leftmost set bit -> shift it by one place to right ex: 01010 -> 01001
 
        cout<<"("<<x<<") "<<bitset<4>(x)<<"("<<bitset<4>(left_child(x))<<" "<<bitset<4>(right_child(x))<<")"<<endl;
        
 
        printTreeSkleteon(right_child(x));
    }
 
    void printInorderTree(lli x)
    {
        const lli &i = x;
 
        if(isLeaf(x)) //if last bit is set => this is root node
        {
            printf("tree[%lld]=(%lld,%lld):L\n",i,tree[i].val,tree[i].lsum);
            return;
        }
 
        printInorderTree(left_child(x)); //find the leftmost set bit -> shift it by one place to right ex: 01010 -> 01001
 
        
        printf("tree[%lld]=(%lld,%lld) \t::",x,tree[x].val,tree[x].lsum);
 
        //::node(lchild,rchild) :: binary_form_of_same
        printf("%lld(%lld,%lld)\t:",x,left_child(x),right_child(x));
        cout<<bitset<4>(x)<<"("<<bitset<4>(left_child(x))<<" "<<bitset<4>(right_child(x))<<")"<<endl;
    
 
 
        printInorderTree(right_child(x));
    }
};
 
void testNodeFenwickImplementation()
{
    FTN *ft = new FTN();
    vector<lli> arr = {5,1,15,11,52,28,0};
 
    // ft->update(ft->root, 1,5);
 
    for(lli i=0;i<arr.size();i++)
        ft->update(ft->root,i+1,arr[i]); //fenwick tree using 1-based-indexing
        //for tree case you can switch easily to 0-based-indexing (i have used 1 based as i drawn diagram using 1-based)
    
    printf("After update tree is\n");
    ft->print(ft->root);
 
    for(lli i=1;i<arr.size()+1;i++)
    {
        lli qres = ft->query(ft->root,i);
        printf("query[1,%lld] = %lld\n",i,qres);
    }
}
 
void testFenwickImplmemention()
{
    vector<lli> arr = {5,1,15,11,52,28,0};
 
    FT ft = FT(arr);
    for(lli i=0;i<arr.size();i++)
    {
        ft.update(i+1,arr[i]);
    }
 
    printf("\n\t\t::After update, the ft is\n");
    ft.print();
 
    cout<<"\n\t\t::Printing the tree in BinaryTree formate\n";
    cout<<"find_root: "<<find_root(arr.size())<<endl;
    ft.printInorderTree(find_root(arr.size()));
 
    cout<<"\t\t::Query Test\n";
    // printf("query[1,%lld] = %lld\n",3,ft.query(3));
     for(lli i=1;i<arr.size()+1;i++)
    {
        lli qres = ft.query(i);
        printf("query[1,%lld] = %lld\n",i,qres);
    }
 
}
 
void bitTesting()
{
    
    // for(lli idx=1;idx<10;idx++)
    // {
 
        
    //     lli par = (idx - (idx & (-idx)));
        
    //     cout<<bitset<5>(idx)<<"-"<<idx<<"  ::  "<<bitset<5>(par)<<"-"<<par<<endl;
    // }
 
 
    for(lli i=1;i<16;i++)
    {
        cout<<bitset<4>(i)<<"::"<<bitset<5>(left_child(i))<<" "<<bitset<5>(right_child(i))<<endl;
    }
}
 
 
void cses()
{
    // freopen("fenwick_input.txt","r+",stdin);
    lli arraySize,nQuery;
    cin>>arraySize>>nQuery;
    cc printf("arraySize:%lld, nQuery:%lld\n",arraySize,nQuery);
 
    vector<lli> arr;
    for(lli i=0;i<arraySize;i++)
    {
        lli temp;
        cin>>temp;
        arr.push_back(temp);
    }
 
 
    FT ft = FT(arr);
    for(lli i=0;i<arr.size();i++)
    {
        ft.update(i+1,arr[i]);
    }
 
cc    cout<<"\n\t:: tree after buildup is\n";
 cc   ft.printInorderTree(find_root(arr.size()));
    for(lli i=0;i<nQuery;i++)
    {
        lli op,a,b;
        cin>>op>>a>>b;
 
        if(op == 1)
        {
            ft.update(a,-arr[a-1]);
            ft.update(a,b);
            arr[a-1] = b;
 
         //   cout<<"After update\n"<<endl;
          //  ft.print();
        }
        else
        {
            lli qres = ft.range_query(a,b);
            cc printf("query(%lld,%lld) = %lld\n",a,b,qres);
            cout<<qres<<endl;
        }
    }
 
 
}
 
int main()
{
 
//    testFenwickImplmemention();
        cses();
 
 
 
    return 0;
}
 
//BIT hacks: https://graphics.stanford.edu/~seander/bithacks.html#DetermineIfPowerOf2