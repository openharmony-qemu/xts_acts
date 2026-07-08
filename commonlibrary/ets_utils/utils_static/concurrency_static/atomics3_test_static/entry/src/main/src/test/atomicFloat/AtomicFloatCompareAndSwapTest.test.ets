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

interface CompareAndSwapNoParam {
  compareAndSwap: () => float;
}

interface CompareAndSwapOneParam {
  compareAndSwap: (a: float) => float;
}

interface CompareAndSwapObjectFirst {
  compareAndSwap: (a: Object, b: float) => float;
}

interface CompareAndSwapObjectSecond {
  compareAndSwap: (a: float, b: Object) => float;
}

interface CompareAndSwapNumberFirst {
  compareAndSwap: (a: number, b: float) => float;
}

interface CompareAndSwapStringFirst {
  compareAndSwap: (a: string, b: float) => float;
}

export default function AtomicFloatCompareAndSwapTest(): void {
  describe("AtomicFloatCompareAndSwapTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_PARAM_TEST_0100
     * @tc.desc   Verify compareAndSwap with all required parameters (expected matches current value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest0100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ERROR_TEST_0200
     * @tc.desc   Verify compareAndSwap with no parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest0200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let casFunc = obj as CompareAndSwapNoParam;
        casFunc.compareAndSwap();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_PARAM_TEST_0300
     * @tc.desc   Verify compareAndSwap with expected parameter as normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest0300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Double.toFloat(20.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(20.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_PARAM_TEST_0400
     * @tc.desc   Verify compareAndSwap with val parameter as normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest0400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_0500
     * @tc.desc   Verify compareAndSwap with expected as NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest0500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NaN);
      let oldValue = atomicFloat.compareAndSwap(Float.NaN, Double.toFloat(10.5));

      expect(isNaN(oldValue)).assertTrue();
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_0600
     * @tc.desc   Verify compareAndSwap with val as NaN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest0600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.NaN);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_0700
     * @tc.desc   Verify compareAndSwap with expected as positive infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest0700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.POSITIVE_INFINITY);
      let oldValue = atomicFloat.compareAndSwap(Float.POSITIVE_INFINITY, Double.toFloat(10.5));

      expect(oldValue === Float.POSITIVE_INFINITY).assertTrue();
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_0800
     * @tc.desc   Verify compareAndSwap with expected as negative infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest0800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.NEGATIVE_INFINITY);
      let oldValue = atomicFloat.compareAndSwap(Float.NEGATIVE_INFINITY, Double.toFloat(10.5));

      expect(oldValue === Float.NEGATIVE_INFINITY).assertTrue();
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_0900
     * @tc.desc   Verify compareAndSwap with val as positive infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest0900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.POSITIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load() === Float.POSITIVE_INFINITY).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_1000
     * @tc.desc   Verify compareAndSwap with val as negative infinity
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest1000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.NEGATIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load() === Float.NEGATIVE_INFINITY).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1100
     * @tc.desc   Verify compareAndSwap returns expected when current value equals expected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest1100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1200
     * @tc.desc   Verify compareAndSwap returns actual old value when current value does not equal expected
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest1200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(2.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1300
     * @tc.desc   Verify compareAndSwap return value type is float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest1300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(5.5), Double.toFloat(10.5));

      expect(typeof oldValue).assertEqual('float');
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1400
     * @tc.desc   Verify compareAndSwap updates value when match succeeds
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest1400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1500
     * @tc.desc   Verify compareAndSwap does not update value when match fails
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('atomicFloatCompareAndSwapTest1500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(2.5), Double.toFloat(3.0));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1600
     * @tc.desc   Verify compareAndSwap returns 0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest1600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1700
     * @tc.desc   Verify compareAndSwap returns negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest1700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-5.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(-5.5), Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(-5.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_RETURN_TEST_1800
     * @tc.desc   Verify compareAndSwap returns positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest1800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(5.5), Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(5.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest1900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EXTREME_TEST_1900
     * @tc.desc   Verify compareAndSwap returns very small positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest1900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let verySmall: float = Double.toFloat(1.17549435e-38);
      let atomicFloat = new AtomicFloat(verySmall);
      let oldValue = atomicFloat.compareAndSwap(verySmall, Double.toFloat(10.5));

      expect(oldValue).assertEqual(verySmall);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EXTREME_TEST_2000
     * @tc.desc   Verify compareAndSwap returns very large positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let veryLarge: float = Double.toFloat(3.40282347e+38);
      let atomicFloat = new AtomicFloat(veryLarge);
      let oldValue = atomicFloat.compareAndSwap(veryLarge, Double.toFloat(10.5));

      expect(oldValue).assertEqual(veryLarge);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2100
     * @tc.desc   Verify compareAndSwap with expected as minimum positive float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let minPositive: float = Double.toFloat(1.17549435e-38);
      let atomicFloat = new AtomicFloat(minPositive);
      let oldValue = atomicFloat.compareAndSwap(minPositive, Double.toFloat(10.5));

      expect(oldValue).assertEqual(minPositive);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2200
     * @tc.desc   Verify compareAndSwap with expected as maximum positive float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let maxPositive: float = Double.toFloat(3.40282347e+38);
      let atomicFloat = new AtomicFloat(maxPositive);
      let oldValue = atomicFloat.compareAndSwap(maxPositive, Double.toFloat(10.5));

      expect(oldValue).assertEqual(maxPositive);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2300
     * @tc.desc   Verify compareAndSwap with val as minimum positive float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let minPositive: float = Double.toFloat(1.17549435e-38);
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(0.0), minPositive);

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(minPositive);
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2400
     * @tc.desc   Verify compareAndSwap with val as maximum positive float
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let maxPositive: float = Double.toFloat(3.40282347e+38);
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(0.0), maxPositive);

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(maxPositive);
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2500
     * @tc.desc   Verify compareAndSwap swapping from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest2500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Double.toFloat(-20.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-20.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2600
     * @tc.desc   Verify compareAndSwap swapping from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest2600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(-10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(-10.5), Double.toFloat(20.5));

      expect(oldValue).assertEqual(Double.toFloat(-10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(20.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_EDGE_TEST_2700
     * @tc.desc   Verify compareAndSwap with same value swap (no change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest2700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(5.5), Double.toFloat(5.5));

      expect(oldValue).assertEqual(Double.toFloat(5.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(5.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_OPER_TEST_2800
     * @tc.desc   Verify compareAndSwap with consecutive operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));

      let oldValue1 = atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.5));
      expect(oldValue1).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(1.5));

      let oldValue2 = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(2.5));
      expect(oldValue2).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));

      let oldValue3 = atomicFloat.compareAndSwap(Double.toFloat(2.5), Double.toFloat(3.5));
      expect(oldValue3).assertEqual(Double.toFloat(2.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(3.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest2900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_OPER_TEST_2900
     * @tc.desc   Verify compareAndSwap retry pattern - fail then succeed
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest2900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));

      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(2.5));
      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(0.0));

      oldValue = atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(2.5));
      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_OPER_TEST_3000
     * @tc.desc   Verify compareAndSwap multiple failures then success
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));

      let oldValue1 = atomicFloat.compareAndSwap(Double.toFloat(2.5), Double.toFloat(3.5));
      expect(oldValue1).assertEqual(Double.toFloat(1.5));

      let oldValue2 = atomicFloat.compareAndSwap(Double.toFloat(3.5), Double.toFloat(4.5));
      expect(oldValue2).assertEqual(Double.toFloat(1.5));

      let oldValue3 = atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(5.5));
      expect(oldValue3).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(5.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_OPER_TEST_3100
     * @tc.desc   Verify compareAndSwap multiple operations on same instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));

      let oldValue1 = atomicFloat.compareAndSwap(Double.toFloat(10.5), Double.toFloat(20.5));
      expect(oldValue1).assertEqual(Double.toFloat(10.5));

      let oldValue2 = atomicFloat.compareAndSwap(Double.toFloat(20.5), Double.toFloat(30.5));
      expect(oldValue2).assertEqual(Double.toFloat(20.5));

      let oldValue3 = atomicFloat.compareAndSwap(Double.toFloat(30.5), Double.toFloat(40.5));
      expect(oldValue3).assertEqual(Double.toFloat(30.5));

      expect(atomicFloat.load()).assertEqual(Double.toFloat(40.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ASYNC_TEST_3200
     * @tc.desc   Verify compareAndSwap atomicity with concurrent access using Promise.all
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let results1: float[] = [];
      let results2: float[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.5)));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(2.5)));
        }
      };

      await Promise.all([task1(), task2()]);

      for (let i = 0; i < results1.length; i++) {
        expect(results1[i] === Double.toFloat(0.0) || results1[i] === Double.toFloat(1.5) || results1[i] === Double.toFloat(2.5)).assertTrue();
      }

      for (let i = 0; i < results2.length; i++) {
        expect(results2[i] === Double.toFloat(0.0) || results2[i] === Double.toFloat(1.5) || results2[i] === Double.toFloat(2.5)).assertTrue();
      }
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ASYNC_TEST_3300
     * @tc.desc   Verify compareAndSwap atomicity with multiple concurrent tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let results: float[] = [];

      let task1 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.5)));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(2.5)));
        }
      };

      let task3 = async () => {
        for (let i = 0; i < 50; i++) {
          results.push(atomicFloat.compareAndSwap(Double.toFloat(2.5), Double.toFloat(3.5)));
        }
      };

      await Promise.all([task1(), task2(), task3()]);

      for (let i = 0; i < results.length; i++) {
        expect(results[i] >= Double.toFloat(0.0) && results[i] <= Double.toFloat(3.5)).assertTrue();
      }
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ASYNC_TEST_3400
     * @tc.desc   Verify compareAndSwap concurrent read-write consistency
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let readResults: float[] = [];
      let writeResults: float[] = [];

      let readTask = async () => {
        for (let i = 0; i < 100; i++) {
          readResults.push(atomicFloat.load());
        }
      };

      let writeTask = async () => {
        for (let i = 0; i < 100; i++) {
          writeResults.push(atomicFloat.compareAndSwap(Double.toFloat(1.5), Double.toFloat(2.5)));
          atomicFloat.store(Double.toFloat(1.5));
        }
      };

      await Promise.all([readTask(), writeTask()]);

      for (let i = 0; i < readResults.length; i++) {
        expect(readResults[i] === Double.toFloat(1.5) || readResults[i] === Double.toFloat(2.5)).assertTrue();
      }
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_FUNCTION_TEST_3500
     * @tc.desc   Verify compareAndSwap for implementing spin lock pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let lock = new AtomicFloat(Double.toFloat(0.0));

      let acquireResult = lock.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.0));

      expect(acquireResult).assertEqual(Double.toFloat(0.0));
      expect(lock.load()).assertEqual(Double.toFloat(1.0));

      lock.store(Double.toFloat(0.0));
      expect(lock.load()).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_FUNCTION_TEST_3600
     * @tc.desc   Verify compareAndSwap for state machine transition
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let state = new AtomicFloat(Double.toFloat(0.0));

      let result = state.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.0));

      expect(result).assertEqual(Double.toFloat(0.0));
      expect(state.load()).assertEqual(Double.toFloat(1.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_FUNCTION_TEST_3700
     * @tc.desc   Verify compareAndSwap for atomic counter increment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicFloat(Double.toFloat(0.0));

      let oldValue: float;
      let newValue: float;

      oldValue = counter.load();
      newValue = oldValue + Double.toFloat(1.0);
      let result = counter.compareAndSwap(oldValue, newValue);
      expect(result).assertEqual(Double.toFloat(0.0));
      expect(counter.load()).assertEqual(Double.toFloat(1.0));

      oldValue = counter.load();
      newValue = oldValue + Double.toFloat(1.0);
      result = counter.compareAndSwap(oldValue, newValue);
      expect(result).assertEqual(Double.toFloat(1.0));
      expect(counter.load()).assertEqual(Double.toFloat(2.0));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_FUNCTION_TEST_3800
     * @tc.desc   Verify compareAndSwap for lock-free data structure operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('atomicFloatCompareAndSwapTest3800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let top = new AtomicFloat(Double.toFloat(0.0));
      let oldValue: float;
      let newValue: float = Double.toFloat(10.5);

      oldValue = top.load();
      let result = top.compareAndSwap(oldValue, newValue);

      expect(result).assertEqual(Double.toFloat(0.0));
      expect(top.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest3900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ERROR_TEST_3900
     * @tc.desc   Verify compareAndSwap with missing first parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest3900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let casFunc = obj as CompareAndSwapOneParam;
        casFunc.compareAndSwap(Double.toFloat(5.5));
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ERROR_TEST_4000
     * @tc.desc   Verify compareAndSwap with string as expected parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest4000', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let casFunc = obj as CompareAndSwapStringFirst;
        casFunc.compareAndSwap("5.5", Double.toFloat(10.5));
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_ERROR_TEST_4100
     * @tc.desc   Verify compareAndSwap with Object as val parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest4100', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let casFunc = obj as CompareAndSwapObjectSecond;
        casFunc.compareAndSwap(Double.toFloat(5.5), {} as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_PERFORMANCE_TEST_4200
     * @tc.desc   Verify compareAndSwap single call performance measurement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest4200', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let start = Date.now();
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(5.5), Double.toFloat(10.5));
      let end = Date.now();

      expect(oldValue).assertEqual(Double.toFloat(5.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_PERFORMANCE_TEST_4300
     * @tc.desc   Verify compareAndSwap batch call performance measurement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it('atomicFloatCompareAndSwapTest4300', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicFloat.compareAndSwap(Double.toFloat(0.0), Double.toFloat(1.5));
        atomicFloat.store(Double.toFloat(0.0));
      }
      let end = Date.now();

      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4400
     * @tc.desc   Verify compareAndSwap with expected as Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4400', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MIN_VALUE);
      let oldValue = atomicFloat.compareAndSwap(Float.MIN_VALUE, Double.toFloat(10.5));

      expect(oldValue).assertEqual(Float.MIN_VALUE);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4500
     * @tc.desc   Verify compareAndSwap with val as Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4500', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.MIN_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.MIN_VALUE);
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4600
     * @tc.desc   Verify compareAndSwap with expected as Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4600', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.MAX_VALUE);
      let oldValue = atomicFloat.compareAndSwap(Float.MAX_VALUE, Double.toFloat(10.5));

      expect(oldValue).assertEqual(Float.MAX_VALUE);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4700
     * @tc.desc   Verify compareAndSwap with val as Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4700', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.MAX_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4800
     * @tc.desc   Verify compareAndSwap with expected as Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4800', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Float.EPSILON);
      let oldValue = atomicFloat.compareAndSwap(Float.EPSILON, Double.toFloat(10.5));

      expect(oldValue).assertEqual(Float.EPSILON);
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatCompareAndSwapTest4900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_COMPAREANDSWAP_SPECIAL_TEST_4900
     * @tc.desc   Verify compareAndSwap with val as Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it('atomicFloatCompareAndSwapTest4900', TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.compareAndSwap(Double.toFloat(10.5), Float.EPSILON);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.EPSILON);
    })

  })
}
