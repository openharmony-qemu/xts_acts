'use static';
import EAWorkerConcurrentTest from './EAWorkerConcurrentTest.test';
import LongTaskConcurrentTest from './LongTaskConcurrentTest.test';
import TaskPoolConcurrentTest from './TaskPoolConcurrentTest.test';

export default function asyncTaskList(): void {
  EAWorkerConcurrentTest();
  LongTaskConcurrentTest();
  TaskPoolConcurrentTest();
}
