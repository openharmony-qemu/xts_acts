'use static';
/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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

import MutexLockTest from "./MutexLock.test";
import RWLockTest from "./RWLock.test";
import CombLockTest from "./CombLock.test";
import MutexLockEnhancedTest from "./MutexLockEnhanced.test";
import RWLockEnhancedTest from "./RWLockEnhanced.test";
import CombLockEnhancedTest from "./CombLockEnhanced.test";
import LockDesignDistributedLockProcessTest from './lockDesign/LockDesignDistributedLockProcessTest.test'
import LockDesignAsyncOperationTest from './lockDesign/LockDesignAsyncOperationTest.test'
import LockDesignProducerConsumerTest from './lockDesign/LockDesignProducerConsumerTest.test'
import LockDesignReadWriteCacheTest from './lockDesign/LockDesignReadWriteCacheTest.test'
import LockDesignResourcePoolConnectionTest from './lockDesign/LockDesignResourcePoolConnectionTest.test'
import LockDesignSpecialBusinessTransactionTest from './lockDesign/LockDesignSpecialBusinessTransactionTest.test'
import LockComboTest from './lockFactor/LockComboTest.test'
import LockFactorCallbackTest from './lockFactor/LockFactorCallbackTest.test'
import LockFactorConcurrentTest from './lockFactor/LockFactorConcurrentTest.test'
import LockFactorNestingTest from './lockFactor/LockFactorNestingTest.test'
import LockFactorStressTest from './lockFactor/LockFactorStressTest.test'
import MutexConstructorTest from './mutex/MutexConstructorTest.test'
import MutexLockSubTest from './mutex/MutexLockTest.test'
import MutexUnlockTest from './mutex/MutexUnlockTest.test'
import ReadLockLockTest from './readLock/ReadLockLockTest.test'
import ReadLockUnlockTest from './readLock/ReadLockUnlockTest.test'
import RWLockConstructorTest from './rwLock/RWLockConstructorTest.test'
import RWLockReadLockTest from './rwLock/RWLockReadLockTest.test'
import RWLockWriteLockTest from './rwLock/RWLockWriteLockTest.test'
import WriteLockLockTest from './writeLock/WriteLockLockTest.test'
import WriteLockUnlockTest from './writeLock/WriteLockUnlockTest.test'
export default function testsuite(): void {
  MutexLockTest()
  RWLockTest()
  CombLockTest()
  MutexLockEnhancedTest()
  RWLockEnhancedTest()
  CombLockEnhancedTest()
  LockDesignDistributedLockProcessTest()
  LockDesignAsyncOperationTest()
  LockDesignProducerConsumerTest()
  LockDesignReadWriteCacheTest()
  LockDesignResourcePoolConnectionTest()
  LockDesignSpecialBusinessTransactionTest()
  LockComboTest()
  LockFactorCallbackTest()
  LockFactorConcurrentTest()
  LockFactorNestingTest()
  LockFactorStressTest()
  MutexConstructorTest()
  MutexLockSubTest()
  MutexUnlockTest()
  ReadLockLockTest()
  ReadLockUnlockTest()
  RWLockConstructorTest()
  RWLockReadLockTest()
  RWLockWriteLockTest()
  WriteLockLockTest()
  WriteLockUnlockTest()
}
