import 'dart:math';

void main() {
  print(Solution().maxProfit([7,1,5,3,6,4])); // 5
  print(Solution().maxProfit([7,6,4,3,1])); // 0
}

class Solution {
  int maxProfit(final List<int> prices) {
    int minBuy = prices.first, maxProfit = 0;
    for (int to = 1; to < prices.length; to++) {
      minBuy = min(minBuy, prices[to]);
      maxProfit = max(maxProfit, prices[to]-minBuy);
    }
    return maxProfit;
  }

// int maxProfit(final List<int> prices) {
//   int maxProfit = 0;
//   for (int from = 0; from < prices.length; from++) {
//     for (int to = from+1; to < prices.length; to++) {
//       maxProfit = max(maxProfit, prices[to]-prices[from]);
//       // print('$from --> $to = ${prices[to]-prices[from]} max($maxProfit)');
//     }
//   }
//   return maxProfit;
// }
}
