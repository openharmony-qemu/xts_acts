'use static';
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

import { describe, it, expect, TestType, Level, Size } from '../../../hypium/index';

export default function AsyncLockOptionsParameterizedConstructorTest(): void {
  describe('AsyncLockOptionsParameterizedConstructorTest', (): void => {

    /**
     * @tc.name    testAsyncLockOptionsParameterizedConstructor0100
     * @tc.number  SUB_ASYNCLOCK_OPTIONS_PARAMETERIZED_CONSTRUCTOR_TEST_0100
     * @tc.desc    Verify maximum parameter count boundary
     * @tc.type    FUNCTION
     * @tc.size    MEDIUMTEST
     * @tc.level   LEVEL1
     */
    it('testAsyncLockOptionsParameterizedConstructor0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
      let s: AbortSignal<string> = { aborted: false, reason: "test" };
      let options = new AsyncLockOptions<string>(false, s, 3000);
      expect(options.timeout).assertEqual(3000);
      expect(options.signal).not().assertNull();
    });

  });
}
