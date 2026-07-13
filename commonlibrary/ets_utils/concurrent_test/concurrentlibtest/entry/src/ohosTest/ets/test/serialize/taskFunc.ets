/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { ArrayList, HashMap, HashSet, LinkedList, List, taskpool, TreeSet } from '@kit.ArkTS';

export class TestClass {
  value: number;

  constructor(value: number) {
    this.value = value;
  }
}

export class TestClassWithContainers {
  arrayList: ArrayList<string> = new ArrayList();
  hashMap: HashMap<string, number> = new HashMap();
  hashSet: HashSet<number> = new HashSet();
  treeSet: TreeSet<number> = new TreeSet(treeSetComparator);
  linkedList: LinkedList<string> = new LinkedList();
  list: List<string> = new List();

  constructor() {
  }
}

@Concurrent
export function traverseContainAllContainers(clas: TestClassWithContainers): TestClassWithContainers {
  // ArrayList operations
  clas.arrayList.clear();
  clas.arrayList.add('1');
  clas.arrayList.add('2');
  clas.arrayList.add('3');
  clas.arrayList.remove('2');

  // HashMap operations
  clas.hashMap.clear();
  clas.hashMap.set('a', 1);
  clas.hashMap.set('b', 2);
  clas.hashMap.set('c', 3);
  clas.hashMap.remove('b');

  // HashSet operations
  clas.hashSet.clear();
  clas.hashSet.add(1);
  clas.hashSet.add(2);
  clas.hashSet.add(3);
  clas.hashSet.remove(2);

  // TreeSet operations
  clas.treeSet.clear();
  clas.treeSet.add(1);
  clas.treeSet.add(2);
  clas.treeSet.add(3);
  clas.treeSet.remove(2);

  // LinkedList operations
  clas.linkedList.clear();
  clas.linkedList.add('1');
  clas.linkedList.add('2');
  clas.linkedList.add('3');
  clas.linkedList.remove('2');

  // List operations
  clas.list.clear();
  clas.list.add('1');
  clas.list.add('2');
  clas.list.add('3');
  clas.list.remove('2');

  return clas
}
@Sendable
function treeSetComparator(a: number, b: number): boolean {
  return a > b;
}
@Sendable
export function treeSetComparator3(a: TestClass, b: TestClass): boolean {
  return a.value > b.value;
}
@Sendable
function treeSetComparator2(a: number, b: number): boolean {
  return a < b;
}

@Concurrent
function traverseArrayListAllInterfaces(list: ArrayList<number>): ArrayList<number> {
  list.add(4);
  list.add(5);
  list.insert(100, 1);
  const has100 = list.has(100);
  const has999 = list.has(999);
  const idx1 = list.getIndexOf(100);
  const lastIdx1 = list.getLastIndexOf(100);
  const isEmpty1 = list.isEmpty();
  const len1 = list.length;
  list.remove(2);
  list.removeByIndex(0);
  list.removeByRange(0, 1);
  list.replaceAllElements((value: number, index?: number): number => value + 1);
  list.forEach((value: number, index?: number) => {
    console.info(`ArrayList forEach: ${index} - ${value}`);
  });
  list.sort((a: number, b: number): number => a - b);
  const subList = list.subArrayList(0, 2);
  const cloned = list.clone();
  const capacity = list.getCapacity();
  const arr = list.convertToArray();
  list.increaseCapacityTo(20);
  list.trimToCurrentLength();
  const elem0 = list[0];
  list.clear();
  list.add(1);
  list.add(2);
  list.add(3);
  return list;
}

@Concurrent
function traverseHashMapAllInterfaces(map: HashMap<string, number>): HashMap<string, number> {
  map.set('d', 4);
  map.set('e', 5);
  const isEmpty1 = map.isEmpty();
  const hasKeyA = map.hasKey('a');
  const hasKeyD = map.hasKey('d');
  const hasValue1 = map.hasValue(1);
  const hasValue999 = map.hasValue(999);
  const valA = map.get('a');
  const newMap = new HashMap<string, number>();
  newMap.set('x', 10);
  map.setAll(newMap);
  map.remove('a');
  const replaced = map.replace('b', 20);
  const keys = map.keys();
  const values = map.values();
  const entries = map.entries();
  const len1 = map.length;
  map.forEach((value?: number, key?: string) => {
    console.info(`HashMap forEach: ${key} - ${value}`);
  });
  map.clear();
  map.set('x', 1);
  map.set('y', 2);
  map.set('z', 3);
  return map;
}

@Concurrent
function traverseHashSetAllInterfaces(set: HashSet<number>): HashSet<number> {
  set.add(4);
  set.add(5);
  const isEmpty1 = set.isEmpty();
  const has1 = set.has(1);
  const has999 = set.has(999);
  const len1 = set.length;
  set.remove(1);
  const values = set.values();
  const entries = set.entries();
  set.forEach((value?: number, key?: number) => {
    console.info(`HashSet forEach: ${value}`);
  });
  set.clear();
  set.add(10);
  set.add(20);
  set.add(30);
  return set;
}

@Concurrent
function traverseTreeSetAllInterfaces(set: TreeSet<number>): TreeSet<number> {
  set.add(4);
  set.add(0);
  const isEmpty1 = set.isEmpty();
  const has1 = set.has(1);
  const has999 = set.has(999);
  const len1 = set.length;
  const first = set.getFirstValue();
  const last = set.getLastValue();
  const lower = set.getLowerValue(3);
  const higher = set.getHigherValue(3);
  set.remove(1);
  set.popFirst();
  set.popLast();
  const values = set.values();
  const entries = set.entries();
  set.forEach((value?: number, key?: number) => {
    console.info(`TreeSet forEach: ${value}`);
  });
  set.clear();
  set.add(1);
  set.add(2);
  set.add(3);
  return set;
}

@Concurrent
function traverseLinkedListAllInterfaces(list: LinkedList<number>): LinkedList<number> {
  list.add(4);
  list.add(5);
  list.insert(2, 100);
  list.addFirst(999);
  taskpool.Task.sendData(list)
  const elem0 = list.get(0);
  const has100 = list.has(100);
  const has999 = list.has(999);
  const idx100 = list.getIndexOf(100);
  const lastIdx100 = list.getLastIndexOf(100);
  const first = list.getFirst();
  const last = list.getLast();
  list.remove(2);
  list.removeByIndex(0);
  list.removeFirst();
  list.removeLast();
  if (list.has(100)) {
    list.removeFirstFound(100);
  }
  if (list.has(100)) {
    list.removeLastFound(100);
  }
  const replaced = list.set(0, 888);
  list.forEach((value: number, index?: number) => {
    console.info(`LinkedList forEach: ${index} - ${value}`);
  });
  const cloned = list.clone();
  const arr = list.convertToArray();
  const len1 = list.length;
  list.clear();
  list.add(1);
  list.add(2);
  list.add(3);
  return list;
}

@Concurrent
function traverseListAllInterfaces(list: List<number>): List<number> {
  list.add(4);
  list.add(5);
  list.insert(100, 1);
  const elem0 = list.get(0);
  const isEmpty1 = list.isEmpty();
  const has100 = list.has(100);
  const has999 = list.has(999);
  const idx100 = list.getIndexOf(100);
  const lastIdx100 = list.getLastIndexOf(100);
  const first = list.getFirst();
  const last = list.getLast();
  list.remove(2);
  list.removeByIndex(0);
  const replaced = list.set(0, 888);
  const isEqual = list.equal(new List<number>());
  list.forEach((value: number, index?: number) => {
    console.info(`List forEach: ${index} - ${value}`);
  });
  list.sort((a: number, b: number): number => a - b);
  const subList = list.getSubList(0, 2);
  list.replaceAllElements((value: number, index?: number): number => value + 1);
  const arr = list.convertToArray();
  const len1 = list.length;
  list.clear();
  list.add(10);
  list.add(20);
  list.add(30);
  return list;
}

@Concurrent
function objectTaskFunc(obj: object) {
  taskpool.Task.sendData(obj);
  return obj;
}

@Concurrent
function arrayListTaskFunc(list: ArrayList<number>): ArrayList<number> {
  list.add(4);
  return list;
}

@Concurrent
function hashMapTaskFunc(map: HashMap<string, number>): HashMap<string, number> {
  map.set('b', 2);
  return map;
}

@Concurrent
function hashSetTaskFunc(set: HashSet<number>): HashSet<number> {
  set.add(2);
  return set;
}

@Concurrent
function arrayListTask(list: ArrayList<number>): ArrayList<number> {
  list.add(4);
  list.remove(2);
  list.sort((a: number, b: number): number => a - b);
  const cloned = list.clone();
  return cloned;
}

@Concurrent
function hashMapTask(map: HashMap<string, number>): HashMap<string, number> {
  map.set('d', 4);
  map.remove('a');
  return map;
}

@Concurrent
function hashSetTask(set: HashSet<number>): HashSet<number> {
  set.add(4);
  set.remove(1);
  return set;
}

@Concurrent
function treeSetTask(set: TreeSet<number>): TreeSet<number> {
  set.add(4);
  set.add(0);
  set.remove(1);
  return set;
}



@Concurrent
function linkedListTask(list: LinkedList<number>): number {
  list.add(4);
  list.remove(2);
  list.add(5);
  return list.length;
}

@Concurrent
function listTask(list: List<number>): List<number> {
  list.add(4);
  return list;
}



@Concurrent
function concurrentReadWrite(list: ArrayList<number>): number {
  list.add(100);
  return list.length;
}

@Concurrent
function concurrentLoopTask(list: ArrayList<number>): ArrayList<number> {
  list.add(list.length);
  return list;
}

@Concurrent
function linkedListTaskSend(list: LinkedList<number>): LinkedList<number> {
  list.add(4);
  list.remove(2);
  taskpool.Task.sendData(list);
  list.add(5);
  return list;
}

export {
  traverseArrayListAllInterfaces,
  traverseHashMapAllInterfaces,
  traverseHashSetAllInterfaces,
  traverseTreeSetAllInterfaces,
  traverseLinkedListAllInterfaces,
  traverseListAllInterfaces,
  objectTaskFunc,
  arrayListTaskFunc,
  hashMapTaskFunc,
  hashSetTaskFunc,
  arrayListTask,
  hashMapTask,
  hashSetTask,
  treeSetTask,
  linkedListTask,
  listTask,
  concurrentReadWrite,
  concurrentLoopTask,
  linkedListTaskSend,
  treeSetComparator,
  treeSetComparator2
};