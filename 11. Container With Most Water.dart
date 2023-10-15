import 'dart:math';

void main(){
  final List<int> height = [1,8,6,2,5,4,8,3,7];

  print(Solution().maxArea(height)); // 49
}

class Solution {
  int maxArea(List<int> height) {
    int i = 0, j = height.length-1;

    int maxArea = 0, area, idealHeight;
    while(i < j) {
      idealHeight = min(height[i], height[j]);
      area = idealHeight * (j - i);
      maxArea = max(maxArea, area);
      if(height[i] < height[j]) {
        i++;
      } else {
        j--;
      }
    }

    return maxArea;
  }
}