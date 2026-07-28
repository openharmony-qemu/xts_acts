'use static';
import FixedArrayNoLockConcurrentTest from './FixedArrayNoLockConcurrentTest.test';
import MapMutexConcurrentTest from './MapMutexConcurrentTest.test';
import MapNoLockConcurrentTest from './MapNoLockConcurrentTest.test';
import MapRWLockConcurrentTest from './MapRWLockConcurrentTest.test';
import ResizableArrayEAWorkerConcurrentTest from './ResizableArrayEAWorkerConcurrentTest.test';
import ResizableArrayMutexConcurrentTest from './ResizableArrayMutexConcurrentTest.test';
import ResizableArrayNoLockConcurrentTest from './ResizableArrayNoLockConcurrentTest.test';
import ResizableArrayRWLockConcurrentTest from './ResizableArrayRWLockConcurrentTest.test';
import ResizableArrayStressConcurrentTest from './ResizableArrayStressConcurrentTest.test';
import ResizableArrayWorkerLocalConcurrentTest from './ResizableArrayWorkerLocalConcurrentTest.test';
import SetNoLockConcurrentTest from './SetNoLockConcurrentTest.test';

export default function containerList(): void {
  FixedArrayNoLockConcurrentTest();
  MapMutexConcurrentTest();
  MapNoLockConcurrentTest();
  MapRWLockConcurrentTest();
  ResizableArrayEAWorkerConcurrentTest();
  ResizableArrayMutexConcurrentTest();
  ResizableArrayNoLockConcurrentTest();
  ResizableArrayRWLockConcurrentTest();
  ResizableArrayStressConcurrentTest();
  ResizableArrayWorkerLocalConcurrentTest();
  SetNoLockConcurrentTest();
}
