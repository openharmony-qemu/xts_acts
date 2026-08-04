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

interface IsLockFreeWithNumberParam {
  isLockFree: (a: number) => boolean;
}

interface IsLockFreeWithStringParam {
  isLockFree: (a: string) => boolean;
}

export default function AtomicByteIsLockFreeTest(): void {
  describe("AtomicByteIsLockFreeTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteIsLockFree0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_PARAM_TEST_0100
     * @tc.desc   Verify isLockFree with no parameters returns a value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteIsLockFree0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicByte.isLockFree();
      expect(result !== undefined).assertTrue();
      expect(typeof result).assertEqual('boolean');
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_ERROR_TEST_0200
     * @tc.desc   Verify isLockFree with extra number parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteIsLockFree0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(10);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let func = obj as IsLockFreeWithNumberParam;
        func.isLockFree(1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_ERROR_TEST_0300
     * @tc.desc   Verify isLockFree with extra string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteIsLockFree0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(10);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let func = obj as IsLockFreeWithStringParam;
        func.isLockFree("test");
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_RETURN_TEST_0400
     * @tc.desc   Verify isLockFree returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteIsLockFree0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicByte.isLockFree();
      expect(typeof result).assertEqual("boolean");
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_BASIC_TEST_0500
     * @tc.desc   Verify isLockFree returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteIsLockFree0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicByte.isLockFree();
      expect(result).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_RETURN_TEST_0600
     * @tc.desc   Verify isLockFree result can be assigned to boolean variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteIsLockFree0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicByte.isLockFree();
      expect(isLockFree).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_RETURN_TEST_0700
     * @tc.desc   Verify isLockFree result can be used in boolean expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicByte.isLockFree();
      expect(result === true).assertTrue();
      expect(result !== false).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_SPECIAL_TEST_0800
     * @tc.desc   Verify isLockFree returns same value on two consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1 = AtomicByte.isLockFree();
      let result2 = AtomicByte.isLockFree();
      expect(result1).assertEqual(result2);
    })
    /**
     * @tc.name   testAtomicByteIsLockFree0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_SPECIAL_TEST_0900
     * @tc.desc   Verify isLockFree returns same value on multiple calls in loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let firstResult = AtomicByte.isLockFree();
      for (let i = 0; i < 10; i++) {
        let result = AtomicByte.isLockFree();
        expect(result).assertEqual(firstResult);
      }
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_SPECIAL_TEST_1000
     * @tc.desc   Verify isLockFree returns same value before and after instance operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let resultBefore = AtomicByte.isLockFree();
      let atomicByte = new AtomicByte(10);
      atomicByte.store(20);
      atomicByte.fetchAdd(5);
      atomicByte.load();
      let resultAfter = AtomicByte.isLockFree();
      expect(resultBefore).assertEqual(resultAfter);
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_SPECIAL_TEST_1100
     * @tc.desc   Verify isLockFree returns same value from concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteIsLockFree1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let results1: boolean[] = [];
      let results2: boolean[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicByte.isLockFree());
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicByte.isLockFree());
        }
      };
      await Promise.all([task1(), task2()]);
      let expected = AtomicByte.isLockFree();
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(expected);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(expected);
      }
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_TYPE_TEST_1200
     * @tc.desc   Verify isLockFree result works in if statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicByte.isLockFree();
      if (result) {
        expect(result).assertTrue();
      } else {
        expect(result).assertFalse();
      }
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_TYPE_TEST_1300
     * @tc.desc   Verify isLockFree result works in ternary expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicByte.isLockFree();
      let label: string = result ? "lock-free" : "lock-based";
      expect(label).assertEqual("lock-free");
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_TYPE_TEST_1400
     * @tc.desc   Verify isLockFree result can be negated with not operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteIsLockFree1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicByte.isLockFree();
      let negated = !result;
      expect(negated).assertFalse();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_PERFORMANCE_TEST_1500
     * @tc.desc   Verify isLockFree single call completes within reasonable time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteIsLockFree1500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let result = AtomicByte.isLockFree();
      let end = Date.now();
      expect(result).assertTrue();
      expect(end - start < 1000).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_PERFORMANCE_TEST_1600
     * @tc.desc   Verify isLockFree multiple calls performance is consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteIsLockFree1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        AtomicByte.isLockFree();
      }
      let end = Date.now();
      expect(end - start < 5000).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_FUNCTION_TEST_1700
     * @tc.desc   Verify isLockFree used for algorithm selection decision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteIsLockFree1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicByte.isLockFree();
      let algorithm: string;
      if (isLockFree) {
        algorithm = "lock-free";
      } else {
        algorithm = "lock-based";
      }
      expect(algorithm).assertEqual("lock-free");
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_FUNCTION_TEST_1800
     * @tc.desc   Verify isLockFree used in conditional optimization logic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteIsLockFree1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicByte.isLockFree();
      let atomicByte = new AtomicByte(0);
      if (isLockFree) {
        atomicByte.fetchAdd(1);
      } else {
        atomicByte.store(1);
      }
      expect(atomicByte.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteIsLockFree1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_ISLOCKFREE_FUNCTION_TEST_1900
     * @tc.desc   Verify isLockFree combined with instance method operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteIsLockFree1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicByte.isLockFree();
      expect(isLockFree).assertTrue();
      let atomicByte = new AtomicByte(10);
      expect(atomicByte.load()).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
      let oldValue = atomicByte.fetchAdd(5);
      expect(oldValue).assertEqual(20);
      expect(atomicByte.load()).assertEqual(25);
    })  })
}
