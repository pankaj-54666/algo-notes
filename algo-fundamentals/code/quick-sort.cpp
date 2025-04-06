#include<vector>
#include<iostream>

class QuickSort
{
public:
    int partition(int l, int r,vector<int>&arr) {
        int pivot = arr[r];
        int i = l;
        
        for (int j = l; j < r; j++) {
            if (arr[j] <= pivot) { //move all samller element to left side
                my_swap(i,j,arr); //[0...i, unfiltered elements , pivote] j points to first element of unfiltered 
                i++;                //[0...i] is processed , and its less than pivote
            }
        }
        //[0...i-1] less than pivote
        //[i...r-1] greator than pivote
        //pivot at r, so move it to i
        my_swap(i, r,arr); //move pivote to ith index, so that all left side of it is smaller than it
        return i;
    }

    void quickSort(int l , int r,vector<int> &arr)
    {
        if(l>r) return;
        
        //Randonmanization
        int min = l,max = r;
        int randomIndex = rand()%(max-min + 1) + min;
        swap(arr[randomIndex],arr[r]);
        
        int p = partition(l,r,arr);
        
        //arr[p] is placed at correct place! so omit from both recursion
        quickSort(l,p-1,arr);
        quickSort(p+1,r,arr);
    }
};

int main(){
     
    QuickSort qs = QuickSort();
    qs.quickSort(0,arr.size()-1,arr);

    return 0;
}