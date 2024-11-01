
import 'dart:math';

void main() {
  print(Solution().largestRectangleArea([2,1,5,6,2,3]));  // 10
  print(Solution().largestRectangleArea([2,4]));  // 4
}

class Solution {
  int largestRectangleArea(final List<int> heights) {
    int maxArea = 0;

    final List<int> monotonicIncrementStack = [];
    for (int i = 0; i <= heights.length; i++) {

      while (monotonicIncrementStack.isNotEmpty && (i == heights.length || heights[i] <= heights[monotonicIncrementStack.peak()])) {
        final int height = heights[monotonicIncrementStack.pop()];
        final int width = monotonicIncrementStack.isNotEmpty? i - monotonicIncrementStack.peak() - 1: i;
        maxArea = max(maxArea, height * width);
      }

      monotonicIncrementStack.push(i);
    }

    return maxArea;
  }
}

extension Stack<T> on List<T> {

  void push(final T element) => add(element);

  T pop() {
    final T top = last;
    removeLast();
    return top;
  }

  T peak() => last;
}