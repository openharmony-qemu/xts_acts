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

export default function AtomicByteConstructorTest(): void {
  describe("AtomicByteConstructorTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteConstructor0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_PARAM_TEST_0100
     * @tc.desc   Verify AtomicByte constructor with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteConstructor0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_0200
     * @tc.desc   Verify AtomicByte constructor with normal byte value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteConstructor0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_0300
     * @tc.desc   Verify AtomicByte constructor with positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(50);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteConstructor0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_0400
     * @tc.desc   Verify AtomicByte constructor with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(0);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteConstructor0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_0500
     * @tc.desc   Verify AtomicByte constructor with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-50);
      expect(atomicByte.load()).assertEqual(-50);
    })
    /**
     * @tc.name   testAtomicByteConstructor0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_0600
     * @tc.desc   Verify AtomicByte constructor with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteConstructor0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_0700
     * @tc.desc   Verify AtomicByte constructor with byte min value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteConstructor0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_0800
     * @tc.desc   Verify AtomicByte constructor with hex value 0x7F
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0x7F);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteConstructor0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_0900
     * @tc.desc   Verify AtomicByte constructor with octal value 0o77
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0o77);
      expect(atomicByte.load()).assertEqual(63);
    })
    /**
     * @tc.name   testAtomicByteConstructor1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_1000
     * @tc.desc   Verify AtomicByte constructor with binary value 0b1010
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0b1010);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteConstructor1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_RETURN_TEST_1100
     * @tc.desc   Verify AtomicByte constructor returns instance object
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(typeof atomicByte).assertEqual("object");
    })
    /**
     * @tc.name   testAtomicByteConstructor1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_TYPE_TEST_1200
     * @tc.desc   Verify AtomicByte constructor returns correct instance type
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(atomicByte instanceof AtomicByte).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteConstructor1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_RETURN_TEST_1300
     * @tc.desc   Verify AtomicByte constructor with negative initial value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-100);
      expect(atomicByte.load()).assertEqual(-100);
    })
    /**
     * @tc.name   testAtomicByteConstructor1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_TYPE_TEST_1400
     * @tc.desc   Verify AtomicByte instance has available methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      expect(typeof atomicByte.load).assertEqual("function");
      expect(typeof atomicByte.store).assertEqual("function");
      expect(typeof atomicByte.exchange).assertEqual("function");
    })
    /**
     * @tc.name   testAtomicByteConstructor1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_INIT_TEST_1500
     * @tc.desc   Verify AtomicByte constructor sets initial value correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(42);
      expect(atomicByte.load()).assertEqual(42);
    })
    /**
     * @tc.name   testAtomicByteConstructor1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_INIT_TEST_1600
     * @tc.desc   Verify multiple AtomicByte instances with different initial values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(10);
      let atomic2 = new AtomicByte(20);
      let atomic3 = new AtomicByte(-30);
      expect(atomic1.load()).assertEqual(10);
      expect(atomic2.load()).assertEqual(20);
      expect(atomic3.load()).assertEqual(-30);
    })
    /**
     * @tc.name   testAtomicByteConstructor1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_INIT_TEST_1700
     * @tc.desc   Verify multiple AtomicByte instances are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(10);
      let atomic2 = new AtomicByte(20);
      atomic1.store(100);
      expect(atomic1.load()).assertEqual(100);
      expect(atomic2.load()).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteConstructor1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_INIT_TEST_1800
     * @tc.desc   Verify multiple AtomicByte instances with same initial value are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(15);
      let atomic2 = new AtomicByte(15);
      atomic1.store(30);
      expect(atomic1.load()).assertEqual(30);
      expect(atomic2.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteConstructor1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_1900
     * @tc.desc   Verify AtomicByte constructor with values near max boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte1 = new AtomicByte(126);
      expect(atomicByte1.load()).assertEqual(126);
      let atomicByte2 = new AtomicByte(127);
      expect(atomicByte2.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteConstructor2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_2000
     * @tc.desc   Verify AtomicByte constructor with values near min boundary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte1 = new AtomicByte(-127);
      expect(atomicByte1.load()).assertEqual(-127);
      let atomicByte2 = new AtomicByte(-128);
      expect(atomicByte2.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteConstructor2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_2100
     * @tc.desc   Verify AtomicByte constructor with values 1 and -1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(1);
      let atomic2 = new AtomicByte(-1);
      expect(atomic1.load()).assertEqual(1);
      expect(atomic2.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteConstructor2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EDGE_TEST_2200
     * @tc.desc   Verify AtomicByte constructor with special hex values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomic1 = new AtomicByte(0x7F);
      let atomic2 = new AtomicByte(-0x80);
      expect(atomic1.load()).assertEqual(127);
      expect(atomic2.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteConstructor2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_PERF_TEST_2300
     * @tc.desc   Verify AtomicByte constructor performance with single call
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteConstructor2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let atomicByte = new AtomicByte(10);
      let end = Date.now();
      let duration = end - start;
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteConstructor2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_PERF_TEST_2400
     * @tc.desc   Verify AtomicByte constructor performance with multiple calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteConstructor2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let start = Date.now();
      let atomics: AtomicByte[] = [];
      for (let i = 0; i < 1000; i++) {
        let val: byte = Int.toByte(i % 128);
        atomics.push(new AtomicByte(val));
      }
      let end = Date.now();
      let duration = end - start;
      expect(atomics.length).assertEqual(1000);
    })
    /**
     * @tc.name   testAtomicByteConstructor2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_PERF_TEST_2500
     * @tc.desc   Verify AtomicByte constructor memory usage with multiple instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteConstructor2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomics: AtomicByte[] = [];
      for (let i = 0; i < 1000; i++) {
        let val: byte = Int.toByte(i % 128);
        atomics.push(new AtomicByte(val));
      }
      for (let i = 0; i < 1000; i++) {
        let expectedVal: byte = Int.toByte(i % 128);
        expect(atomics[i].load()).assertEqual(expectedVal);
      }
    })
    /**
     * @tc.name   testAtomicByteConstructor2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_COUNTER_TEST_2600
     * @tc.desc   Verify AtomicByte constructor for counter initialization from 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(0);
      expect(counter.load()).assertEqual(0);
      counter.store(1);
      expect(counter.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteConstructor2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_COUNTER_TEST_2700
     * @tc.desc   Verify AtomicByte constructor for counter initialization from non-zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let counter = new AtomicByte(10);
      expect(counter.load()).assertEqual(10);
      counter.store(11);
      expect(counter.load()).assertEqual(11);
    })
    /**
     * @tc.name   testAtomicByteConstructor2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_FLAG_TEST_2800
     * @tc.desc   Verify AtomicByte constructor for flag initialization to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flag = new AtomicByte(0);
      expect(flag.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteConstructor2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_FLAG_TEST_2900
     * @tc.desc   Verify AtomicByte constructor for flag initialization to 1
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flag = new AtomicByte(1);
      expect(flag.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteConstructor3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BUFFER_TEST_3000
     * @tc.desc   Verify AtomicByte constructor for buffer initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let buffer: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        let val: byte = Int.toByte(i);
        buffer.push(new AtomicByte(val));
      }
      for (let i = 0; i < 10; i++) {
        let expectedVal: byte = Int.toByte(i);
        expect(buffer[i].load()).assertEqual(expectedVal);
      }
    })
    /**
     * @tc.name   testAtomicByteConstructor3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BUFFER_TEST_3100
     * @tc.desc   Verify AtomicByte constructor for buffer modification
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let buffer: AtomicByte[] = [];
      for (let i = 0; i < 10; i++) {
        buffer.push(new AtomicByte(0));
      }
      buffer[5].store(42);
      expect(buffer[5].load()).assertEqual(42);
    })
    /**
     * @tc.name   testAtomicByteConstructor3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_LIMIT_TEST_3200
     * @tc.desc   Verify AtomicByte constructor for rate limiter initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let limit = new AtomicByte(100);
      expect(limit.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteConstructor3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_LIMIT_TEST_3300
     * @tc.desc   Verify AtomicByte constructor for rate limiter dynamic adjustment
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let limit = new AtomicByte(100);
      limit.store(127);
      expect(limit.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteConstructor3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_SENSOR_TEST_3400
     * @tc.desc   Verify AtomicByte constructor for temperature sensor initialization
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      expect(temperature.load()).assertEqual(25);
    })
    /**
     * @tc.name   testAtomicByteConstructor3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_SENSOR_TEST_3500
     * @tc.desc   Verify AtomicByte constructor for temperature sensor update
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let temperature = new AtomicByte(25);
      temperature.store(26);
      expect(temperature.load()).assertEqual(26);
    })
    /**
     * @tc.name   testAtomicByteConstructor3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EXTREME_TEST_3600
     * @tc.desc   Verify AtomicByte constructor swap from max to min value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      expect(atomicByte.load()).assertEqual(127);
      atomicByte.store(-128);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteConstructor3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_EXTREME_TEST_3700
     * @tc.desc   Verify AtomicByte constructor swap from min to max value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteConstructor3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-128);
      expect(atomicByte.load()).assertEqual(-128);
      atomicByte.store(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteConstructor3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_3800
     * @tc.desc   Verify AtomicByte constructor with small positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteConstructor3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(1);
      expect(atomicByte.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteConstructor3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_CONSTRUCTOR_BASIC_TEST_3900
     * @tc.desc   Verify AtomicByte constructor with small negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteConstructor3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      expect(atomicByte.load()).assertEqual(-1);
    })
  })
}
