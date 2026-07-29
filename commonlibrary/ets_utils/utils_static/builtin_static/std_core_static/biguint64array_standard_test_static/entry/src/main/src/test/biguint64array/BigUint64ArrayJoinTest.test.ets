'use static';


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


export default function biguint64arrayJoinTest(): void {

  describe('BigUint64ArrayJoinTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0100
     * @tc.name testBigUint64ArrayJoin001
     * @tc.desc Verify join() on an empty BigUint64Array returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0200
     * @tc.name testBigUint64ArrayJoin002
     * @tc.desc Verify join() on a single zero element returns the zero string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n]);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0300
     * @tc.name testBigUint64ArrayJoin003
     * @tc.desc Verify join() preserves the max uint64 decimal string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551615n]);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0400
     * @tc.name testBigUint64ArrayJoin004
     * @tc.desc Verify join() uses comma as the default separator for two elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0500
     * @tc.name testBigUint64ArrayJoin005
     * @tc.desc Verify join() preserves zero, max uint64, and one in source order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 18446744073709551615n, 1n]);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('0,18446744073709551615,1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0600
     * @tc.name testBigUint64ArrayJoin006
     * @tc.desc Verify join() on a length-constructed zero-filled array returns comma-separated zeros
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('0,0,0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0700
     * @tc.name testBigUint64ArrayJoin007
     * @tc.desc Verify join(',') matches the default comma separator result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join(',');
      expect(joinResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0800
     * @tc.name testBigUint64ArrayJoin008
     * @tc.desc Verify join('|') inserts a pipe separator between every element
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join('|');
      expect(joinResult).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_0900
     * @tc.name testBigUint64ArrayJoin009
     * @tc.desc Verify join('') concatenates multiple element strings without delimiters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join('');
      expect(joinResult).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1000
     * @tc.name testBigUint64ArrayJoin010
     * @tc.desc Verify join('') preserves repeated zero element strings
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 0n]);
      let joinResult = sourceArray.join('');
      expect(joinResult).assertEqual('00');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1100
     * @tc.name testBigUint64ArrayJoin011
     * @tc.desc Verify join('') concatenates boundary element strings without delimiters
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 1n, 18446744073709551615n]);
      let joinResult = sourceArray.join('');
      expect(joinResult).assertEqual('0118446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1200
     * @tc.name testBigUint64ArrayJoin012
     * @tc.desc Verify join(' ') inserts a space separator between elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join(' ');
      expect(joinResult).assertEqual('1 2 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1300
     * @tc.name testBigUint64ArrayJoin013
     * @tc.desc Verify join() accepts a tab separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n, 30n]);
      let joinResult = sourceArray.join('\t');
      expect(joinResult).assertEqual('10\t20\t30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1400
     * @tc.name testBigUint64ArrayJoin014
     * @tc.desc Verify join() accepts a newline separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([10n, 20n]);
      let joinResult = sourceArray.join('\n');
      expect(joinResult).assertEqual('10\n20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1500
     * @tc.name testBigUint64ArrayJoin015
     * @tc.desc Verify join() accepts a multi-character separator
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join('--');
      expect(joinResult).assertEqual('1--2--3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1600
     * @tc.name testBigUint64ArrayJoin016
     * @tc.desc Verify join() accepts an alphabetic separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join('abc');
      expect(joinResult).assertEqual('1abc2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1700
     * @tc.name testBigUint64ArrayJoin017
     * @tc.desc Verify join() accepts a CJK separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join('中文');
      expect(joinResult).assertEqual('1中文2中文3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1800
     * @tc.name testBigUint64ArrayJoin018
     * @tc.desc Verify join() accepts a Japanese separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join('日本語');
      expect(joinResult).assertEqual('1日本語2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_1900
     * @tc.name testBigUint64ArrayJoin019
     * @tc.desc Verify join() accepts a backslash separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join('\\');
      expect(joinResult).assertEqual('1\\2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2000
     * @tc.name testBigUint64ArrayJoin020
     * @tc.desc Verify join() preserves spaces around a separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join(' , ');
      expect(joinResult).assertEqual('1 , 2 , 3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2100
     * @tc.name testBigUint64ArrayJoin021
     * @tc.desc Verify join() accepts a long separator string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let separatorText = 'abcdefghijabcdefghij';
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join(separatorText);
      expect(joinResult).assertEqual('1abcdefghijabcdefghij2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2200
     * @tc.name testBigUint64ArrayJoin022
     * @tc.desc Verify join() keeps order for a twelve-element sequential array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(12);
      for (let writeIndex: int = 0; writeIndex < sourceArray.length; writeIndex++) {
        sourceArray[writeIndex] = BigInt(writeIndex);
      }
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('0,1,2,3,4,5,6,7,8,9,10,11');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2300
     * @tc.name testBigUint64ArrayJoin023
     * @tc.desc Verify join('|') keeps order for a loop-initialized array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(6);
      for (let writeIndex: int = 0; writeIndex < sourceArray.length; writeIndex++) {
        sourceArray[writeIndex] = BigInt(writeIndex + 1);
      }
      let joinResult = sourceArray.join('|');
      expect(joinResult).assertEqual('1|2|3|4|5|6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2400
     * @tc.name testBigUint64ArrayJoin024
     * @tc.desc Verify the empty array join result has zero string length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(0);
      let joinResult = sourceArray.join();
      expect(joinResult.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2500
     * @tc.name testBigUint64ArrayJoin025
     * @tc.desc Verify the max uint64 join string length equals its decimal digit count
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551615n]);
      let joinResult = sourceArray.join();
      expect(joinResult.length).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2600
     * @tc.name testBigUint64ArrayJoin026
     * @tc.desc Verify a two-element comma join has the expected string length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n]);
      let joinResult = sourceArray.join(',');
      expect(joinResult.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2700
     * @tc.name testBigUint64ArrayJoin027
     * @tc.desc Verify a multi-character separator contributes its full string length
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let joinResult = sourceArray.join('--');
      expect(joinResult.length).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2800
     * @tc.name testBigUint64ArrayJoin028
     * @tc.desc Verify a CJK separator contributes its string length in the join result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let joinResult = sourceArray.join('中文');
      expect(joinResult.length).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_2900
     * @tc.name testBigUint64ArrayJoin029
     * @tc.desc Verify join('') produces the shortest combined representation for multi-digit elements
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([11n, 22n, 33n]);
      let joinResult = sourceArray.join('');
      expect(joinResult.length).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3000
     * @tc.name testBigUint64ArrayJoin030
     * @tc.desc Verify join() on BigUint64Array.of() preserves argument order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(10n, 20n, 30n);
      let joinResult = sourceArray.join('|');
      expect(joinResult).assertEqual('10|20|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3100
     * @tc.name testBigUint64ArrayJoin031
     * @tc.desc Verify join() on a copy-constructed array matches copied source values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([1n, 2n, 3n]);
      let copiedArray = new BigUint64Array(originalArray);
      let joinResult = copiedArray.join();
      expect(joinResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3200
     * @tc.name testBigUint64ArrayJoin032
     * @tc.desc Verify copy construction isolates join output from later source mutation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let originalArray = new BigUint64Array([1n, 2n, 3n]);
      let copiedArray = new BigUint64Array(originalArray);
      originalArray[0] = 99n;
      let joinResult = copiedArray.join();
      expect(joinResult).assertEqual('1,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3300
     * @tc.name testBigUint64ArrayJoin033
     * @tc.desc Verify join() on BigUint64Array.from(Set<BigInt>) follows insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceSet: Set<bigint> = new Set<bigint>();
      sourceSet.add(4n);
      sourceSet.add(8n);
      sourceSet.add(12n);
      let sourceArray = BigUint64Array.from(sourceSet);
      let joinResult = sourceArray.join('/');
      expect(joinResult).assertEqual('4/8/12');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3400
     * @tc.name testBigUint64ArrayJoin034
     * @tc.desc Verify join() after explicit index writes reflects written values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array(3);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      let joinResult = sourceArray.join(':');
      expect(joinResult).assertEqual('100:200:300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3500
     * @tc.name testBigUint64ArrayJoin035
     * @tc.desc Verify join() on a full ArrayBuffer view stringifies the shared values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let sourceArray = new BigUint64Array(sourceBuffer);
      sourceArray[0] = 100n;
      sourceArray[1] = 200n;
      sourceArray[2] = 300n;
      let joinResult = sourceArray.join(':');
      expect(joinResult).assertEqual('100:200:300');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3600
     * @tc.name testBigUint64ArrayJoin036
     * @tc.desc Verify join() on a non-zero byteOffset view reads only the view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(32);
      let baseView = new BigUint64Array(sourceBuffer);
      baseView[0] = 9n;
      baseView[1] = 8n;
      baseView[2] = 7n;
      baseView[3] = 6n;
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      let joinResult = offsetView.join(':');
      expect(joinResult).assertEqual('8:7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3700
     * @tc.name testBigUint64ArrayJoin037
     * @tc.desc Verify overlapping ArrayBuffer views produce join output for each view range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer, 0, 3);
      fullView[0] = 1n;
      fullView[1] = 2n;
      fullView[2] = 3n;
      let partialView = new BigUint64Array(sourceBuffer, 0, 2);
      let fullJoinResult = fullView.join();
      let partialJoinResult = partialView.join();
      expect(fullJoinResult).assertEqual('1,2,3');
      expect(partialJoinResult).assertEqual('1,2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3800
     * @tc.name testBigUint64ArrayJoin038
     * @tc.desc Verify join() on a tail ArrayBuffer view reads the final element only
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let fullView = new BigUint64Array(sourceBuffer);
      fullView[0] = 1n;
      fullView[1] = 4n;
      fullView[2] = 9n;
      let tailView = new BigUint64Array(sourceBuffer, 16, 1);
      let joinResult = tailView.join();
      expect(joinResult).assertEqual('9');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_3900
     * @tc.name testBigUint64ArrayJoin039
     * @tc.desc Verify join() on a subarray stringifies only the subarray range
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n, 5n]);
      let subarrayView = sourceArray.subarray(1, 4);
      let joinResult = subarrayView.join('|');
      expect(joinResult).assertEqual('2|3|4');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4000
     * @tc.name testBigUint64ArrayJoin040
     * @tc.desc Verify join() reflects element mutation performed after a previous join call
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      sourceArray.join();
      sourceArray[0] = 99n;
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('99,2,3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4100
     * @tc.name testBigUint64ArrayJoin041
     * @tc.desc Verify changing separators changes the join output without modifying the array
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let commaJoinResult = sourceArray.join(',');
      let pipeJoinResult = sourceArray.join('|');
      expect(commaJoinResult).assertEqual('1,2,3');
      expect(pipeJoinResult).assertEqual('1|2|3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4200
     * @tc.name testBigUint64ArrayJoin042
     * @tc.desc Verify join() does not modify byteOffset on a non-zero offset view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(24);
      let offsetView = new BigUint64Array(sourceBuffer, 8, 2);
      offsetView[0] = 10n;
      offsetView[1] = 20n;
      let byteOffsetBeforeJoin = offsetView.byteOffset;
      offsetView.join();
      expect(offsetView.byteOffset).assertEqual(byteOffsetBeforeJoin);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4300
     * @tc.name testBigUint64ArrayJoin043
     * @tc.desc Verify join() on one view does not modify a sibling view on the same buffer
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceBuffer = new ArrayBuffer(16);
      let firstView = new BigUint64Array(sourceBuffer);
      firstView[0] = 10n;
      firstView[1] = 20n;
      let siblingView = new BigUint64Array(sourceBuffer);
      firstView.join();
      expect(siblingView[0]).assertEqual(10n);
      expect(siblingView[1]).assertEqual(20n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4400
     * @tc.name testBigUint64ArrayJoin044
     * @tc.desc Verify join() stringifies negative BigInt inputs after uint64 conversion
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([-1n, -2n]);
      let joinResult = sourceArray.join(',');
      expect(joinResult).assertEqual('18446744073709551615,18446744073709551614');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4500
     * @tc.name testBigUint64ArrayJoin045
     * @tc.desc Verify join() stringifies a 2^64 input after uint64 wrap to zero
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([18446744073709551616n]);
      let joinResult = sourceArray.join();
      expect(joinResult).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4600
     * @tc.name testBigUint64ArrayJoin046
     * @tc.desc Verify join() preserves signed long max and max uint64 decimal strings together
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([9223372036854775807n, 18446744073709551615n]);
      let joinResult = sourceArray.join('|');
      expect(joinResult).assertEqual('9223372036854775807|18446744073709551615');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4700
     * @tc.name testBigUint64ArrayJoin047
     * @tc.desc Verify join(undefined) follows the default comma separator path
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([4n, 5n, 6n]);
      let separatorText: string | undefined = undefined;
      let joinResult = sourceArray.join(separatorText);
      expect(joinResult).assertEqual('4,5,6');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4800
     * @tc.name testBigUint64ArrayJoin048
     * @tc.desc Verify join() on a number byteOffset view reads the converted view window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 24;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let baseView = new BigUint64Array(sourceBuffer);
      baseView[0] = 10n;
      baseView[1] = 20n;
      baseView[2] = 30n;
      let byteOffset: number = 8.0;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset);
      let joinResult = offsetView.join();
      expect(joinResult).assertEqual('20,30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_4900
     * @tc.name testBigUint64ArrayJoin049
     * @tc.desc Verify join() on a zero-length ArrayBuffer view returns an empty string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 16;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let byteOffset: int = 16;
      let viewLength: int = 0;
      let emptyWindow = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      let separatorText: string = '|';
      let joinResult = emptyWindow.join(separatorText);
      expect(joinResult).assertEqual('');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5000
     * @tc.name testBigUint64ArrayJoin050
     * @tc.desc Verify join() on an offset view reflects parent view writes inside the window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let bufferByteLength: int = 32;
      let sourceBuffer = new ArrayBuffer(bufferByteLength);
      let baseView = new BigUint64Array(sourceBuffer);
      baseView[0] = 1n;
      baseView[1] = 2n;
      baseView[2] = 3n;
      baseView[3] = 4n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let offsetView = new BigUint64Array(sourceBuffer, byteOffset, viewLength);
      baseView[2] = 30n;
      let separatorText: string = '|';
      let joinResult = offsetView.join(separatorText);
      expect(joinResult).assertEqual('2|30');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5100
     * @tc.name testBigUint64ArrayJoin051
     * @tc.desc Verify join() on a subarray reflects parent mutation within the live window
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n, 4n]);
      let beginIndex: int = 1;
      let endIndex: int = 3;
      let subarrayView = sourceArray.subarray(beginIndex, endIndex);
      sourceArray[2] = 99n;
      let separatorText: string = '|';
      let joinResult = subarrayView.join(separatorText);
      expect(joinResult).assertEqual('2|99');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5200
     * @tc.name testBigUint64ArrayJoin052
     * @tc.desc Verify join() on a length-bounded byteOffset subarray stringifies current window values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(56);
      let fullView = new BigUint64Array(sharedBuffer, 0, 7);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      fullView[5] = 60n;
      fullView[6] = 70n;
      let byteOffset: int = 8;
      let viewLength: int = 5;
      let byteOffsetView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      let beginIndex: int = 2;
      let endIndex: int = 5;
      let nestedView = byteOffsetView.subarray(beginIndex, endIndex);
      fullView[4] = 555n;
      let separatorText: string = '|';
      let joinResult = nestedView.join(separatorText);
      expect(nestedView.byteOffset).assertEqual(24);
      expect(nestedView.length).assertEqual(3);
      expect(joinResult).assertEqual('40|555|60');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5300
     * @tc.name testBigUint64ArrayJoin053
     * @tc.desc Verify join() on a slice copy from byteOffset view ignores later source writes
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer: ArrayBuffer = new ArrayBuffer(40);
      let fullView = new BigUint64Array(sharedBuffer, 0, 5);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      fullView[4] = 50n;
      let sourceView = new BigUint64Array(sharedBuffer, 8, 3);
      let copyBegin: int = 0;
      let copyEnd: int = 3;
      let sliceCopy = sourceView.slice(copyBegin, copyEnd);
      sourceView[1] = 777n;
      let joinResult = sliceCopy.join('|');
      expect(sliceCopy.byteOffset).assertEqual(0);
      expect(sliceCopy.length).assertEqual(3);
      expect(joinResult).assertEqual('20|30|40');
      expect(sourceView[1]).assertEqual(777n);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5400
     * @tc.name testBigUint64ArrayJoin054
     * @tc.desc Verify join() on Set-constructed array stringifies unique values in insertion order
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceValues: Set<bigint> = new Set<bigint>();
      sourceValues.add(7n);
      sourceValues.add(11n);
      sourceValues.add(7n);
      sourceValues.add(15n);
      let sourceArray = new BigUint64Array(sourceValues);
      let joinResult = sourceArray.join('|');
      expect(sourceArray.length).assertEqual(3);
      expect(joinResult).assertEqual('7|11|15');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5500
     * @tc.name testBigUint64ArrayJoin055
     * @tc.desc Verify join() on iterator-constructed array starts from advanced iterator position
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(5n, 10n, 15n, 20n);
      let sourceIterator = sourceArray.values();
      sourceIterator.next();
      let targetArray = new BigUint64Array(sourceIterator);
      let joinResult = targetArray.join('~');
      expect(targetArray.length).assertEqual(3);
      expect(joinResult).assertEqual('10~15~20');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5600
     * @tc.name testBigUint64ArrayJoin056
     * @tc.desc Verify default join() matches toString() for mixed unsigned boundary values
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([0n, 9223372036854775808n, 18446744073709551615n]);
      let joinResult = sourceArray.join();
      let toStringResult = sourceArray.toString();
      expect(joinResult).assertEqual('0,9223372036854775808,18446744073709551615');
      expect(joinResult).assertEqual(toStringResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5700
     * @tc.name testBigUint64ArrayJoin057
     * @tc.desc Verify default join() and toString() read the same current values from a shared view
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sharedBuffer = new ArrayBuffer(32);
      let fullView = new BigUint64Array(sharedBuffer);
      fullView[0] = 10n;
      fullView[1] = 20n;
      fullView[2] = 30n;
      fullView[3] = 40n;
      let byteOffset: int = 8;
      let viewLength: int = 2;
      let sourceView = new BigUint64Array(sharedBuffer, byteOffset, viewLength);
      fullView[2] = 300n;
      let joinResult = sourceView.join();
      let toStringResult = sourceView.toString();
      expect(joinResult).assertEqual('20,300');
      expect(joinResult).assertEqual(toStringResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5800
     * @tc.name testBigUint64ArrayJoin058
     * @tc.desc Verify join() preserves a NUL separator between each element string
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = new BigUint64Array([1n, 2n, 3n]);
      let separatorText: string = '\u0000';
      let joinResult = sourceArray.join(separatorText);
      let expectedResult: string = '1\u00002\u00003';
      expect(joinResult).assertEqual(expectedResult);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_5900
     * @tc.name testBigUint64ArrayJoin059
     * @tc.desc Verify join emits decimal strings for binary integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0b101010), BigInt(0b11111111));
      expect(sourceArray.join(',')).assertEqual('42,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_6000
     * @tc.name testBigUint64ArrayJoin060
     * @tc.desc Verify join emits decimal strings for octal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0o52), BigInt(0o377));
      expect(sourceArray.join(',')).assertEqual('42,255');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_BIGUINT64ARRAY_JOIN_6100
     * @tc.name testBigUint64ArrayJoin061
     * @tc.desc Verify join emits decimal strings for hexadecimal integer values converted through BigInt
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testBigUint64ArrayJoin061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sourceArray = BigUint64Array.of(BigInt(0x2A), BigInt(0xFF));
      expect(sourceArray.join(',')).assertEqual('42,255');
    });
  });
}
