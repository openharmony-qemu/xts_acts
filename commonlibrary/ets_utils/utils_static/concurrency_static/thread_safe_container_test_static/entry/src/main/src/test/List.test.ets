import ConcurrentHashMapTest from './ConcurrentHashMap.test';
import ArrayBlockingQueuetest from './ArrayBlockingQueue.test';
import LinkedBlockingQueuetest from './LinkedBlockingQueuetest.test';
import ConcurrentSetTest from "./ConcurrentSet.test";

export default function testsuite() {
  LinkedBlockingQueuetest()
  ConcurrentHashMapTest()
  ArrayBlockingQueuetest()
  ConcurrentSetTest()
}