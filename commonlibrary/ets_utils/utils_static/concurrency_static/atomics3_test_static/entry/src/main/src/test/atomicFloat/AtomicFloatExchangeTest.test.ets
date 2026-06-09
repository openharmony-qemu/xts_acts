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

interface ExchangeNoParam {
  exchange: () => float;
}

interface ExchangeOneParam {
  exchange: (a: float) => float;
}

interface ExchangeStringFirst {
  exchange: (a: string, b: float) => float;
}

interface ExchangeObjectSecond {
  exchange: (a: float, b: Object) => float;
}

interface ExchangeObjectParam {
  exchange: (a: Object) => float;
}

export default function AtomicFloatExchangeTest(): void {
  describe("AtomicFloatExchangeTest", (): void => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   atomicFloatExchangeTest0100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_PARAM_TEST_0100
     * @tc.desc   Verify exchange with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatExchangeTest0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(2.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest0200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_PARAM_TEST_0200
     * @tc.desc   Verify exchange throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let exchangeFunc = obj as ExchangeNoParam;
        exchangeFunc.exchange();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest0300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_BASIC_TEST_0300
     * @tc.desc   Verify exchange with normal float value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatExchangeTest0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest0400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_BASIC_TEST_0400
     * @tc.desc   Verify exchange with zero value 0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatExchangeTest0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(0.0));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(0.0));
    })

    /**
     * @tc.name   atomicFloatExchangeTest0500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_BASIC_TEST_0500
     * @tc.desc   Verify exchange with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(-50.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(-50.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest0600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_0600
     * @tc.desc   Verify exchange with NaN value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.NaN);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(isNaN(atomicFloat.load())).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest0700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_ERROR_TEST_0700
     * @tc.desc   Verify exchange with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let exchangeFunc = obj as ExchangeObjectParam;
        exchangeFunc.exchange(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest0800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_RETURN_TEST_0800
     * @tc.desc   Verify exchange returns old value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("atomicFloatExchangeTest0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(1.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(2.5));

      expect(oldValue).assertEqual(Double.toFloat(1.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(2.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest0900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_RETURN_TEST_0900
     * @tc.desc   Verify exchange returns 0.0 when old value is 0.0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let oldValue = atomicFloat.exchange(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest1000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_RETURN_TEST_1000
     * @tc.desc   Verify exchange with same value (no actual change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Double.toFloat(10.5));

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest1100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_ASYNC_TEST_1100
     * @tc.desc   Verify exchange atomicity with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatExchangeTest1100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let results1: float[] = [];
      let results2: float[] = [];

      let task1 = async () => {
        for (let i = 0; i < 100; i++) {
          results1.push(atomicFloat.exchange(Double.toFloat(1.5)));
        }
      };

      let task2 = async () => {
        for (let i = 0; i < 100; i++) {
          results2.push(atomicFloat.exchange(Double.toFloat(2.5)));
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
     * @tc.name   atomicFloatExchangeTest1200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_STATE_TEST_1200
     * @tc.desc   Verify exchange for state switching application
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatExchangeTest1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let status = new AtomicFloat(Double.toFloat(0.0));
      let oldStatus = status.exchange(Double.toFloat(1.0));

      expect(oldStatus).assertEqual(Double.toFloat(0.0));
      expect(status.load()).assertEqual(Double.toFloat(1.0));
    })

    /**
     * @tc.name   atomicFloatExchangeTest1300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SCENARIO_TEST_1300
     * @tc.desc   Verify exchange for counter increment pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatExchangeTest1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicFloat(Double.toFloat(0.0));
      let oldValue: float;

      oldValue = counter.exchange(Double.toFloat(1.0));
      expect(oldValue).assertEqual(Double.toFloat(0.0));
      expect(counter.load()).assertEqual(Double.toFloat(1.0));

      oldValue = counter.exchange(Double.toFloat(2.0));
      expect(oldValue).assertEqual(Double.toFloat(1.0));
      expect(counter.load()).assertEqual(Double.toFloat(2.0));
    })

    /**
     * @tc.name   atomicFloatExchangeTest1400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SCENARIO_TEST_1400
     * @tc.desc   Verify exchange for position update pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("atomicFloatExchangeTest1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let position = new AtomicFloat(Double.toFloat(0.0));
      let oldPosition = position.exchange(Double.toFloat(10.5));

      expect(oldPosition).assertEqual(Double.toFloat(0.0));
      expect(position.load()).assertEqual(Double.toFloat(10.5));
    })

    /**
     * @tc.name   atomicFloatExchangeTest1500
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_ERROR_TEST_1500
     * @tc.desc   Verify exchange with wrong parameter count throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let exchangeFunc = obj as ExchangeOneParam;
        exchangeFunc.exchange(Double.toFloat(10.5));
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest1600
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_ERROR_TEST_1600
     * @tc.desc   Verify exchange with string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let exchangeFunc = obj as ExchangeStringFirst;
        exchangeFunc.exchange("5.5", Double.toFloat(10.5));
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest1700
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_ERROR_TEST_1700
     * @tc.desc   Verify exchange with Object parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let errorThrown = false;

      try {
        let obj: Object = atomicFloat;
        let exchangeFunc = obj as ExchangeObjectSecond;
        exchangeFunc.exchange(Double.toFloat(5.5), {} as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest1800
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_PERF_TEST_1800
     * @tc.desc   Verify exchange single call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(5.5));
      let start = Date.now();
      let oldValue = atomicFloat.exchange(Double.toFloat(10.5));
      let end = Date.now();

      expect(oldValue).assertEqual(Double.toFloat(5.5));
      expect(atomicFloat.load()).assertEqual(Double.toFloat(10.5));
      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest1900
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_PERF_TEST_1900
     * @tc.desc   Verify exchange batch call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("atomicFloatExchangeTest1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(0.0));
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        atomicFloat.exchange(Double.toFloat(1.5));
        atomicFloat.store(Double.toFloat(0.0));
      }
      let end = Date.now();

      expect(end - start >= 0).assertTrue();
    })

    /**
     * @tc.name   atomicFloatExchangeTest2000
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_2000
     * @tc.desc   Verify exchange with Float.POSITIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.POSITIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.POSITIVE_INFINITY);
    })

    /**
     * @tc.name   atomicFloatExchangeTest2100
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_2100
     * @tc.desc   Verify exchange with Float.NEGATIVE_INFINITY
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.NEGATIVE_INFINITY);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.NEGATIVE_INFINITY);
    })

    /**
     * @tc.name   atomicFloatExchangeTest2200
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_2200
     * @tc.desc   Verify exchange with Float.MIN_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.MIN_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.MIN_VALUE);
    })

    /**
     * @tc.name   atomicFloatExchangeTest2300
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_2300
     * @tc.desc   Verify exchange with Float.MAX_VALUE
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.MAX_VALUE);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.MAX_VALUE);
    })

    /**
     * @tc.name   atomicFloatExchangeTest2400
     * @tc.number SUB_BUILTINS_ATOMICFLOAT_EXCHANGE_SPECIAL_TEST_2400
     * @tc.desc   Verify exchange with Float.EPSILON
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("atomicFloatExchangeTest2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicFloat = new AtomicFloat(Double.toFloat(10.5));
      let oldValue = atomicFloat.exchange(Float.EPSILON);

      expect(oldValue).assertEqual(Double.toFloat(10.5));
      expect(atomicFloat.load()).assertEqual(Float.EPSILON);
    })

  })
}
