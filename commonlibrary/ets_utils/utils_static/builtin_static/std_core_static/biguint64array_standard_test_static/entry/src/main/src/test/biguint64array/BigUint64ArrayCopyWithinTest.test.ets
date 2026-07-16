'use static'


/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import {
  beforeAll,
  afterEach,
  beforeEach,
  afterAll,
  describe,
  it,
  expect,
  TestType,
  Size,
  Level
} from '../../../../hypium/index';
import Utils from './../Util.test';

export default function biguint64arrayCopyWithinTest(): void {

  describe('BigUint64ArrayCopyWithinTest', () => {
    beforeAll(() => {
    });
    beforeEach(async () => {
    await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0010
     * @tc.name testBigUint64ArrayCopyWithin001
     * @tc.desc Verify copyWithin(target=0, start=2) with end defaulting to length copies [2,length) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      let result: BigUint64Array = sourceArr.copyWithin(0, 2);
      expect(result[0]).assertEqual(30n);
      expect(result[1]).assertEqual(40n);
      expect(result[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0020
     * @tc.name testBigUint64ArrayCopyWithin002
     * @tc.desc Verify copyWithin(target=1, start=3) two-arg form copies single element to index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(1, 3);
      expect(sourceArr[1]).assertEqual(40n);
      expect(sourceArr[2]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0030
     * @tc.name testBigUint64ArrayCopyWithin003
     * @tc.desc Verify copyWithin(target=0, start=0) with target equal to start leaves array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, 0);
      expect(sourceArr[0]).assertEqual(10n);
      expect(sourceArr[1]).assertEqual(20n);
      expect(sourceArr[2]).assertEqual(30n);
      expect(sourceArr[3]).assertEqual(40n);
      expect(sourceArr[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0040
     * @tc.name testBigUint64ArrayCopyWithin004
     * @tc.desc Verify copyWithin(target=2, start=0) two-arg form copies full array to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(2, 0);
      expect(sourceArr[2]).assertEqual(10n);
      expect(sourceArr[3]).assertEqual(20n);
      expect(sourceArr[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0050
     * @tc.name testBigUint64ArrayCopyWithin005
     * @tc.desc Verify copyWithin(target=0, start=1, end=4) three-arg form copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      sourceArr.copyWithin(0, 1, 4);
      expect(sourceArr[0]).assertEqual(200n);
      expect(sourceArr[1]).assertEqual(300n);
      expect(sourceArr[2]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0060
     * @tc.name testBigUint64ArrayCopyWithin006
     * @tc.desc Verify copyWithin(target=0, start=0, end=3) copies first 3 elements to self unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      sourceArr.copyWithin(0, 0, 3);
      expect(sourceArr[0]).assertEqual(100n);
      expect(sourceArr[1]).assertEqual(200n);
      expect(sourceArr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0070
     * @tc.name testBigUint64ArrayCopyWithin007
     * @tc.desc Verify copyWithin with end=undefined behaves as two-arg form using default length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n]);
      let endOpt: int | undefined = undefined;
      sourceArr.copyWithin(0, 1, endOpt);
      expect(sourceArr[0]).assertEqual(2n);
      expect(sourceArr[1]).assertEqual(3n);
      expect(sourceArr[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0080
     * @tc.name testBigUint64ArrayCopyWithin008
     * @tc.desc Verify copyWithin with start=length copies no elements and leaves array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArr.copyWithin(0, sourceArr.length);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[2]).assertEqual(3n);
      expect(sourceArr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0090
     * @tc.name testBigUint64ArrayCopyWithin009
     * @tc.desc Verify copyWithin with start=end copies no elements and leaves array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n]);
      sourceArr.copyWithin(0, 2, 2);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[2]).assertEqual(3n);
      expect(sourceArr[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0100
     * @tc.name testBigUint64ArrayCopyWithin010
     * @tc.desc Verify copyWithin(target=1, start=3, end=5) copies [3,5) to index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      sourceArr.copyWithin(1, 3, 5);
      expect(sourceArr[1]).assertEqual(400n);
      expect(sourceArr[2]).assertEqual(500n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0110
     * @tc.name testBigUint64ArrayCopyWithin011
     * @tc.desc Verify target=0 writes copied content starting at the first position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, 2, 4);
      expect(sourceArr[0]).assertEqual(30n);
      expect(sourceArr[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0120
     * @tc.name testBigUint64ArrayCopyWithin012
     * @tc.desc Verify target=1 writes copied content starting at index 1
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(1, 2, 4);
      expect(sourceArr[1]).assertEqual(30n);
      expect(sourceArr[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0130
     * @tc.name testBigUint64ArrayCopyWithin013
     * @tc.desc Verify target=2 after source shifts source region backward
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(2, 0, 3);
      expect(sourceArr[2]).assertEqual(10n);
      expect(sourceArr[3]).assertEqual(20n);
      expect(sourceArr[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0140
     * @tc.name testBigUint64ArrayCopyWithin014
     * @tc.desc Verify target=length-2 near end accommodates only 2 copied elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n, 600n]);
      sourceArr.copyWithin(sourceArr.length - 2, 0, 4);
      expect(sourceArr[4]).assertEqual(100n);
      expect(sourceArr[5]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0150
     * @tc.name testBigUint64ArrayCopyWithin015
     * @tc.desc Verify target=length-1 last position accommodates only 1 copied element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      sourceArr.copyWithin(sourceArr.length - 1, 1, 4);
      expect(sourceArr[4]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0160
     * @tc.name testBigUint64ArrayCopyWithin016
     * @tc.desc Verify target=length clamps to length with all copied content truncated and array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 17n, 27n, 37n]);
      sourceArr.copyWithin(sourceArr.length, 1, 3);
      expect(sourceArr[0]).assertEqual(7n);
      expect(sourceArr[1]).assertEqual(17n);
      expect(sourceArr[2]).assertEqual(27n);
      expect(sourceArr[3]).assertEqual(37n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0170
     * @tc.name testBigUint64ArrayCopyWithin017
     * @tc.desc Verify target=length+1 clamps to length and array stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 17n, 27n, 37n]);
      sourceArr.copyWithin(sourceArr.length + 1, 0, 2);
      expect(sourceArr[0]).assertEqual(7n);
      expect(sourceArr[1]).assertEqual(17n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0180
     * @tc.name testBigUint64ArrayCopyWithin018
     * @tc.desc Verify target=-1 negative index maps to length-1 and writes from last position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([5n, 15n, 25n, 35n, 45n]);
      sourceArr.copyWithin(-1, 0, 2);
      expect(sourceArr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0190
     * @tc.name testBigUint64ArrayCopyWithin019
     * @tc.desc Verify target=-2 negative index maps to length-2 and writes from second-to-last
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([5n, 15n, 25n, 35n, 45n]);
      sourceArr.copyWithin(-2, 0, 3);
      expect(sourceArr[3]).assertEqual(5n);
      expect(sourceArr[4]).assertEqual(15n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0200
     * @tc.name testBigUint64ArrayCopyWithin020
     * @tc.desc Verify target=-length negative index maps to 0 equivalent to target=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([2n, 4n, 6n, 8n, 10n]);
      sourceArr.copyWithin(-sourceArr.length, 2, 5);
      expect(sourceArr[0]).assertEqual(6n);
      expect(sourceArr[1]).assertEqual(8n);
      expect(sourceArr[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0210
     * @tc.name testBigUint64ArrayCopyWithin021
     * @tc.desc Verify target=-length-1 negative index clamped to 0 writes from first position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([2n, 4n, 6n, 8n, 10n]);
      sourceArr.copyWithin(-sourceArr.length - 1, 2, 5);
      expect(sourceArr[0]).assertEqual(6n);
      expect(sourceArr[1]).assertEqual(8n);
      expect(sourceArr[2]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0220
     * @tc.name testBigUint64ArrayCopyWithin022
     * @tc.desc Verify target=int max 2147483647 clamps to array length and array remains unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n]);
      sourceArr.copyWithin(2147483647, 0, 2);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0230
     * @tc.name testBigUint64ArrayCopyWithin023
     * @tc.desc Verify start=0 copies from first element with target=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArr.copyWithin(2, 0, 4);
      expect(sourceArr[2]).assertEqual(1n);
      expect(sourceArr[3]).assertEqual(2n);
      expect(sourceArr[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0240
     * @tc.name testBigUint64ArrayCopyWithin024
     * @tc.desc Verify start=1 copies from index 1 to target=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArr.copyWithin(0, 1, 4);
      expect(sourceArr[0]).assertEqual(2n);
      expect(sourceArr[1]).assertEqual(3n);
      expect(sourceArr[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0250
     * @tc.name testBigUint64ArrayCopyWithin025
     * @tc.desc Verify start=length-1 copies only the last element to target=0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, sourceArr.length - 1);
      expect(sourceArr[0]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0260
     * @tc.name testBigUint64ArrayCopyWithin026
     * @tc.desc Verify start=length copies no elements and array stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, sourceArr.length);
      expect(sourceArr[0]).assertEqual(10n);
      expect(sourceArr[1]).assertEqual(20n);
      expect(sourceArr[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0270
     * @tc.name testBigUint64ArrayCopyWithin027
     * @tc.desc Verify start=length+1 clamps to length and array stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, sourceArr.length + 1);
      expect(sourceArr[0]).assertEqual(10n);
      expect(sourceArr[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0280
     * @tc.name testBigUint64ArrayCopyWithin028
     * @tc.desc Verify start=-1 negative index maps to length-1 and copies last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([5n, 15n, 25n, 35n]);
      sourceArr.copyWithin(0, -1);
      expect(sourceArr[0]).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0290
     * @tc.name testBigUint64ArrayCopyWithin029
     * @tc.desc Verify start=-2 negative index maps to length-2 and copies from second-to-last
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([5n, 15n, 25n, 35n]);
      sourceArr.copyWithin(0, -2);
      expect(sourceArr[0]).assertEqual(25n);
      expect(sourceArr[1]).assertEqual(35n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0300
     * @tc.name testBigUint64ArrayCopyWithin030
     * @tc.desc Verify start=-length negative index maps to 0 and copies from first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([3n, 6n, 9n, 12n]);
      sourceArr.copyWithin(1, -sourceArr.length);
      expect(sourceArr[1]).assertEqual(3n);
      expect(sourceArr[2]).assertEqual(6n);
      expect(sourceArr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0310
     * @tc.name testBigUint64ArrayCopyWithin031
     * @tc.desc Verify start=-length-1 negative index clamps to 0 and copies from first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([3n, 6n, 9n, 12n]);
      sourceArr.copyWithin(1, -sourceArr.length - 1);
      expect(sourceArr[1]).assertEqual(3n);
      expect(sourceArr[2]).assertEqual(6n);
      expect(sourceArr[3]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0320
     * @tc.name testBigUint64ArrayCopyWithin032
     * @tc.desc Verify start=int max 2147483647 clamps to length and array stays unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n]);
      sourceArr.copyWithin(0, 2147483647);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0330
     * @tc.name testBigUint64ArrayCopyWithin033
     * @tc.desc Verify start=int min -2147483648 clamps to 0 and copies from first element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([9n, 18n, 27n, 36n]);
      sourceArr.copyWithin(0, -2147483648);
      expect(sourceArr[0]).assertEqual(9n);
      expect(sourceArr[1]).assertEqual(18n);
      expect(sourceArr[2]).assertEqual(27n);
      expect(sourceArr[3]).assertEqual(36n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0340
     * @tc.name testBigUint64ArrayCopyWithin034
     * @tc.desc Verify start=0 and target=0 source and target fully coincide leaving array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([22n, 33n, 44n, 55n]);
      sourceArr.copyWithin(0, 0, 4);
      expect(sourceArr[0]).assertEqual(22n);
      expect(sourceArr[1]).assertEqual(33n);
      expect(sourceArr[2]).assertEqual(44n);
      expect(sourceArr[3]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0350
     * @tc.name testBigUint64ArrayCopyWithin035
     * @tc.desc Verify end=undefined two-arg behavior with end defaulting to length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let endOpt: int | undefined = undefined;
      sourceArr.copyWithin(0, 2, endOpt);
      expect(sourceArr[0]).assertEqual(30n);
      expect(sourceArr[1]).assertEqual(40n);
      expect(sourceArr[2]).assertEqual(50n);
      expect(sourceArr[3]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0360
     * @tc.name testBigUint64ArrayCopyWithin036
     * @tc.desc Verify end=0 with end<=start copies no elements and array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 2, 0);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[1]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0370
     * @tc.name testBigUint64ArrayCopyWithin037
     * @tc.desc Verify end=1 copies exactly one element from start=0 to target=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(2, 0, 1);
      expect(sourceArr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0380
     * @tc.name testBigUint64ArrayCopyWithin038
     * @tc.desc Verify end=length-1 copies up to the second-to-last element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 17n, 27n, 37n, 47n, 57n]);
      sourceArr.copyWithin(0, 2, sourceArr.length - 1);
      expect(sourceArr[0]).assertEqual(27n);
      expect(sourceArr[1]).assertEqual(37n);
      expect(sourceArr[2]).assertEqual(47n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0390
     * @tc.name testBigUint64ArrayCopyWithin039
     * @tc.desc Verify end=length equivalent to two-arg form copies start to end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 17n, 27n, 37n, 47n, 57n]);
      sourceArr.copyWithin(1, 3, sourceArr.length);
      expect(sourceArr[1]).assertEqual(37n);
      expect(sourceArr[2]).assertEqual(47n);
      expect(sourceArr[3]).assertEqual(57n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0400
     * @tc.name testBigUint64ArrayCopyWithin040
     * @tc.desc Verify end=length+1 clamps to length and copies to end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 17n, 27n, 37n, 47n, 57n]);
      sourceArr.copyWithin(0, 1, sourceArr.length + 1);
      expect(sourceArr[0]).assertEqual(17n);
      expect(sourceArr[1]).assertEqual(27n);
      expect(sourceArr[2]).assertEqual(37n);
      expect(sourceArr[3]).assertEqual(47n);
      expect(sourceArr[4]).assertEqual(57n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0410
     * @tc.name testBigUint64ArrayCopyWithin041
     * @tc.desc Verify end=-1 negative index maps to length-1 and copies up to second-to-last
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([2n, 4n, 6n, 8n, 10n, 12n]);
      sourceArr.copyWithin(0, 3, -1);
      expect(sourceArr[0]).assertEqual(8n);
      expect(sourceArr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0420
     * @tc.name testBigUint64ArrayCopyWithin042
     * @tc.desc Verify end=-2 negative index maps to length-2 and copies up to third-to-last
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([2n, 4n, 6n, 8n, 10n, 12n]);
      sourceArr.copyWithin(0, 1, -2);
      expect(sourceArr[0]).assertEqual(4n);
      expect(sourceArr[1]).assertEqual(6n);
      expect(sourceArr[2]).assertEqual(8n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0430
     * @tc.name testBigUint64ArrayCopyWithin043
     * @tc.desc Verify end=-length negative index maps to 0 making end<=start with no copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([2n, 4n, 6n, 8n, 10n, 12n]);
      sourceArr.copyWithin(0, 2, -sourceArr.length);
      expect(sourceArr[0]).assertEqual(2n);
      expect(sourceArr[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0440
     * @tc.name testBigUint64ArrayCopyWithin044
     * @tc.desc Verify end=-length-1 clamps to 0 with no copy and array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([5n, 10n, 15n, 20n]);
      sourceArr.copyWithin(0, 1, -sourceArr.length - 1);
      expect(sourceArr[0]).assertEqual(5n);
      expect(sourceArr[1]).assertEqual(10n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0450
     * @tc.name testBigUint64ArrayCopyWithin045
     * @tc.desc Verify end=int max 2147483647 clamps to length and copies to end
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([3n, 6n, 9n]);
      sourceArr.copyWithin(0, 1, 2147483647);
      expect(sourceArr[0]).assertEqual(6n);
      expect(sourceArr[1]).assertEqual(9n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0460
     * @tc.name testBigUint64ArrayCopyWithin046
     * @tc.desc Verify end < start with end=2 start=4 copies no elements and array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([25n, 50n, 75n, 100n, 125n, 150n]);
      sourceArr.copyWithin(2, 4, 2);
      expect(sourceArr[0]).assertEqual(25n);
      expect(sourceArr[1]).assertEqual(50n);
      expect(sourceArr[2]).assertEqual(75n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0470
     * @tc.name testBigUint64ArrayCopyWithin047
     * @tc.desc Verify target>=length no-op keeps array unchanged for target=6
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(6, 0, 3);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0480
     * @tc.name testBigUint64ArrayCopyWithin048
     * @tc.desc Verify target=length+1 beyond length no-op keeps array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(7, 0, 3);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[2]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0490
     * @tc.name testBigUint64ArrayCopyWithin049
     * @tc.desc Verify start=length no source elements to copy with target=0 no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 6);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0500
     * @tc.name testBigUint64ArrayCopyWithin050
     * @tc.desc Verify start=length+1 clamps to length no-op keeps array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 7);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0510
     * @tc.name testBigUint64ArrayCopyWithin051
     * @tc.desc Verify start=end explicit same value no-op keeps array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 5, 5);
      expect(sourceArr[1]).assertEqual(2n);
      expect(sourceArr[4]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0520
     * @tc.name testBigUint64ArrayCopyWithin052
     * @tc.desc Verify start=0 end=0 zero-length interval no-op keeps array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([7n, 14n, 21n, 28n]);
      sourceArr.copyWithin(0, 0, 0);
      expect(sourceArr[0]).assertEqual(7n);
      expect(sourceArr[1]).assertEqual(14n);
      expect(sourceArr[2]).assertEqual(21n);
      expect(sourceArr[3]).assertEqual(28n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0530
     * @tc.name testBigUint64ArrayCopyWithin053
     * @tc.desc Verify start>end with start=3 end=2 no-op keeps array unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 3, 2);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0540
     * @tc.name testBigUint64ArrayCopyWithin054
     * @tc.desc Verify all parameters positive and beyond length clamp with no copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n]);
      sourceArr.copyWithin(100, 99, 200);
      expect(sourceArr[0]).assertEqual(100n);
      expect(sourceArr[1]).assertEqual(200n);
      expect(sourceArr[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0550
     * @tc.name testBigUint64ArrayCopyWithin055
     * @tc.desc Verify start=-1 end=-2 after clamp start>=end no-op
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, -1, -2);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0560
     * @tc.name testBigUint64ArrayCopyWithin056
     * @tc.desc Verify overlapping regions with target<start forward copy preserves order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 1, 4);
      expect(sourceArr[0]).assertEqual(2n);
      expect(sourceArr[1]).assertEqual(3n);
      expect(sourceArr[2]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0570
     * @tc.name testBigUint64ArrayCopyWithin057
     * @tc.desc Verify overlapping regions with target>start reverse copy prevents corruption
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(2, 1, 4);
      expect(sourceArr[2]).assertEqual(2n);
      expect(sourceArr[3]).assertEqual(3n);
      expect(sourceArr[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0580
     * @tc.name testBigUint64ArrayCopyWithin058
     * @tc.desc Verify overlapping regions with target>start large-span reverse copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n]);
      sourceArr.copyWithin(4, 1, 4);
      expect(sourceArr[4]).assertEqual(22n);
      expect(sourceArr[5]).assertEqual(33n);
      expect(sourceArr[6]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0590
     * @tc.name testBigUint64ArrayCopyWithin059
     * @tc.desc Verify overlapping regions with target equals start region coincides equivalent to no change
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([11n, 22n, 33n, 44n, 55n, 66n, 77n, 88n]);
      sourceArr.copyWithin(1, 1, 5);
      expect(sourceArr[1]).assertEqual(22n);
      expect(sourceArr[2]).assertEqual(33n);
      expect(sourceArr[3]).assertEqual(44n);
      expect(sourceArr[4]).assertEqual(55n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0600
     * @tc.name testBigUint64ArrayCopyWithin060
     * @tc.desc Verify partial overlap with target inside source range copies correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      sourceArr.copyWithin(1, 0, 4);
      expect(sourceArr[1]).assertEqual(1n);
      expect(sourceArr[2]).assertEqual(2n);
      expect(sourceArr[3]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0610
     * @tc.name testBigUint64ArrayCopyWithin061
     * @tc.desc Verify non-overlapping forward copy target=2 start=0 end=2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(2, 0, 2);
      expect(sourceArr[2]).assertEqual(1n);
      expect(sourceArr[3]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0620
     * @tc.name testBigUint64ArrayCopyWithin062
     * @tc.desc Verify non-overlapping backward copy target=0 start=3 end=5
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      sourceArr.copyWithin(0, 3, 5);
      expect(sourceArr[0]).assertEqual(4n);
      expect(sourceArr[1]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0630
     * @tc.name testBigUint64ArrayCopyWithin063
     * @tc.desc Verify all three parameters negative each individually clamped
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([100n, 200n, 300n, 400n, 500n]);
      sourceArr.copyWithin(-1, -2, -1);
      expect(sourceArr[4]).assertEqual(400n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0640
     * @tc.name testBigUint64ArrayCopyWithin064
     * @tc.desc Verify three-arg copyWithin returns this same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 2, 4);
      expect(returned).assertEqual(sourceArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0650
     * @tc.name testBigUint64ArrayCopyWithin065
     * @tc.desc Verify two-arg copyWithin returns this same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 2);
      expect(returned).assertEqual(sourceArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0660
     * @tc.name testBigUint64ArrayCopyWithin066
     * @tc.desc Verify empty array copyWithin returns this same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array(0);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 0, 0);
      expect(returned).assertEqual(sourceArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0670
     * @tc.name testBigUint64ArrayCopyWithin067
     * @tc.desc Verify single element array copyWithin returns this same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([42n]);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 0, 1);
      expect(returned).assertEqual(sourceArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0680
     * @tc.name testBigUint64ArrayCopyWithin068
     * @tc.desc Verify chain of two copyWithin calls both return the same this reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let firstCall: BigUint64Array = sourceArr.copyWithin(0, 2);
      let secondCall: BigUint64Array = firstCall.copyWithin(1, 0);
      expect(secondCall).assertEqual(sourceArr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0690
     * @tc.name testBigUint64ArrayCopyWithin069
     * @tc.desc Verify return value mutation via subscript visible through original array reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 2);
      returned[0] = 99n;
      expect(sourceArr[0]).assertEqual(99n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0700
     * @tc.name testBigUint64ArrayCopyWithin070
     * @tc.desc Verify no-op copyWithin still returns this same reference
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n]);
      let returned: BigUint64Array = sourceArr.copyWithin(6, 0, 3);
      returned[1] = 88n;
      expect(sourceArr[1]).assertEqual(88n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0710
     * @tc.name testBigUint64ArrayCopyWithin071
     * @tc.desc Verify return value allows direct subscript read after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let firstCopied: bigint = sourceArr.copyWithin(0, 3)[0];
      expect(firstCopied).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0720
     * @tc.name testBigUint64ArrayCopyWithin072
     * @tc.desc Verify return value can be used in expression after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let returned: BigUint64Array = sourceArr.copyWithin(0, 2);
      let elementSum: bigint = returned[0] + returned[1];
      expect(elementSum).assertEqual(70n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0730
     * @tc.name testBigUint64ArrayCopyWithin073
     * @tc.desc Verify chain copyWithin accumulated modifications reflected in final result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let finalResult: BigUint64Array = sourceArr.copyWithin(0, 2).copyWithin(2, 0, 2);
      expect(finalResult[0]).assertEqual(30n);
      expect(finalResult[1]).assertEqual(40n);
      expect(finalResult[2]).assertEqual(30n);
      expect(finalResult[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0740
     * @tc.name testBigUint64ArrayCopyWithin074
     * @tc.desc Verify triple chain copyWithin returns correct accumulated result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let tripleResult: BigUint64Array = sourceArr.copyWithin(3, 0, 2).copyWithin(0, 3, 5).copyWithin(2, 0);
      let expectedValues: Array<BigInt> = [1n, 2n, 1n, 2n, 3n];
      expect(tripleResult[0]).assertEqual(expectedValues[0]);
      expect(tripleResult[1]).assertEqual(expectedValues[1]);
      expect(tripleResult[2]).assertEqual(expectedValues[2]);
      expect(tripleResult[3]).assertEqual(expectedValues[3]);
      expect(tripleResult[4]).assertEqual(expectedValues[4]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0750
     * @tc.name testBigUint64ArrayCopyWithin075
     * @tc.desc Verify length remains unchanged after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(0, 2, 4);
      expect(sourceArr.length).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0760
     * @tc.name testBigUint64ArrayCopyWithin076
     * @tc.desc Verify length stays zero for empty array after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array(0);
      sourceArr.copyWithin(0, 0, 0);
      expect(sourceArr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0770
     * @tc.name testBigUint64ArrayCopyWithin077
     * @tc.desc Verify byteLength remains unchanged after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      sourceArr.copyWithin(0, 2);
      expect(sourceArr.byteLength).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0780
     * @tc.name testBigUint64ArrayCopyWithin078
     * @tc.desc Verify byteLength equals length multiplied by 8 after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      sourceArr.copyWithin(1, 0);
      expect(sourceArr.byteLength).assertEqual(sourceArr.length * 8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0790
     * @tc.name testBigUint64ArrayCopyWithin079
     * @tc.desc Verify byteOffset remains unchanged after copyWithin on zero-offset array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n]);
      sourceArr.copyWithin(0, 1);
      expect(sourceArr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0800
     * @tc.name testBigUint64ArrayCopyWithin080
     * @tc.desc Verify byteOffset unchanged after copyWithin on buffer view with non-zero offset
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuf = new ArrayBuffer(32);
      let bufferView = new BigUint64Array(sharedBuf, 8, 2);
      bufferView[0] = 10n;
      bufferView[1] = 20n;
      bufferView.copyWithin(0, 1);
      expect(bufferView.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0810
     * @tc.name testBigUint64ArrayCopyWithin081
     * @tc.desc Verify buffer reference remains unchanged after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuf = new ArrayBuffer(24);
      let bufferView = new BigUint64Array(sharedBuf, 0, 3);
      bufferView[0] = 10n;
      bufferView[1] = 20n;
      bufferView[2] = 30n;
      let bufferBefore: ArrayBuffer = bufferView.buffer;
      bufferView.copyWithin(0, 1);
      let bufferAfter: ArrayBuffer = bufferView.buffer;
      expect(bufferAfter).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0820
     * @tc.name testBigUint64ArrayCopyWithin082
     * @tc.desc Verify direct-constructed array buffer reference unchanged after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n]);
      let bufferBefore: ArrayBuffer = sourceArr.buffer;
      sourceArr.copyWithin(0, 2);
      let bufferAfter: ArrayBuffer = sourceArr.buffer;
      expect(bufferAfter).assertEqual(bufferBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0830
     * @tc.name testBigUint64ArrayCopyWithin083
     * @tc.desc Verify 0n value preserved with all 64 bits exactly zero after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([0n, 10n, 20n]);
      sourceArr.copyWithin(2, 0);
      expect(sourceArr[2]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0840
     * @tc.name testBigUint64ArrayCopyWithin084
     * @tc.desc Verify max uint64 value 2^64-1 preserved exactly after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let sourceArr = new BigUint64Array([maxVal, 10n]);
      sourceArr.copyWithin(1, 0);
      expect(sourceArr[1]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0850
     * @tc.name testBigUint64ArrayCopyWithin085
     * @tc.desc Verify max-1 value preserved exactly after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let nearMax: bigint = 18446744073709551614n;
      let sourceArr = new BigUint64Array([nearMax, 5n]);
      sourceArr.copyWithin(1, 0);
      expect(sourceArr[1]).assertEqual(nearMax);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0860
     * @tc.name testBigUint64ArrayCopyWithin086
     * @tc.desc Verify value 1n preserved exactly after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 100n, 200n]);
      sourceArr.copyWithin(2, 0);
      expect(sourceArr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0870
     * @tc.name testBigUint64ArrayCopyWithin087
     * @tc.desc Verify 2^63-1 max signed positive value preserved after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxSigned: bigint = 9223372036854775807n;
      let sourceArr = new BigUint64Array([maxSigned, 11n]);
      sourceArr.copyWithin(1, 0);
      expect(sourceArr[1]).assertEqual(maxSigned);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0880
     * @tc.name testBigUint64ArrayCopyWithin088
     * @tc.desc Verify 2^63 value preserved exactly after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let pow2to63: bigint = 2n**63n;
      let sourceArr = new BigUint64Array([pow2to63, 99n]);
      sourceArr.copyWithin(1, 0);
      expect(sourceArr[1]).assertEqual(pow2to63);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0890
     * @tc.name testBigUint64ArrayCopyWithin089
     * @tc.desc Verify mixed boundary values 0n max and signed max all preserved after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let signedMax: bigint = 9223372036854775807n;
      let sourceArr = new BigUint64Array([0n, maxVal, signedMax, 1n]);
      sourceArr.copyWithin(0, 1, 4);
      expect(sourceArr[0]).assertEqual(maxVal);
      expect(sourceArr[1]).assertEqual(signedMax);
      expect(sourceArr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0900
     * @tc.name testBigUint64ArrayCopyWithin090
     * @tc.desc Verify alternating 0n and max pattern preserved after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let sourceArr = new BigUint64Array([0n, maxVal, 0n, maxVal]);
      sourceArr.copyWithin(0, 2, 4);
      expect(sourceArr[0]).assertEqual(0n);
      expect(sourceArr[1]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0910
     * @tc.name testBigUint64ArrayCopyWithin091
     * @tc.desc Verify all-zero array remains zero after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([0n, 0n, 0n, 0n]);
      sourceArr.copyWithin(2, 0, 2);
      expect(sourceArr[2]).assertEqual(0n);
      expect(sourceArr[3]).assertEqual(0n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0920
     * @tc.name testBigUint64ArrayCopyWithin092
     * @tc.desc Verify all-max array elements remain max after copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let sourceArr = new BigUint64Array([maxVal, maxVal, maxVal]);
      sourceArr.copyWithin(0, 1, 3);
      expect(sourceArr[0]).assertEqual(maxVal);
      expect(sourceArr[1]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0930
     * @tc.name testBigUint64ArrayCopyWithin093
     * @tc.desc Verify empty array copyWithin with all params zero keeps length zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array(0);
      sourceArr.copyWithin(0, 0, 0);
      expect(sourceArr.length).assertEqual(0);
      expect(sourceArr.byteLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0940
     * @tc.name testBigUint64ArrayCopyWithin094
     * @tc.desc Verify single element array self-copy target=0 start=0 end=1 leaves element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n]);
      sourceArr.copyWithin(0, 0, 1);
      expect(sourceArr[0]).assertEqual(1n);
      expect(sourceArr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0950
     * @tc.name testBigUint64ArrayCopyWithin095
     * @tc.desc Verify single element array target=1 >= length no-op keeps element unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n]);
      sourceArr.copyWithin(1, 0, 1);
      expect(sourceArr[0]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0960
     * @tc.name testBigUint64ArrayCopyWithin096
     * @tc.desc Verify truncation when target+count exceeds length copies only fitting elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([10n, 20n, 30n, 40n, 50n]);
      sourceArr.copyWithin(3, 0, 5);
      expect(sourceArr[3]).assertEqual(10n);
      expect(sourceArr[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0970
     * @tc.name testBigUint64ArrayCopyWithin097
     * @tc.desc Verify count truncation to 1 when target only accommodates one element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArr = new BigUint64Array([1n, 2n, 3n]);
      sourceArr.copyWithin(sourceArr.length - 1, 0, sourceArr.length);
      expect(sourceArr[2]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0980
     * @tc.name testBigUint64ArrayCopyWithin098
     * @tc.desc Verify repeated copyWithin on same position does not drift boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let sourceArr = new BigUint64Array([maxVal, 10n, 20n]);
      sourceArr.copyWithin(1, 0);
      sourceArr.copyWithin(2, 1);
      expect(sourceArr[2]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_0990
     * @tc.name testBigUint64ArrayCopyWithin099
     * @tc.desc Verify shared buffer multi-view consistency after copyWithin on one view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuf = new ArrayBuffer(24);
      let firstView = new BigUint64Array(sharedBuf, 0, 3);
      firstView[0] = 100n;
      firstView[1] = 200n;
      firstView[2] = 300n;
      firstView.copyWithin(0, 1);
      let secondView = new BigUint64Array(sharedBuf, 0, 3);
      expect(secondView[0]).assertEqual(200n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1000
     * @tc.name testBigUint64ArrayCopyWithin100
     * @tc.desc Verify large array boundary value copyWithin preserves element at target correctly
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let maxVal: bigint = 18446744073709551615n;
      let largeArr = new BigUint64Array(100);
      largeArr[0] = 0n;
      largeArr[50] = maxVal;
      largeArr[99] = 42n;
      largeArr.copyWithin(0, 50, 51);
      expect(largeArr[0]).assertEqual(maxVal);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1010
     * @tc.name testBigUint64ArrayCopyWithin101
     * @tc.desc Verify copyWithin(target: int) accepts binary literal 0b10 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let binaryTarget: int = 0b10;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(binaryTarget, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1020
     * @tc.name testBigUint64ArrayCopyWithin102
     * @tc.desc Verify copyWithin(target: int) accepts octal literal 0o2 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let octalTarget: int = 0o2;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(octalTarget, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1030
     * @tc.name testBigUint64ArrayCopyWithin103
     * @tc.desc Verify copyWithin(target: int) accepts hexadecimal literal 0x02 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let hexadecimalTarget: int = 0x02;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(hexadecimalTarget, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1040
     * @tc.name testBigUint64ArrayCopyWithin104
     * @tc.desc Verify copyWithin(start: int) accepts binary literal 0b10 and copies [2,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let binaryStart: int = 0b10;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, binaryStart, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1050
     * @tc.name testBigUint64ArrayCopyWithin105
     * @tc.desc Verify copyWithin(start: int) accepts octal literal 0o2 and copies [2,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let octalStart: int = 0o2;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, octalStart, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1060
     * @tc.name testBigUint64ArrayCopyWithin106
     * @tc.desc Verify copyWithin(start: int) accepts hexadecimal literal 0x02 and copies [2,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let hexadecimalStart: int = 0x02;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, hexadecimalStart, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1070
     * @tc.name testBigUint64ArrayCopyWithin107
     * @tc.desc Verify copyWithin(end: int) accepts binary literal 0b100 and copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let binaryEnd: int = 0b100;
      sourceArray.copyWithin(targetIndex, startIndex, binaryEnd);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1080
     * @tc.name testBigUint64ArrayCopyWithin108
     * @tc.desc Verify copyWithin(end: int) accepts octal literal 0o4 and copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let octalEnd: int = 0o4;
      sourceArray.copyWithin(targetIndex, startIndex, octalEnd);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1090
     * @tc.name testBigUint64ArrayCopyWithin109
     * @tc.desc Verify copyWithin(end: int) accepts hexadecimal literal 0x04 and copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let hexadecimalEnd: int = 0x04;
      sourceArray.copyWithin(targetIndex, startIndex, hexadecimalEnd);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1100
     * @tc.name testBigUint64ArrayCopyWithin110
     * @tc.desc Verify copyWithin mixed radix target/start/end copies [2,5) to target 1 with forward overlap
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n, 60n];
      let sourceArray = new BigUint64Array(sourceValues);
      let hexadecimalTarget: int = 0x01;
      let binaryStart: int = 0b10;
      let octalEnd: int = 0o5;
      sourceArray.copyWithin(hexadecimalTarget, binaryStart, octalEnd);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
      expect(sourceArray[3]).assertEqual(50n);
      expect(sourceArray[4]).assertEqual(50n);
      expect(sourceArray[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1110
     * @tc.name testBigUint64ArrayCopyWithin111
     * @tc.desc Verify copyWithin mixed radix with negative start clamps start to 0 before copying [0,4) to target 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [1n, 2n, 3n, 4n, 5n, 6n];
      let sourceArray = new BigUint64Array(sourceValues);
      let binaryTarget: int = 0b10;
      let negativeStart: int = -8;
      let hexadecimalEnd: int = 0x04;
      sourceArray.copyWithin(binaryTarget, negativeStart, hexadecimalEnd);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[1]).assertEqual(2n);
      expect(sourceArray[2]).assertEqual(1n);
      expect(sourceArray[3]).assertEqual(2n);
      expect(sourceArray[4]).assertEqual(3n);
      expect(sourceArray[5]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1120
     * @tc.name testBigUint64ArrayCopyWithin112
     * @tc.desc Verify copyWithin mixed radix with target beyond length clamps target to length and preserves array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [11n, 22n, 33n, 44n];
      let sourceArray = new BigUint64Array(sourceValues);
      let binaryTarget: int = 0b1000;
      let octalStart: int = 0o1;
      let hexadecimalEnd: int = 0x03;
      sourceArray.copyWithin(binaryTarget, octalStart, hexadecimalEnd);
      expect(sourceArray[0]).assertEqual(11n);
      expect(sourceArray[1]).assertEqual(22n);
      expect(sourceArray[2]).assertEqual(33n);
      expect(sourceArray[3]).assertEqual(44n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1130
     * @tc.name testBigUint64ArrayCopyWithin113
     * @tc.desc Verify copyWithin(target: byte) accepts declared byte target 2 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: byte = 2;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1140
     * @tc.name testBigUint64ArrayCopyWithin114
     * @tc.desc Verify copyWithin(target: short) accepts declared short target 2 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: short = 2;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1150
     * @tc.name testBigUint64ArrayCopyWithin115
     * @tc.desc Verify copyWithin(start: byte) accepts declared byte start 2 and copies [2,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: byte = 2;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1160
     * @tc.name testBigUint64ArrayCopyWithin116
     * @tc.desc Verify copyWithin(start: short) accepts declared short start 2 and copies [2,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: short = 2;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
      expect(sourceArray[2]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1170
     * @tc.name testBigUint64ArrayCopyWithin117
     * @tc.desc Verify copyWithin(end: byte) accepts declared byte end 4 and copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let endIndex: byte = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1180
     * @tc.name testBigUint64ArrayCopyWithin118
     * @tc.desc Verify copyWithin(end: short) accepts declared short end 4 and copies [1,4) to index 0
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let endIndex: short = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1190
     * @tc.name testBigUint64ArrayCopyWithin119
     * @tc.desc Verify copyWithin() mutates its receiver while toReversed() returns a reversed copy and leaves its source unchanged
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let mutableArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let targetIndex: int = 1;
      let startIndex: int = 0;
      let endIndex: int = 2;
      let copyWithinResult = mutableArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(copyWithinResult).assertEqual(mutableArray);
      expect(mutableArray[0]).assertEqual(1n);
      expect(mutableArray[1]).assertEqual(1n);
      expect(mutableArray[2]).assertEqual(2n);
      expect(mutableArray[3]).assertEqual(4n);
      let immutableSourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let reversedArray = immutableSourceArray.toReversed();
      expect(reversedArray[0]).assertEqual(4n);
      expect(reversedArray[1]).assertEqual(3n);
      expect(reversedArray[2]).assertEqual(2n);
      expect(reversedArray[3]).assertEqual(1n);
      expect(immutableSourceArray[0]).assertEqual(1n);
      expect(immutableSourceArray[1]).assertEqual(2n);
      expect(immutableSourceArray[2]).assertEqual(3n);
      expect(immutableSourceArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1200
     * @tc.name testBigUint64ArrayCopyWithin120
     * @tc.desc Verify copyWithin on non-zero byteOffset view writes back only inside the shared buffer window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sharedBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let byteOffset: int = 8;
      let viewLength: int = 3;
      let windowView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let targetIndex: int = 1;
      let startIndex: int = 0;
      let endIndex: int = 2;
      windowView.copyWithin(targetIndex, startIndex, endIndex);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(20n);
      expect(fullView[3]).assertEqual(30n);
      expect(fullView[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1210
     * @tc.name testBigUint64ArrayCopyWithin121
     * @tc.desc Verify copyWithin on a subarray window writes the copied range back to the parent array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin121', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([10n, 20n, 30n, 40n, 50n, 60n]);
      let windowView = parentArray.subarray(1, 5);
      let targetIndex: int = 1;
      let startIndex: int = 2;
      let endIndex: int = 4;
      windowView.copyWithin(targetIndex, startIndex, endIndex);
      expect(parentArray[0]).assertEqual(10n);
      expect(parentArray[1]).assertEqual(20n);
      expect(parentArray[2]).assertEqual(40n);
      expect(parentArray[3]).assertEqual(50n);
      expect(parentArray[4]).assertEqual(50n);
      expect(parentArray[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1220
     * @tc.name testBigUint64ArrayCopyWithin122
     * @tc.desc Verify copyWithin negative start is normalized inside a subarray window before parent writeback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin122', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let windowView = parentArray.subarray(2, 6);
      let targetIndex: int = 0;
      let startIndex: int = -2;
      windowView.copyWithin(targetIndex, startIndex);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(5n);
      expect(parentArray[3]).assertEqual(6n);
      expect(parentArray[4]).assertEqual(5n);
      expect(parentArray[5]).assertEqual(6n);
      expect(parentArray[6]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1230
     * @tc.name testBigUint64ArrayCopyWithin123
     * @tc.desc Verify copyWithin(target: int) accepts decimal literal 2 and writes [0,2) to index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin123', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n];
      let sourceArray = new BigUint64Array(sourceValues);
      let decimalTarget: int = 2;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(decimalTarget, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1240
     * @tc.name testBigUint64ArrayCopyWithin124
     * @tc.desc Verify copyWithin clamps start below zero and end beyond length before reverse overlap copy
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin124', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceValues: Array<BigInt> = [10n, 20n, 30n, 40n, 50n, 60n];
      let sourceArray = new BigUint64Array(sourceValues);
      let targetIndex: int = 1;
      let underflowStart: int = -10;
      let overflowEnd: int = 10;
      sourceArray.copyWithin(targetIndex, underflowStart, overflowEnd);
      expect(sourceArray[0]).assertEqual(10n);
      expect(sourceArray[1]).assertEqual(10n);
      expect(sourceArray[2]).assertEqual(20n);
      expect(sourceArray[3]).assertEqual(30n);
      expect(sourceArray[4]).assertEqual(40n);
      expect(sourceArray[5]).assertEqual(50n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1250
     * @tc.name testBigUint64ArrayCopyWithin125
     * @tc.desc Verify subarray copyWithin clamps negative target and overflow end within window before parent writeback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin125', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n, 6n, 7n]);
      let windowView = parentArray.subarray(1, 6);
      let targetIndex: int = -2;
      let startIndex: int = 0;
      let overflowEnd: int = 10;
      windowView.copyWithin(targetIndex, startIndex, overflowEnd);
      expect(parentArray[0]).assertEqual(1n);
      expect(parentArray[1]).assertEqual(2n);
      expect(parentArray[2]).assertEqual(3n);
      expect(parentArray[3]).assertEqual(4n);
      expect(parentArray[4]).assertEqual(2n);
      expect(parentArray[5]).assertEqual(3n);
      expect(parentArray[6]).assertEqual(7n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1260
     * @tc.name testBigUint64ArrayCopyWithin126
     * @tc.desc Verify nested subarray copyWithin from a byteOffset view writes to the correct shared buffer positions
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin126', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(64);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      fullView[7] = 80n;
      let byteOffset: int = 8;
      let offsetLength: int = 6;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, offsetLength);
      let middleWindow = offsetView.subarray(1, 5);
      let nestedWindow = middleWindow.subarray(1, 4);
      let targetIndex: int = 1;
      let startIndex: int = 0;
      let endIndex: int = 2;
      nestedWindow.copyWithin(targetIndex, startIndex, endIndex);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(40n);
      expect(fullView[5]).assertEqual(50n);
      expect(fullView[6]).assertEqual(70n);
      expect(fullView[7]).assertEqual(80n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1270
     * @tc.name testBigUint64ArrayCopyWithin127
     * @tc.desc Verify copyWithin on a slice window mutates the independent copy without changing the source buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin127', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(48);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      let byteOffset: int = 8;
      let offsetLength: int = 4;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, offsetLength);
      let sliceBegin: int = 1;
      let sliceEnd: int = 4;
      let sliceWindow = offsetView.slice(sliceBegin, sliceEnd);
      let targetIndex: int = 1;
      let startIndex: int = 0;
      let endIndex: int = 2;
      sliceWindow.copyWithin(targetIndex, startIndex, endIndex);
      let usesIndependentBuffer: boolean = sliceWindow.buffer !== sourceBuffer;
      expect(usesIndependentBuffer).assertTrue();
      expect(sliceWindow[0]).assertEqual(30n);
      expect(sliceWindow[1]).assertEqual(30n);
      expect(sliceWindow[2]).assertEqual(40n);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
      expect(fullView[4]).assertEqual(50n);
      expect(fullView[5]).assertEqual(60n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1280
     * @tc.name testBigUint64ArrayCopyWithin128
     * @tc.desc Verify zero-length byteOffset view copyWithin is a no-op and preserves source data
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin128', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let zeroLengthView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let targetIndex: int = 0;
      let startIndex: int = 0;
      let endIndex: int = 0;
      let returnedView: BigUint64Array = zeroLengthView.copyWithin(targetIndex, startIndex, endIndex);
      expect(returnedView).assertEqual(zeroLengthView);
      expect(zeroLengthView.length).assertEqual(0);
      expect(zeroLengthView.byteOffset).assertEqual(16);
      expect(zeroLengthView.byteLength).assertEqual(0);
      expect(fullView[0]).assertEqual(10n);
      expect(fullView[1]).assertEqual(20n);
      expect(fullView[2]).assertEqual(30n);
      expect(fullView[3]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1290
     * @tc.name testBigUint64ArrayCopyWithin129
     * @tc.desc Verify byte source converted by toInt supplies target index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin129', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let byteTarget: byte = 2;
      let targetIndex: int = byteTarget.toInt();
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1300
     * @tc.name testBigUint64ArrayCopyWithin130
     * @tc.desc Verify short source converted by toInt supplies start index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin130', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let shortStart: short = 2;
      let targetIndex: int = 0;
      let startIndex: int = shortStart.toInt();
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(30n);
      expect(sourceArray[1]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1310
     * @tc.name testBigUint64ArrayCopyWithin131
     * @tc.desc Verify long source converted by toInt supplies end index 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin131', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let longEnd: long = 4;
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let endIndex: int = longEnd.toInt();
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1320
     * @tc.name testBigUint64ArrayCopyWithin132
     * @tc.desc Verify float source 2.9f converted by toInt supplies target index 2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin132', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let floatTarget: float = 2.9f;
      let targetIndex: int = floatTarget.toInt();
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[2]).assertEqual(10n);
      expect(sourceArray[3]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1330
     * @tc.name testBigUint64ArrayCopyWithin133
     * @tc.desc Verify negative long source converted by toInt supplies target index -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin133', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let longTarget: long = -2;
      let targetIndex: int = longTarget.toInt();
      let startIndex: int = 0;
      let endIndex: int = 2;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[3]).assertEqual(10n);
      expect(sourceArray[4]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1340
     * @tc.name testBigUint64ArrayCopyWithin134
     * @tc.desc Verify copyWithin truncates float start 1.9f to index 1 and copies 20n and 30n to indices zero and one
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin134', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let floatStart: float = 1.9f;
      let targetIndex: int = 0;
      let startIndex: int = floatStart.toInt();
      let endIndex: int = 3;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[1]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1350
     * @tc.name testBigUint64ArrayCopyWithin135
     * @tc.desc Verify byte source converted by toInt supplies end index 4
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin135', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let byteEnd: byte = 4;
      let targetIndex: int = 0;
      let startIndex: int = 1;
      let endIndex: int = byteEnd.toInt();
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(20n);
      expect(sourceArray[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1360
     * @tc.name testBigUint64ArrayCopyWithin136
     * @tc.desc Verify negative short source converted by toInt supplies target index -2
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin136', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let shortTarget: short = -2;
      let targetIndex: int = shortTarget.toInt();
      let startIndex: int = 1;
      let endIndex: int = 4;
      sourceArray.copyWithin(targetIndex, startIndex, endIndex);
      expect(sourceArray[3]).assertEqual(20n);
      expect(sourceArray[4]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1370
     * @tc.name testBigUint64ArrayCopyWithin137
     * @tc.desc Verify target -1 and overflow end copy only the first source element to the tail
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin137', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let targetIndex: int = -1;
      let startIndex: int = 0;
      let overflowEnd: int = sourceArray.length + 1;
      sourceArray.copyWithin(targetIndex, startIndex, overflowEnd);
      expect(sourceArray[4]).assertEqual(1n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1380
     * @tc.name testBigUint64ArrayCopyWithin138
     * @tc.desc Verify int-min start and int-max end clamp before reverse overlap copying
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin138', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let targetIndex: int = 1;
      let minimumStart: int = -2147483648;
      let maximumEnd: int = 2147483647;
      sourceArray.copyWithin(targetIndex, minimumStart, maximumEnd);
      expect(sourceArray[1]).assertEqual(1n);
      expect(sourceArray[4]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1390
     * @tc.name testBigUint64ArrayCopyWithin139
     * @tc.desc Verify int-min target clamps to zero before copying a bounded middle range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin139', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n);
      let minimumTarget: int = -2147483648;
      let startIndex: int = 2;
      let endIndex: int = 4;
      sourceArray.copyWithin(minimumTarget, startIndex, endIndex);
      expect(sourceArray[0]).assertEqual(3n);
      expect(sourceArray[1]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1400
     * @tc.name testBigUint64ArrayCopyWithin140
     * @tc.desc Verify int-min end clamps to zero and makes the source interval empty
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin140', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n);
      let targetIndex: int = 0;
      let startIndex: int = 3;
      let minimumEnd: int = -2147483648;
      sourceArray.copyWithin(targetIndex, startIndex, minimumEnd);
      expect(sourceArray[0]).assertEqual(1n);
      expect(sourceArray[5]).assertEqual(6n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1410
     * @tc.name testBigUint64ArrayCopyWithin141
     * @tc.desc Verify sibling write before copyWithin is read from the shared source window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin141', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let windowView = new BigUint64Array(sourceBuffer, 8, 3);
      fullView[2] = 300n;
      windowView.copyWithin(0, 1, 3);
      expect(fullView[1]).assertEqual(300n);
      expect(fullView[2]).assertEqual(40n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1420
     * @tc.name testBigUint64ArrayCopyWithin142
     * @tc.desc Verify backing write outside a view remains unchanged during copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin142', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 999n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      let windowView = new BigUint64Array(sourceBuffer, 8, 2);
      windowView.copyWithin(0, 1);
      expect(fullView[0]).assertEqual(999n);
      expect(windowView[0]).assertEqual(30n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1430
     * @tc.name testBigUint64ArrayCopyWithin143
     * @tc.desc Verify negative target normalization inside an offset view writes back to its parent
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin143', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n);
      let windowView = parentArray.subarray(1, 5);
      windowView.copyWithin(-2, 0, 3);
      expect(parentArray[3]).assertEqual(2n);
      expect(parentArray[4]).assertEqual(3n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1440
     * @tc.name testBigUint64ArrayCopyWithin144
     * @tc.desc Verify overflow end clamps inside an offset view before parent writeback
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin144', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n);
      let windowView = parentArray.subarray(1, 5);
      let overflowEnd: int = 100;
      windowView.copyWithin(0, 2, overflowEnd);
      expect(parentArray[1]).assertEqual(4n);
      expect(parentArray[2]).assertEqual(5n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1450
     * @tc.name testBigUint64ArrayCopyWithin145
     * @tc.desc Verify negative start inside a nested subarray is resolved against the nested length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin145', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = BigUint64Array.of(1n, 2n, 3n, 4n, 5n, 6n, 7n);
      let middleWindow = parentArray.subarray(1, 6);
      let nestedWindow = middleWindow.subarray(1, 4);
      nestedWindow.copyWithin(0, -1);
      expect(parentArray[2]).assertEqual(5n);
      expect(parentArray[3]).assertEqual(4n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1460
     * @tc.name testBigUint64ArrayCopyWithin146
     * @tc.desc Verify a later sibling write remains visible through the mutated shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin146', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      fullView[3] = 4n;
      let windowView = new BigUint64Array(sourceBuffer, 0, 4);
      windowView.copyWithin(1, 0, 2);
      fullView[1] = 11n;
      expect(windowView[1]).assertEqual(11n);
      expect(windowView[2]).assertEqual(2n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1470
     * @tc.name testBigUint64ArrayCopyWithin147
     * @tc.desc Verify a slice snapshot stays detached after parent mutation before copyWithin
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin147', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let parentArray = BigUint64Array.of(10n, 20n, 30n, 40n, 50n);
      let sliceWindow = parentArray.slice(1, 4);
      parentArray[2] = 300n;
      sliceWindow.copyWithin(1, 0, 2);
      expect(sliceWindow[0]).assertEqual(20n);
      expect(sliceWindow[1]).assertEqual(20n);
      expect(sliceWindow[2]).assertEqual(30n);
      expect(parentArray[2]).assertEqual(300n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_COPYWITHIN_1480
     * @tc.name testBigUint64ArrayCopyWithin148
     * @tc.desc Verify overlapping sibling views both expose copyWithin writeback cells
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayCopyWithin148', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      let sourceBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let firstView = new BigUint64Array(sourceBuffer, 8, 3);
      let secondView = new BigUint64Array(sourceBuffer, 16, 3);
      firstView.copyWithin(1, 0, 2);
      expect(secondView[0]).assertEqual(20n);
      expect(secondView[1]).assertEqual(30n);
      expect(secondView[2]).assertEqual(50n);
    });
  });
}
