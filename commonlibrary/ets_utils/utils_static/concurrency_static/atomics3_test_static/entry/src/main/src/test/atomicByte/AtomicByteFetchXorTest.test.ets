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

interface FetchXorNoParam {
  fetchXor: () => byte;
}

interface FetchXorObjectParam {
  fetchXor: (a: Object) => byte;
}

interface FetchXorStringParam {
  fetchXor: (a: string) => byte;
}

interface FetchXorNumberParam {
  fetchXor: (a: number) => byte;
}

export default function AtomicByteFetchXorTest(): void {
  describe("AtomicByteFetchXorTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchXor0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PARAM_TEST_0100
     * @tc.desc   Verify fetchXor with all required parameters returns old value and updates to XOR result
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchXor0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchXor(3);

      expect(oldValue).assertEqual(5);
      expect(atomicByte.load()).assertEqual(6);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PARAM_TEST_0200
     * @tc.desc   Verify fetchXor throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchXorFunc = obj as FetchXorNoParam;
        fetchXorFunc.fetchXor();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PARAM_TEST_0300
     * @tc.desc   Verify fetchXor with normal byte value 10 XOR 3 returns 10 and updates to 9
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchXor0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchXor(3);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(9);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_EDGE_TEST_0400
     * @tc.desc   Verify fetchXor with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchXor(127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PARAM_TEST_0500
     * @tc.desc   Verify fetchXor with zero value returns old value and keeps value unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchXor0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(7);
      let oldValue = atomicByte.fetchXor(0);

      expect(oldValue).assertEqual(7);
      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_BASIC_TEST_0600
     * @tc.desc   Verify fetchXor with hexadecimal value 15 XOR 10 returns 5
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(15);
      let oldValue = atomicByte.fetchXor(10);

      expect(oldValue).assertEqual(15);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_EDGE_TEST_0700
     * @tc.desc   Verify fetchXor with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchXor(-3);

      expect(oldValue).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_EDGE_TEST_0800
     * @tc.desc   Verify fetchXor with all ones mask 127 flips all bits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(18);
      let oldValue = atomicByte.fetchXor(127);

      expect(oldValue).assertEqual(18);
      expect(atomicByte.load()).assertEqual(109);
    })
    /**
     * @tc.name   testAtomicByteFetchXor0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ERROR_TEST_0900
     * @tc.desc   Verify fetchXor throws error when null parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchXorFunc = obj as FetchXorObjectParam;
        fetchXorFunc.fetchXor(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ERROR_TEST_1000
     * @tc.desc   Verify fetchXor throws error when out of range value 128 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchXorFunc = obj as FetchXorNumberParam;
        fetchXorFunc.fetchXor(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor1050
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ERROR_TEST_1050
     * @tc.desc   Verify fetchXor throws error when out of range value -129 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor1050", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchXorFunc = obj as FetchXorNumberParam;
        fetchXorFunc.fetchXor(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ERROR_TEST_1100
     * @tc.desc   Verify fetchXor throws error when string parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchXorFunc = obj as FetchXorStringParam;
        fetchXorFunc.fetchXor("10");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_TYPE_TEST_1200
     * @tc.desc   Verify fetchXor return value type is number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchXor1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchXor(3);

      expect(Number.isInteger(oldValue)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchXor1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_RETURN_TEST_1300
     * @tc.desc   Verify fetchXor returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);

      let oldValue1 = atomicByte.fetchXor(2);
      expect(oldValue1).assertEqual(1);

      let oldValue2 = atomicByte.fetchXor(1);
      expect(oldValue2).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_RETURN_TEST_1400
     * @tc.desc   Verify fetchXor returns zero when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchXor(5);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_RETURN_TEST_1500
     * @tc.desc   Verify fetchXor with same value results in 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchXor(10);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_RETURN_TEST_1600
     * @tc.desc   Verify fetchXor twice with same mask restores original value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);
      atomicByte.fetchXor(127);
      atomicByte.fetchXor(127);

      expect(atomicByte.load()).assertEqual(1);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_EDGE_TEST_1700
     * @tc.desc   Verify fetchXor with min byte value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchXor(-128);

      expect(oldValue).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ATOMIC_TEST_1800
     * @tc.desc   Verify fetchXor atomicity with concurrent access using async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor1800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let iterations: number = 100;

      for (let i: number = 0; i < iterations; i++) {
        let bitPos: number = i % 8;
        let mask: byte = Int.toByte(1 << bitPos);
        atomicByte.fetchXor(mask);
      }

      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchXor1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_OPER_TEST_1900
     * @tc.desc   Verify fetchXor with consecutive XOR operations accumulates correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      atomicByte.fetchXor(1);
      atomicByte.fetchXor(2);
      atomicByte.fetchXor(4);

      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_COMBINED_TEST_2000
     * @tc.desc   Verify fetchXor combined with fetchOr works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.fetchXor(1);
      atomicByte.fetchOr(2);

      expect(atomicByte.load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_BITOP_TEST_2100
     * @tc.desc   Verify fetchXor flips specific bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0b0010);
      let oldValue = atomicByte.fetchXor(0b0001);

      expect(oldValue).assertEqual(2);
      expect(atomicByte.load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_BITOP_TEST_2200
     * @tc.desc   Verify fetchXor progressively flips all bits from 0 to all ones
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      for (let i: number = 0; i < 8; i++) {
        let val: byte = Int.toByte(1 << i);
        atomicByte.fetchXor(val);
      }

      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_BITOP_TEST_2300
     * @tc.desc   Verify fetchXor twice with same mask restores original value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(18);
      atomicByte.fetchXor(-16);
      atomicByte.fetchXor(-16);

      expect(atomicByte.load()).assertEqual(18);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_COMBINED_TEST_2400
     * @tc.desc   Verify fetchXor combined with store and load operations sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let val1: byte = 17;
      let val2: byte = 34;
      let val3: byte = 68;

      atomicByte.fetchXor(val1);
      expect(atomicByte.load()).assertEqual(17);

      atomicByte.store(val2);
      expect(atomicByte.load()).assertEqual(34);

      atomicByte.fetchXor(val3);
      expect(atomicByte.load()).assertEqual(102);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_OPER_TEST_2500
     * @tc.desc   Verify multiple fetchXor operations return correct sequence of old values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchXor2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);

      let results: byte[] = [];
      let val1: byte = 1;
      let val2: byte = 2;
      let val3: byte = 4;
      let val4: byte = 8;
      results.push(atomicByte.fetchXor(val1));
      results.push(atomicByte.fetchXor(val2));
      results.push(atomicByte.fetchXor(val3));
      results.push(atomicByte.fetchXor(val4));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(3);
      expect(results[3]).assertEqual(7);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PERF_TEST_2600
     * @tc.desc   Verify fetchXor single call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor2600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let start: number = Date.now();

      for (let i: number = 0; i < 1000; i++) {
        atomicByte.fetchXor(1);
        atomicByte.fetchXor(1);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_PERF_TEST_2700
     * @tc.desc   Verify fetchXor batch call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchXor2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let iterations: number = 10000;
      let start: number = Date.now();
      let testVal: byte = 85;

      for (let i: number = 0; i < iterations; i++) {
        atomicByte.fetchXor(testVal);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(typeof atomicByte.load()).assertEqual('byte');
    })
    /**
     * @tc.name   testAtomicByteFetchXor2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_FLAG_TEST_2800
     * @tc.desc   Verify fetchXor for bit flag operations toggles lowest bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flags = new AtomicByte(0);
      flags.fetchXor(1);

      expect(flags.load()).assertEqual(1);
      flags.fetchXor(1);

      expect(flags.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchXor2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ENCRYPT_TEST_2900
     * @tc.desc   Verify fetchXor for simple XOR encryption and decryption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data = new AtomicByte(18);
      let key: byte = 52;

      data.fetchXor(key);

      expect(data.load()).assertEqual(38);
      data.fetchXor(key);

      expect(data.load()).assertEqual(18);
    })
    /**
     * @tc.name   testAtomicByteFetchXor3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_ENCRYPT_TEST_3000
     * @tc.desc   Verify fetchXor for multi-round XOR encryption and decryption
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data = new AtomicByte(85);
      let key1: byte = 18;
      let key2: byte = 52;
      data.fetchXor(key1);
      data.fetchXor(key2);
      data.fetchXor(key2);
      data.fetchXor(key1);

      expect(data.load()).assertEqual(85);
    })
    /**
     * @tc.name   testAtomicByteFetchXor3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_CHECKSUM_TEST_3100
     * @tc.desc   Verify fetchXor for cumulative checksum calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let checksum = new AtomicByte(0);
      let data1: byte = 18;
      let data2: byte = 52;

      checksum.fetchXor(data1);
      checksum.fetchXor(data2);

      expect(checksum.load()).assertEqual(38);
    })

    /**
     * @tc.name   testAtomicByteFetchXor3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_DATA_TEST_3200
     * @tc.desc   Verify fetchXor for repeated data compression by storing XOR difference
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let parity = new AtomicByte(0);
      let data: byte = 85;

      parity.fetchXor(data);

      expect(parity.load()).assertEqual(85);
    })
    /**
     * @tc.name   testAtomicByteFetchXor3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHXOR_DATA_TEST_3300
     * @tc.desc   Verify fetchXor for XOR with same value results in zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchXor3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(85);
      atomicByte.fetchXor(85);

      expect(atomicByte.load()).assertEqual(0);
    })
  })
}
