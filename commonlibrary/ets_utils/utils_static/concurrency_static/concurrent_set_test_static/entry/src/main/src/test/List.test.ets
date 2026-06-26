'use static'
/*
 * Copyright (c) 2026 RKH Corp.
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

import ConcurrentSetConstructorEmptyTest from './ConcurrentSetConstructorEmptyTest.test'
import ConcurrentSetConstructorArrayLikeTest from './ConcurrentSetConstructorArrayLikeTest.test'
import ConcurrentSetConstructorIterableTest from './ConcurrentSetConstructorIterableTest.test'
import ConcurrentSetConstructorReadonlySetTest from './ConcurrentSetConstructorReadonlySetTest.test'
import ConcurrentSetAddTest from './ConcurrentSetAddTest.test'
import ConcurrentSetHasTest from './ConcurrentSetHasTest.test'
import ConcurrentSetDeleteTest from './ConcurrentSetDeleteTest.test'
import ConcurrentSetClearTest from './ConcurrentSetClearTest.test'
import ConcurrentSetKeysTest from './ConcurrentSetKeysTest.test'
import ConcurrentSetValuesTest from './ConcurrentSetValuesTest.test'
import ConcurrentSetIteratorTest from './ConcurrentSetIteratorTest.test'
import ConcurrentSetEntriesTest from './ConcurrentSetEntriesTest.test'
import ConcurrentSetForEachTest from './ConcurrentSetForEachTest.test'
import ConcurrentSetToStringTest from './ConcurrentSetToStringTest.test'
import ConcurrentSetSizeTest from './ConcurrentSetSizeTest.test'
import ConcurrentSetHighConcurrencyTest from './ConcurrentSetHighConcurrencyTest.test'

export default function testsuite(): void {
  ConcurrentSetConstructorEmptyTest()
  ConcurrentSetConstructorArrayLikeTest()
  ConcurrentSetConstructorIterableTest()
  ConcurrentSetConstructorReadonlySetTest()
  ConcurrentSetAddTest()
  ConcurrentSetHasTest()
  ConcurrentSetDeleteTest()
  ConcurrentSetClearTest()
  ConcurrentSetKeysTest()
  ConcurrentSetValuesTest()
  ConcurrentSetIteratorTest()
  ConcurrentSetEntriesTest()
  ConcurrentSetForEachTest()
  ConcurrentSetToStringTest()
  ConcurrentSetSizeTest()
  ConcurrentSetHighConcurrencyTest()

}
