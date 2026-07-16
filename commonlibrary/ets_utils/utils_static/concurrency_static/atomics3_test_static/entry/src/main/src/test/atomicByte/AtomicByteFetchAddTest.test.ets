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

interface FetchAddNoParam {
  fetchAdd: () => byte;
}

interface FetchAddObjectParam {
  fetchAdd: (a: Object) => byte;
}

interface FetchAddStringParam {
  fetchAdd: (a: string) => byte;
}

interface FetchAddNumberParam {
  fetchAdd: (a: number) => byte;
}

export default function AtomicByteFetchAddTest(): void {
  describe("AtomicByteFetchAddTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchAdd0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_PARAM_TEST_0100
     * @tc.desc   Verify fetchAdd with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(1);
      let oldValue = atomicByte.fetchAdd(4);

      expect(oldValue).assertEqual(1);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_PARAM_TEST_0200
     * @tc.desc   Verify fetchAdd throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddNoParam;
        fetchAddFunc.fetchAdd();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_0300
     * @tc.desc   Verify fetchAdd with normal byte value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchAdd(5);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EDGE_TEST_0400
     * @tc.desc   Verify fetchAdd with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EDGE_TEST_0500
     * @tc.desc   Verify fetchAdd with byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchAdd(-128);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_0600
     * @tc.desc   Verify fetchAdd with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchAdd(0);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_0700
     * @tc.desc   Verify fetchAdd with negative value (equivalent to subtraction)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(20);
      let oldValue = atomicByte.fetchAdd(-5);

      expect(oldValue).assertEqual(20);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ERROR_TEST_0800
     * @tc.desc   Verify fetchAdd with null parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddObjectParam;
        fetchAddFunc.fetchAdd(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ERROR_TEST_0900
     * @tc.desc   Verify fetchAdd with out of range value 128 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddNumberParam;
        fetchAddFunc.fetchAdd(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ERROR_TEST_1000
     * @tc.desc   Verify fetchAdd with out of range value -129 throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddNumberParam;
        fetchAddFunc.fetchAdd(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ERROR_TEST_1100
     * @tc.desc   Verify fetchAdd with string parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddStringParam;
        fetchAddFunc.fetchAdd("5");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RETURN_TEST_1200
     * @tc.desc   Verify fetchAdd returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);

      let oldValue1 = atomicByte.fetchAdd(2);
      expect(oldValue1).assertEqual(1);

      let oldValue2 = atomicByte.fetchAdd(3);
      expect(oldValue2).assertEqual(3);

      let oldValue3 = atomicByte.fetchAdd(4);
      expect(oldValue3).assertEqual(6);

      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RETURN_TEST_1300
     * @tc.desc   Verify fetchAdd returns 0 when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(10);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RETURN_TEST_1400
     * @tc.desc   Verify fetchAdd returns negative value when old value is negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      let oldValue = atomicByte.fetchAdd(60);

      expect(oldValue).assertEqual(-50);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RETURN_TEST_1500
     * @tc.desc   Verify fetchAdd returns max byte value 127 when old value is 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(120);
      let oldValue = atomicByte.fetchAdd(7);

      expect(oldValue).assertEqual(120);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_TYPE_TEST_1600
     * @tc.desc   Verify fetchAdd return value type is number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(1);
      let oldValue = atomicByte.fetchAdd(4);

      expect(Number.isInteger(oldValue)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_OPER_TEST_1700
     * @tc.desc   Verify fetchAdd with consecutive operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.fetchAdd(10);
      expect(atomicByte.load()).assertEqual(10);

      atomicByte.fetchAdd(20);
      expect(atomicByte.load()).assertEqual(30);

      atomicByte.fetchAdd(30);
      expect(atomicByte.load()).assertEqual(60);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_OPER_TEST_1800
     * @tc.desc   Verify fetchAdd combined with other atomic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);

      let oldValue1 = atomicByte.fetchAdd(5);
      expect(oldValue1).assertEqual(10);

      let value = atomicByte.load();
      expect(value).assertEqual(15);

      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);

      let oldValue2 = atomicByte.fetchAdd(10);
      expect(oldValue2).assertEqual(20);
      expect(atomicByte.load()).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_1900
     * @tc.desc   Verify fetchAdd with overflow scenario
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(120);
      let oldValue = atomicByte.fetchAdd(20);

      expect(oldValue).assertEqual(120);
      expect(atomicByte.load()).assertEqual(-116);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_2000
     * @tc.desc   Verify fetchAdd with negative subtraction near min boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-120);
      let oldValue = atomicByte.fetchAdd(-8);

      expect(oldValue).assertEqual(-120);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_2100
     * @tc.desc   Verify fetchAdd with underflow scenario
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-120);
      let oldValue = atomicByte.fetchAdd(-10);

      expect(oldValue).assertEqual(-120);
      expect(atomicByte.load()).assertEqual(126);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_COUNTER_TEST_2200
     * @tc.desc   Verify fetchAdd for atomic counter increment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);
      let oldValue = counter.fetchAdd(1);

      expect(oldValue).assertEqual(0);
      expect(counter.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_COUNTER_TEST_2300
     * @tc.desc   Verify fetchAdd for request counting
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let requestCount = new AtomicByte(0);

      requestCount.fetchAdd(1);
      requestCount.fetchAdd(1);

      expect(requestCount.load()).assertEqual(2);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RESOURCE_TEST_2400
     * @tc.desc   Verify fetchAdd for resource allocation tracking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let allocatedResources = new AtomicByte(0);

      allocatedResources.fetchAdd(5);
      expect(allocatedResources.load()).assertEqual(5);

      allocatedResources.fetchAdd(3);
      expect(allocatedResources.load()).assertEqual(8);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RESOURCE_TEST_2500
     * @tc.desc   Verify fetchAdd for resource release using negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let allocatedResources = new AtomicByte(10);
      let oldValue = allocatedResources.fetchAdd(-3);

      expect(oldValue).assertEqual(10);
      expect(allocatedResources.load()).assertEqual(7);
    })


    /**
     * @tc.name   testAtomicByteFetchAdd2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_PERF_TEST_2600
     * @tc.desc   Verify fetchAdd single call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let start = Date.now();
      let oldValue = atomicByte.fetchAdd(4);
      let end = Date.now();

      expect(oldValue).assertEqual(1);
      expect(end - start < 1000).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_PERF_TEST_2700
     * @tc.desc   Verify fetchAdd batch call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let start = Date.now();

      for (let i = 0; i < 100; i++) {
        atomicByte.fetchAdd(1);
      }

      let end = Date.now();
      let duration = end - start;

      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RETURN_TEST_2800
     * @tc.desc   Verify multiple fetchAdd return correct sequence of old values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let results: byte[] = [];

      results.push(atomicByte.fetchAdd(10));
      results.push(atomicByte.fetchAdd(20));
      results.push(atomicByte.fetchAdd(30));
      results.push(atomicByte.fetchAdd(40));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(10);
      expect(results[2]).assertEqual(30);
      expect(results[3]).assertEqual(60);
      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_2900
     * @tc.desc   Verify fetchAdd with small positive values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(1);
      let oldValue = atomicByte.fetchAdd(1);

      expect(oldValue).assertEqual(1);
      expect(atomicByte.load()).assertEqual(2);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_3000
     * @tc.desc   Verify fetchAdd with small negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(-1);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EDGE_TEST_3100
     * @tc.desc   Verify fetchAdd from min value to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-10);
      let oldValue = atomicByte.fetchAdd(10);

      expect(oldValue).assertEqual(-10);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EDGE_TEST_3200
     * @tc.desc   Verify fetchAdd from zero to min value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(-128);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EDGE_TEST_3300
     * @tc.desc   Verify fetchAdd from max value to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchAdd(-127);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_3400
     * @tc.desc   Verify fetchAdd swap from max to min using overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchAdd(1);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_3500
     * @tc.desc   Verify fetchAdd swap from min to max using underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      let oldValue = atomicByte.fetchAdd(-1);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_COUNTER_TEST_3600
     * @tc.desc   Verify fetchAdd for atomic counter increment by multiple
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);

      let old1 = counter.fetchAdd(5);
      expect(old1).assertEqual(0);

      let old2 = counter.fetchAdd(10);
      expect(old2).assertEqual(5);

      expect(counter.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_COUNTER_TEST_3700
     * @tc.desc   Verify fetchAdd for atomic counter decrement
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(100);

      let old1 = counter.fetchAdd(-20);
      expect(old1).assertEqual(100);

      let old2 = counter.fetchAdd(-30);
      expect(old2).assertEqual(80);

      expect(counter.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_SEQUENTIAL_TEST_3800
     * @tc.desc   Verify fetchAdd maintains correct sequential state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(50);

      let oldValue = atomicByte.fetchAdd(25);
      expect(oldValue).assertEqual(50);
      expect(atomicByte.load()).assertEqual(75);

      let oldValue2 = atomicByte.fetchAdd(-50);
      expect(oldValue2).assertEqual(75);
      expect(atomicByte.load()).assertEqual(25);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_SEQUENTIAL_TEST_3900
     * @tc.desc   Verify fetchAdd with alternating positive and negative values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.fetchAdd(50);
      expect(atomicByte.load()).assertEqual(50);

      atomicByte.fetchAdd(-30);
      expect(atomicByte.load()).assertEqual(20);

      atomicByte.fetchAdd(10);
      expect(atomicByte.load()).assertEqual(30);

      atomicByte.fetchAdd(-20);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_AGGREGATE_TEST_4000
     * @tc.desc   Verify fetchAdd with negative values for data aggregation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let sum = new AtomicByte(100);

      sum.fetchAdd(-10);
      sum.fetchAdd(-20);
      sum.fetchAdd(-30);

      expect(sum.load()).assertEqual(40);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_INITIAL_TEST_4100
     * @tc.desc   Verify fetchAdd preserves initial value as return
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(42);
      let oldValue = atomicByte.fetchAdd(8);

      expect(oldValue).assertEqual(42);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_INITIAL_TEST_4200
     * @tc.desc   Verify fetchAdd with zero initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd4200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(50);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_VALUE_TEST_4300
     * @tc.desc   Verify fetchAdd with value 1 for increment operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd4300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(1);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_VALUE_TEST_4400
     * @tc.desc   Verify fetchAdd with value -1 for decrement operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd4400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchAdd(-1);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(9);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RANGE_TEST_4500
     * @tc.desc   Verify fetchAdd with values in middle range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd4500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      let oldValue = atomicByte.fetchAdd(100);

      expect(oldValue).assertEqual(-50);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_RANGE_TEST_4600
     * @tc.desc   Verify fetchAdd with values from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd4600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-100);
      let addValue: byte = 50;
      let oldValue = atomicByte.fetchAdd(addValue);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ROUND_TEST_4700
     * @tc.desc   Verify fetchAdd with round trip to original value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd4700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(50);

      atomicByte.fetchAdd(25);
      atomicByte.fetchAdd(-25);

      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_IDEMPOTENT_TEST_4800
     * @tc.desc   Verify fetchAdd with zero is idempotent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd4800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(100);

      let old1 = atomicByte.fetchAdd(0);
      expect(old1).assertEqual(100);

      let old2 = atomicByte.fetchAdd(0);
      expect(old2).assertEqual(100);

      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd4900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_ERROR_TEST_4900
     * @tc.desc   Verify fetchAdd with undefined parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAdd4900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(1);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAddFunc = obj as FetchAddObjectParam;
        fetchAddFunc.fetchAdd(undefined as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAdd5000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_5000
     * @tc.desc   Verify fetchAdd with large positive overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd5000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);
      let oldValue = atomicByte.fetchAdd(50);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(-106);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd5100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXTREME_TEST_5100
     * @tc.desc   Verify fetchAdd with large negative underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAdd5100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-100);
      let oldValue = atomicByte.fetchAdd(-50);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(106);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd5200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_BASIC_TEST_5200
     * @tc.desc   Verify fetchAdd returns previous value and updates state
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAdd5200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(25);
      let oldValue = atomicByte.fetchAdd(25);

      expect(oldValue).assertEqual(25);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAdd5300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_INITIAL_TEST_5300
     * @tc.desc   Verify fetchAdd from negative initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAdd5300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-25);
      let oldValue = atomicByte.fetchAdd(50);

      expect(oldValue).assertEqual(-25);
      expect(atomicByte.load()).assertEqual(25);
    })
  })
}
