#include<iostream>
#include<string.h>
#include<stdlib.h>
using namespace std;
#define lson x*2 + 1
#define rson x*2 + 2

void print_array(int *arr, int size);

class MaxHeap{
	 int size;
    vector<int> harr;
	
public:
	void heapify(int);
	void build_heap();

    vector<int> heapSort();
	
	void print();
	MaxHeap(vector<int> arr);
		
};

vector<int> MaxHeap::heapSort(){

    while(size > 1){
        swap(harr[0], harr[size-1]); //start placing max element at end
        size--;

        heapify(0);
    }
    
    return harr;
}


MaxHeap::MaxHeap(vector<int> arr):size(arr.size()){
    
    harr = vector<int>(size,-1);

	for(int i=0;i<size;i++)
		harr[i]=arr[i];
	
	build_heap();
}

void MaxHeap::build_heap(){
	
    //need to heapify only non-leaf node.
    //now let say node k is leaf node => its left child should NOT exist => their left child will point outsie the array =>  2*k+1 > n
    //=> k>(n-1)/2 , Hence node for k<=(n-1)/2 all these are non-leaf nodes
	for(int i=((size-1)/2) ; i>=0 ; i--){
		heapify(i);
	}
}

void MaxHeap::heapify(int x){
	int largest=x;

/* at start, we need to find which is biggest amount these 3
             largest
                10
               /  \
             20    30
            lson   rson
*/

    
    if(lson < size && harr[lson] > harr[largest]) largest=lson;
	if(rson < size && harr[rson] > harr[largest]) largest=rson;

    if(largest == x) return; //its a perfect heap, root with x

    swap(harr[largest],harr[x]); 
    heapify(largest);
}

int main(){
    vector<int> arr{4,1,3,2,16,9,10,14,8,7};

	MaxHeap heap1(arr);
	cout<<"Printing the final sorted heap\n";
	
	heap1.print();

    auto sarr = heap1.heapSort();
    cout<<"sorted data is\n";
    for(auto k:sarr) cout<<k<<" ";
    cout<<endl;
	
	return 0;
}




void MaxHeap::print(){
	for(auto k:harr) cout<<k<<" ";
    cout<<endl;
}
