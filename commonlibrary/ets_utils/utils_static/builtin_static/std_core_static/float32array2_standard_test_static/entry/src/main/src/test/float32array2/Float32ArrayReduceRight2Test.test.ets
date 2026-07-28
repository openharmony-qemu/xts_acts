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
import Utils from '../Util.test';

export default function Float32ArrayReduceRight2Test(): void {
  describe('Float32ArrayReduceRight2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(45);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0010
     * @tc.name testFloat32ArrayReduceRightTwo001
     * @tc.desc Verify reduceRight(p+c) on [10,20,30] returns 60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0020
     * @tc.name testFloat32ArrayReduceRightTwo002
     * @tc.desc Verify reduceRight(p-c) on [10,20,30] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight((p, c, i, a) => p - c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0030
     * @tc.name testFloat32ArrayReduceRightTwo003
     * @tc.desc Verify reduceRight(p+c) on single-element [42] returns 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0040
     * @tc.name testFloat32ArrayReduceRightTwo004
     * @tc.desc Verify reduceRight(p+c) on [1,2,3,4] returns 10
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0050
     * @tc.name testFloat32ArrayReduceRightTwo005
     * @tc.desc Verify reduceRight(p+c) on typed callback with [2,4,6] returns 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 4.0, 6.0);
      const result = arr.reduceRight((p: number, c: number, i: int, a: Float32Array): number => p + c);
      expect(result).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0060
     * @tc.name testFloat32ArrayReduceRightTwo006
     * @tc.desc Verify reduceRight with const arrow function on [5,10,15] returns 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0, 15.0);
      const adder = (p: number, c: number, i: int, a: Float32Array): number => {
        return p + c;
      };
      const result = arr.reduceRight(adder);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0070
     * @tc.name testFloat32ArrayReduceRightTwo007
     * @tc.desc Verify reduceRight returning constant 5 on [1,2,3] returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => 5);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0080
     * @tc.name testFloat32ArrayReduceRightTwo008
     * @tc.desc Verify reduceRight((p,c,i,a)=>p) on [7,8,9] returns 9
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(7.0, 8.0, 9.0);
      const result = arr.reduceRight((p, c, i, a) => p);
      expect(result).assertEqual(9);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0090
     * @tc.name testFloat32ArrayReduceRightTwo009
     * @tc.desc Verify reduceRight visits indices 1,0 on [10,20,30]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const indices: number[] = [];
      arr.reduceRight((p, c, i, a) => {
        indices.push(i);
        return p + c;
      });
      expect(indices[0]).assertEqual(1);
      expect(indices[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0100
     * @tc.name testFloat32ArrayReduceRightTwo010
     * @tc.desc Verify reduceRight visits indices 2,1,0 on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const indices: number[] = [];
      arr.reduceRight((p, c, i, a) => {
        indices.push(i);
        return p + c;
      });
      expect(indices[0]).assertEqual(2);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0110
     * @tc.name testFloat32ArrayReduceRightTwo011
     * @tc.desc Verify reduceRight visits index 0 only on [100,200]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 200.0);
      const indices: number[] = [];
      arr.reduceRight((p, c, i, a) => {
        indices.push(i);
        return p + c;
      });
      expect(indices.length).assertEqual(1);
      expect(indices[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0120
     * @tc.name testFloat32ArrayReduceRightTwo012
     * @tc.desc Verify reduceRight visits indices 3,2,1,0 on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const indices: number[] = [];
      arr.reduceRight((p, c, i, a) => {
        indices.push(i);
        return p + c;
      });
      expect(indices[0]).assertEqual(3);
      expect(indices[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0130
     * @tc.name testFloat32ArrayReduceRightTwo013
     * @tc.desc Verify reduceRight on single-element [99] does not invoke callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(99.0);
      const indices: number[] = [];
      const result = arr.reduceRight((p, c, i, a) => {
        indices.push(i);
        return p + c;
      });
      expect(indices.length).assertEqual(0);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0140
     * @tc.name testFloat32ArrayReduceRightTwo014
     * @tc.desc Verify reduceRight first visit index is length-2 on 6 elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0, 6.0);
      let firstIndex = -1;
      arr.reduceRight((p, c, i, a) => {
        if (firstIndex === -1) {
          firstIndex = i;
        }
        return p + c;
      });
      expect(firstIndex).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0150
     * @tc.name testFloat32ArrayReduceRightTwo015
     * @tc.desc Verify reduceRight last visited index is 0 on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let lastIndex = -1;
      arr.reduceRight((p, c, i, a) => {
        lastIndex = i;
        return p + c;
      });
      expect(lastIndex).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0160
     * @tc.name testFloat32ArrayReduceRightTwo016
     * @tc.desc Verify reduceRight skips index length-1 on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      const seen: boolean[] = [false, false, false, false, false];
      arr.reduceRight((p, c, i, a) => {
        seen[i] = true;
        return p + c;
      });
      expect(seen[4]).assertFalse();
      expect(seen[3]).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0170
     * @tc.name testFloat32ArrayReduceRightTwo017
     * @tc.desc Verify reduceRight callback receives array with correct element at index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(11.0, 22.0, 33.0);
      let capturedElement017: number = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedElement017 = a.$_get(0);
        return p + c;
      });
      expect(capturedElement017).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0180
     * @tc.name testFloat32ArrayReduceRightTwo018
     * @tc.desc Verify reduceRight callback receives array with correct length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let capturedLength = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedLength = a.length;
        return p + c;
      });
      expect(capturedLength).assertEqual(arr.length);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0190
     * @tc.name testFloat32ArrayReduceRightTwo019
     * @tc.desc Verify reduceRight callback receives array with correct byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let capturedByteLength = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedByteLength = a.byteLength;
        return p + c;
      });
      expect(capturedByteLength).assertEqual(arr.byteLength);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0200
     * @tc.name testFloat32ArrayReduceRightTwo020
     * @tc.desc Verify reduceRight callback receives array with BYTES_PER_ELEMENT=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0);
      let capturedBytesPerElement = 0;
      let callCount020 = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        capturedBytesPerElement = a.BYTES_PER_ELEMENT;
        callCount020 = callCount020 + 1;
        return p + c;
      });
      expect(capturedBytesPerElement).assertEqual(4);
      expect(callCount020).assertEqual(1);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0210
     * @tc.name testFloat32ArrayReduceRightTwo021
     * @tc.desc Verify reduceRight callback receives array with correct byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 6.0, 7.0);
      let capturedByteOffset = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedByteOffset = a.byteOffset;
        return p + c;
      });
      expect(capturedByteOffset).assertEqual(arr.byteOffset);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0220
     * @tc.name testFloat32ArrayReduceRightTwo022
     * @tc.desc Verify reduceRight callback receives array with correct last element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(8.0, 9.0, 10.0);
      let capturedElement022: number = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedElement022 = a.$_get(a.length - 1);
        return p + c;
      });
      expect(capturedElement022).assertEqual(arr.$_get(arr.length - 1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0230
     * @tc.name testFloat32ArrayReduceRightTwo023
     * @tc.desc Verify reduceRight callback array access via index 1 matches original
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 6.0, 9.0);
      let capturedElement023: number = 0;
      arr.reduceRight((p, c, i, a) => {
        capturedElement023 = a[1];
        return p + c;
      });
      expect(capturedElement023).assertEqual(arr.$_get(1));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0240
     * @tc.name testFloat32ArrayReduceRightTwo024
     * @tc.desc Verify reduceRight callback mutates array via $_set(0,999) and change persists
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      arr.reduceRight((p, c, i, a) => {
        a.$_set(0, 999);
        return p + c;
      });
      const element024 = arr.$_get(0);
      expect(element024).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0250
     * @tc.name testFloat32ArrayReduceRightTwo025
     * @tc.desc Verify reduceRight(p+c*i) on [2,4,6,8] returns 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 4.0, 6.0, 8.0);
      const result = arr.reduceRight((p, c, i, a) => p + c * i);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0260
     * @tc.name testFloat32ArrayReduceRightTwo026
     * @tc.desc Verify reduceRight(p-c) on [1,2,3,4] returns -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight((p, c, i, a) => p - c);
      expect(result).assertEqual(-2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0270
     * @tc.name testFloat32ArrayReduceRightTwo027
     * @tc.desc Verify reduceRight(p*c) on [1,2,3,4] returns 24
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight((p, c, i, a) => p * c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0280
     * @tc.name testFloat32ArrayReduceRightTwo028
     * @tc.desc Verify reduceRight(max) on [3,1,4,1,5] returns 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 4.0, 1.0, 5.0);
      const result = arr.reduceRight((p, c, i, a) => p > c ? p : c);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0290
     * @tc.name testFloat32ArrayReduceRightTwo029
     * @tc.desc Verify reduceRight(min) on [3,1,4,1,5] returns 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, 1.0, 4.0, 1.0, 5.0);
      const result = arr.reduceRight((p, c, i, a) => p < c ? p : c);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0300
     * @tc.name testFloat32ArrayReduceRightTwo030
     * @tc.desc Verify reduceRight(p*10+c) on [1,2,3] returns 321
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p * 10 + c);
      expect(result).assertEqual(321);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0310
     * @tc.name testFloat32ArrayReduceRightTwo031
     * @tc.desc Verify reduceRight(p+c) on [-1,-2,-3] returns -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0320
     * @tc.name testFloat32ArrayReduceRightTwo032
     * @tc.desc Verify reduceRight(p+c) on [5,-5,10,-10] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, -5.0, 10.0, -10.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0330
     * @tc.name testFloat32ArrayReduceRightTwo033
     * @tc.desc Verify reduceRight(p-c) on [100,10,1] returns -109
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 10.0, 1.0);
      const result = arr.reduceRight((p, c, i, a) => p - c);
      expect(result).assertEqual(-109);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0340
     * @tc.name testFloat32ArrayReduceRightTwo034
     * @tc.desc Verify reduceRight(p%c) on [10,20,30] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0);
      const result = arr.reduceRight((p, c, i, a) => p % c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0350
     * @tc.name testFloat32ArrayReduceRightTwo035
     * @tc.desc Verify reduceRight(p/c) on [2,3,4] matches manual division
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2.0, 3.0, 4.0);
      const expected = 0.6666666666666666;
      const result = arr.reduceRight((p, c, i, a) => p / c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0360
     * @tc.name testFloat32ArrayReduceRightTwo036
     * @tc.desc Verify reduceRight initial previousValue is last element 3 on [1,2,3]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let capturedPrev = 0;
      let firstCall = true;
      arr.reduceRight((p, c, i, a) => {
        if (firstCall) {
          capturedPrev = p.toInt();
          firstCall = false;
        }
        return p + c;
      });
      expect(capturedPrev).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0370
     * @tc.name testFloat32ArrayReduceRightTwo037
     * @tc.desc Verify reduceRight with Float32 MAX_VALUE and 1.0 returns expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 1.0);
      const expected = 3.4028234663852886e+38;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0380
     * @tc.name testFloat32ArrayReduceRightTwo038
     * @tc.desc Verify reduceRight with Float32 MIN_VALUE and 1.0 returns expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1754943508222875e-38, 1.0);
      const expected = 1.0;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0390
     * @tc.name testFloat32ArrayReduceRightTwo039
     * @tc.desc Verify reduceRight with Float32 MIN_NORMAL and 1.0 returns expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.401298464324817e-45, 1.0);
      const expected = 1.0;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0400
     * @tc.name testFloat32ArrayReduceRightTwo040
     * @tc.desc Verify reduceRight with NaN in [1,NaN,3] returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.NaN, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0410
     * @tc.name testFloat32ArrayReduceRightTwo041
     * @tc.desc Verify reduceRight with Infinity in [1,Infinity,3] returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, Number.POSITIVE_INFINITY, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0420
     * @tc.name testFloat32ArrayReduceRightTwo042
     * @tc.desc Verify reduceRight with -Infinity in [1,-Infinity,3] returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, -Number.POSITIVE_INFINITY, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0430
     * @tc.name testFloat32ArrayReduceRightTwo043
     * @tc.desc Verify reduceRight(p+c) on [0,0,0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0440
     * @tc.name testFloat32ArrayReduceRightTwo044
     * @tc.desc Verify reduceRight on [-0] returns negative zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      const observedValue044 = 1 / result;
      expect(observedValue044).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0450
     * @tc.name testFloat32ArrayReduceRightTwo045
     * @tc.desc Verify reduceRight with negative Float32 MAX_VALUE and 1.0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-3.4028234663852886e+38, 1.0);
      const expected = -3.4028234663852886e+38;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0460
     * @tc.name testFloat32ArrayReduceRightTwo046
     * @tc.desc Verify reduceRight(p+c) on [0.1,0.2] equals expected float32 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2);
      const expected = 0.30000000447034836;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0470
     * @tc.name testFloat32ArrayReduceRightTwo047
     * @tc.desc Verify reduceRight(p+c) on [0.1,0.2,0.3] is not exactly 0.6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.1, 0.2, 0.3);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      const observedValue047 = result === 0.6;
      expect(observedValue047).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0480
     * @tc.name testFloat32ArrayReduceRightTwo048
     * @tc.desc Verify reduceRight(p+c) on [1.1,1.0000001] equals expected float32 sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.1, 1.0000001);
      const expected = 2.1000001430511475;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0490
     * @tc.name testFloat32ArrayReduceRightTwo049
     * @tc.desc Verify reduceRight on [16777216,1] returns 16777217 (2^24 precision)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777216.0, 1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(16777217);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0500
     * @tc.name testFloat32ArrayReduceRightTwo050
     * @tc.desc Verify reduceRight on [16777217,1] preserves float32 precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(16777217.0, 1.0);
      const expected = 16777217.0;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0510
     * @tc.name testFloat32ArrayReduceRightTwo051
     * @tc.desc Verify reduceRight overflows to Infinity with 1.0e40+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e40, 1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0520
     * @tc.name testFloat32ArrayReduceRightTwo052
     * @tc.desc Verify reduceRight overflows to -Infinity with -1.0e40+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0e40, 1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0530
     * @tc.name testFloat32ArrayReduceRightTwo053
     * @tc.desc Verify reduceRight with denormalized 1.0e-46 and 1.0 preserves precision
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e-46, 1.0);
      const expected = 1.0;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0540
     * @tc.name testFloat32ArrayReduceRightTwo054
     * @tc.desc Verify reduceRight(p+c) on [0,0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0550
     * @tc.name testFloat32ArrayReduceRightTwo055
     * @tc.desc Verify reduceRight(p+c) on [-1,-1,-1] returns -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -1.0, -1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0560
     * @tc.name testFloat32ArrayReduceRightTwo056
     * @tc.desc Verify reduceRight on [2147483647,1] returns 2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(2147483647.0, 1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0570
     * @tc.name testFloat32ArrayReduceRightTwo057
     * @tc.desc Verify reduceRight on [-2147483648,-1] returns -2147483649
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-2147483648.0, -1.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-2147483649);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0580
     * @tc.name testFloat32ArrayReduceRightTwo058
     * @tc.desc Verify reduceRight on [1.0e3,2.0e3] returns 3000
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0e3, 2.0e3);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(3000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0590
     * @tc.name testFloat32ArrayReduceRightTwo059
     * @tc.desc Verify reduceRight with hex 0xFF+0x01 returns 256
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0xFF, 0x01);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(256);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0600
     * @tc.name testFloat32ArrayReduceRightTwo060
     * @tc.desc Verify reduceRight with octal 0o17+0o1 returns 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0o17, 0o1);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0610
     * @tc.name testFloat32ArrayReduceRightTwo061
     * @tc.desc Verify reduceRight with binary 0b1010+0b1 returns 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0b1010, 0b1);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(11);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0620
     * @tc.name testFloat32ArrayReduceRightTwo062
     * @tc.desc Verify reduceRight(p+c) on [5,5,5] returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 5.0, 5.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0630
     * @tc.name testFloat32ArrayReduceRightTwo063
     * @tc.desc Verify reduceRight(p+c) on [0,0,0,0] returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0.0, 0.0, 0.0, 0.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0640
     * @tc.name testFloat32ArrayReduceRightTwo064
     * @tc.desc Verify reduceRight(p+c) on [3,-3,3] returns 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.0, -3.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0650
     * @tc.name testFloat32ArrayReduceRightTwo065
     * @tc.desc Verify reduceRight on 100-element array [0..99] returns 4950
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(100);
      for (let k = 0; k < 100; k++) {
        arr.$_set(k, k);
      }
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(4950);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0660
     * @tc.name testFloat32ArrayReduceRightTwo066
     * @tc.desc Verify reduceRight on single Float32 MAX_VALUE returns itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(arr.$_get(0));
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0670
     * @tc.name testFloat32ArrayReduceRightTwo067
     * @tc.desc Verify reduceRight(p+c) on two Float32 MAX_VALUEs matches expected sum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(3.4028234663852886e+38, 3.4028234663852886e+38);
      const expected = 6.805646932770577e+38;
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(expected);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0680
     * @tc.name testFloat32ArrayReduceRightTwo068
     * @tc.desc Verify reduceRight on [-0,0] returns positive zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0, 0.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      const observedValue068 = 1 / result;
      expect(observedValue068).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0690
     * @tc.name testFloat32ArrayReduceRightTwo069
     * @tc.desc Verify reduceRight(p+c) on [1,2,3] returns 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0700
     * @tc.name testFloat32ArrayReduceRightTwo070
     * @tc.desc Verify reduceRight on single-element [77] returns 77
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(77.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(77);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0710
     * @tc.name testFloat32ArrayReduceRightTwo071
     * @tc.desc Verify reduceRight matches manual loop accumulation result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let acc = arr.$_get(arr.length - 1);
      for (let k = arr.length - 2; k >= 0; k--) {
        acc = acc + arr.$_get(k);
      }
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(acc);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0720
     * @tc.name testFloat32ArrayReduceRightTwo072
     * @tc.desc Verify reduceRight with NaN as first element returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.NaN, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0730
     * @tc.name testFloat32ArrayReduceRightTwo073
     * @tc.desc Verify reduceRight with Infinity as first element returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(Number.POSITIVE_INFINITY, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0740
     * @tc.name testFloat32ArrayReduceRightTwo074
     * @tc.desc Verify reduceRight with -Infinity as first element returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-Number.POSITIVE_INFINITY, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0750
     * @tc.name testFloat32ArrayReduceRightTwo075
     * @tc.desc Verify reduceRight(p+c) on [100,200,300] returns 600
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(100.0, 200.0, 300.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0760
     * @tc.name testFloat32ArrayReduceRightTwo076
     * @tc.desc Verify reduceRight(p+c) on [-10,-20,-30] returns -60
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-10.0, -20.0, -30.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(-60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0770
     * @tc.name testFloat32ArrayReduceRightTwo077
     * @tc.desc Verify reduceRight(10+20)/4 on [10,20] equals 7.5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      const observedValue078 = result / 4;
      expect(observedValue078).assertEqual(7.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0780
     * @tc.name testFloat32ArrayReduceRightTwo078
     * @tc.desc Verify reduceRight(p*10+c) on [4,5,6] returns 654
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(4.0, 5.0, 6.0);
      const result = arr.reduceRight((p, c, i, a) => p * 10 + c);
      expect(result).assertEqual(654);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0790
     * @tc.name testFloat32ArrayReduceRightTwo079
     * @tc.desc Verify reduceRight result multiplied by 2 gives 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => p + c);
      const observedValue080 = result * 2;
      expect(observedValue080).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0800
     * @tc.name testFloat32ArrayReduceRightTwo080
     * @tc.desc Verify reduceRight on empty array throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.reduceRight((p, c, i, a) => p + c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0810
     * @tc.name testFloat32ArrayReduceRightTwo081
     * @tc.desc Verify reduceRight stops after first callback throw on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let callCount = 0;
      try {
        arr.reduceRight((p, c, i, a) => {
          callCount++;
          throw new Error('first');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0820
     * @tc.name testFloat32ArrayReduceRightTwo082
     * @tc.desc Verify reduceRight stops after second callback throw on [1,2,3,4,5]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let callCount = 0;
      try {
        arr.reduceRight((p, c, i, a) => {
          callCount++;
          if (callCount === 2) {
            throw new Error('middle');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0830
     * @tc.name testFloat32ArrayReduceRightTwo083
     * @tc.desc Verify reduceRight stops after third callback throw on [1,2,3,4]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let callCount = 0;
      try {
        arr.reduceRight((p, c, i, a) => {
          callCount++;
          if (callCount === 3) {
            throw new Error('last');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(callCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0840
     * @tc.name testFloat32ArrayReduceRightTwo084
     * @tc.desc Verify reduceRight callback error message is preserved correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          throw new Error('custom-msg-xyz');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
        expect(e.message).assertEqual('custom-msg-xyz');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0850
     * @tc.name testFloat32ArrayReduceRightTwo085
     * @tc.desc Verify reduceRight callback throws Error with string message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          throw new Error('string-err');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0860
     * @tc.name testFloat32ArrayReduceRightTwo086
     * @tc.desc Verify reduceRight callback throws Error with numeric message
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          throw new Error('123');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0870
     * @tc.name testFloat32ArrayReduceRightTwo087
     * @tc.desc Verify reduceRight callback throw on 2-element array propagates Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          throw new Error('only');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0880
     * @tc.name testFloat32ArrayReduceRightTwo088
     * @tc.desc Verify reduceRight callback throws RangeError at index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          if (i === 1) {
            throw new RangeError('idx1');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0890
     * @tc.name testFloat32ArrayReduceRightTwo089
     * @tc.desc Verify reduceRight callback throws when accumulator exceeds threshold
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const threshold = 2;
      try {
        arr.reduceRight((p, c, i, a) => {
          if (p > threshold) {
            throw new Error('over');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0900
     * @tc.name testFloat32ArrayReduceRightTwo090
     * @tc.desc Verify reduceRight on empty array length 0 throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      try {
        arr.reduceRight((p, c, i, a) => p * c);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0910
     * @tc.name testFloat32ArrayReduceRightTwo091
     * @tc.desc Verify nested reduceRight on empty inner array throws TypeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Float32Array.of(1.0, 2.0, 3.0);
      const inner = new Float32Array(0);
      try {
        outer.reduceRight((p, c, i, a) => {
          return inner.reduceRight((p2, c2, i2, a2) => p2 + c2);
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0920
     * @tc.name testFloat32ArrayReduceRightTwo092
     * @tc.desc Verify reduceRight callback throws RangeError when previousValue exceeds 50
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 100.0);
      try {
        arr.reduceRight((p, c, i, a) => {
          if (p > 50) {
            throw new RangeError('too-big');
          }
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0930
     * @tc.name testFloat32ArrayReduceRightTwo093
     * @tc.desc Verify reduceRight invokes callback length-1 times for 4-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      let count = 0;
      arr.reduceRight((p, c, i, a) => {
        count++;
        return p + c;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0940
     * @tc.name testFloat32ArrayReduceRightTwo094
     * @tc.desc Verify reduceRight invokes callback 0 times for single-element [42]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(42.0);
      let count = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        count++;
        return p + c;
      });
      expect(count).assertEqual(0);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0950
     * @tc.name testFloat32ArrayReduceRightTwo095
     * @tc.desc Verify reduceRight invokes callback 1 time for 2-element [5,10]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0);
      let count = 0;
      arr.reduceRight((p, c, i, a) => {
        count++;
        return p + c;
      });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0960
     * @tc.name testFloat32ArrayReduceRightTwo096
     * @tc.desc Verify reduceRight invokes callback 4 times for 5-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let count = 0;
      arr.reduceRight((p, c, i, a) => {
        count++;
        return p + c;
      });
      expect(count).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0970
     * @tc.name testFloat32ArrayReduceRightTwo097
     * @tc.desc Verify reduceRight(p+c*factor) on [1,2,3] with factor=10 returns 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const factor = 10;
      const result = arr.reduceRight((p, c, i, a) => p + c * factor);
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0980
     * @tc.name testFloat32ArrayReduceRightTwo098
     * @tc.desc Verify reduceRight external accumulator variable tracks result correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      let externalAcc = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        externalAcc = (p + c).toInt();
        return externalAcc;
      });
      expect(externalAcc).assertEqual(10);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_0990
     * @tc.name testFloat32ArrayReduceRightTwo099
     * @tc.desc Verify reduceRight processes indices in reverse order 2,1,0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(10.0, 20.0, 30.0, 40.0);
      const order: number[] = [];
      arr.reduceRight((p, c, i, a) => {
        order.push(i);
        return p + c;
      });
      expect(order[0]).assertEqual(2);
      expect(order[1]).assertEqual(1);
      expect(order[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1000
     * @tc.name testFloat32ArrayReduceRightTwo100
     * @tc.desc Verify reduceRight callback accumulates currentValues while reducing
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let counter = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        counter += c;
        return p + c;
      });
      expect(counter).assertEqual(3);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1010
     * @tc.name testFloat32ArrayReduceRightTwo101
     * @tc.desc Verify reduceRight callback modifies array via $_set during iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => {
        if (i > 0) {
          a.$_set(i - 1, 100);
        }
        return p + c;
      });
      expect(result).assertEqual(105);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1020
     * @tc.name testFloat32ArrayReduceRightTwo102
     * @tc.desc Verify chained reduceRight on combined arrays returns 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr1 = Float32Array.of(1.0, 2.0, 3.0);
      const arr2 = Float32Array.of(4.0, 5.0);
      const sum1 = arr1.reduceRight((p, c, i, a) => p + c);
      const combined = Float32Array.of(sum1, arr2.$_get(0), arr2.$_get(1));
      const result = combined.reduceRight((p, c, i, a) => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1030
     * @tc.name testFloat32ArrayReduceRightTwo103
     * @tc.desc Verify nested reduceRight on inner array from callback returns 33
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Float32Array.of(1.0, 2.0);
      const inner = Float32Array.of(10.0, 20.0);
      const result = outer.reduceRight((p, c, i, a) => {
        const innerSum = inner.reduceRight((p2, c2, i2, a2) => p2 + c2);
        return p + c + innerSum;
      });
      expect(result).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1040
     * @tc.name testFloat32ArrayReduceRightTwo104
     * @tc.desc Verify reduceRight(p+c+a.length) on [1,2,3,4] returns 22
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0);
      const result = arr.reduceRight((p, c, i, a) => p + c + a.length);
      expect(result).assertEqual(22);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1050
     * @tc.name testFloat32ArrayReduceRightTwo105
     * @tc.desc Verify reduceRight tracks max difference between adjacent elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 1.0, 9.0, 2.0);
      let maxDiff = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        const diff = p - c > 0 ? p - c : c - p;
        if (diff > maxDiff) {
          maxDiff = diff.toInt();
        }
        return p + c;
      });
      expect(maxDiff).assertEqual(10);
      expect(result).assertEqual(17);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1060
     * @tc.name testFloat32ArrayReduceRightTwo106
     * @tc.desc Verify reduceRight sums current values excluding the initial element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0, 4.0, 5.0);
      let currentSum = 0;
      const result = arr.reduceRight((p, c, i, a) => {
        currentSum += c;
        return p + c;
      });
      expect(currentSum).assertEqual(10);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1070
     * @tc.name testFloat32ArrayReduceRightTwo107
     * @tc.desc Verify reduceRight callback executes for all elements down to index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let finished = false;
      arr.reduceRight((p, c, i, a) => {
        if (i === 0) {
          finished = true;
        }
        return p + c;
      });
      expect(finished).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1080
     * @tc.name testFloat32ArrayReduceRightTwo108
     * @tc.desc Verify reduceRight array.reverse inside callback modifies iteration
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((p, c, i, a) => {
        if (i === 1) {
          a.reverse();
        }
        return p + c;
      });
      const element113 = arr.$_get(0);
      expect(element113).assertEqual(3);
      expect(result).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1090
     * @tc.name testFloat32ArrayReduceRightTwo109
     * @tc.desc Verify reduceRight<int> sums integer values to int accumulator
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo109', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1100
     * @tc.name testFloat32ArrayReduceRightTwo110
     * @tc.desc Verify reduceRight<int> truncates float values when accumulating (1.5+2.7+3.2 -> 1+2+3=6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo110', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.5, 2.7, 3.2);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1110
     * @tc.name testFloat32ArrayReduceRightTwo111
     * @tc.desc Verify reduceRight<int> counts elements by ignoring values and incrementing counter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo111', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(5.0, 10.0, 15.0, 20.0);
      const result = arr.reduceRight<int>((acc: int, v: number): int => acc + 1, 0);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1120
     * @tc.name testFloat32ArrayReduceRightTwo112
     * @tc.desc Verify reduceRight<int> on empty array returns initial value unchanged
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo112', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), 42);
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1130
     * @tc.name testFloat32ArrayReduceRightTwo113
     * @tc.desc Verify reduceRight with initialValue NaN on [1,2,3] returns NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo113', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((acc, v) => acc + v, Number.NaN);
      expect(result).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1140
     * @tc.name testFloat32ArrayReduceRightTwo114
     * @tc.desc Verify reduceRight with initialValue Infinity on [1,2,3] returns Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo114', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((acc, v) => acc + v, Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1150
     * @tc.name testFloat32ArrayReduceRightTwo115
     * @tc.desc Verify reduceRight with initialValue -Infinity on [1,2,3] returns -Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo115', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      const result = arr.reduceRight((acc, v) => acc + v, -Number.POSITIVE_INFINITY);
      expect(result).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1160
     * @tc.name testFloat32ArrayReduceRightTwo116
     * @tc.desc Verify reduceRight with initialValue -0.0 on empty array preserves -0 sign
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo116', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      const result = arr.reduceRight((acc, v) => acc + v, -0.0);
      const inv = 1.0 / result;
      expect(inv).assertEqual(-Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1170
     * @tc.name testFloat32ArrayReduceRightTwo117
     * @tc.desc Verify reduceRight<int> with negative values [-1,-2,-3] sums to -6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo117', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1180
     * @tc.name testFloat32ArrayReduceRightTwo118
     * @tc.desc Verify reduceRight<int> with negative fractional values truncates each step toward zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo118', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.5, -2.7, -3.2);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), 0);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1190
     * @tc.name testFloat32ArrayReduceRightTwo119
     * @tc.desc Verify reduceRight<int> with negative initialValue -10 and negative values sums to -16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo119', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-1.0, -2.0, -3.0);
      const result = arr.reduceRight<int>((acc: int, v: number): int => (acc + v).toInt(), -10);
      expect(result).assertEqual(-16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_REDUCE_RIGHT_TWO_1200
     * @tc.name testFloat32ArrayReduceRightTwo120
     * @tc.desc Verify reduceRight on subarray only iterates within subarray range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayReduceRightTwo120', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const parent = Float32Array.of(10.0, 20.0, 30.0, 40.0, 50.0);
      const view = parent.subarray(1, 4);
      const result = view.reduceRight<number>((acc: number, v: number): number => acc + v, 0);
      expect(result).assertEqual(90.0);
    });

  });
}
