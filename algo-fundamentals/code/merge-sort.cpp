#include <iostream>
#include <vector>

using namespace std;

void merge(vector<int> &input, int l, int mid, int r){
    // Merge two sorted array

    int left_size = (mid - l) + 1;
    int right_size = (r - (mid+1))+1;

    int left[left_size + 1];
    int right[right_size + 1];
    int i = 0, j = 0;

    for (i = 0; i < left_size; i++)
        left[i] = input[l + i];

    for (j = 0; j < right_size; j++)
        right[j] = input[(mid+1) + j];

    left[i++] = INT_MAX;
    right[j++] = INT_MAX;

    i = 0;j = 0;
    for (int k = l; k <= r; k++) // copy exactly (r-l+1) elements
    {
        int val = (left[i] <= right[j]) ? left[i++] : right[j++];
        input[k] = val;
    }
}

//merge [l,r] with both side inclusive
void mergeSort(vector<int> &input, int l, int r){
    if (l >= r) return;

    int mid = (l + r) / 2; //OR l + (r - l) / 2;
    mergeSort(input, l, mid);
    mergeSort(input, mid + 1, r);

    merge(input, l, mid, r);
}

int main(){
    mergeSort(nums,0,nums.size()-1);
    return 0;
}