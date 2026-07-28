'use static';
import AtomicBoolConcurrentTest from './AtomicBoolConcurrentTest.test';
import AtomicIntConcurrentTest from './AtomicIntConcurrentTest.test';
import AtomicIntEAWorkerConcurrentTest from './AtomicIntEAWorkerConcurrentTest.test';

export default function atomicList(): void {
  AtomicBoolConcurrentTest();
  AtomicIntConcurrentTest();
  AtomicIntEAWorkerConcurrentTest();
}
