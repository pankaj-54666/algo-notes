#include<vector>
#define cc if(0)
void my_swap(int i, int j, vector<int>&arr)
{
    int t = arr[i];
    arr[i] = arr[j];
    arr[j]=t;
}

class QuickSort
{
private:
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
        //[i...r] greator than pivote
        my_swap(i, r,arr); //move pivote to ith index, so that all left side of it is smaller than it
        return i;
    }

public:    
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


class Solution {
    
    void printArray(int *arr, int size)
    {
        cout<<"size = "<<size<<" :: ";
        for(int i=0;i<size;i++)
            cout<<arr[i]<<" ";
        cout<<endl;
    }
public:
    void merge(vector<int> &input, int l, int mid, int r)
  
    {
        //Merge two sorted array
        
        int left_size = (mid-l)+1;
        int right_size = (r-mid);
 cc     cout<<"l: mid: r: "<<l<<" "<<mid<<" "<<r<<endl;
        
        
        int left[left_size+1];
        int right[right_size+1];
        int i=0,j=0;
        
        for(i=0;i<left_size;i++)
            left[i] = input[l+i];
        
        for(j=0;j<right_size;j++)
            right[j] = input[mid+j+1];
        
        left[i++]=INT_MAX;
        right[j++]=INT_MAX;
        
     cc cout<<"left Array: ";
     cc printArray(left,left_size+1);
      cc  cout<<"right Array: ";
      cc  printArray(right,right_size+1);
        
        i=0;
        j=0;
        for(int k=l;k<=r;k++) //copy exactly (r-l) elements
        {
            int val = (left[i] <= right[j]) ? left[i++] : right[j++];
            input[k] = val;
        }
        
       cc printf("Final Array OverAll ");
        //printArray(input,input.size());
        #if 0
        for(int i=0;i<input.size();i++)
            cout<<input[i]<<" ";
        cout<<endl<<endl;
    #endif
    }
    void mergeSort(vector<int> &input, int l, int r)
    {
        
        if(l>=r)
            return;
        
        int mid = (l+r)/2;
        mergeSort(input,l,mid);
        mergeSort(input,mid+1,r);
        
        merge(input,l,mid,r);        
        
    }
    
    vector<int> sortArray(vector<int>& nums) 
    {
        
       // vector<int> ans(nums.size());
        
       // mergeSort(nums,0,nums.size()-1);

        QuickSort qs = QuickSort();
        qs.quickSort(0,nums.size()-1,nums);
        
        return nums;
        
    }
};
