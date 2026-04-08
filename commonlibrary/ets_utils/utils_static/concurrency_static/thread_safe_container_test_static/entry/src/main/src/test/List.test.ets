import ArrayBlockingQueuetest from './ArrayBlockingQueue.test';
import LinkedBlockingQueuetest from './LinkedBlockingQueuetest.test';
import ArrayBlockingQueueStressTest from './ArrayBlockingQueueStressTest.test';
import LinkedBlockingQueueStressTest from './LinkedBlockingQueueStressTest.test';

export default function testsuite() {
  LinkedBlockingQueuetest()
  ArrayBlockingQueuetest()
  ArrayBlockingQueueStressTest()
  LinkedBlockingQueueStressTest()
}