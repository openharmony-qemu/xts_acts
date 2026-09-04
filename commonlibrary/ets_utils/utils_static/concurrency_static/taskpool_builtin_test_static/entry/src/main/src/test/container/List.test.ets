'use static';
/*
 * Copyright (c) 2026 RKH Corp.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
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
