
import 'dart:math';

void main() {
  print(Solution().maxArea([1,8,6,2,5,4,8,3,7])); // 49
  print(Solution().maxArea([1,1])); // 1
}

class Solution {
  int maxArea(final List<int> height) {
    int maxArea = 0, low = 0, high = height.length-1;
    while (low < high) {
      final int area = min(height[low], height[high]) * (high - low);
      maxArea = max(maxArea, area);
      if (height[low] < height[high]) {
        low++;
      } else {
        high--;
      }
    }
    return maxArea;
  }
}