```java
PriorityQueue<ListNode> pq = new PriorityQueue<>(lists.length, (a, b)->(a.val - b.val));
// 将 k 个链表的头结点加入最小堆
PriorityQueue<Integer> maxHeap = new PriorityQueue<Integer>(11,new Comparator<Integer>(){
    @Override
    public int compare(Integer i1,Integer i2){
        return i1-i2;
    }
});
add(E e);
clear();
Comparator<? super E> comparator();
contains(Object o);
offer(E e); 插入
poll(); 返回头节点并移除
peek(); 返回头节点
remove(Object o);
size();
```

```java
Stack<Integer> st = new Stack<Integer>();
empty();
peek( ); //查看堆栈顶部的对象，但不从堆栈中移除它。
pop();
push();
search();
empty();
```

```java
String ans = s.substring(0,1);
s.charAt(index);
```

```java
Map<Object, Object> map = new HashMap<>();
put(key,value);
get(key);
remove(key);
size();
isEmpty();
containsKey();
```

```java
Queue<Object> que = new LinkedList<>();
offer();//添加
poll();//空返回null
peek();//返回头部元素
isEmpty();
```

```java
// 实现Comparator接口
class MyComparator implements Comparator<Object> {
    @Override
    public int compare(Object o1, Object o2) {
        return o1 - o2;
    }
}
Comparator cmp = new MyComparator();
Arrays.sort(a, cmp);
```

```java
Set<Object> set = new HashSet<Object>();
add();
remove();
contains();
size();
clear();
isEmpty();
```

```java
List<Object> list = new ArrayList<>();
add();
remove(index);
get();
subList(1,4);
isEmpty();
set(index, element);
indexOf(element);
subList(fromIndex, toIndex);

ans = new ArrayList<List<Integer>>();
ans.add(new ArrayList<Integer>(temp));

List<int[]> merged = new ArrayList<int[]>();
return merged.toArray(new int[merged.size()][]);
```

