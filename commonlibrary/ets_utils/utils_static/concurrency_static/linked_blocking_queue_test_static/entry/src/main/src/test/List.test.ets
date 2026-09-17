'use static';

import LinkedBlockingQueuetest from './LinkedBlockingQueuetest.test';
import LinkedBlockingQueueStressTest from './LinkedBlockingQueueStressTest.test';

export default function testsuite(): void {
  LinkedBlockingQueuetest()
  LinkedBlockingQueueStressTest()
}