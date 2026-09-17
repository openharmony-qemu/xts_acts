'use static';

import ArrayBlockingQueuetest from './ArrayBlockingQueue.test';
import ArrayBlockingQueueStressTest from './ArrayBlockingQueueStressTest.test';

export default function testsuite(): void {
  ArrayBlockingQueuetest()
  ArrayBlockingQueueStressTest()
}
