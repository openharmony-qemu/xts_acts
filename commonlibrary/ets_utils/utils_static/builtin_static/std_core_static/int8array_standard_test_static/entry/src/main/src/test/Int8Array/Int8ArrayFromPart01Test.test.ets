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
} from '../../../../hypium/index';
import Utils from '../Util.test';

class CodeItem {
  code: int = 0;
  constructor(c: int) {
    this.code = c;
  }
}

class Score {
  value: number = 0.0;
  constructor(v: number) {
    this.value = v;
  }
}

export default function int8ArrayFromPart01Test(): void {
  describe('Int8ArrayFromPart01Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    const INT8_MAX: byte = 127;
    const INT8_MIN: byte = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0100
     * @tc.name int8ArrayFromPart01Test001
     * @tc.desc Verify static Int8Array.from(FixedArray<int>) with single argument returns Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8];
      const result = Int8Array.from(source);
      expect(result.length).assertEqual(2);
      let r1: string = result.join(',');
      let e1: string = '7,8';
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0200
     * @tc.name int8ArrayFromPart01Test002
     * @tc.desc Verify Int8Array.from(empty FixedArray<int>) returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [];
      const result = Int8Array.from(source);
      expect(result.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0300
     * @tc.name int8ArrayFromPart01Test003
     * @tc.desc Verify Int8Array.from([42]) returns length 1 and element preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [42];
      const result = Int8Array.from(source);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0400
     * @tc.name int8ArrayFromPart01Test004
     * @tc.desc Verify Int8Array.from([64, -64, 32]) preserves order with mixed signs
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [64, -64, 32];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(64);
      expect(result[1]).assertEqual(-64);
      expect(result[2]).assertEqual(32);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0500
     * @tc.name int8ArrayFromPart01Test005
     * @tc.desc Verify Int8Array.from([99, 99, 99]) all elements equal 99
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [99, 99, 99];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(99);
      let r1: number = result[1];
      let e1: int = 99;
      expect(r1).assertEqual(e1);
      expect(result[2]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0600
     * @tc.name int8ArrayFromPart01Test006
     * @tc.desc Verify Int8Array.from([-128]) returns int8 minimum without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [INT8_MIN];
      const result = Int8Array.from(source);
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0700
     * @tc.name int8ArrayFromPart01Test007
     * @tc.desc Verify Int8Array.from([127]) returns int8 maximum without truncation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [INT8_MAX];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0800
     * @tc.name int8ArrayFromPart01Test008
     * @tc.desc Verify Int8Array.from([0]) returns default value 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [0];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_0900
     * @tc.name int8ArrayFromPart01Test009
     * @tc.desc Verify Int8Array.from([-1]) returns sentinel value -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-1];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1000
     * @tc.name int8ArrayFromPart01Test010
     * @tc.desc Verify Int8Array.from([128]) truncates and wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [128];
      const result = Int8Array.from(source);
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1100
     * @tc.name int8ArrayFromPart01Test011
     * @tc.desc Verify Int8Array.from([-129]) truncates and wraps to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-129];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1200
     * @tc.name int8ArrayFromPart01Test012
     * @tc.desc Verify Int8Array.from([255]) truncates and wraps to -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [255];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1300
     * @tc.name int8ArrayFromPart01Test013
     * @tc.desc Verify Int8Array.from([256]) truncates and wraps to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [256];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1400
     * @tc.name int8ArrayFromPart01Test014
     * @tc.desc Verify Int8Array.from([129]) truncates and wraps to -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [129];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1500
     * @tc.name int8ArrayFromPart01Test015
     * @tc.desc Verify Int8Array.from([383]) wraps cross-cycle back to positive max 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [383];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1600
     * @tc.name int8ArrayFromPart01Test016
     * @tc.desc Verify Int8Array.from([-256]) wraps full negative cycle to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-256];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1700
     * @tc.name int8ArrayFromPart01Test017
     * @tc.desc Verify Int8Array.from([-255]) wraps to 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-255];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1800
     * @tc.name int8ArrayFromPart01Test018
     * @tc.desc Verify Int8Array.from([max int 2147483647]) truncates to -1 via 32-bit underflow
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [2147483647];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_1900
     * @tc.name int8ArrayFromPart01Test019
     * @tc.desc Verify Int8Array.from([int min -2147483647-1]) truncates to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [-2147483648];
      const result = Int8Array.from(source);
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2000
     * @tc.name int8ArrayFromPart01Test020
     * @tc.desc Verify Int8Array.from() BYTES_PER_ELEMENT equals 1 for Int8Array type check
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7];
      const result = Int8Array.from(source);
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
      let r1: int = result.byteOffset;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2100
     * @tc.name int8ArrayFromPart01Test021
     * @tc.desc Verify Int8Array.from(source) byteLength equals element count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8, 9];
      const result = Int8Array.from(source);
      let r1: int = result.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: int = result.buffer.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2200
     * @tc.name int8ArrayFromPart01Test022
     * @tc.desc Verify two Int8Array.from() calls produce independent buffers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8];
      const a = Int8Array.from(source);
      const b = Int8Array.from(source);
      a[0] = -1;
      expect(b[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2300
     * @tc.name int8ArrayFromPart01Test023
     * @tc.desc Verify source FixedArray is unmodified after Int8Array.from()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8];
      const result = Int8Array.from(source);
      result[0] = -1;
      expect(source[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2400
     * @tc.name int8ArrayFromPart01Test024
     * @tc.desc Verify Int8Array.from(source) returned array is mutable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7];
      const result = Int8Array.from(source);
      result[0] = INT8_MIN;
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2500
     * @tc.name int8ArrayFromPart01Test025
     * @tc.desc Verify Int8Array.from(source) subarray shares the same buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: FixedArray<int> = [7, 8, 9];
      const result = Int8Array.from(source);
      const view = result.subarray(1);
      view[0] = -1;
      expect(result[1]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2600
     * @tc.name int8ArrayFromPart01Test026
     * @tc.desc Verify Int8Array.from<U>(arrayLike, mapfn) with 2 arguments returns mapped result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['1', '2'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return k + 1;
      });
      expect(result.length).assertEqual(2);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2700
     * @tc.name int8ArrayFromPart01Test027
     * @tc.desc Verify Int8Array.from() with empty source does not call mapfn
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count: number = 0.0;
      const src: Array<string> = [];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        count = count + 1;
        return 0.0;
      });
      expect(result.length).assertEqual(0);
      expect(count).assertEqual(0.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2800
     * @tc.name int8ArrayFromPart01Test028
     * @tc.desc Verify Int8Array.from(["abcd"]) mapfn returns v.length equals 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['abcd'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return v.length;
      });
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_2900
     * @tc.name int8ArrayFromPart01Test029
     * @tc.desc Verify Int8Array.from(["a","bb","ccc"]) mapfn with v.length returns [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'bb', 'ccc'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return v.length;
      });
      expect(result[0]).assertEqual(1);
      expect(result[2]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3000
     * @tc.name int8ArrayFromPart01Test030
     * @tc.desc Verify Int8Array.from<boolean>() mapfn maps true/false to 1/0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<boolean> = [true, false, true];
      const result = Int8Array.from<boolean>(src, (v: boolean, k: number) => {
        return v ? 1.0 : 0.0;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3100
     * @tc.name int8ArrayFromPart01Test031
     * @tc.desc Verify Int8Array.from<CodeItem>() mapfn extracts int field code
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<CodeItem> = [new CodeItem(7), new CodeItem(8)];
      const result = Int8Array.from<CodeItem>(src, (v: CodeItem, k: number) => {
        return v.code;
      });
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3200
     * @tc.name int8ArrayFromPart01Test032
     * @tc.desc Verify Int8Array.from<Score>() mapfn extracts number field triggering truncation 128.0 -> -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<Score> = [new Score(128.0)];
      const result = Int8Array.from<Score>(src, (v: Score, k: number) => {
        return v.value;
      });
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3300
     * @tc.name int8ArrayFromPart01Test033
     * @tc.desc Verify Int8Array.from mapfn returning 128.0 overflows and wraps to -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 128.0;
      });
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3400
     * @tc.name int8ArrayFromPart01Test034
     * @tc.desc Verify Int8Array.from mapfn returning -129.0 underflows to INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -129.0;
      });
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3500
     * @tc.name int8ArrayFromPart01Test035
     * @tc.desc Verify Int8Array.from expects -1 when 255.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 255.0;
      });
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3600
     * @tc.name int8ArrayFromPart01Test036
     * @tc.desc Verify Int8Array.from mapfn returning 256.0 overflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 256.0;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3700
     * @tc.name int8ArrayFromPart01Test037
     * @tc.desc Verify Int8Array.from expects -127 when mapfn returns 129.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 129.0;
      });
      expect(result[0]).assertEqual(-INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3800
     * @tc.name int8ArrayFromPart01Test038
     * @tc.desc Verify Int8Array.from mapfn returning 383.0 wraps multi-cycle to INT8_MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 383.0;
      });
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_3900
     * @tc.name int8ArrayFromPart01Test039
     * @tc.desc Verify Int8Array.from mapfn returning -256.0 underflows to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -256.0;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4000
     * @tc.name int8ArrayFromPart01Test040
     * @tc.desc Verify Int8Array.from expects 1 when -255.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -255.0;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4100
     * @tc.name int8ArrayFromPart01Test041
     * @tc.desc Verify Int8Array.from mapfn returning Number.NaN converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return Number.NaN;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4200
     * @tc.name int8ArrayFromPart01Test042
     * @tc.desc Verify Int8Array.from expects 1 when 1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 1.9;
      });
      expect(result[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4300
     * @tc.name int8ArrayFromPart01Test043
     * @tc.desc Verify Int8Array.from expects -1 when -1.9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -1.9;
      });
      expect(result[0]).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4400
     * @tc.name int8ArrayFromPart01Test044
     * @tc.desc Verify Int8Array.from mapfn returning 0.0 preserves 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 0.0;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4500
     * @tc.name int8ArrayFromPart01Test045
     * @tc.desc Verify Int8Array.from mapfn returning -0.0 converts to 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -0.0;
      });
      expect(result[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4600
     * @tc.name int8ArrayFromPart01Test046
     * @tc.desc Verify Int8Array.from() with Number.MAX_VALUE input produces Int8Array with length 1 and element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const result: Int8Array = Int8Array.from([Number.MAX_VALUE]);
      expect(result[0]).assertEqual(0);
      expect(result.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4700
     * @tc.name int8ArrayFromPart01Test047
     * @tc.desc Verify Int8Array.from mapfn returning -128.0 preserves exact int8 minimum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return -128.0;
      });
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4800
     * @tc.name int8ArrayFromPart01Test048
     * @tc.desc Verify Int8Array.from mapfn returning 127.0 preserves int8 maximum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 127.0;
      });
      expect(result[0]).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_4900
     * @tc.name int8ArrayFromPart01Test049
     * @tc.desc Verify Int8Array.from mapfn returns index k as element value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'b', 'c'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return k;
      });
      expect(result[0]).assertEqual(0);
      expect(result[2]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5000
     * @tc.name int8ArrayFromPart01Test050
     * @tc.desc Verify Int8Array.from mapfn returns v.length + k equals 3 for index 1 with 'bb'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'bb', 'ccc'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return v.length + k;
      });
      expect(result[1]).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5100
     * @tc.name int8ArrayFromPart01Test051
     * @tc.desc Verify Int8Array.from mapfn ignores source value returns constant 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'b'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 42.0;
      });
      expect(result[0]).assertEqual(42);
      expect(result[1]).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5200
     * @tc.name int8ArrayFromPart01Test052
     * @tc.desc Verify Int8Array.from mapfn branches on source value returning 128 or 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['high'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        if (v === 'high') {
          return 128.0;
        }
        return 0.0;
      });
      let r1: number = result[0];
      let e1: number = INT8_MIN;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5300
     * @tc.name int8ArrayFromPart01Test053
     * @tc.desc Verify Int8Array.from mapfn reads closure variable factor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factor: number = 2.0;
      const src: Array<string> = ['a', 'b', 'c'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return k * factor;
      });
      expect(result[2]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5400
     * @tc.name int8ArrayFromPart01Test054
     * @tc.desc Verify Int8Array.from mapfn modifies external state via push
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let collected: Array<number> = [];
      const src: Array<string> = ['a', 'b', 'c'];
      Int8Array.from<string>(src, (v: string, k: number) => {
        collected.push(k);
        return 0.0;
      });
      expect(collected.length).assertEqual(3);
      expect(collected[2]).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5500
     * @tc.name int8ArrayFromPart01Test055
     * @tc.desc Verify Int8Array.from mapfn call count equals source length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0.0;
      const src: Array<string> = ['a', 'b', 'c'];
      Int8Array.from<string>(src, (v: string, k: number) => {
        calls = calls + 1;
        return 0.0;
      });
      expect(calls).assertEqual(3.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5600
     * @tc.name int8ArrayFromPart01Test056
     * @tc.desc Verify Int8Array.from mapfn receives correct source element values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let got: Array<string> = [];
      const src: Array<string> = ['x', 'y', 'z'];
      Int8Array.from<string>(src, (v: string, k: number) => {
        got.push(v);
        return 0.0;
      });
      expect(got[0]).assertEqual('x');
      expect(got[2]).assertEqual('z');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5700
     * @tc.name int8ArrayFromPart01Test057
     * @tc.desc Verify Int8Array.from expects 2 when mapfn returns k*2 on ['a','b']
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'b'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return k * 2;
      });
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5800
     * @tc.name int8ArrayFromPart01Test058
     * @tc.desc Verify Int8Array.from<U>() return type is Int8Array via BYTES_PER_ELEMENT === 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 0.0;
      });
      expect(result.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_5900
     * @tc.name int8ArrayFromPart01Test059
     * @tc.desc Verify Int8Array.from() result length equals source arrayLike length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'b', 'c'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 0.0;
      });
      let r1: int = result.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6000
     * @tc.name int8ArrayFromPart01Test060
     * @tc.desc Verify Int8Array.from result elements equal k+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a', 'b'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return k + 1;
      });
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6100
     * @tc.name int8ArrayFromPart01Test061
     * @tc.desc Verify Int8Array.from modifying result does not affect source arrayLike
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['7', '8'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 7.0;
      });
      result[0] = -1;
      expect(src[0]).assertEqual('7');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6200
     * @tc.name int8ArrayFromPart01Test062
     * @tc.desc Verify Int8Array.from() result byteOffset equals 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      const result = Int8Array.from<string>(src, (v: string, k: number) => {
        return 0.0;
      });
      expect(result.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6300
     * @tc.name int8ArrayFromPart01Test063
     * @tc.desc Verify Int8Array.from mapfn throws Error('boom') immediately, catch asserts error name and message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      try {
        Int8Array.from<string>(src, (v: string, k: number) => {
          throw new Error('boom');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('boom');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6400
     * @tc.name int8ArrayFromPart01Test064
     * @tc.desc Verify Int8Array.from mapfn throwing RangeError propagates exception with name RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      try {
        Int8Array.from<string>(src, (v: string, k: number) => {
          throw new RangeError('r');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6500
     * @tc.name int8ArrayFromPart01Test065
     * @tc.desc Verify Int8Array.from mapfn throwing TypeError propagates exception with name TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = ['a'];
      try {
        Int8Array.from<string>(src, (v: string, k: number) => {
          throw new TypeError('t');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6600
     * @tc.name int8ArrayFromPart01Test066
     * @tc.desc Verify Int8Array.from mapfn throws Error on second element (k===1), catch asserts partial call count 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0.0;
      const src: Array<string> = ['a', 'b', 'c'];
      try {
        Int8Array.from<string>(src, (v: string, k: number) => {
          calls = calls + 1;
          if (k === 1.0) {
            throw new Error('second');
          }
          return 0.0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(2.0);
        expect(e.message).assertEqual('second');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6700
     * @tc.name int8ArrayFromPart01Test067
     * @tc.desc Verify Int8Array.from mapfn throws Error on third element (k===2), catch asserts full call count 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let calls: number = 0.0;
      const src: Array<string> = ['a', 'b', 'c'];
      try {
        Int8Array.from<string>(src, (_v: string, k: number) => {
          calls = calls + 1;
          if (k === 2.0) {
            throw new Error('last');
          }
          return 0.0;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(calls).assertEqual(3.0);
        expect(e.message).assertEqual('last');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART01_TEST_6800
     * @tc.name int8ArrayFromPart01Test068
     * @tc.desc Verify Int8Array.from() with empty source and throwing mapfn does not call mapfn and returns length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart01Test068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<string> = [];
      const result = Int8Array.from<string>(src, (_v: string, _k: number) => {
        throw new Error('never');
      });
      expect(result.length).assertEqual(0);
    });
  });
}
