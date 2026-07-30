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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium';
import Utils from '../Util.test';

export default function atomicBooleanStoreTest():void {
  describe('atomicBooleanStoreTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanStoreTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0100
     * @tc.desc   Verify AtomicBoolean.store() with required parameter - store true value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanStoreTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      atomicBoolean.store(true);
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanStoreTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0200
     * @tc.desc   Verify AtomicBoolean.store() with required parameter - store false value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanStoreTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      atomicBoolean.store(false);
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanStoreTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0300
     * @tc.desc   Verify AtomicBoolean.store() returns void
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanStoreTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const result = atomicBoolean.store(true);
      expect(result).assertEqual(undefined);
    });

    /**
     * @tc.name   atomicBooleanStoreTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0400
     * @tc.desc   Verify AtomicBoolean.store() multiple consecutive stores
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanStoreTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      atomicBoolean.store(true);
      expect(atomicBoolean.load()).assertTrue();
      atomicBoolean.store(false);
      expect(atomicBoolean.load()).assertFalse();
      atomicBoolean.store(true);
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanStoreTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0500
     * @tc.desc   Verify AtomicBoolean.store() overwrites previous value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanStoreTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      atomicBoolean.store(false);
      expect(atomicBoolean.load()).assertFalse();
      atomicBoolean.store(true);
      expect(atomicBoolean.load()).assertTrue();
    });
    /**
     * @tc.name   atomicBooleanStoreTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0600
     * @tc.desc   Verify AtomicBoolean.store() concurrent write stores valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanStoreTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicBoolean.store(true);
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          atomicBoolean.store(false);
        }
      };

      await Promise.all([task1(), task2()]);

      const finalValue = atomicBoolean.load();
      expect(typeof finalValue).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanStoreTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_STORE_TEST_0700
     * @tc.desc   Verify AtomicBoolean.store() concurrent read and write returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanStoreTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const readResults: boolean[] = [];

      const readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicBoolean.load());
        }
      };

      const writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          atomicBoolean.store(i % 2 === 0);
        }
      };

      await Promise.all([readTask(), writeTask()]);

      expect(readResults.length).assertEqual(100);
      for (let i = 0; i < readResults.length; i++) {
        expect(typeof readResults[i]).assertEqual('boolean');
      }
    });
  });
}
