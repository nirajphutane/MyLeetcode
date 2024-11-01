
import 'dart:collection';

void main() {
  final LRUCache lruCache = LRUCache(2);
  lruCache.put(1, 1);
  lruCache.put(2, 2);
  print(lruCache.get(1));   // 1
  lruCache.put(3, 3);
  print(lruCache.get(2));   // null
  lruCache.put(4, 4);
  print(lruCache.get(1));   // null
  print(lruCache.get(3));   // 3
  print(lruCache.get(4));   // 4
}

final class Data extends LinkedListEntry<Data> {
  final int key;
  final int value;
  Data(this.key, this.value);
}

class LRUCache {

  final int capacity;
  final Map<int, Data> _map = {};
  final LinkedList<Data> _linkedList = LinkedList();

  LRUCache(this.capacity);

  int? get(final int key) {
    if (_map.containsKey(key)) {
      _linkedList.remove(_map[key]!);
      _linkedList.addFirst(_map[key]!);
    }
    return _map[key]?.value;
  }

  void put(final int key, final int value) {
    _map[key] = Data(key, value);
    if (_linkedList.length < capacity) {
      _linkedList.addFirst(_map[key]!);
    } else {
      _map.remove(_linkedList.last.key);
      _linkedList.remove(_linkedList.last);
      _linkedList.addFirst(_map[key]!);
    }
  }
}
