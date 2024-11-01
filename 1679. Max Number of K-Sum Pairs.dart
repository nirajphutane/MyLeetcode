
void main(){
  print(Solution().maxOperations([1,2,3,4], 5));
}

class Solution {
  int maxOperations(List<int> nums, int k) {
    int start = 0, end = nums.length -1, count = 0;

    nums.sort();
    while(start < end) {
      int sum = nums[start] + nums[end];
      if(sum == k) {
        count++;
        start++;
        end--;
      } else if(sum < k) {
        start++;
      } else {
        end--;
      }
    }

    return count;
  }
}
