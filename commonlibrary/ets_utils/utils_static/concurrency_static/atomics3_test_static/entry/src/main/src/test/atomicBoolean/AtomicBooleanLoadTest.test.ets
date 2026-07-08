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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function atomicBooleanLoadTest():void {
  describe('atomicBooleanLoadTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanLoadTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0100
     * @tc.desc   Verify AtomicBoolean.load() requires no parameters and returns false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanLoadTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const value = atomicBoolean.load();
      expect(value).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanLoadTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0200
     * @tc.desc   Verify AtomicBoolean.load() returns true when initialized with true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanLoadTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const value = atomicBoolean.load();
      expect(value).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanLoadTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0300
     * @tc.desc   Verify AtomicBoolean.load() return type is boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanLoadTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      const result = atomicBoolean.load();
      expect(typeof result).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicBooleanLoadTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0400
     * @tc.desc   Verify AtomicBoolean.load() reads updated value after store
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanLoadTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      atomicBoolean.store(true);
      const value = atomicBoolean.load();
      expect(value).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanLoadTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0500
     * @tc.desc   Verify AtomicBoolean.load() multiple consecutive reads return same value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanLoadTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const value1 = atomicBoolean.load();
      const value2 = atomicBoolean.load();
      const value3 = atomicBoolean.load();
      expect(value1).assertTrue();
      expect(value2).assertTrue();
      expect(value3).assertTrue();
    });
    /**
     * @tc.name   atomicBooleanLoadTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0600
     * @tc.desc   Verify AtomicBoolean.load() concurrent read returns consistent value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanLoadTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      const results1: boolean[] = [];
      const results2: boolean[] = [];

      const task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicBoolean.load());
        }
      };

      const task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicBoolean.load());
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertTrue();
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertTrue();
      }
    });

    /**
     * @tc.name   atomicBooleanLoadTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_LOAD_TEST_0700
     * @tc.desc   Verify AtomicBoolean.load() concurrent read and write returns valid boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanLoadTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
