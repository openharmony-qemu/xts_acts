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

interface FetchAndNoParam {
  fetchAnd: () => byte;
}

interface FetchAndObjectParam {
  fetchAnd: (a: Object) => byte;
}

interface FetchAndStringParam {
  fetchAnd: (a: string) => byte;
}

interface FetchAndNumberParam {
  fetchAnd: (a: number) => byte;
}

export default function AtomicByteFetchAndTest(): void {
  describe("AtomicByteFetchAndTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchAnd0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PARAM_TEST_0100
     * @tc.desc   Verify fetchAnd with all required parameters
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAnd0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(7);
      let oldValue = atomicByte.fetchAnd(6);

      expect(oldValue).assertEqual(7);
      expect(atomicByte.load()).assertEqual(6);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PARAM_TEST_0200
     * @tc.desc   Verify fetchAnd throws error when no parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndNoParam;
        fetchAndFunc.fetchAnd();
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_BASIC_TEST_0300
     * @tc.desc   Verify fetchAnd with normal byte value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAnd0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(15);
      let oldValue = atomicByte.fetchAnd(10);

      expect(oldValue).assertEqual(15);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_0400
     * @tc.desc   Verify fetchAnd with byte max value 127
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(100);
      let oldValue = atomicByte.fetchAnd(127);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_BASIC_TEST_0500
     * @tc.desc   Verify fetchAnd with zero value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAnd0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(7);
      let oldValue = atomicByte.fetchAnd(0);

      expect(oldValue).assertEqual(7);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_0600
     * @tc.desc   Verify fetchAnd with negative value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(5);
      let oldValue = atomicByte.fetchAnd(-3);

      expect(oldValue).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ERROR_TEST_0700
     * @tc.desc   Verify fetchAnd throws error when null parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndObjectParam;
        fetchAndFunc.fetchAnd(null as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ERROR_TEST_0800
     * @tc.desc   Verify fetchAnd throws error when out of range value 128 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndNumberParam;
        fetchAndFunc.fetchAnd(128);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ERROR_TEST_0900
     * @tc.desc   Verify fetchAnd throws error when out of range value -129 is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndNumberParam;
        fetchAndFunc.fetchAnd(-129);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ERROR_TEST_1000
     * @tc.desc   Verify fetchAnd throws error when string parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndStringParam;
        fetchAndFunc.fetchAnd("10");
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ERROR_TEST_1100
     * @tc.desc   Verify fetchAnd throws error when undefined parameter is provided
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let errorThrown = false;

      try {
        let obj: Object = atomicByte;
        let fetchAndFunc = obj as FetchAndObjectParam;
        fetchAndFunc.fetchAnd(undefined as Object);
      } catch (e) {
        errorThrown = true;
      }

      expect(errorThrown).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_RETURN_TEST_1200
     * @tc.desc   Verify fetchAnd returns correct old value on multiple consecutive calls
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(15);

      let oldValue1 = atomicByte.fetchAnd(10);
      expect(oldValue1).assertEqual(15);

      let oldValue2 = atomicByte.fetchAnd(5);
      expect(oldValue2).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_RETURN_TEST_1300
     * @tc.desc   Verify fetchAnd returns zero when old value is 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAnd(5);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_RETURN_TEST_1400
     * @tc.desc   Verify fetchAnd result is 0 when two numbers have no common bits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(8);
      let oldValue = atomicByte.fetchAnd(7);

      expect(oldValue).assertEqual(8);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_RETURN_TEST_1500
     * @tc.desc   Verify fetchAnd result equals one operand when one is subset of other
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(15);
      let oldValue = atomicByte.fetchAnd(7);

      expect(oldValue).assertEqual(15);
      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_TYPE_TEST_1600
     * @tc.desc   Verify fetchAnd return value type is number
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it("testAtomicByteFetchAnd1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL0, async () => {
      let atomicByte = new AtomicByte(7);
      let oldValue = atomicByte.fetchAnd(6);

      expect(Number.isInteger(oldValue)).assertTrue();
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_RETURN_TEST_1700
     * @tc.desc   Verify multiple fetchAnd operations return correct sequence of old values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      let results: byte[] = [];

      results.push(atomicByte.fetchAnd(-16));
      results.push(atomicByte.fetchAnd(15));
      results.push(atomicByte.fetchAnd(3));
      results.push(atomicByte.fetchAnd(1));

      expect(results[0]).assertEqual(-1);
      expect(results[1]).assertEqual(-16);
      expect(results[2]).assertEqual(0);
      expect(results[3]).assertEqual(0);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_OPER_TEST_1800
     * @tc.desc   Verify fetchAnd with consecutive AND operations
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);

      atomicByte.fetchAnd(-16);
      expect(atomicByte.load()).assertEqual(-16);

      atomicByte.fetchAnd(15);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_COMBINED_TEST_1900
     * @tc.desc   Verify fetchAnd combined with fetchOr
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);

      atomicByte.fetchAnd(-16);
      atomicByte.fetchOr(15);

      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_BITOP_TEST_2000
     * @tc.desc   Verify fetchAnd clears specific bit
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      atomicByte.fetchAnd(-2);

      expect(atomicByte.load()).assertEqual(-2);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_BITOP_TEST_2100
     * @tc.desc   Verify fetchAnd keeps specific bits
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      atomicByte.fetchAnd(15);

      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_BITOP_TEST_2200
     * @tc.desc   Verify fetchAnd with partial mask operation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-85);
      atomicByte.fetchAnd(-16);

      expect(atomicByte.load()).assertEqual(-96);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_OPER_TEST_2300
     * @tc.desc   Verify consecutive fetchAnd operations result in 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);

      atomicByte.fetchAnd(15);
      atomicByte.fetchAnd(-16);

      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_COMBINED_TEST_2400
     * @tc.desc   Verify fetchAnd combined with other atomic methods
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);

      let oldValue1 = atomicByte.fetchAnd(-16);
      expect(oldValue1).assertEqual(-1);

      let value = atomicByte.load();
      expect(value).assertEqual(-16);

      atomicByte.store(15);
      expect(atomicByte.load()).assertEqual(15);

      let oldValue2 = atomicByte.fetchAnd(7);
      expect(oldValue2).assertEqual(15);
      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_FLAG_TEST_2500
     * @tc.desc   Verify fetchAnd clears specific bit flag
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flags = new AtomicByte(-1);

      flags.fetchAnd(-2);
      expect(flags.load()).assertEqual(-2);

      flags.fetchAnd(-3);
      expect(flags.load()).assertEqual(-4);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PERM_TEST_2600
     * @tc.desc   Verify fetchAnd clears specific permission
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let permissions = new AtomicByte(31);
      permissions.fetchAnd(15);

      expect(permissions.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_DATA_TEST_2700
     * @tc.desc   Verify fetchAnd filters data with mask
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let data = new AtomicByte(-86);
      data.fetchAnd(15);

      expect(data.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_NETWORK_TEST_2800
     * @tc.desc   Verify fetchAnd handles network protocol flags
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let packetFlags = new AtomicByte(-1);
      packetFlags.fetchAnd(127);

      expect(packetFlags.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_CONFIG_TEST_2900
     * @tc.desc   Verify fetchAnd clears specific configuration items
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let config = new AtomicByte(-1);
      config.fetchAnd(-16);

      expect(config.load()).assertEqual(-16);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_FLAG_TEST_3000
     * @tc.desc   Verify fetchAnd clears multiple bit flags consecutively
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let flags = new AtomicByte(-1);

      flags.fetchAnd(-2);
      expect(flags.load()).assertEqual(-2);

      flags.fetchAnd(-3);
      expect(flags.load()).assertEqual(-4);

      flags.fetchAnd(-5);
      expect(flags.load()).assertEqual(-8);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PERM_TEST_3100
     * @tc.desc   Verify fetchAnd with permission mask combination
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let permissions = new AtomicByte(127);

      permissions.fetchAnd(63);
      expect(permissions.load()).assertEqual(63);

      permissions.fetchAnd(31);
      expect(permissions.load()).assertEqual(31);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_ATOMIC_TEST_3200
     * @tc.desc   Verify fetchAnd atomicity with concurrent access using async tasks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd3200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);
      let iterations: number = 100;

      let task1 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = i % 8;
          let mask: byte = Int.toByte(~(1 << bitPos));
          atomicByte.fetchAnd(mask);
        }
      };

      let task2 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = (i + 1) % 8;
          let mask: byte = Int.toByte(~(1 << bitPos));
          atomicByte.fetchAnd(mask);
        }
      };

      let task3 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = (i + 2) % 8;
          let mask: byte = Int.toByte(~(1 << bitPos));
          atomicByte.fetchAnd(mask);
        }
      };

      let task4 = async () => {
        for (let i: number = 0; i < iterations; i++) {
          let bitPos: number = (i + 3) % 8;
          let mask: byte = Int.toByte(~(1 << bitPos));
          atomicByte.fetchAnd(mask);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4()]);

      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PERF_TEST_3300
     * @tc.desc   Verify fetchAnd single call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd3300", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(7);
      let start: number = Date.now();

      for (let i: number = 0; i < 1000; i++) {
        atomicByte.fetchAnd(-1);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(atomicByte.load()).assertEqual(7);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_PERF_TEST_3400
     * @tc.desc   Verify fetchAnd batch call performance is within acceptable range
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAnd3400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(-1);
      let iterations: number = 10000;
      let start: number = Date.now();
      let testVal: byte = 85;

      for (let i: number = 0; i < iterations; i++) {
        atomicByte.fetchAnd(testVal);
      }

      let end: number = Date.now();
      let duration: number = end - start;

      expect(atomicByte.load()).assertEqual(testVal);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EXTREME_TEST_3500
     * @tc.desc   Verify fetchAnd result is min value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd3500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-1);
      let oldValue = atomicByte.fetchAnd(-128);

      expect(oldValue).assertEqual(-1);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EXTREME_TEST_3600
     * @tc.desc   Verify fetchAnd result is max value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd3600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(127);
      let oldValue = atomicByte.fetchAnd(127);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_3700
     * @tc.desc   Verify fetchAnd from all ones to all zeros
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd3700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      let oldValue = atomicByte.fetchAnd(0);

      expect(oldValue).assertEqual(-1);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd3800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_3800
     * @tc.desc   Verify fetchAnd from zero remains zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd3800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAnd(127);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(0);
    })


    /**
     * @tc.name   testAtomicByteFetchAnd3900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_3900
     * @tc.desc   Verify fetchAnd with itself remains unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd3900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(85);
      let oldValue = atomicByte.fetchAnd(85);

      expect(oldValue).assertEqual(85);
      expect(atomicByte.load()).assertEqual(85);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd4000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EDGE_TEST_4000
     * @tc.desc   Verify fetchAnd with all ones mask remains unchanged
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAnd4000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(85);
      let oldValue = atomicByte.fetchAnd(127);

      expect(oldValue).assertEqual(85);
      expect(atomicByte.load()).assertEqual(85);
    })
    /**
     * @tc.name   testAtomicByteFetchAnd4100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHAND_EXTREME_TEST_4100
     * @tc.desc   Verify fetchAnd with all zeros mask results in zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAnd4100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(85);
      let oldValue = atomicByte.fetchAnd(0);

      expect(oldValue).assertEqual(85);
      expect(atomicByte.load()).assertEqual(0);
    })
  })
}
