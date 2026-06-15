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

export default function AtomicByteFetchAddExtendedTest(): void {
  describe("AtomicByteFetchAddExtendedTest", () => {
    beforeAll((): void => {})
    beforeEach((): void => {})
    afterEach((): void => {
          })
    afterAll(async (): Promise<void> => {
      await Utils.msSleep(100);
    })

    /**
     * @tc.name   testAtomicByteFetchAddExtended0100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BASIC_TEST_0100
     * @tc.desc   Verify fetchAdd with hex value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended0100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(0x0A);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BASIC_TEST_0200
     * @tc.desc   Verify fetchAdd with octal value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended0200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(0o17);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BASIC_TEST_0300
     * @tc.desc   Verify fetchAdd with binary value parameter
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended0300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let oldValue = atomicByte.fetchAdd(0b1010);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_EDGE_TEST_0400
     * @tc.desc   Verify fetchAdd with negative hex value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended0400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);
      let oldValue = atomicByte.fetchAdd(-0x05);

      expect(oldValue).assertEqual(10);
      expect(atomicByte.load()).assertEqual(5);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CHAIN_TEST_0500
     * @tc.desc   Verify fetchAdd in chained operations pattern
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended0500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      for (let i = 1; i <= 5; i++) {
        atomicByte.fetchAdd(Int.toByte(i));
      }

      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CHAIN_TEST_0600
     * @tc.desc   Verify fetchAdd returns correct sequence in chain
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended0600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(10);
      let results: byte[] = [];

      results.push(atomicByte.fetchAdd(5));
      results.push(atomicByte.fetchAdd(5));
      results.push(atomicByte.fetchAdd(5));
      results.push(atomicByte.fetchAdd(5));

      expect(results[0]).assertEqual(10);
      expect(results[1]).assertEqual(15);
      expect(results[2]).assertEqual(20);
      expect(results[3]).assertEqual(25);
      expect(atomicByte.load()).assertEqual(30);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_WRAP_TEST_0700
     * @tc.desc   Verify fetchAdd wrap around from positive to negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended0700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(126);
      let oldValue = atomicByte.fetchAdd(5);

      expect(oldValue).assertEqual(126);
      expect(atomicByte.load()).assertEqual(-125);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_WRAP_TEST_0800
     * @tc.desc   Verify fetchAdd wrap around from negative to positive
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended0800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-126);
      let oldValue = atomicByte.fetchAdd(-5);

      expect(oldValue).assertEqual(-126);
      expect(atomicByte.load()).assertEqual(125);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended0900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BOUNDARY_TEST_0900
     * @tc.desc   Verify fetchAdd with boundary transition 1 to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended0900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(1);
      let oldValue = atomicByte.fetchAdd(-1);

      expect(oldValue).assertEqual(1);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BOUNDARY_TEST_1000
     * @tc.desc   Verify fetchAdd with boundary transition -1 to 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(-1);
      let oldValue = atomicByte.fetchAdd(1);

      expect(oldValue).assertEqual(-1);
      expect(atomicByte.load()).assertEqual(0);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_COUNTER_TEST_1100
     * @tc.desc   Verify fetchAdd for cumulative counter with different steps
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended1100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let cumulative = new AtomicByte(0);

      cumulative.fetchAdd(2);
      cumulative.fetchAdd(3);
      cumulative.fetchAdd(5);

      expect(cumulative.load()).assertEqual(10);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_SYNC_TEST_1200
     * @tc.desc   Verify fetchAdd synchronization pattern with load
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended1200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let syncValue = new AtomicByte(100);

      let oldValue = syncValue.fetchAdd(20);
      let currentValue = syncValue.load();

      expect(oldValue).assertEqual(100);
      expect(currentValue).assertEqual(120);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_SYNC_TEST_1300
     * @tc.desc   Verify fetchAdd synchronization pattern with store
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended1300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let syncValue = new AtomicByte(0);

      syncValue.fetchAdd(100);
      syncValue.store(50);

      expect(syncValue.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_OFFSET_TEST_1400
     * @tc.desc   Verify fetchAdd for offset calculation
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended1400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let base = new AtomicByte(100);

      let offset1 = base.fetchAdd(10);
      expect(offset1).assertEqual(100);
      expect(base.load()).assertEqual(110);

      let offset2 = base.fetchAdd(-20);
      expect(offset2).assertEqual(110);
      expect(base.load()).assertEqual(90);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_DELTA_TEST_1500
     * @tc.desc   Verify fetchAdd with small delta values
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(50);

      atomicByte.fetchAdd(1);
      expect(atomicByte.load()).assertEqual(51);

      atomicByte.fetchAdd(2);
      expect(atomicByte.load()).assertEqual(53);

      atomicByte.fetchAdd(3);
      expect(atomicByte.load()).assertEqual(56);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_DELTA_TEST_1600
     * @tc.desc   Verify fetchAdd with alternating small deltas
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.fetchAdd(3);
      expect(atomicByte.load()).assertEqual(3);

      atomicByte.fetchAdd(-1);
      expect(atomicByte.load()).assertEqual(2);

      atomicByte.fetchAdd(4);
      expect(atomicByte.load()).assertEqual(6);

      atomicByte.fetchAdd(-2);
      expect(atomicByte.load()).assertEqual(4);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CALC_TEST_1700
     * @tc.desc   Verify fetchAdd calculation consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(10);

      let oldValue = atomicByte.fetchAdd(20);
      let newValue = atomicByte.load();

      expect(newValue - oldValue).assertEqual(20);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CALC_TEST_1800
     * @tc.desc   Verify fetchAdd negative calculation consistency
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(50);

      let oldValue = atomicByte.fetchAdd(-15);
      let newValue = atomicByte.load();

      expect(oldValue - newValue).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended1900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_VERIFY_TEST_1900
     * @tc.desc   Verify fetchAdd previous value tracking
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended1900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(0);
      let previousValues: byte[] = [];

      previousValues.push(atomicByte.fetchAdd(10));
      previousValues.push(atomicByte.fetchAdd(20));
      previousValues.push(atomicByte.fetchAdd(30));

      expect(previousValues[0]).assertEqual(0);
      expect(previousValues[1]).assertEqual(10);
      expect(previousValues[2]).assertEqual(30);
      expect(atomicByte.load()).assertEqual(60);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_MULTI_TEST_2000
     * @tc.desc   Verify fetchAdd with multiple AtomicByte instances
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomic1 = new AtomicByte(10);
      let atomic2 = new AtomicByte(20);
      let atomic3 = new AtomicByte(30);

      atomic1.fetchAdd(5);
      atomic2.fetchAdd(10);
      atomic3.fetchAdd(15);

      expect(atomic1.load()).assertEqual(15);
      expect(atomic2.load()).assertEqual(30);
      expect(atomic3.load()).assertEqual(45);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_INDEPENDENT_TEST_2100
     * @tc.desc   Verify fetchAdd instances are independent
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomic1 = new AtomicByte(100);
      let atomic2 = new AtomicByte(100);

      atomic1.fetchAdd(20);

      expect(atomic1.load()).assertEqual(120);
      expect(atomic2.load()).assertEqual(100);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_RESET_TEST_2200
     * @tc.desc   Verify fetchAdd behavior after reset to zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);

      atomicByte.store(0);
      let oldValue = atomicByte.fetchAdd(50);

      expect(oldValue).assertEqual(0);
      expect(atomicByte.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_RESUME_TEST_2300
     * @tc.desc   Verify fetchAdd resumes correctly after reset
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);

      atomicByte.fetchAdd(100);
      atomicByte.store(0);
      atomicByte.fetchAdd(25);

      expect(atomicByte.load()).assertEqual(25);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_NEGLOOP_TEST_2400
     * @tc.desc   Verify fetchAdd with negative accumulation loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let accumulator = new AtomicByte(100);

      accumulator.fetchAdd(-10);
      accumulator.fetchAdd(-20);
      accumulator.fetchAdd(-30);

      expect(accumulator.load()).assertEqual(40);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_MIXLOOP_TEST_2500
     * @tc.desc   Verify fetchAdd with mixed positive and negative loop
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2500", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let accumulator = new AtomicByte(0);

      accumulator.fetchAdd(50);
      accumulator.fetchAdd(-20);
      accumulator.fetchAdd(30);
      accumulator.fetchAdd(-10);

      expect(accumulator.load()).assertEqual(50);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_IDENTITY_TEST_2600
     * @tc.desc   Verify fetchAdd identity property with zero
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL1
     */
    it("testAtomicByteFetchAddExtended2600", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL1, async () => {
      let atomicByte = new AtomicByte(75);

      let oldValue = atomicByte.fetchAdd(0);

      expect(oldValue).assertEqual(75);
      expect(atomicByte.load()).assertEqual(75);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2700
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_ASSOCIATIVE_TEST_2700
     * @tc.desc   Verify fetchAdd associative property with split additions
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2700", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte1 = new AtomicByte(10);
      let atomicByte2 = new AtomicByte(10);

      atomicByte1.fetchAdd(30);
      atomicByte2.fetchAdd(10);
      atomicByte2.fetchAdd(10);
      atomicByte2.fetchAdd(10);

      expect(atomicByte1.load()).assertEqual(atomicByte2.load());
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2800
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_RETURNSEQ_TEST_2800
     * @tc.desc   Verify fetchAdd return value sequence independence
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2800", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let returns: byte[] = [];

      returns.push(atomicByte.fetchAdd(5));
      returns.push(atomicByte.fetchAdd(5));
      returns.push(atomicByte.fetchAdd(5));

      expect(returns[0]).assertEqual(0);
      expect(returns[1]).assertEqual(5);
      expect(returns[2]).assertEqual(10);
      expect(atomicByte.load()).assertEqual(15);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended2900
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BOUND_TEST_2900
     * @tc.desc   Verify fetchAdd reaching boundary from below
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended2900", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(122);
      let oldValue = atomicByte.fetchAdd(5);

      expect(oldValue).assertEqual(122);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3000
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_BOUND_TEST_3000
     * @tc.desc   Verify fetchAdd reaching boundary from above negative
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended3000", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-123);
      let oldValue = atomicByte.fetchAdd(-5);

      expect(oldValue).assertEqual(-123);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3100
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_NEARMAX_TEST_3100
     * @tc.desc   Verify fetchAdd near max boundary without overflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended3100", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);
      let oldValue = atomicByte.fetchAdd(27);

      expect(oldValue).assertEqual(100);
      expect(atomicByte.load()).assertEqual(127);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3200
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_NEARMIN_TEST_3200
     * @tc.desc   Verify fetchAdd near min boundary without underflow
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended3200", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(-100);
      let oldValue = atomicByte.fetchAdd(-28);

      expect(oldValue).assertEqual(-100);
      expect(atomicByte.load()).assertEqual(-128);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3300
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_FULLRANGE_TEST_3300
     * @tc.desc   Verify fetchAdd across full positive range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAddExtended3300", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(-128);
      let addValue: byte = 127;
      let oldValue = atomicByte.fetchAdd(addValue);

      expect(oldValue).assertEqual(-128);
      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3400
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_FULLRANGE_TEST_3400
     * @tc.desc   Verify fetchAdd across full negative range
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL3
     */
    it("testAtomicByteFetchAddExtended3400", TestType.FUNCTION | Size.SMALLTEST | Level.LEVEL3, async () => {
      let atomicByte = new AtomicByte(127);
      let addValue: byte = -128;
      let oldValue = atomicByte.fetchAdd(addValue);

      expect(oldValue).assertEqual(127);
      expect(atomicByte.load()).assertEqual(-1);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3500
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CONCURRENT_TEST_3500
     * @tc.desc   Verify fetchAdd atomicity with concurrent access
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended3500", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(0);
      let iterations = 10;

      let task1 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };

      let task2 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };

      let task3 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };

      let task4 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };

      let task5 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };

      await Promise.all([task1(), task2(), task3(), task4(), task5()]);

      expect(atomicByte.load()).assertEqual(iterations * 5);
    })
    /**
     * @tc.name   testAtomicByteFetchAddExtended3600
     * @tc.number SUB_BUILTINS_ATOMICBYTE_FETCHADD_EXT_CONCURRENT_TEST_3600
     * @tc.desc   Verify fetchAdd atomicity with concurrent negative operations
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it("testAtomicByteFetchAddExtended3600", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async () => {
      let atomicByte = new AtomicByte(100);
      let iterations = 50;
      
      let task1 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };
      
      let task2 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(-1);
        }
      };
      
      let task3 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(1);
        }
      };
      
      let task4 = async () => {
        for (let i = 0; i < iterations; i++) {
          atomicByte.fetchAdd(-1);
        }
      };
      
      await Promise.all([task1(), task2(), task3(), task4()]);
      
      expect(atomicByte.load()).assertEqual(100);
    })
  })
}
