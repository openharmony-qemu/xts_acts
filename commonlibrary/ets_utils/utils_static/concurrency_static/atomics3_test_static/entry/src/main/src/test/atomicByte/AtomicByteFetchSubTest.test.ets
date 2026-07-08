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

interface FetchSubNoParam {
  fetchSub: () => byte;
}

interface FetchSubObjectParam {
  fetchSub: (a: Object) => byte;
}

interface FetchSubStringParam {
  fetchSub: (a: string) => byte;
}

interface FetchSubNumberParam {
  fetchSub: (a: number) => byte;
}

export default function AtomicByteFetchSubTest(): void {
  describe("AtomicByteFetchSubTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_PARAM_TEST_0100
     * @tc.desc   Verify fetchSub with all required parameters exists
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(8);
      let oldValue = atomicByte.fetchSub(3);

      expect(oldValue).assertEqual(8);
      expect(atomicByte.load()).assertEqual(5);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_BASIC_TEST_0200
     * @tc.desc   Verify fetchSub with normal positive byte value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(20);
      let oldValue = atomicByte.fetchSub(5);

      expect(oldValue).assertEqual(20);
      expect(atomicByte.load()).assertEqual(15);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_0300
     * @tc.desc   Verify fetchSub with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchSub(127);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(0);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_0400
     * @tc.desc   Verify fetchSub with val value 0 (no change)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchSub(0);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(10);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_BASIC_TEST_0500
     * @tc.desc   Verify fetchSub with negative val value (equivalent to addition)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchSub(-5);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(15);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RETURN_TEST_0600
     * @tc.desc   Verify fetchSub returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(30);

      let oldValue1 = atomicByte.fetchSub(5);
      expect(oldValue1).assertEqual(30);

      let oldValue2 = atomicByte.fetchSub(10);
      expect(oldValue2).assertEqual(25);

      let oldValue3 = atomicByte.fetchSub(5);
      expect(oldValue3).assertEqual(15);

      expect(atomicByte.load()).assertEqual(10);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RETURN_TEST_0700
     * @tc.desc   Verify fetchSub returns 0 when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchSub(5);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-5);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RETURN_TEST_0800
     * @tc.desc   Verify fetchSub returns correct value when subtraction results in negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchSub(10);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(-5);
    })

    /**
     * @tc.name   testAtomicByteFetchSub0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_0900
     * @tc.desc   Verify fetchSub with byte overflow scenario (underflow)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-120);
      let oldValue = atomicByte.fetchSub(20);

      expect(oldValue).assertEqual(-120);
      expect(atomicByte.load()).assertEqual(116);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_OPER_TEST_1000
     * @tc.desc   Verify fetchSub with consecutive subtraction operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);

      atomicByte.fetchSub(10);
      atomicByte.fetchSub(20);
      atomicByte.fetchSub(30);

      expect(atomicByte.load()).assertEqual(40);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_OPER_TEST_1100
     * @tc.desc   Verify fetchSub combined with fetchAdd operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(50);

      atomicByte.fetchSub(10);
      atomicByte.fetchAdd(20);
      atomicByte.fetchSub(30);

      expect(atomicByte.load()).assertEqual(30);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_TYPE_TEST_1200
     * @tc.desc   Verify fetchSub return value type is byte
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchSub(5);

      expect(Number.isInteger(oldValue)).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_COUNTER_TEST_1300
     * @tc.desc   Verify fetchSub for atomic counter decrement pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(100);
      let oldValue = counter.fetchSub(1);

      expect(oldValue).assertEqual(100);
      expect(counter.load()).assertEqual(99);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_QUOTA_TEST_1400
     * @tc.desc   Verify fetchSub for rate limiter quota consumption pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let quota = new AtomicByte(100);

      let remaining1 = quota.fetchSub(10);
      expect(remaining1).assertEqual(100);

      let remaining2 = quota.fetchSub(20);
      expect(remaining2).assertEqual(90);

      expect(quota.load()).assertEqual(70);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RESOURCE_TEST_1500
     * @tc.desc   Verify fetchSub for resource count decrement on release
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let activeConnections = new AtomicByte(50);

      let oldValue = activeConnections.fetchSub(1);

      expect(oldValue).assertEqual(50);
      expect(activeConnections.load()).assertEqual(49);
    })

    /**
     * @tc.name   testAtomicByteFetchSub1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_COUNTDOWN_TEST_1600
     * @tc.desc   Verify fetchSub for countdown timer pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let countdown = new AtomicByte(10);

      for (let i = 0; i < 5; i++) {
        countdown.fetchSub(1);
      }

      expect(countdown.load()).assertEqual(5);
    })



    /**
     * @tc.name   testAtomicByteFetchSub1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_1700
     * @tc.desc   Verify fetchSub with no parameters throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchSubFunc = obj as FetchSubNoParam;
        fetchSubFunc.fetchSub();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_1800
     * @tc.desc   Verify fetchSub with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchSubFunc = obj as FetchSubObjectParam;
        fetchSubFunc.fetchSub({} as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_1900
     * @tc.desc   Verify fetchSub with out of range value 128 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchSubFunc = obj as FetchSubNumberParam;
        fetchSubFunc.fetchSub(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_2000
     * @tc.desc   Verify fetchSub with out of range value -129 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchSubFunc = obj as FetchSubNumberParam;
        fetchSubFunc.fetchSub(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_2100
     * @tc.desc   Verify fetchSub with string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchSubFunc = obj as FetchSubStringParam;
        fetchSubFunc.fetchSub("5");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })

    /**
     * @tc.name   testAtomicByteFetchSub2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EXTREME_TEST_2200
     * @tc.desc   Verify fetchSub with min byte value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.fetchSub(0);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EXTREME_TEST_2300
     * @tc.desc   Verify fetchSub from max to min byte boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchSub(-1);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-128);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_BASIC_TEST_2400
     * @tc.desc   Verify fetchSub returns negative old value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      let oldValue = atomicByte.fetchSub(10);

      expect(oldValue).assertEqual(-50);
      expect(atomicByte.load()).assertEqual(-60);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_OPER_TEST_2500
     * @tc.desc   Verify multiple fetchSub operations on same AtomicByte instance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);

      let oldValue1 = atomicByte.fetchSub(10);
      expect(oldValue1).assertEqual(100);

      let oldValue2 = atomicByte.fetchSub(20);
      expect(oldValue2).assertEqual(90);

      let oldValue3 = atomicByte.fetchSub(30);
      expect(oldValue3).assertEqual(70);

      expect(atomicByte.load()).assertEqual(40);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_2600
     * @tc.desc   Verify fetchSub subtraction to zero boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(50);
      let oldValue = atomicByte.fetchSub(50);

      expect(oldValue).assertEqual(50);
      expect(atomicByte.load()).assertEqual(0);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RETURN_TEST_2700
     * @tc.desc   Verify fetchSub returns correct type for large negative results
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-100);
      let oldValue = atomicByte.fetchSub(27);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(-127);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_BASIC_TEST_2800
     * @tc.desc   Verify fetchSub with val equals current value results in zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(25);
      let oldValue = atomicByte.fetchSub(25);

      expect(oldValue).assertEqual(25);
      expect(atomicByte.load()).assertEqual(0);
    })

    /**
     * @tc.name   testAtomicByteFetchSub2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ERROR_TEST_2900
     * @tc.desc   Verify fetchSub behavior with double subtraction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(100);

      atomicByte.fetchSub(50);
      let oldValue = atomicByte.fetchSub(25);

      expect(oldValue).assertEqual(50);
      expect(atomicByte.load()).assertEqual(25);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_3000
     * @tc.desc   Verify fetchSub with small positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchSub(1);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(4);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_3100
     * @tc.desc   Verify fetchSub with small negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchSub(-1);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(1);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_RETURN_TEST_3200
     * @tc.desc   Verify fetchSub behavior when current value is negative and subtract positive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchSub3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-10);
      let oldValue = atomicByte.fetchSub(20);

      expect(oldValue).assertEqual(-10);
      expect(atomicByte.load()).assertEqual(-30);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_COUNTER_TEST_3300
     * @tc.desc   Verify fetchSub used as semaphore release pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let semaphore = new AtomicByte(10);

      let oldValue1 = semaphore.fetchSub(2);
      expect(oldValue1).assertEqual(10);
      expect(semaphore.load()).assertEqual(8);

      let oldValue2 = semaphore.fetchSub(3);
      expect(oldValue2).assertEqual(8);
      expect(semaphore.load()).assertEqual(5);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_COUNTER_TEST_3400
     * @tc.desc   Verify fetchSub for batch processing counter decrement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let batchCounter = new AtomicByte(100);

      for (let i = 0; i < 5; i++) {
        batchCounter.fetchSub(10);
      }

      expect(batchCounter.load()).assertEqual(50);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_COUNTER_TEST_3500
     * @tc.desc   Verify fetchSub for inventory stock reduction pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let stock = new AtomicByte(80);

      let order1 = stock.fetchSub(5);
      expect(order1).assertEqual(80);

      let order2 = stock.fetchSub(10);
      expect(order2).assertEqual(75);

      let order3 = stock.fetchSub(15);
      expect(order3).assertEqual(65);

      expect(stock.load()).assertEqual(50);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_3600
     * @tc.desc   Verify fetchSub with maximum valid subtraction from max value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchSub(100);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(27);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EDGE_TEST_3700
     * @tc.desc   Verify fetchSub with maximum valid subtraction from min value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchSub3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.fetchSub(-128);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(0);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EXTREME_TEST_3800
     * @tc.desc   Verify fetchSub wraps correctly on byte overflow (underflow below -128)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(-100);
      let oldValue = atomicByte.fetchSub(50);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(106);
    })

    /**
     * @tc.name   testAtomicByteFetchSub3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_EXTREME_TEST_3900
     * @tc.desc   Verify fetchSub wraps correctly on byte overflow (above 127)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(100);
      let oldValue = atomicByte.fetchSub(-100);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(-56);
    })

    /**
     * @tc.name   testAtomicByteFetchSub4000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_ATOMIC_TEST_4000
     * @tc.desc   Verify fetchSub atomicity with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchSub4000", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(100);
      
      let task1 = async () => {
        for (let i = 0; i < 10; i++) {
          atomicByte.fetchSub(1);
        }
      };
      
      let task2 = async () => {
        for (let i = 0; i < 10; i++) {
          atomicByte.fetchSub(1);
        }
      };
      
      await Promise.all([task1(), task2()]);
      
      expect(atomicByte.load()).assertEqual(80);
    })

    /**
     * @tc.name   testAtomicByteFetchSub4100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_PERF_TEST_4100
     * @tc.desc   Verify fetchSub single call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(8);
      let start = Date.now();
      let oldValue = atomicByte.fetchSub(3);
      let end = Date.now();
      let duration = end - start;
      
      expect(oldValue).assertEqual(8);
      expect(atomicByte.load()).assertEqual(5);
    })

    /**
     * @tc.name   testAtomicByteFetchSub4200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHSUB_PERF_TEST_4200
     * @tc.desc   Verify fetchSub batch call performance
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchSub4200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(100);
      let start = Date.now();

      for (let i = 0; i < 50; i++) {
        atomicByte.fetchSub(1);
      }

      let end = Date.now();
      let duration = end - start;

      expect(atomicByte.load()).assertEqual(50);
    })

  })
}
