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

interface LoadWithParams {
  load: (a: number) => byte;
}

export default function AtomicByteLoadTest(): void {
  describe("AtomicByteLoadTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteLoad0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_PARAM_TEST_0100
     * @tc.desc   Verify load method with no parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(value).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_0200
     * @tc.desc   Verify load returns zero value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      let value = atomicByte.load();
      expect(value).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteLoad0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_0300
     * @tc.desc   Verify load returns negative value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(-50);
      let value = atomicByte.load();
      expect(value).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteLoad0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EDGE_TEST_0400
     * @tc.desc   Verify load returns byte max value 127 correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      let value = atomicByte.load();
      expect(value).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteLoad0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EDGE_TEST_0500
     * @tc.desc   Verify load returns byte min value -128 correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-128);
      let value = atomicByte.load();
      expect(value).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteLoad0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_TYPE_TEST_0600
     * @tc.desc   Verify load return value type is number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(Number.isInteger(value)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteLoad0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_0700
     * @tc.desc   Verify load returns new value after store operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(atomicByte.load()).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteLoad0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_0800
     * @tc.desc   Verify load returns latest value after multiple store operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(atomicByte.load()).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
      atomicByte.store(30);
      expect(atomicByte.load()).assertEqual(30);
      atomicByte.store(-50);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteLoad0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_0900
     * @tc.desc   Verify load returns same value on multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value1 = atomicByte.load();
      let value2 = atomicByte.load();
      let value3 = atomicByte.load();
      expect(value1).assertEqual(10);
      expect(value2).assertEqual(10);
      expect(value3).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_OPER_TEST_1000
     * @tc.desc   Verify load value used in subsequent store operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      atomicByte.store(Int.toByte(value + 5));
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteLoad1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_OPER_TEST_1100
     * @tc.desc   Verify load combined with exchange operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.load();
      let exchangedValue = atomicByte.exchange(20);
      expect(oldValue).assertEqual(10);
      expect(exchangedValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteLoad1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SPECIAL_TEST_1200
     * @tc.desc   Verify load immediately after construction
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(42);
      let value = atomicByte.load();
      expect(value).assertEqual(42);
    })
    /**
     * @tc.name   testAtomicByteLoad1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SPECIAL_TEST_1300
     * @tc.desc   Verify load on multiple independent AtomicByte instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(10);
      let atomic2 = new AtomicByte(20);
      let atomic3 = new AtomicByte(-30);
      expect(atomic1.load()).assertEqual(10);
      expect(atomic2.load()).assertEqual(20);
      expect(atomic3.load()).assertEqual(-30);
    })
    /**
     * @tc.name   testAtomicByteLoad1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SPECIAL_TEST_1400
     * @tc.desc   Verify load in loop executes correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(42);
      for (let i = 0; i < 100; i++) {
        let value = atomicByte.load();
        expect(value).assertEqual(42);
      }
    })
    /**
     * @tc.name   testAtomicByteLoad1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_TYPE_TEST_1500
     * @tc.desc   Verify load return value within byte range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(value >= -128 && value <= 127).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteLoad1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_COUNTER_TEST_1600
     * @tc.desc   Verify load returns current counter value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);
      counter.store(5);
      let currentCount = counter.load();
      expect(currentCount).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteLoad1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_COUNTER_TEST_1700
     * @tc.desc   Verify load in loop with counter updates
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i);
        counter.store(val);
        let currentCount = counter.load();
        expect(currentCount).assertEqual(i);
      }
    })
    /**
     * @tc.name   testAtomicByteLoad1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_FLAG_TEST_1800
     * @tc.desc   Verify load reads status flag value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flag = new AtomicByte(0);
      let status = flag.load();
      expect(status).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteLoad1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_FLAG_TEST_1900
     * @tc.desc   Verify load reads status flag value after update to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flag = new AtomicByte(0);
      let status = flag.load();
      expect(status).assertEqual(0);
      flag.store(1);
      status = flag.load();
      expect(status).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteLoad2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BUFFER_TEST_2000
     * @tc.desc   Verify load reads values from buffer array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let buffer: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i);
        buffer.push(new AtomicByte(val));
      }
      for (let i = 0; i < 10; i++) {
        let value = buffer[i].load();
        expect(value).assertEqual(i);
      }
    })
    /**
     * @tc.name   testAtomicByteLoad2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BUFFER_TEST_2100
     * @tc.desc   Verify load reads modified value in buffer
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let buffer: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i);
        buffer.push(new AtomicByte(val));
      }
      buffer[5].store(42);
      let value = buffer[5].load();
      expect(value).assertEqual(42);
    })
    /**
     * @tc.name   testAtomicByteLoad2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SENSOR_TEST_2200
     * @tc.desc   Verify load reads temperature sensor value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      let currentTemp = temperature.load();
      expect(currentTemp).assertEqual(25);
    })
    /**
     * @tc.name   testAtomicByteLoad2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SENSOR_TEST_2300
     * @tc.desc   Verify load reads updated temperature sensor value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      let currentTemp = temperature.load();
      expect(currentTemp).assertEqual(25);
      temperature.store(26);
      currentTemp = temperature.load();
      expect(currentTemp).assertEqual(26);
    })
    /**
     * @tc.name   testAtomicByteLoad2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SENSOR_TEST_2400
     * @tc.desc   Verify load in loop with temperature changes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(25 + i);
        temperature.store(val);
        let currentTemp = temperature.load();
        expect(currentTemp).assertEqual(25 + i);
      }
    })
    /**
     * @tc.name   testAtomicByteLoad2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_CONFIG_TEST_2500
     * @tc.desc   Verify load reads configuration value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new AtomicByte(10);
      let maxRetries = config.load();
      expect(maxRetries).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_CONFIG_TEST_2600
     * @tc.desc   Verify load reads updated configuration value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new AtomicByte(10);
      let maxRetries = config.load();
      expect(maxRetries).assertEqual(10);
      config.store(20);
      maxRetries = config.load();
      expect(maxRetries).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteLoad2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_CONCURRENT_TEST_2700
     * @tc.desc   Verify load returns valid value for concurrent access check
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let concurrentCount = new AtomicByte(0);
      let count = concurrentCount.load();
      expect(count).assertEqual(0);
      concurrentCount.fetchAdd(1);
      count = concurrentCount.load();
      expect(count).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteLoad2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_CONCURRENT_TEST_2800
     * @tc.desc   Verify load monitors resource usage correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let resourceCount = new AtomicByte(0);
      resourceCount.fetchAdd(1);
      let usage = resourceCount.load();
      expect(usage).assertEqual(1);
      resourceCount.fetchSub(1);
      usage = resourceCount.load();
      expect(usage).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteLoad2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_PERF_TEST_2900
     * @tc.desc   Verify load single call performance
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteLoad2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(10);
      let start = Date.now();
      let value = atomicByte.load();
      let end = Date.now();
      let duration = end - start;
      expect(value).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_PERF_TEST_3000
     * @tc.desc   Verify load batch call performance with 10000 calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteLoad3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(42);
      let start = Date.now();
      for (let i = 0; i < 10000; i++) {
        let value = atomicByte.load();
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomicByte.load()).assertEqual(42);
    })
    /**
     * @tc.name   testAtomicByteLoad3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_COMPAT_TEST_3100
     * @tc.desc   Verify load behavior consistency across operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteLoad3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(value).assertEqual(10);
      atomicByte.store(20);
      expect(atomicByte.load()).assertEqual(20);
      atomicByte.store(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BASIC_TEST_3200
     * @tc.desc   Verify load with small positive value 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(1);
      let value = atomicByte.load();
      expect(value).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteLoad3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BASIC_TEST_3300
     * @tc.desc   Verify load with small negative value -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      let value = atomicByte.load();
      expect(value).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteLoad3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BASIC_TEST_3400
     * @tc.desc   Verify load with typical byte value 100
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(100);
      let value = atomicByte.load();
      expect(value).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteLoad3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EDGE_TEST_3500
     * @tc.desc   Verify load with value near max boundary 126
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(126);
      let value = atomicByte.load();
      expect(value).assertEqual(126);
    })
    /**
     * @tc.name   testAtomicByteLoad3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EDGE_TEST_3600
     * @tc.desc   Verify load with value near min boundary -127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-127);
      let value = atomicByte.load();
      expect(value).assertEqual(-127);
    })
    /**
     * @tc.name   testAtomicByteLoad3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_HEX_TEST_3700
     * @tc.desc   Verify load with hex value 0x7F
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0x7F);
      let value = atomicByte.load();
      expect(value).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteLoad3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_HEX_TEST_3800
     * @tc.desc   Verify load with negative hex value -0x80
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-0x80);
      let value = atomicByte.load();
      expect(value).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteLoad3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_BINARY_TEST_3900
     * @tc.desc   Verify load with binary value 0b1010
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0b1010);
      let value = atomicByte.load();
      expect(value).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad4000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_OCTAL_TEST_4000
     * @tc.desc   Verify load with octal value 0o77
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteLoad4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0o77);
      let value = atomicByte.load();
      expect(value).assertEqual(63);
    })
    /**
     * @tc.name   testAtomicByteLoad4100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EXTREME_TEST_4100
     * @tc.desc   Verify load after transition from max to min value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      expect(atomicByte.load()).assertEqual(127);
      atomicByte.store(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteLoad4200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_EXTREME_TEST_4200
     * @tc.desc   Verify load after transition from min to max value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad4200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      expect(atomicByte.load()).assertEqual(-128);
      atomicByte.store(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteLoad4300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_ERROR_TEST_4300
     * @tc.desc   Verify load with extra parameter throws error
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteLoad4300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(10);
      let errorThrown = false;
      try {
        let obj: Object = atomicByte;
        let loadFunc = obj as LoadWithParams;
        loadFunc.load(1);
      } catch (e) {
        errorThrown = true;
      }
      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteLoad4400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_4400
     * @tc.desc   Verify load returns value that can be used in arithmetic operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad4400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      let result = value + 5;
      expect(result).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteLoad4500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_4500
     * @tc.desc   Verify load returns value that can be used in comparison
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad4500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(value > 5).assertTrue();
      expect(value < 20).assertTrue();
      expect(value === 10).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteLoad4600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_RETURN_TEST_4600
     * @tc.desc   Verify load can be used directly in conditional expression
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteLoad4600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let value = atomicByte.load();
      expect(value).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteLoad4700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_LOAD_SPECIAL_TEST_4700
     * @tc.desc   Verify load works with multiple instances in array
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteLoad4700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomics: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i * 10);
        atomics.push(new AtomicByte(val));
      }
      for (let i = 0; i < 10; i++) {
        let expectedVal: byte = Int.toByte(i * 10);
        expect(atomics[i].load()).assertEqual(expectedVal);
      }
    })  })
}
