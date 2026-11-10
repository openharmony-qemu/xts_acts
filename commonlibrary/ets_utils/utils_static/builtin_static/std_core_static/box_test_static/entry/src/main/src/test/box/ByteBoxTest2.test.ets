'use static';

/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType,
} from '@ohos/hypium-static/src/main/indexStatic';
import Utils from '../Util.test';

export default function BoxByteBoxTest2(): void {
  describe('BoxByteBoxTest2', (): void => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0100
     * @tc.name testBoxByteBoxTestTwo001
     * @tc.desc Verify ByteBox constructor with explicit zero value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0200
     * @tc.name testBoxByteBoxTestTwo002
     * @tc.desc Verify ByteBox.box factory method with Byte.MAX_VALUE 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = ByteBox.box(Byte.MAX_VALUE);
      expect(box.get()).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0300
     * @tc.name testBoxByteBoxTestTwo003
     * @tc.desc Verify ByteBox get returns consistent value over 100 repeated calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(50);
      let i: int = 0;
      while (i < 100) {
        expect(box.get()).assertEqual(50);
        i++;
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0400
     * @tc.name testBoxByteBoxTestTwo004
     * @tc.desc Verify ByteBox set with multiple sequential positive and negative values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      box.set(2);
      expect(box.get()).assertEqual(2);
      box.set(-2);
      expect(box.get()).assertEqual(-2);
      box.set(8);
      expect(box.get()).assertEqual(8);
      box.set(16);
      expect(box.get()).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0500
     * @tc.name testBoxByteBoxTestTwo005
     * @tc.desc Verify ByteBox set in loop 100 times does not throw error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      for (let i: int = 0; i < 100; i++) {
        box.set(Int.toByte(i));
      }
      expect(box.get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0600
     * @tc.name testBoxByteBoxTestTwo006
     * @tc.desc Verify ByteBox value used in if condition for positive value check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(26);
      let result: int = 0;
      if (box.get() > 0) {
        result = box.get();
      }
      expect(result).assertEqual(26);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0700
     * @tc.name testBoxByteBoxTestTwo007
     * @tc.desc Verify ByteBox zero and non-zero value in if-else conditional logic
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let result: string = '';
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('zero');
      box.set(5);
      if (box.get() === 0) {
        result = 'zero';
      } else {
        result = 'non-zero';
      }
      expect(result).assertEqual('non-zero');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0800
     * @tc.name testBoxByteBoxTestTwo008
     * @tc.desc Verify x ^ x = 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x55));
      box.set(Int.toByte(box.get() ^ box.get()));
      expect(box.get()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_0900
     * @tc.name testBoxByteBoxTestTwo009
     * @tc.desc Verify five ByteBox instances created with same value 42 all return equal results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let boxes: ByteBox[] = [new ByteBox(42), new ByteBox(42), new ByteBox(42), new ByteBox(42), new ByteBox(42)];
      let allEqual: boolean = true;
      for (let i: int = 1; i < 5; i++) {
        if (boxes[i].get() !== boxes[0].get()) {
          allEqual = false;
        }
      }
      expect(allEqual).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1000
     * @tc.name testBoxByteBoxTestTwo010
     * @tc.desc Verify ByteBox alternating positive/negative set for 10 cycles ends at -10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 10) {
        box.set(Int.toByte(i + 1));
        let left: byte = box.get();
        let right: byte = Int.toByte(i + 1);
        expect(left).assertEqual(right);
        box.set(Int.toByte(-(i + 1)));
        i++;
      }
      expect(box.get()).assertEqual(-10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1100
     * @tc.name testBoxByteBoxTestTwo011
     * @tc.desc Verify ByteBox factory stores a negative boundary value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = ByteBox.box(-127);
      expect(box.get()).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1200
     * @tc.name testBoxByteBoxTestTwo012
     * @tc.desc Verify ByteBox.set returns the assigned byte value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let result: byte = box.set(42);
      expect(result).assertEqual(42);
      expect(box.get()).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1300
     * @tc.name testBoxByteBoxTestTwo013
     * @tc.desc Verify ByteBox.get can be assigned to a byte variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(73);
      let value: byte = box.get();
      expect(value).assertEqual(73);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1400
     * @tc.name testBoxByteBoxTestTwo014
     * @tc.desc Verify ByteBox bit mask keeps the low four bits
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0x5a);
      let masked: byte = Int.toByte(box.get() & 0x0f);
      expect(masked).assertEqual(0x0a);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1500
     * @tc.name testBoxByteBoxTestTwo015
     * @tc.desc Verify two ByteBox instances remain independent after mutation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let first: ByteBox = new ByteBox(10);
      let second: ByteBox = new ByteBox(20);
      first.set(30);
      expect(first.get()).assertEqual(30);
      expect(second.get()).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1600
     * @tc.name testBoxByteBoxTestTwo016
     * @tc.desc Verify ByteBox OR with 0x80 sets sign bit making value negative
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0x0f));
      box.set(Int.toByte(box.get() | 0x80));
      expect(box.get() < 0).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1700
     * @tc.name testBoxByteBoxTestTwo017
     * @tc.desc Verify ByteBox after 500 set operations with modulo 100 yields final value 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(0);
      let i: int = 0;
      while (i < 500) {
        box.set(Int.toByte(i % 100));
        i++;
      }
      expect(box.get()).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1800
     * @tc.name testBoxByteBoxTestTwo018
     * @tc.desc Verify ByteBox int value 300 overflow truncation yields byte value 44
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let large: int = 300;
      let truncated: byte = Int.toByte(large);
      let box: ByteBox = new ByteBox(truncated);
      expect(box.get()).assertEqual(44);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_1900
     * @tc.name testBoxByteBoxTestTwo019
     * @tc.desc Verify ByteBox value passes logical AND check greater than 0 and less than 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(1);
      let result: boolean = box.get() > 0 && box.get() < 10;
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_2000
     * @tc.name testBoxByteBoxTestTwo020
     * @tc.desc Verify ByteBox XOR with mask 0x55 flips bits correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let box: ByteBox = new ByteBox(Int.toByte(0xaa));
      let masked: byte = Int.toByte(box.get() ^ 0x55);
      expect(masked).assertEqual(Int.toByte(0xff));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BOX_BYTEBOX_TWO_2100
     * @tc.name testBoxByteBoxTestTwo021
     * @tc.desc Verify comparison of six ByteBox values finding min -128 and max 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testBoxByteBoxTestTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let firstBox: ByteBox = new ByteBox(-128);
      let secondBox: ByteBox = new ByteBox(-64);
      let thirdBox: ByteBox = new ByteBox(0);
      let fourthBox: ByteBox = new ByteBox(64);
      let fifthBox: ByteBox = new ByteBox(100);
      let sixthBox: ByteBox = new ByteBox(127);
      expect(firstBox.get() < secondBox.get()).assertTrue();
      expect(secondBox.get() < thirdBox.get()).assertTrue();
      expect(thirdBox.get() < fourthBox.get()).assertTrue();
      expect(fourthBox.get() < fifthBox.get()).assertTrue();
      expect(fifthBox.get() < sixthBox.get()).assertTrue();
    });
  });
}
