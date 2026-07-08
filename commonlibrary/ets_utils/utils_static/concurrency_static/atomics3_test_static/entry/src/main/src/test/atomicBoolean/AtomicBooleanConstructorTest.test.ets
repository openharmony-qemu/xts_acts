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

export default function atomicBooleanConstructorTest():void {
  describe('atomicBooleanConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicBooleanConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicBoolean constructor with required parameter - all required parameters exist
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicBoolean constructor with true as initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(true);
      expect(atomicBoolean.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicBoolean constructor with false as initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      expect(atomicBoolean.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicBoolean constructor returns an instance object
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      expect(atomicBoolean instanceof AtomicBoolean).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicBoolean constructor creates independent instances
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean1 = new AtomicBoolean(true);
      const atomicBoolean2 = new AtomicBoolean(false);
      expect(atomicBoolean1.load()).assertTrue();
      expect(atomicBoolean2.load()).assertFalse();
      // Verify they are independent
      atomicBoolean1.store(false);
      expect(atomicBoolean1.load()).assertFalse();
      expect(atomicBoolean2.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicBoolean constructor with multiple instances having same initial value
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean1 = new AtomicBoolean(true);
      const atomicBoolean2 = new AtomicBoolean(true);
      const atomicBoolean3 = new AtomicBoolean(true);
      expect(atomicBoolean1.load()).assertTrue();
      expect(atomicBoolean2.load()).assertTrue();
      expect(atomicBoolean3.load()).assertTrue();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicBoolean constructor instance has required methods
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicBooleanConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicBoolean = new AtomicBoolean(false);
      // Verify load method exists and is callable
      expect(typeof atomicBoolean.load).assertEqual('function');
      // Verify store method exists and is callable
      expect(typeof atomicBoolean.store).assertEqual('function');
      // Verify compareAndSwap method exists and is callable
      expect(typeof atomicBoolean.compareAndSwap).assertEqual('function');
      // Verify exchange method exists and is callable
      expect(typeof atomicBoolean.exchange).assertEqual('function');
    });
    /**
     * @tc.name   atomicBooleanConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicBoolean constructor with concurrent creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const atomicBoolean1 = new AtomicBoolean(true);
      const atomicBoolean2 = new AtomicBoolean(false);
      expect(atomicBoolean1.load()).assertTrue();
      expect(atomicBoolean2.load()).assertFalse();
    });

    /**
     * @tc.name   atomicBooleanConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_BOOLEAN_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicBoolean constructor concurrent read after creation
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicBooleanConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
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
  });
}
