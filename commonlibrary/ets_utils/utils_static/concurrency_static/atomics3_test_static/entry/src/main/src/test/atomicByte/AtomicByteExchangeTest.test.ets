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
  exchange: () => byte;
}

interface ExchangeObjectParam {
  exchange: (a: Object) => byte;
}

interface ExchangeStringParam {
  exchange: (a: string) => byte;
}

interface ExchangeNumberParam {
  exchange: (a: number) => byte;
}

export default function AtomicByteExchangeTest(): void {
  describe("AtomicByteExchangeTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteExchange0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_PARAM_TEST_0100
     * @tc.desc   Verify exchange with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.exchange(1);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteExchange0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_PARAM_TEST_0200
     * @tc.desc   Verify exchange throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteExchange0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let exchangeFunc = obj as ExchangeNoParam;
        exchangeFunc.exchange();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_BASIC_TEST_0300
     * @tc.desc   Verify exchange with normal byte value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.exchange(10);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteExchange0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EDGE_TEST_0400
     * @tc.desc   Verify exchange with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.exchange(127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteExchange0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EDGE_TEST_0500
     * @tc.desc   Verify exchange with byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.exchange(-128);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteExchange0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_BASIC_TEST_0600
     * @tc.desc   Verify exchange with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.exchange(0);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteExchange0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_BASIC_TEST_0700
     * @tc.desc   Verify exchange with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.exchange(-50);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteExchange0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_ERROR_TEST_0800
     * @tc.desc   Verify exchange with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteExchange0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let exchangeFunc = obj as ExchangeObjectParam;
        exchangeFunc.exchange(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_ERROR_TEST_0900
     * @tc.desc   Verify exchange with out of range value 128 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteExchange0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let exchangeFunc = obj as ExchangeNumberParam;
        exchangeFunc.exchange(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_ERROR_TEST_1000
     * @tc.desc   Verify exchange with out of range value -129 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteExchange1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let exchangeFunc = obj as ExchangeNumberParam;
        exchangeFunc.exchange(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_ERROR_TEST_1100
     * @tc.desc   Verify exchange with string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteExchange1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let exchangeFunc = obj as ExchangeStringParam;
        exchangeFunc.exchange("10");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_1200
     * @tc.desc   Verify exchange returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);

      let oldValue1 = atomicByte.exchange(2);
      expect(oldValue1).assertEqual(1);

      let oldValue2 = atomicByte.exchange(3);
      expect(oldValue2).assertEqual(2);

      let oldValue3 = atomicByte.exchange(4);
      expect(oldValue3).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteExchange1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_1300
     * @tc.desc   Verify exchange returns 0 when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.exchange(10);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteExchange1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_1400
     * @tc.desc   Verify exchange returns negative value when old value is negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      let oldValue = atomicByte.exchange(10);

      expect(oldValue).assertEqual(-50);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteExchange1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_1500
     * @tc.desc   Verify exchange returns max byte value 127 when old value is 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.exchange(0);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteExchange1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_1600
     * @tc.desc   Verify exchange returns min byte value -128 when old value is -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.exchange(0);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteExchange1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_TYPE_TEST_1700
     * @tc.desc   Verify exchange return value type is byte
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.exchange(1);

      expect(Number.isInteger(oldValue)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteExchange1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_OPER_TEST_1800
     * @tc.desc   Verify exchange with consecutive operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.exchange(10);
      expect(atomicByte.load()).assertEqual(10);

      atomicByte.exchange(20);
      expect(atomicByte.load()).assertEqual(20);

      atomicByte.exchange(30);
      expect(atomicByte.load()).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteExchange1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_OPER_TEST_1900
     * @tc.desc   Verify exchange combined with other atomic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);

      let oldValue1 = atomicByte.exchange(20);
      expect(oldValue1).assertEqual(10);

      let value = atomicByte.load();
      expect(value).assertEqual(20);

      atomicByte.store(30);
      expect(atomicByte.load()).assertEqual(30);

      let oldValue2 = atomicByte.exchange(40);
      expect(oldValue2).assertEqual(30);
      expect(atomicByte.load()).assertEqual(40);
    })
    /**
     * @tc.name   testAtomicByteExchange2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EXTREME_TEST_2000
     * @tc.desc   Verify exchange with extreme values from -128 to 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.exchange(127);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteExchange2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EXTREME_TEST_2100
     * @tc.desc   Verify exchange with same value (no actual change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.exchange(10);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteExchange2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_STATE_TEST_2200
     * @tc.desc   Verify exchange for state switching from 0 to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let status = new AtomicByte(0);
      let oldStatus = status.exchange(1);

      expect(oldStatus).assertEqual(0);
      expect(status.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteExchange2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_VALUE_TEST_2300
     * @tc.desc   Verify exchange for value replacement and save old value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let current = new AtomicByte(10);
      let previous = current.exchange(20);

      expect(previous).assertEqual(10);
      expect(current.load()).assertEqual(20);
    })

    /**
     * @tc.name   testAtomicByteExchange2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_BASIC_TEST_2400
     * @tc.desc   Verify exchange with positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(50);
      let oldValue = atomicByte.exchange(100);

      expect(oldValue).assertEqual(50);
      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteExchange2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_BASIC_TEST_2500
     * @tc.desc   Verify exchange stores new value and returns old value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteExchange2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(25);
      let oldValue = atomicByte.exchange(75);

      expect(oldValue).assertEqual(25);
      expect(atomicByte.load()).assertEqual(75);
    })
    /**
     * @tc.name   testAtomicByteExchange2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EDGE_TEST_2600
     * @tc.desc   Verify exchange from positive to negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(100);
      let oldValue = atomicByte.exchange(-100);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(-100);
    })
    /**
     * @tc.name   testAtomicByteExchange2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EDGE_TEST_2700
     * @tc.desc   Verify exchange from negative to positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-100);
      let oldValue = atomicByte.exchange(100);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteExchange2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_EDGE_TEST_2800
     * @tc.desc   Verify exchange from max value 127 to min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.exchange(-128);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteExchange2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_FLAG_TEST_2900
     * @tc.desc   Verify exchange for flag toggle pattern 0 -> 1 -> 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flag = new AtomicByte(0);

      let old1 = flag.exchange(1);
      expect(old1).assertEqual(0);
      expect(flag.load()).assertEqual(1);

      let old2 = flag.exchange(0);
      expect(old2).assertEqual(1);
      expect(flag.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteExchange3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_STATE_TEST_3000
     * @tc.desc   Verify exchange for multi-state transitions 0 -> 1 -> 2 -> 3
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteExchange3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let state = new AtomicByte(0);

      let old1 = state.exchange(1);
      expect(old1).assertEqual(0);

      let old2 = state.exchange(2);
      expect(old2).assertEqual(1);

      let old3 = state.exchange(3);
      expect(old3).assertEqual(2);

      expect(state.load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteExchange3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_EXCHANGE_RETURN_TEST_3100
     * @tc.desc   Verify multiple exchanges return correct sequence of old values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteExchange3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);

      let results: byte[] = [];
      results.push(atomicByte.exchange(10));
      results.push(atomicByte.exchange(20));
      results.push(atomicByte.exchange(30));
      results.push(atomicByte.exchange(40));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(10);
      expect(results[2]).assertEqual(20);
      expect(results[3]).assertEqual(30);
      expect(atomicByte.load()).assertEqual(40);
    })
  })
}
