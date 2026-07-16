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

export default function atomicShortConstructorTest(): void {
  describe('atomicShortConstructorTest', () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicShortConstructorTest0100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0100
     * @tc.desc   Verify AtomicShort constructor with all required parameters present (value 3)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortConstructorTest0200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0200
     * @tc.desc   Verify AtomicShort constructor with positive value (100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(100);
      expect(atomicShort.load()).assertEqual(100);
    });

    /**
     * @tc.name   atomicShortConstructorTest0300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0300
     * @tc.desc   Verify AtomicShort constructor with zero value (0)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(0);
      expect(atomicShort.load()).assertEqual(0);
    });

    /**
     * @tc.name   atomicShortConstructorTest0400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0400
     * @tc.desc   Verify AtomicShort constructor with negative value (-100)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-100);
      expect(atomicShort.load()).assertEqual(-100);
    });

    /**
     * @tc.name   atomicShortConstructorTest0500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0500
     * @tc.desc   Verify AtomicShort constructor with max boundary value (32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(32767);
      expect(atomicShort.load()).assertEqual(32767);
    });

    /**
     * @tc.name   atomicShortConstructorTest0600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0600
     * @tc.desc   Verify AtomicShort constructor with min boundary value (-32768)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32768);
      expect(atomicShort.load()).assertEqual(-32768);
    });

    /**
     * @tc.name   atomicShortConstructorTest0700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0700
     * @tc.desc   Verify AtomicShort constructor with small positive value (50)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(50);
      expect(atomicShort.load()).assertEqual(50);
    });

    /**
     * @tc.name   atomicShortConstructorTest0800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0800
     * @tc.desc   Verify AtomicShort constructor returns AtomicShort instance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(3);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortConstructorTest0900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_0900
     * @tc.desc   Verify AtomicShort constructor with medium value (500)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(500);
      expect(atomicShort.load()).assertEqual(500);
    });

    /**
     * @tc.name   atomicShortConstructorTest1000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1000
     * @tc.desc   Verify AtomicShort constructor immediate method usage after construction
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(1);
      expect(atomicShort.load()).assertEqual(1);
      atomicShort.store(2);
      expect(atomicShort.load()).assertEqual(2);
    });

    /**
     * @tc.name   atomicShortConstructorTest1100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1100
     * @tc.desc   Verify AtomicShort constructor single call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortConstructorTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const start: number = Date.now();
      const atomicShort = new AtomicShort(3);
      const end: number = Date.now();
      const duration: number = end - start;

      expect(atomicShort.load()).assertEqual(3);
      expect(duration >= 0).assertTrue();
    });

    /**
     * @tc.name   atomicShortConstructorTest1200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1200
     * @tc.desc   Verify AtomicShort constructor compatibility with different ArkTS versions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('atomicShortConstructorTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      const atomicShort = new AtomicShort(3);
      expect(atomicShort.load()).assertEqual(3);
    });

    /**
     * @tc.name   atomicShortConstructorTest1300
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1300
     * @tc.desc   Verify AtomicShort.isLockFree() static method returns boolean
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const isLockFree: boolean = AtomicShort.isLockFree();
      expect(typeof isLockFree).assertEqual('boolean');
    });

    /**
     * @tc.name   atomicShortConstructorTest1400
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1400
     * @tc.desc   Verify AtomicShort constructor for medium value initialization (value 200)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortConstructorTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const mediumValue = new AtomicShort(200);
      expect(mediumValue.load()).assertEqual(200);
    });

    /**
     * @tc.name   atomicShortConstructorTest1500
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1500
     * @tc.desc   Verify AtomicShort constructor for large value initialization (value 300)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortConstructorTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const largeValue = new AtomicShort(300);
      expect(largeValue.load()).assertEqual(300);
    });

    /**
     * @tc.name   atomicShortConstructorTest1600
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1600
     * @tc.desc   Verify AtomicShort constructor for small negative value initialization (value -50)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortConstructorTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const negativeValue = new AtomicShort(-50);
      expect(negativeValue.load()).assertEqual(-50);
    });

    /**
     * @tc.name   atomicShortConstructorTest1700
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1700
     * @tc.desc   Verify AtomicShort constructor for port number initialization (value 8080)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicShortConstructorTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      const port = new AtomicShort(8080);
      expect(port.load()).assertEqual(8080);
    });

    /**
     * @tc.name   atomicShortConstructorTest1800
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1800
     * @tc.desc   Verify AtomicShort constructor with near max boundary value (32766)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(32766);
      expect(atomicShort.load()).assertEqual(32766);
    });

    /**
     * @tc.name   atomicShortConstructorTest1900
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_1900
     * @tc.desc   Verify AtomicShort constructor with near max boundary value (32765)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(32765);
      expect(atomicShort.load()).assertEqual(32765);
    });

    /**
     * @tc.name   atomicShortConstructorTest2000
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_2000
     * @tc.desc   Verify AtomicShort constructor with near min boundary value (-32767)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32767);
      expect(atomicShort.load()).assertEqual(-32767);
    });

    /**
     * @tc.name   atomicShortConstructorTest2100
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_2100
     * @tc.desc   Verify AtomicShort constructor with near min boundary value (-32766)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32766);
      expect(atomicShort.load()).assertEqual(-32766);
    });

    /**
     * @tc.name   atomicShortConstructorTest2200
     * @tc.number SUB_BUILTINS_ATOMIC_SHORT_CONSTRUCTOR_TEST_2200
     * @tc.desc   Verify AtomicShort constructor with near min boundary value (-32765)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('atomicShortConstructorTest2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      const atomicShort = new AtomicShort(-32765);
      expect(atomicShort.load()).assertEqual(-32765);
    });
  })
}
