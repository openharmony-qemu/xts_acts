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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function atomicCharIsLockFreeTest():void {
  describe('atomicCharIsLockFreeTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicCharIsLockFreeTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_IS_LOCK_FREE_TEST_0100
     * @tc.desc   Verify AtomicChar.isLockFree() is a static method that requires no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharIsLockFreeTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = AtomicChar.isLockFree();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicCharIsLockFreeTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_IS_LOCK_FREE_TEST_0200
     * @tc.desc   Verify AtomicChar.isLockFree() returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharIsLockFreeTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result = AtomicChar.isLockFree();
      expect(result).assertTrue();
    });

    /**
     * @tc.name   atomicCharIsLockFreeTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_IS_LOCK_FREE_TEST_0300
     * @tc.desc   Verify AtomicChar.isLockFree() returns consistent result on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharIsLockFreeTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let result1 = AtomicChar.isLockFree();
      let result2 = AtomicChar.isLockFree();
      let result3 = AtomicChar.isLockFree();
      expect(result1).assertEqual(result2);
      expect(result2).assertEqual(result3);
    });

    /**
     * @tc.name   atomicCharIsLockFreeTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_CHAR_IS_LOCK_FREE_TEST_0400
     * @tc.desc   Verify AtomicChar.isLockFree() returns boolean value for implementation check
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicCharIsLockFreeTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let isLockFree = AtomicChar.isLockFree();
      expect(typeof isLockFree).assertEqual('boolean');
    });
  })
}
