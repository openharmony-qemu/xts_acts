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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../../hypium/index';
import Utils from '../Util.test';

interface IsLockFreeWithNumberParam {
  isLockFree: (a: number) => boolean;
}

interface IsLockFreeWithStringParam {
  isLockFree: (a: string) => boolean;
}

export default function AtomicFloatIsLockFreeTest(): void {
  describe("AtomicFloatIsLockFreeTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0100
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_PARAM_TEST_0100
     * @tc.desc   Verify AtomicFloat.isLockFree with no parameters returns boolean value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatIsLockFree0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicFloat.isLockFree();
      expect(result !== undefined).assertTrue();
      expect(typeof result).assertEqual('boolean');
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0200
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_ERROR_TEST_0200
     * @tc.desc   Verify AtomicFloat.isLockFree with extra number parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatIsLockFree0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let func = obj as IsLockFreeWithNumberParam;
        func.isLockFree(1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0300
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_ERROR_TEST_0300
     * @tc.desc   Verify AtomicFloat.isLockFree with extra string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatIsLockFree0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let errorThrown = false;
      try {
        let obj: Object = atomicFloat;
        let func = obj as IsLockFreeWithStringParam;
        func.isLockFree("test");
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0400
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_RETURN_TEST_0400
     * @tc.desc   Verify AtomicFloat.isLockFree returns boolean type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatIsLockFree0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicFloat.isLockFree();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0500
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_BASIC_TEST_0500
     * @tc.desc   Verify AtomicFloat.isLockFree returns true indicating lock-free implementation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatIsLockFree0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicFloat.isLockFree();
      expect(result).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0600
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_RETURN_TEST_0600
     * @tc.desc   Verify AtomicFloat.isLockFree result can be assigned to boolean variable
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatIsLockFree0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let isLockFree: boolean = AtomicFloat.isLockFree();
      expect(isLockFree).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0700
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_RETURN_TEST_0700
     * @tc.desc   Verify AtomicFloat.isLockFree result can be used in boolean expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicFloat.isLockFree();
      expect(result === true).assertTrue();
      expect(result !== false).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0800
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_SPECIAL_TEST_0800
     * @tc.desc   Verify AtomicFloat.isLockFree returns same value on two consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result1 = AtomicFloat.isLockFree();
      let result2 = AtomicFloat.isLockFree();
      expect(result1).assertEqual(result2);
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree0900
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_SPECIAL_TEST_0900
     * @tc.desc   Verify AtomicFloat.isLockFree returns same value on multiple calls in loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let firstResult = AtomicFloat.isLockFree();
      for (let i = 0; i < 10; i++) {
        let result = AtomicFloat.isLockFree();
        expect(result).assertEqual(firstResult);
      }
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1000
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_SPECIAL_TEST_1000
     * @tc.desc   Verify AtomicFloat.isLockFree returns same value before and after instance operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let resultBefore = AtomicFloat.isLockFree();
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      atomicFloat.store(Double.toFloat(20.5));
      atomicFloat.fetchAdd(Double.toFloat(5.5));
      atomicFloat.load();
      let resultAfter = AtomicFloat.isLockFree();
      expect(resultBefore).assertEqual(resultAfter);
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1100
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_SPECIAL_TEST_1100
     * @tc.desc   Verify AtomicFloat.isLockFree returns same value from concurrent calls
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatIsLockFree1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let results1: boolean[] = [];
      let results2: boolean[] = [];
      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(AtomicFloat.isLockFree());
        }
      };
      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(AtomicFloat.isLockFree());
        }
      };
      await Promise.all([task1(), task2()]);
      let expected = AtomicFloat.isLockFree();
      for (let i = 0; i < results1.length; i++) {
        expect(results1[i]).assertEqual(expected);
      }
      for (let i = 0; i < results2.length; i++) {
        expect(results2[i]).assertEqual(expected);
      }
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1200
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_TYPE_TEST_1200
     * @tc.desc   Verify typeof AtomicFloat.isLockFree result is boolean
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicFloatIsLockFree1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let result = AtomicFloat.isLockFree();
      expect(typeof result).assertEqual("boolean");
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1300
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_TYPE_TEST_1300
     * @tc.desc   Verify AtomicFloat.isLockFree result works in if statement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicFloat.isLockFree();
      if (result) {
        expect(result).assertTrue();
      } else {
        expect(result).assertFalse();
      }
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1400
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_TYPE_TEST_1400
     * @tc.desc   Verify AtomicFloat.isLockFree result works in ternary expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicFloat.isLockFree();
      let label: string = result ? "lock-free" : "lock-based";
      expect(label).assertEqual("lock-free");
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1500
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_TYPE_TEST_1500
     * @tc.desc   Verify AtomicFloat.isLockFree result can be negated with not operator
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicFloatIsLockFree1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let result = AtomicFloat.isLockFree();
      let negated = !result;
      expect(negated).assertFalse();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1600
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_PERFORMANCE_TEST_1600
     * @tc.desc   Verify AtomicFloat.isLockFree single call completes within reasonable time
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatIsLockFree1600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let result = AtomicFloat.isLockFree();
      let end = Date.now();
      expect(result).assertTrue();
      expect(end - start < 1000).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1700
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_PERFORMANCE_TEST_1700
     * @tc.desc   Verify AtomicFloat.isLockFree multiple calls performance is consistent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicFloatIsLockFree1700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      for (let i = 0; i < 1000; i++) {
        AtomicFloat.isLockFree();
      }
      let end = Date.now();
      expect(end - start < 5000).assertTrue();
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1800
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_FUNCTION_TEST_1800
     * @tc.desc   Verify AtomicFloat.isLockFree used for algorithm selection decision
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatIsLockFree1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicFloat.isLockFree();
      let algorithm: string;
      if (isLockFree) {
        algorithm = "lock-free";
      } else {
        algorithm = "lock-based";
      }
      expect(algorithm).assertEqual("lock-free");
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree1900
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_FUNCTION_TEST_1900
     * @tc.desc   Verify AtomicFloat.isLockFree used in conditional optimization logic
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatIsLockFree1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicFloat.isLockFree();
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      if (isLockFree) {
        atomicFloat.fetchAdd(Double.toFloat(1.5));
      } else {
        atomicFloat.store(Double.toFloat(1.5));
      }
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   testAtomicFloatIsLockFree2000
     * @tc.number SUB_BUILTINS_ATOMIC_FLOAT_ISLOCKFREE_FUNCTION_TEST_2000
     * @tc.desc   Verify AtomicFloat.isLockFree combined with instance method operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicFloatIsLockFree2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let isLockFree = AtomicFloat.isLockFree();
      expect(isLockFree).assertTrue();
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
      atomicFloat.store(Double.toFloat(20.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(20.5));
      let oldValue = atomicFloat.fetchAdd(Double.toFloat(5.5));
      expect(oldValue).assertEqual(Double.toFloat(20.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(26.0));
    })
  })
}
