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

export default function int8ArrayMapPart02Test(): void {
  describe('Int8ArrayMapPart02Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    
    const INT8_MAX = 127;
    const INT8_MIN = -128;

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0300
     * @tc.name int8ArrayMapPart02Test003
     * @tc.desc Verify map Int8Array returns empty result for empty source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let r = src.map((v: number) => v);
      let mappedLength: int = r.length;
      expect(mappedLength).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0500
     * @tc.name int8ArrayMapPart02Test005
     * @tc.desc Verify map Int8Array preserves length of 100-element source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(100);
      let r = src.map((v: number) => v);
      let mappedLength: int = r.length;
      expect(mappedLength).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0600
     * @tc.name int8ArrayMapPart02Test006
     * @tc.desc Verify map typeof object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedLength: int = r.length;
      expect(mappedLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0700
     * @tc.name int8ArrayMapPart02Test007
     * @tc.desc Verify subarray map Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let view = src.subarray(1, 3);
      let r = view.map((v: number) => v);
      let mappedLength: int = r.length;
      expect(mappedLength).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0800
     * @tc.name int8ArrayMapPart02Test008
     * @tc.desc Verify identity map copies element values at first and last index to result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 1;
      expect(mappedValue).assertEqual(expectedValue);
      let mappedValue2: number = r.$_get(2);
      let expectedValue2: int = 3;
      expect(mappedValue2).assertEqual(expectedValue2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_0900
     * @tc.name int8ArrayMapPart02Test009
     * @tc.desc Verify identity map int8 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([INT8_MIN, 0, INT8_MAX]);
      let r = src.map((v: number) => v);
      let mappedValue: number = r.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1000
     * @tc.name int8ArrayMapPart02Test010
     * @tc.desc Verify map v+1 transforms element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v + 1);
      let mappedValue: number = r.$_get(1);
      let expectedValue: int = 3;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1100
     * @tc.name int8ArrayMapPart02Test011
     * @tc.desc Verify map v*2 transforms index 2 to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v * 2);
      let mappedValue: number = r.$_get(2);
      let expectedValue: int = 6;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1200
     * @tc.name int8ArrayMapPart02Test012
     * @tc.desc Verify map negates element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, -2, 3]);
      let r = src.map((v: number) => -v);
      let mappedValue: number = r.$_get(1);
      let expectedValue: int = 2;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1400
     * @tc.name int8ArrayMapPart02Test014
     * @tc.desc Verify map callback receives index argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([10, 20, 30]);
      let r = src.map((v: number, i: int) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return i;
      });
      let mappedValue: number = r.$_get(2);
      let expectedValue: int = 2;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1500
     * @tc.name int8ArrayMapPart02Test015
     * @tc.desc Verify map callback array argument has length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number, i: int, a: Int8Array) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return a.length;
      });
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 3;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1700
     * @tc.name int8ArrayMapPart02Test017
     * @tc.desc Verify map identity copies negative element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([-5, -10, -15]);
      let r = src.map((v: number) => v);
      let mappedValue: number = r.$_get(1);
      let expectedValue: int = -10;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1800
     * @tc.name int8ArrayMapPart02Test018
     * @tc.desc Verify map v-1 transforms element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v - 1);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 0;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_1900
     * @tc.name int8ArrayMapPart02Test019
     * @tc.desc Verify map 200 -56
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0, 0]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 200;
      });
      let mappedValue: number = r.$_get(1);
      let expectedValue: int = -56;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_2400
     * @tc.name int8ArrayMapPart02Test024
     * @tc.desc Verify map 0x81(129) -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 0x81;
      });
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = -127;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_2800
     * @tc.name int8ArrayMapPart02Test028
     * @tc.desc Verify map 0.0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([5]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 0.0;
      });
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 0;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_2900
     * @tc.name int8ArrayMapPart02Test029
     * @tc.desc Verify map [42] identity [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([42]);
      let r = src.map((v: number) => v);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 42;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3000
     * @tc.name int8ArrayMapPart02Test030
     * @tc.desc Verify map [-128] 1 -127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([INT8_MIN]);
      let r = src.map((v: number) => v + 1);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = -127;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3100
     * @tc.name int8ArrayMapPart02Test031
     * @tc.desc Verify map [127] 1 -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([INT8_MAX]);
      let r = src.map((v: number) => v + 1);
      let mappedValue: number = r.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3200
     * @tc.name int8ArrayMapPart02Test032
     * @tc.desc Verify map [0] 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 127;
      });
      let mappedValue: number = r.$_get(0);
      let expectedValue: number = INT8_MAX;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3300
     * @tc.name int8ArrayMapPart02Test033
     * @tc.desc Verify map [0] -128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([0]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return -128;
      });
      let mappedValue: number = r.$_get(0);
      let expectedValue: number = INT8_MIN;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3400
     * @tc.name int8ArrayMapPart02Test034
     * @tc.desc Verify map length length 3 identity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedLength: int = r.length;
      let expectedValue: int = 3;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3500
     * @tc.name int8ArrayMapPart02Test035
     * @tc.desc Verify map byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedByteLength: int = r.byteLength;
      let expectedByteLength: int = src.byteLength;
      expect(mappedByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3600
     * @tc.name int8ArrayMapPart02Test036
     * @tc.desc Verify map byteLength length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedByteLength: int = r.byteLength;
      let expectedLength: int = r.length;
      expect(mappedByteLength).assertEqual(expectedLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3700
     * @tc.name int8ArrayMapPart02Test037
     * @tc.desc Verify map length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([42]);
      let r = src.map((v: number) => v);
      let mappedLength: int = r.length;
      let expectedValue: int = 1;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3800
     * @tc.name int8ArrayMapPart02Test038
     * @tc.desc Verify map(callback) transforms each element via callback and returns new Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2]);
      let r = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 200;
      });
      let mappedLength: int = r.length;
      let expectedValue: int = 2;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_3900
     * @tc.name int8ArrayMapPart02Test039
     * @tc.desc Verify subarray map length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let view = src.subarray(1, 3);
      let r = view.map((v: number) => v);
      let mappedLength: int = r.length;
      let expectedValue: int = 2;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4000
     * @tc.name int8ArrayMapPart02Test040
     * @tc.desc Verify identity map leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let resultVal1: Int8Array = src.map((v: number) => v);
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let srcValue: number = src.$_get(0);
      let expectedValue: int = 1;
      expect(srcValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4100
     * @tc.name int8ArrayMapPart02Test041
     * @tc.desc Verify map with constant callback leaves source unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let resultVal1: Int8Array = src.map((v: number) => {
        if (v < INT8_MIN || v > INT8_MAX) {
          return 0;
        }
        return 200;
      });
      let expectedVal1: Int8Array = new Int8Array([200, 200, 200]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let srcValue: number = src.$_get(0);
      let expectedValue: int = 1;
      expect(srcValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4200
     * @tc.name int8ArrayMapPart02Test042
     * @tc.desc Verify map leaves source length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let resultVal1: Int8Array = src.map((v: number) => v);
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let mappedLength: int = src.length;
      let expectedValue: int = 3;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4300
     * @tc.name int8ArrayMapPart02Test043
     * @tc.desc Verify map leaves view byteOffset 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf = new ArrayBuffer(8);
      let src = new Int8Array(buf, 2, 3);
      let resultVal1: Int8Array = src.map((v: number) => v);
      let expectedVal1: Int8Array = new Int8Array([0, 0, 0]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let mappedByteOffset: int = src.byteOffset;
      let expectedValue: int = 2;
      expect(mappedByteOffset).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4400
     * @tc.name int8ArrayMapPart02Test044
     * @tc.desc Verify map result mutation does not affect source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      r.$_set(0, 99);
      let srcValue: number = src.$_get(0);
      let expectedValue: int = 1;
      expect(srcValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4500
     * @tc.name int8ArrayMapPart02Test045
     * @tc.desc Verify map leaves source toString unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let before = src.toString();
      let resultVal1: Int8Array = src.map((v: number) => v);
      let expectedVal1: Int8Array = new Int8Array([1, 2, 3]);
      expect(resultVal1.toString()).assertEqual(expectedVal1.toString());
      let afterString: string = src.toString();
      let expectedString = before;
      expect(afterString).assertEqual(expectedString);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4600
     * @tc.name int8ArrayMapPart02Test046
     * @tc.desc Verify chained map calls double increment to 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v + 1).map((v: number) => v + 1);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 3;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4700
     * @tc.name int8ArrayMapPart02Test047
     * @tc.desc Verify triple map chain increments index 2 to 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src
        .map((v: number) => v + 1)
        .map((v: number) => v + 1)
        .map((v: number) => v + 1);
      let mappedValue: number = r.$_get(2);
      let expectedValue: int = 6;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4800
     * @tc.name int8ArrayMapPart02Test048
     * @tc.desc Verify map result chainable with reverse
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v).reverse();
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 3;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_4900
     * @tc.name int8ArrayMapPart02Test049
     * @tc.desc Verify map subarray buffer subarray map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let sub = r.subarray(0, 2);
      sub.$_set(0, 77);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 77;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5000
     * @tc.name int8ArrayMapPart02Test050
     * @tc.desc Verify map slice slice map
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let sl = r.slice(0, 2);
      sl.$_set(0, 88);
      let mappedValue: number = r.$_get(0);
      let expectedValue: int = 1;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5100
     * @tc.name int8ArrayMapPart02Test051
     * @tc.desc Verify map results are independent copies
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let firstMapped = src.map((v: number) => v);
      let secondMapped = src.map((v: number) => v);
      firstMapped.$_set(0, 44);
      let secondValue: number = secondMapped.$_get(0);
      let expectedValue: int = 1;
      expect(secondValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5200
     * @tc.name int8ArrayMapPart02Test052
     * @tc.desc Verify chained map calls transform element at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v * 2).map((v: number) => v - 1);
      let mappedValue: number = r.$_get(1);
      let expectedValue: int = 3;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5300
     * @tc.name int8ArrayMapPart02Test053
     * @tc.desc Verify map().map() length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v).map((v: number) => v);
      let mappedLength: int = r.length;
      let expectedValue: int = 3;
      expect(mappedLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5400
     * @tc.name int8ArrayMapPart02Test054
     * @tc.desc Verify map fill fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v).fill(0);
      let mappedValue: number = r.$_get(2);
      let expectedValue: int = 0;
      expect(mappedValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5500
     * @tc.name int8ArrayMapPart02Test055
     * @tc.desc Verify map buffer ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      expect(bufferByteLength).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5600
     * @tc.name int8ArrayMapPart02Test056
     * @tc.desc Verify map buffer.byteLength byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      let expectedByteLength: int = r.byteLength;
      expect(bufferByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5700
     * @tc.name int8ArrayMapPart02Test057
     * @tc.desc Verify map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let mappedByteOffset: int = r.byteOffset;
      let expectedValue: int = 0;
      expect(mappedByteOffset).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5800
     * @tc.name int8ArrayMapPart02Test058
     * @tc.desc Verify subarray map byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3, 4]);
      let view = src.subarray(1, 3);
      let r = view.map((v: number) => v);
      let mappedByteOffset: int = r.byteOffset;
      let expectedValue: int = 0;
      expect(mappedByteOffset).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_5900
     * @tc.name int8ArrayMapPart02Test059
     * @tc.desc Verify map buffer.byteLength buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      let expectedByteLength: int = src.buffer.byteLength;
      expect(bufferByteLength).assertEqual(expectedByteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_6000
     * @tc.name int8ArrayMapPart02Test060
     * @tc.desc Verify map buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([1, 2, 3]);
      let r = src.map((v: number) => v);
      r.$_set(0, 55);
      let viewOnR = new Int8Array(r.buffer);
      let viewValue: number = viewOnR.$_get(0);
      let expectedValue: int = 55;
      expect(viewValue).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_6100
     * @tc.name int8ArrayMapPart02Test061
     * @tc.desc Verify map buffer.byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(0);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      let expectedValue: int = 0;
      expect(bufferByteLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_6200
     * @tc.name int8ArrayMapPart02Test062
     * @tc.desc Verify map buffer.byteLength 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array([42]);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      let expectedValue: int = 1;
      expect(bufferByteLength).assertEqual(expectedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_MAP_PART02_6300
     * @tc.name int8ArrayMapPart02Test063
     * @tc.desc Verify (100) map buffer.byteLength 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayMapPart02Test063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let src = new Int8Array(100);
      let r = src.map((v: number) => v);
      let bufferByteLength: int = r.buffer.byteLength;
      let expectedValue: int = 100;
      expect(bufferByteLength).assertEqual(expectedValue);
    });

  });
}
