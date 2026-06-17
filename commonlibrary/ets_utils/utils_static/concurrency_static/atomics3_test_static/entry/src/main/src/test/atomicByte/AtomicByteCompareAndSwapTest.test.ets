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

interface CompareAndSwapNoParam {
  compareAndSwap: () => byte;
}

interface CompareAndSwapOneParam {
  compareAndSwap: (a: byte) => byte;
}

interface CompareAndSwapObjectFirst {
  compareAndSwap: (a: Object, b: byte) => byte;
}

interface CompareAndSwapObjectSecond {
  compareAndSwap: (a: byte, b: Object) => byte;
}

interface CompareAndSwapNumberFirst {
  compareAndSwap: (a: number, b: byte) => byte;
}

interface CompareAndSwapStringFirst {
  compareAndSwap: (a: string, b: byte) => byte;
}

export default function AtomicByteCompareAndSwapTest(): void {
  describe("AtomicByteCompareAndSwapTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteCompareAndSwap0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_PARAM_TEST_0100
     * @tc.desc   Verify compareAndSwap with all required parameters (expected matches current value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.compareAndSwap(5, 2);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(2);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_0200
     * @tc.desc   Verify compareAndSwap returns expected when current value equals expected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.compareAndSwap(5, 10);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_RETURN_TEST_0300
     * @tc.desc   Verify compareAndSwap returns actual old value when current value does not equal expected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.compareAndSwap(10, 20);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EDGE_TEST_0400
     * @tc.desc   Verify compareAndSwap with expected at byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.compareAndSwap(127, 0);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EDGE_TEST_0500
     * @tc.desc   Verify compareAndSwap with expected at byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.compareAndSwap(-128, 0);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(0);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_0600
     * @tc.desc   Verify compareAndSwap with expected value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.compareAndSwap(0, 10);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(10);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_0700
     * @tc.desc   Verify compareAndSwap with negative expected value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      let oldValue = atomicByte.compareAndSwap(-50, 10);

      expect(oldValue).assertEqual(-50);
      expect(atomicByte.load()).assertEqual(10);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EDGE_TEST_0800
     * @tc.desc   Verify compareAndSwap with val at byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.compareAndSwap(0, 127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(127);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EDGE_TEST_0900
     * @tc.desc   Verify compareAndSwap with val at byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.compareAndSwap(0, -128);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-128);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_1000
     * @tc.desc   Verify compareAndSwap with val value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.compareAndSwap(10, 0);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(0);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_1100
     * @tc.desc   Verify compareAndSwap with negative val value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.compareAndSwap(10, -50);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(-50);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_TYPE_TEST_1200
     * @tc.desc   Verify compareAndSwap return value type is byte
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.compareAndSwap(5, 10);

      expect(Number.isInteger(oldValue)).assertTrue();
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_OPER_TEST_1300
     * @tc.desc   Verify compareAndSwap with consecutive operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      // First operation: 0 -> 1
      let oldValue1 = atomicByte.compareAndSwap(0, 1);
      expect(oldValue1).assertEqual(0);
      expect(atomicByte.load()).assertEqual(1);

      // Second operation: 1 -> 2
      let oldValue2 = atomicByte.compareAndSwap(1, 2);
      expect(oldValue2).assertEqual(1);
      expect(atomicByte.load()).assertEqual(2);

      // Third operation: 2 -> 3
      let oldValue3 = atomicByte.compareAndSwap(2, 3);
      expect(oldValue3).assertEqual(2);
      expect(atomicByte.load()).assertEqual(3);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_OPER_TEST_1400
     * @tc.desc   Verify compareAndSwap retry pattern - fail then succeed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      // First attempt: fail, return actual old value 0
      let oldValue = atomicByte.compareAndSwap(1, 2);
      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(0);

      // Retry with correct expected value: succeed
      oldValue = atomicByte.compareAndSwap(0, 2);
      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(2);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EXTREME_TEST_1500
     * @tc.desc   Verify compareAndSwap with extreme values swap from -128 to 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.compareAndSwap(-128, 127);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(127);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_EXTREME_TEST_1600
     * @tc.desc   Verify compareAndSwap with extreme values swap from 127 to -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.compareAndSwap(127, -128);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-128);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_LOCK_TEST_1700
     * @tc.desc   Verify compareAndSwap for implementing spin lock pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let lock = new AtomicByte(0);

      // Acquire lock: try to change from 0 to 1
      let acquireResult = lock.compareAndSwap(0, 1);

      expect(acquireResult).assertEqual(0);
      expect(lock.load()).assertEqual(1);

      // Release lock: change back to 0
      lock.store(0);
      expect(lock.load()).assertEqual(0);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_STATE_TEST_1800
     * @tc.desc   Verify compareAndSwap for state machine - state transition 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // 0: INITIAL, 1: RUNNING, 2: COMPLETED
      let state = new AtomicByte(0);

      // Transition: INITIAL -> RUNNING
      let result = state.compareAndSwap(0, 1);

      expect(result).assertEqual(0);
      expect(state.load()).assertEqual(1);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_STATE_TEST_1900
     * @tc.desc   Verify compareAndSwap for state machine - state transition 1 to 2
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      // 0: INITIAL, 1: RUNNING, 2: COMPLETED
      let state = new AtomicByte(1);

      // Transition: RUNNING -> COMPLETED
      let result = state.compareAndSwap(1, 2);

      expect(result).assertEqual(1);
      expect(state.load()).assertEqual(2);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_COUNTER_TEST_2000
     * @tc.desc   Verify compareAndSwap for implementing atomic counter increment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);

      // Simulate atomic increment using compareAndSwap
      let oldValue: byte;
      let newValue: byte;

      // First increment
      oldValue = counter.load();
      newValue = Int.toByte(oldValue + 1);
      let result = counter.compareAndSwap(oldValue, newValue);
      expect(result).assertEqual(0);
      expect(counter.load()).assertEqual(1);

      // Second increment
      oldValue = counter.load();
      newValue = Int.toByte(oldValue + 1);
      result = counter.compareAndSwap(oldValue, newValue);
      expect(result).assertEqual(1);
      expect(counter.load()).assertEqual(2);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_2100
     * @tc.desc   Verify compareAndSwap with same value swap (no change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(50);
      let oldValue = atomicByte.compareAndSwap(50, 50);

      expect(oldValue).assertEqual(50);
      expect(atomicByte.load()).assertEqual(50);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_BASIC_TEST_2200
     * @tc.desc   Verify compareAndSwap with positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteCompareAndSwap2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.compareAndSwap(10, 20);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(20);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_RETURN_TEST_2300
     * @tc.desc   Verify compareAndSwap fails when expected does not match and returns correct old value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteCompareAndSwap2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(100);

      // Try to swap with wrong expected value
      let oldValue = atomicByte.compareAndSwap(50, 60);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(100);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_OPER_TEST_2400
     * @tc.desc   Verify multiple compareAndSwap operations on same AtomicByte instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);

      // Operation 1: 10 -> 20
      let oldValue1 = atomicByte.compareAndSwap(10, 20);
      expect(oldValue1).assertEqual(10);

      // Operation 2: 20 -> 30
      let oldValue2 = atomicByte.compareAndSwap(20, 30);
      expect(oldValue2).assertEqual(20);

      // Operation 3: 30 -> 40
      let oldValue3 = atomicByte.compareAndSwap(30, 40);
      expect(oldValue3).assertEqual(30);

      expect(atomicByte.load()).assertEqual(40);
    });
    /**
     * @tc.name   testAtomicByteCompareAndSwap2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_2500
     * @tc.desc   Verify compareAndSwap behavior with max valid byte value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);

      // Test with max valid byte value 127
      let oldValue = atomicByte.compareAndSwap(5, 127);
      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_2600
     * @tc.desc   Verify compareAndSwap behavior with min valid byte value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);

      // Test with min valid byte value -128
      let oldValue = atomicByte.compareAndSwap(5, -128);
      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_2700
     * @tc.desc   Verify compareAndSwap with no parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapNoParam;
        casFunc.compareAndSwap();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_PARAM_TEST_2800
     * @tc.desc   Verify compareAndSwap with only one parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapOneParam;
        casFunc.compareAndSwap(5);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_2900
     * @tc.desc   Verify compareAndSwap with null as expected parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let nullObj: Object = null as Object;
        let casFunc = atomicByte as CompareAndSwapObjectFirst;
        casFunc.compareAndSwap(nullObj, 10);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_3000
     * @tc.desc   Verify compareAndSwap with undefined as val parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapObjectSecond;
        casFunc.compareAndSwap(5, {} as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_3100
     * @tc.desc   Verify compareAndSwap with out of range value 128 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapNumberFirst;
        casFunc.compareAndSwap(128, 10);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_3200
     * @tc.desc   Verify compareAndSwap with out of range value -129 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapNumberFirst;
        casFunc.compareAndSwap(-129, 10);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_3300
     * @tc.desc   Verify compareAndSwap with string as expected parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapStringFirst;
        casFunc.compareAndSwap("5", 10);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_ERROR_TEST_3400
     * @tc.desc   Verify compareAndSwap with undefined as val parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let casFunc = obj as CompareAndSwapObjectSecond;
        casFunc.compareAndSwap(5, undefined as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_PERFORMANCE_TEST_3500
     * @tc.desc   Verify compareAndSwap single call performance measurement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let start = Date.now();
      let oldValue = atomicByte.compareAndSwap(5, 10);
      let end = Date.now();

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(10);
      expect(end - start >= 0).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_PERFORMANCE_TEST_3600
     * @tc.desc   Verify compareAndSwap batch call performance measurement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteCompareAndSwap3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicByte.compareAndSwap(0, 1);
        atomicByte.store(0);
      }
      let end = Date.now();

      expect(end - start >= 0).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteCompareAndSwap3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_COMPAREANDSWAP_LOCK_TEST_3700
     * @tc.desc   Verify compareAndSwap for implementing lock-free stack push operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteCompareAndSwap3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let top = new AtomicByte(0);
      let oldValue: byte;
      let newValue: byte = 10;

      oldValue = top.load();
      let result = top.compareAndSwap(oldValue, newValue);

      expect(result).assertEqual(0);
      expect(top.load()).assertEqual(10);
    })
  })
}
