'use static';
import BlockingQueueConcurrentTest from './BlockingQueueConcurrentTest.test';
import BlockingQueueEAWorkerConcurrentTest from './BlockingQueueEAWorkerConcurrentTest.test';
import BlockingQueueStressConcurrentTest from './BlockingQueueStressConcurrentTest.test';
import ConcurrentHashMapConcurrentTest from './ConcurrentHashMapConcurrentTest.test';
import ConcurrentQueueConcurrentTest from './ConcurrentQueueConcurrentTest.test';
import ConcurrentSetConcurrentTest from './ConcurrentSetConcurrentTest.test';

export default function threadSafeContainerList(): void {
  BlockingQueueConcurrentTest();
  BlockingQueueEAWorkerConcurrentTest();
  BlockingQueueStressConcurrentTest();
  ConcurrentHashMapConcurrentTest();
  ConcurrentQueueConcurrentTest();
  ConcurrentSetConcurrentTest();
}
