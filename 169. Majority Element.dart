
void main () {
  print(Solution().majorityElement([3,2,3])); // 3
  print(Solution().majorityElement([2,2,1,1,1,2,2])); // 2
}

class Solution {

  // Moore's Voting Algorithm
  int majorityElement (final List<int> nums) {
    int majority = nums.first, frequency = 0;

    for (int n in nums) {
      if (majority == n) {
        frequency++;
      } else {
        frequency--;
        if (frequency <= 0) {
          majority = n;
        }
      }
    }

    return majority;
  }
}

// class Solution {
//   int majorityElement (final List<int> nums) {
//     final int majority = (nums.length / 2).ceil();
//     final Map<int, int> map = {};
//     for (final int n in nums) {
//       if (map.containsKey(n)) {
//         map[n] = map[n]! + 1;
//         if (map[n]! >= majority) {
//           return n;
//         }
//       } else {
//         map[n] = 1;
//       }
//     }
//     return -1;
//   }
// }
