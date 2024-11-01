
void main() {
  print(Solution().groupAnagrams(['eat','tea','tan','ate','nat','bat'])); // [['bat'],['nat','tan'],['ate','eat','tea']]
  print(Solution().groupAnagrams(['']));  //  [['']]
  print(Solution().groupAnagrams(['a'])); //  [['a']]
}

class Solution {
  List<List<String>> groupAnagrams(final List<String> strs) {
    final List<List<String>> powerSets = [];
    final Set<String> set = strs.toSet();
    for (final String str in strs) {
      final List<String> powerSet = [];
      _permutations(set, str.split(''), 0, powerSet);
      if (powerSet.isNotEmpty) {
        powerSets.add(powerSet);
      }
    }
    return powerSets;
  }

  void _permutations(final Set<String> set, List<String> wordList, final int startIndex, final List<String> powerSet) {
    if (startIndex == wordList.length) {
      final String word = wordList.join('');
      if (set.contains(word)) {
        powerSet.add(word);
        set.remove(word);
      }
      return;
    }

    for (int i = startIndex; i < wordList.length; i++) {
      _swap(wordList, i, startIndex);
      _permutations(set, wordList, startIndex+1, powerSet);
      _swap(wordList, i, startIndex);
    }
  }

  void _swap(final List<String> word, final int i, final int j) {
    final String tmp = word[i];
    word[i] = word[j];
    word[j] = tmp;
  }
}