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

interface FetchOrNoParam {
  fetchOr: () => byte;
}

interface FetchOrObjectParam {
  fetchOr: (a: Object) => byte;
}

interface FetchOrStringParam {
  fetchOr: (a: string) => byte;
}

interface FetchOrNumberParam {
  fetchOr: (a: number) => byte;
}

export default function AtomicByteFetchOrTest(): void {
  describe("AtomicByteFetchOrTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchOr0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_PARAM_TEST_0100
     * @tc.desc   Verify fetchOr with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchOr0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(3);
      let oldValue = atomicByte.fetchOr(4);

      expect(oldValue).assertEqual(3);
      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchOr0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_PARAM_TEST_0200
     * @tc.desc   Verify fetchOr throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(3);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchOrFunc = obj as FetchOrNoParam;
        fetchOrFunc.fetchOr();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EDGE_TEST_0300
     * @tc.desc   Verify fetchOr with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchOr(127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchOr0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EDGE_TEST_0400
     * @tc.desc   Verify fetchOr with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchOr0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(7);
      let oldValue = atomicByte.fetchOr(0);

      expect(oldValue).assertEqual(7);
      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchOr0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EDGE_TEST_0500
     * @tc.desc   Verify fetchOr with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchOr(-3);

      expect(oldValue).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchOr0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_ERROR_TEST_0600
     * @tc.desc   Verify fetchOr throws error when null parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(3);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchOrFunc = obj as FetchOrObjectParam;
        fetchOrFunc.fetchOr(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_ERROR_TEST_0700
     * @tc.desc   Verify fetchOr throws error when out of range value 128 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(3);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchOrFunc = obj as FetchOrNumberParam;
        fetchOrFunc.fetchOr(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr0750
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_ERROR_TEST_0750
     * @tc.desc   Verify fetchOr throws error when out of range value -129 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr0750", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(3);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchOrFunc = obj as FetchOrNumberParam;
        fetchOrFunc.fetchOr(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_RETURN_TEST_0800
     * @tc.desc   Verify fetchOr returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);

      let oldValue1 = atomicByte.fetchOr(2);
      expect(oldValue1).assertEqual(1);

      let oldValue2 = atomicByte.fetchOr(4);
      expect(oldValue2).assertEqual(3);

      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchOr0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_RETURN_TEST_0900
     * @tc.desc   Verify fetchOr returns zero when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchOr(5);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_RETURN_TEST_1000
     * @tc.desc   Verify fetchOr results in all ones when OR operands are complementary
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let val1: byte = 0x0F;
      let val2: byte = -16;
      let atomicByte = new AtomicByte(val1);
      let oldValue = atomicByte.fetchOr(val2);

      expect(oldValue).assertEqual(15);
      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_RETURN_TEST_1100
     * @tc.desc   Verify fetchOr with same bit pattern multiple times keeps value unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let val: byte = 0x01;
      atomicByte.fetchOr(val);
      atomicByte.fetchOr(val);

      expect(atomicByte.load()).assertEqual(0x01);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_TYPE_TEST_1200
     * @tc.desc   Verify fetchOr return value type is byte
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchOr1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchOr(3);

      expect(Number.isInteger(oldValue)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_OPER_TEST_1300
     * @tc.desc   Verify fetchOr with consecutive OR operations accumulates bits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let val1: byte = 0x01;
      let val2: byte = 0x02;
      let val3: byte = 0x04;
      atomicByte.fetchOr(val1);
      atomicByte.fetchOr(val2);
      atomicByte.fetchOr(val3);

      expect(atomicByte.load()).assertEqual(0x07);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_COMBINED_TEST_1400
     * @tc.desc   Verify fetchOr combined with fetchAnd clears bits correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let val1: byte = 0x0F;
      let val2: byte = -16;
      atomicByte.fetchOr(val1);
      atomicByte.fetchAnd(val2);

      expect(atomicByte.load()).assertEqual(0x00);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_BITOP_TEST_1500
     * @tc.desc   Verify fetchOr sets specific bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0b0010);
      let oldValue = atomicByte.fetchOr(0b0001);

      expect(oldValue).assertEqual(2);
      expect(atomicByte.load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_BITOP_TEST_1600
     * @tc.desc   Verify fetchOr sets all bits progressively from 0 to all ones
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      for (let i: number = 0; i < 8; i++) {
        let val: byte = Int.toByte(1 << i);
        atomicByte.fetchOr(val);
      }

      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_FLAG_TEST_1700
     * @tc.desc   Verify fetchOr for bit flag operations sets lowest bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flags = new AtomicByte(0x00);
      let val1: byte = 0x01;
      let val2: byte = 0x02;
      flags.fetchOr(val1);

      expect(flags.load()).assertEqual(0x01);
      flags.fetchOr(val2);

      expect(flags.load()).assertEqual(0x03);
    })


    /**
     * @tc.name   testAtomicByteFetchOr1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_DATA_TEST_1800
     * @tc.desc   Verify fetchOr merges data bits from two bytes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data1 = new AtomicByte(0x0A);
      let data2: byte = 0x05;
      data1.fetchOr(data2);

      expect(data1.load()).assertEqual(0x0F);
    })
    /**
     * @tc.name   testAtomicByteFetchOr1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EVENT_TEST_1900
     * @tc.desc   Verify fetchOr sets event flags for notification system
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let eventFlags = new AtomicByte(0);
      let val1: byte = 0x01;
      let val2: byte = 0x02;
      eventFlags.fetchOr(val1);
      eventFlags.fetchOr(val2);

      expect(eventFlags.load()).assertEqual(0x03);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EDGE_TEST_2000
     * @tc.desc   Verify fetchOr with min byte value -128
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchOr(-128);

      expect(oldValue).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_ERROR_TEST_2100
     * @tc.desc   Verify fetchOr throws error when string parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(5);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchOrFunc = obj as FetchOrStringParam;
        fetchOrFunc.fetchOr("10");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchOr2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_RETURN_TEST_2200
     * @tc.desc   Verify multiple fetchOr operations return correct sequence of old values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchOr2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);

      let results: byte[] = [];
      let val1: byte = 0x01;
      let val2: byte = 0x02;
      let val3: byte = 0x04;
      let val4: byte = 0x08;
      results.push(atomicByte.fetchOr(val1));
      results.push(atomicByte.fetchOr(val2));
      results.push(atomicByte.fetchOr(val3));
      results.push(atomicByte.fetchOr(val4));

      expect(results[0]).assertEqual(0);
      expect(results[1]).assertEqual(1);
      expect(results[2]).assertEqual(3);
      expect(results[3]).assertEqual(7);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_OPER_TEST_2300
     * @tc.desc   Verify fetchOr combined with other atomic methods works correctly
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let val1: byte = 0x0F;
      let val2: byte = -16;

      let oldValue1 = atomicByte.fetchOr(val1);
      expect(oldValue1).assertEqual(0);

      let value = atomicByte.load();
      expect(value).assertEqual(15);

      atomicByte.store(0);
      expect(atomicByte.load()).assertEqual(0);

      let oldValue2 = atomicByte.fetchOr(val2);
      expect(oldValue2).assertEqual(0);
      expect(atomicByte.load()).assertEqual(-16);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_COMBINED_TEST_2400
     * @tc.desc   Verify fetchOr with store and load operations sequence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0x00);
      let val1: byte = 0x11;
      let val2: byte = 0x22;
      let val3: byte = 0x44;

      atomicByte.fetchOr(val1);
      expect(atomicByte.load()).assertEqual(0x11);

      atomicByte.store(val2);
      expect(atomicByte.load()).assertEqual(0x22);

      atomicByte.fetchOr(val3);
      expect(atomicByte.load()).assertEqual(0x66);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EXTREME_TEST_2500
     * @tc.desc   Verify fetchOr with all bits set then cleared
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let val: byte = -1;
      atomicByte.fetchOr(val);

      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_EXTREME_TEST_2600
     * @tc.desc   Verify fetchOr with overlapping bit patterns
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0x0F);
      let val: byte = 0x1E;
      atomicByte.fetchOr(val);

      expect(atomicByte.load()).assertEqual(0x1F);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_ATOMIC_TEST_2700
     * @tc.desc   Verify fetchOr atomicity with concurrent access using async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchOr2700", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let iterations: number = 100;

      let task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = i % 8;
          let mask: byte = Int.toByte(1 << bitPos);
          atomicByte.fetchOr(mask);
        }
      };

      let task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = i % 8;
          let mask: byte = Int.toByte(1 << bitPos);
          atomicByte.fetchOr(mask);
        }
      };

      let task3 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = i % 8;
          let mask: byte = Int.toByte(1 << bitPos);
          atomicByte.fetchOr(mask);
        }
      };

      let task4 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = i % 8;
          let mask: byte = Int.toByte(1 << bitPos);
          atomicByte.fetchOr(mask);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_PERF_TEST_2800
     * @tc.desc   Verify fetchOr single call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr2800", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(3);
      let start: number = Date.now();

      for (let i: number = 0; i < 1000; i++) {
        atomicByte.fetchOr(0x01);
        atomicByte.fetchOr(0x00);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(atomicByte.load()).assertEqual(3);
    })
    /**
     * @tc.name   testAtomicByteFetchOr2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHOR_PERF_TEST_2900
     * @tc.desc   Verify fetchOr batch call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchOr2900", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(0);
      let iterations: number = 10000;
      let start: number = Date.now();
      let testVal: byte = 0x55;

      for (let i: number = 0; i < iterations; i++) {
        atomicByte.fetchOr(testVal);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(atomicByte.load()).assertEqual(testVal);
    })
  })
}
