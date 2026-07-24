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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function Float32ArrayForEach2Test(): void {
  describe('Float32ArrayForEach2Test', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0100
     * @tc.name testFloat32ArrayForEachTWO001
     * @tc.desc Verify forEach on empty array invokes callback zero times and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      let count: int = 0;
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        count++;
      });
      expect(count).assertEqual(0);
      expect(typeof r).assertEqual('undefined');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0200
     * @tc.name testFloat32ArrayForEachTWO002
     * @tc.desc Verify forEach iterates all elements in order and returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let count: int = 0;
      let last: number = 0.0;
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        last = v;
        count++;
      });
      expect(count).assertEqual(3);
      expect(last).assertEqual(-1.0);
      expect(typeof r).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0300
     * @tc.name testFloat32ArrayForEachTWO003
     * @tc.desc Verify forEach returns undefined (with Infinity/-Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity, -Infinity]);
      let count: int = 0;
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(a.$_get(i));
        count = count + 1;
      });
      expect(r).assertUndefined();
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0400
     * @tc.name testFloat32ArrayForEachTWO004
     * @tc.desc Verify forEach return value assertEqual undefined (with -0 element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(-0.0);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(i).assertEqual(0);
        expect(1 / v).assertEqual(-Infinity);
      });
      expect(r).assertEqual(undefined);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0500
     * @tc.name testFloat32ArrayForEachTWO005
     * @tc.desc Verify forEach returns undefined (with Float32.MAX)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([3.4028234663852886e+38]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(3.4028234663852886e+38);
        expect(a).assertEqual(arr);
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0600
     * @tc.name testFloat32ArrayForEachTWO006
     * @tc.desc Verify forEach returns undefined (with the minimum denormalized number)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 1);
      arr.$_set(0, 1.401298464324817e-45);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(1.401298464324817e-45);
        expect(a.byteOffset).assertEqual(4);
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0700
     * @tc.name testFloat32ArrayForEachTWO007
     * @tc.desc Verify forEach returns undefined (with 0.1/0.2 typical precision-loss values)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.from([0.1, 0.2]);
      const expected = Float32Array.from([0.1, 0.2]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(v).assertEqual(expected.$_get(i));
        expect(a.$_get(i)).assertEqual(v);
      });
      expect(r).assertUndefined();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0800
     * @tc.name testFloat32ArrayForEachTWO008
     * @tc.desc Verify forEach returns undefined instead of this, and the original array is still a Float32Array instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(r).assertUndefined();
      expect(arr instanceof Float32Array).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_0900
     * @tc.name testFloat32ArrayForEachTWO009
     * @tc.desc Verify forEach does not return this, a view array returns undefined and byteOffset is preserved
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(r).assertUndefined();
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1000
     * @tc.name testFloat32ArrayForEachTWO010
     * @tc.desc Verify forEach returns undefined, and the original array length is still 1 (not chainable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([9.0]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(r).assertUndefined();
      expect(arr.length).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1100
     * @tc.name testFloat32ArrayForEachTWO011
     * @tc.desc Verify forEach returns undefined, and the original array byteLength is still 8 (not chainable)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(r).assertUndefined();
      expect(arr.byteLength).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1200
     * @tc.name testFloat32ArrayForEachTWO012
     * @tc.desc Verify forEach returns undefined, and is still void after the callback reads a.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.length).assertEqual(3);
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1300
     * @tc.name testFloat32ArrayForEachTWO013
     * @tc.desc Verify forEach returns undefined, and is still void after reading the element sign in the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      const r = arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(1 / v).assertEqual(-Infinity);
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1400
     * @tc.name testFloat32ArrayForEachTWO014
     * @tc.desc Verify the callback's third parameter array is a Float32Array instance (single element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a instanceof Float32Array).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1500
     * @tc.name testFloat32ArrayForEachTWO015
     * @tc.desc Verify the callback's third parameter array is a Float32Array instance (view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const arr = new Float32Array(buf, 0, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a instanceof Float32Array).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1600
     * @tc.name testFloat32ArrayForEachTWO016
     * @tc.desc Verify the callback's third parameter array typeof is 'object'
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(typeof a).assertEqual('object');
        expect(a.length).assertEqual(2);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1700
     * @tc.name testFloat32ArrayForEachTWO017
     * @tc.desc Verify the callback array argument is the same reference as the original array (three-element array)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1800
     * @tc.name testFloat32ArrayForEachTWO018
     * @tc.desc Verify the callback array argument is the same reference as the original view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const arr = new Float32Array(buf, 4, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_1900
     * @tc.name testFloat32ArrayForEachTWO019
     * @tc.desc Verify the callback array argument is the same reference as the original array (with NaN element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a).assertEqual(arr);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2000
     * @tc.name testFloat32ArrayForEachTWO020
     * @tc.desc Verify the callback array argument is the same reference on each iteration and the number of traversals equals length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      let count = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a).assertEqual(arr);
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2100
     * @tc.name testFloat32ArrayForEachTWO021
     * @tc.desc Verify callback array.length equals 3 (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.length).assertEqual(3);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2200
     * @tc.name testFloat32ArrayForEachTWO022
     * @tc.desc Verify callback array.length equals the original view length (offset view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.length).assertEqual(arr.length);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2300
     * @tc.name testFloat32ArrayForEachTWO023
     * @tc.desc Verify callback array.length equals 2 (view with byteOffset 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 8, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.length).assertEqual(2);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2400
     * @tc.name testFloat32ArrayForEachTWO024
     * @tc.desc Verify callback array.byteLength equals 12 (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteLength).assertEqual(12);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2500
     * @tc.name testFloat32ArrayForEachTWO025
     * @tc.desc Verify callback array.byteLength equals the original view byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteLength).assertEqual(arr.byteLength);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2600
     * @tc.name testFloat32ArrayForEachTWO026
     * @tc.desc Verify callback array.byteLength equals array.length * 4 (dynamic relationship)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteLength).assertEqual(a.length * 4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2700
     * @tc.name testFloat32ArrayForEachTWO027
     * @tc.desc Verify callback array.byteOffset equals 0 (default construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteOffset).assertEqual(0);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2800
     * @tc.name testFloat32ArrayForEachTWO028
     * @tc.desc Verify callback array.byteOffset equals 4 (offset-4 view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteOffset).assertEqual(4);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_2900
     * @tc.name testFloat32ArrayForEachTWO029
     * @tc.desc Verify callback array.byteOffset equals 8 (offset-8 view)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteOffset).assertEqual(8);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3000
     * @tc.name testFloat32ArrayForEachTWO030
     * @tc.desc Verify callback array.byteOffset equals the original view byteOffset (dynamic)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float32Array(buf, 12, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteOffset).assertEqual(arr.byteOffset);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3100
     * @tc.name testFloat32ArrayForEachTWO031
     * @tc.desc Verify callback array.buffer is the same reference as the original array buffer (default construction)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer).assertEqual(arr.buffer);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3200
     * @tc.name testFloat32ArrayForEachTWO032
     * @tc.desc Verify callback array.buffer is the same reference as the original view buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer).assertEqual(arr.buffer);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3300
     * @tc.name testFloat32ArrayForEachTWO033
     * @tc.desc Verify callback array.buffer is the same reference as the ArrayBuffer passed to the constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer).assertEqual(buf);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3400
     * @tc.name testFloat32ArrayForEachTWO034
     * @tc.desc Verify callback array.buffer.byteLength equals the original array buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer.byteLength).assertEqual(arr.buffer.byteLength);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3500
     * @tc.name testFloat32ArrayForEachTWO035
     * @tc.desc Verify callback array.buffer is an ArrayBuffer instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer instanceof ArrayBuffer).assertTrue();
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3600
     * @tc.name testFloat32ArrayForEachTWO036
     * @tc.desc Verify a subarray view callback array.buffer is the same reference as the base buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0]);
      const arr = base.subarray(1, 3);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer).assertEqual(base.buffer);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3700
     * @tc.name testFloat32ArrayForEachTWO037
     * @tc.desc Verify for two views of the same buffer, forEach on one returns callback array.buffer as the same reference as the other view's buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Float32Array(buf, 0, 2);
      const v2 = new Float32Array(buf, 8, 2);
      v1.forEach((val: number, i: int, a: Float32Array): void => {
        expect(a.buffer).assertEqual(v2.buffer);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3800
     * @tc.name testFloat32ArrayForEachTWO038
     * @tc.desc Verify view callback array.byteLength differs from array.buffer.byteLength (the view is a slice)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(32);
      const arr = new Float32Array(buf, 8, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteLength).assertEqual(8);
        expect(a.buffer.byteLength).assertEqual(32);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_3900
     * @tc.name testFloat32ArrayForEachTWO039
     * @tc.desc Verify a subarray view callback array.byteOffset is consistent with the original subarray byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = new Float32Array([1.0, 2.0, 3.0, 4.0, 5.0, 6.0]);
      const arr = base.subarray(2, 5);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.byteOffset).assertEqual(arr.byteOffset);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4000
     * @tc.name testFloat32ArrayForEachTWO040
     * @tc.desc Verify offset view callback array.buffer.byteLength equals the underlying buffer capacity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(20);
      const arr = new Float32Array(buf, 4, 3);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.buffer.byteLength).assertEqual(20);
      });
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4100
     * @tc.name testFloat32ArrayForEachTWO041
     * @tc.desc Verify the original array length is unchanged after forEach (three elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4200
     * @tc.name testFloat32ArrayForEachTWO042
     * @tc.desc Verify the original view length is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 0, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4300
     * @tc.name testFloat32ArrayForEachTWO043
     * @tc.desc Verify an empty array's length is still 0 after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4400
     * @tc.name testFloat32ArrayForEachTWO044
     * @tc.desc Verify the original array element 1.0 is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4500
     * @tc.name testFloat32ArrayForEachTWO045
     * @tc.desc Verify the original array element NaN is unchanged after forEach (assertNaN)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([NaN]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertNaN();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4600
     * @tc.name testFloat32ArrayForEachTWO046
     * @tc.desc Verify the original array element Infinity is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([Infinity]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4700
     * @tc.name testFloat32ArrayForEachTWO047
     * @tc.desc Verify the original array element -Infinity is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-Infinity]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4800
     * @tc.name testFloat32ArrayForEachTWO048
     * @tc.desc Verify the original array element +0 is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.0]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_4900
     * @tc.name testFloat32ArrayForEachTWO049
     * @tc.desc Verify the original array element -0 keeps its sign after forEach (1/x is -Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-0.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(1 / arr.$_get(0)).assertEqual(-Infinity);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5000
     * @tc.name testFloat32ArrayForEachTWO050
     * @tc.desc Verify the original array element Float32.MAX is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.4028234663852886e+38]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5100
     * @tc.name testFloat32ArrayForEachTWO051
     * @tc.desc Verify the original array element -Float32.MAX is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([-3.4028234663852886e+38]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5200
     * @tc.name testFloat32ArrayForEachTWO052
     * @tc.desc Verify the original array element minimum normalized number is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.1754943508222875e-38]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5300
     * @tc.name testFloat32ArrayForEachTWO053
     * @tc.desc Verify the original array element minimum denormalized number is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.401298464324817e-45]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5400
     * @tc.name testFloat32ArrayForEachTWO054
     * @tc.desc Verify the original array element 0.1 is unchanged after forEach (precision bit pattern preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.1]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5500
     * @tc.name testFloat32ArrayForEachTWO055
     * @tc.desc Verify the original array element 0.2 is unchanged after forEach (precision bit pattern preserved)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([0.2]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5600
     * @tc.name testFloat32ArrayForEachTWO056
     * @tc.desc Verify the original array element 2^24=16777216 is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([16777216]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5700
     * @tc.name testFloat32ArrayForEachTWO057
     * @tc.desc Verify the original array element 1.0e40 is unchanged after forEach (overflow stored as Infinity)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e40]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5800
     * @tc.name testFloat32ArrayForEachTWO058
     * @tc.desc Verify the original array element 1.0e-46 is unchanged after forEach (underflow stored as +0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0e-46]);
      const before = arr.$_get(0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_5900
     * @tc.name testFloat32ArrayForEachTWO059
     * @tc.desc Verify each element of a multi-element array is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const b0 = arr.$_get(0);
      const b1 = arr.$_get(1);
      const b2 = arr.$_get(2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(b0);
      expect(arr.$_get(1)).assertEqual(b1);
      expect(arr.$_get(2)).assertEqual(b2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6000
     * @tc.name testFloat32ArrayForEachTWO060
     * @tc.desc Verify the original array byteLength is unchanged after forEach (single element 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.byteLength).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6100
     * @tc.name testFloat32ArrayForEachTWO061
     * @tc.desc Verify the original array byteLength is unchanged after forEach (three elements 12)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6200
     * @tc.name testFloat32ArrayForEachTWO062
     * @tc.desc Verify the original array byteOffset is unchanged after forEach (default 0)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6300
     * @tc.name testFloat32ArrayForEachTWO063
     * @tc.desc Verify the original view byteOffset is unchanged after forEach (offset 8)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(24);
      const arr = new Float32Array(buf, 8, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6400
     * @tc.name testFloat32ArrayForEachTWO064
     * @tc.desc Verify the original array buffer reference is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0]);
      const bufBefore = arr.buffer;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.buffer).assertEqual(bufBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6500
     * @tc.name testFloat32ArrayForEachTWO065
     * @tc.desc Verify the original array buffer.byteLength is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(0x10, 0b1010, -1.0);
      const before = arr.buffer.byteLength;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.buffer.byteLength).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6600
     * @tc.name testFloat32ArrayForEachTWO066
     * @tc.desc Verify the view length is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6700
     * @tc.name testFloat32ArrayForEachTWO067
     * @tc.desc Verify the view byteOffset is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6800
     * @tc.name testFloat32ArrayForEachTWO068
     * @tc.desc Verify the view buffer reference is unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      const before = arr.buffer;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
      });
      expect(arr.buffer).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_6900
     * @tc.name testFloat32ArrayForEachTWO069
     * @tc.desc Verify forEach iterates read-only on one view, and the elements of another view sharing the same buffer are not affected
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const v1 = new Float32Array(buf, 0, 2);
      const v2 = new Float32Array(buf, 8, 2);
      v2.$_set(0, 9.0);
      v2.$_set(1, 10.0);
      v1.forEach((val: number, i: int, a: Float32Array): void => {
      });
      expect(v2.$_get(0)).assertEqual(9.0);
      expect(v2.$_get(1)).assertEqual(10.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7000
     * @tc.name testFloat32ArrayForEachTWO070
     * @tc.desc Verify the view's own elements are unchanged after forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 3);
      arr.$_set(0, 1.5);
      arr.$_set(1, 2.5);
      arr.$_set(2, 3.5);
      arr.forEach((val: number, i: int, a: Float32Array): void => {
      });
      expect(arr.$_get(0)).assertEqual(1.5);
      expect(arr.$_get(1)).assertEqual(2.5);
      expect(arr.$_get(2)).assertEqual(3.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7100
     * @tc.name testFloat32ArrayForEachTWO071
     * @tc.desc Verify the callback array argument index 0 has the same value as the original array index 0 (single element)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([7.5]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a[0]).assertEqual(arr.$_get(0));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7200
     * @tc.name testFloat32ArrayForEachTWO072
     * @tc.desc Verify the callback array argument $_get(i) has the same value as the current value (multiple elements)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([10.0, 20.0, 30.0]);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a.$_get(i)).assertEqual(v);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7300
     * @tc.name testFloat32ArrayForEachTWO073
     * @tc.desc Verify the callback array argument index i has the same value as the original view index i
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const arr = new Float32Array(buf, 4, 2);
      arr.$_set(0, 4.25);
      arr.$_set(1, 8.5);
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        expect(a[i]).assertEqual(arr.$_get(i));
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7400
     * @tc.name testFloat32ArrayForEachTWO074
     * @tc.desc Verify empty array forEach does not call the callback
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array(0);
      let callCount: int = 0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        callCount++;
      });
      const expectCount: int = 0;
      expect(callCount).assertEqual(expectCount);
      expect(arr.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7500
     * @tc.name testFloat32ArrayForEachTWO075
     * @tc.desc Verify forEach callback observes a previous callback update to a later element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([1.0, 2.0, 3.0]);
      const changedValue: number = 20.0;
      let observedValue: number = 0.0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          a.$_set(1, changedValue);
        }
        if (i === 1) {
          observedValue = v;
        }
      });
      expect(observedValue).assertEqual(changedValue);
      expect(arr.$_get(1)).assertEqual(changedValue);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7600
     * @tc.name testFloat32ArrayForEachTWO076
     * @tc.desc Verify forEach on an offset view reports indexes relative to the view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(20);
      const view = new Float32Array(buf, 8, 3);
      let indexTotal: int = 0;
      view.forEach((v: number, i: int, a: Float32Array): void => {
        indexTotal = indexTotal + i;
      });
      const expectTotal: int = 3;
      expect(indexTotal).assertEqual(expectTotal);
      expect(view.byteOffset).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7700
     * @tc.name testFloat32ArrayForEachTWO077
     * @tc.desc Verify forEach can update the current element through the callback array argument
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([3.0, 6.0]);
      const replacementValue: number = 9.0;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        if (i === 0) {
          a.$_set(i, replacementValue);
        }
      });
      expect(arr.$_get(0)).assertEqual(replacementValue);
      expect(arr.$_get(1)).assertEqual(6.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7800
     * @tc.name testFloat32ArrayForEachTWO078
     * @tc.desc Verify forEach callback array argument is the same object as the receiver
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Float32Array([2.0]);
      let sameArray: boolean = false;
      arr.forEach((v: number, i: int, a: Float32Array): void => {
        sameArray = a === arr;
      });
      expect(sameArray).assertTrue();
      expect(arr.$_get(0)).assertEqual(2.0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT32ARRAY_FOR_EACHTWO_7900
     * @tc.name testFloat32ArrayForEachTWO079
     * @tc.desc Verify forEach observes updates made to later elements before visiting them
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testFloat32ArrayForEachTWO079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Float32Array.of(1.0, 2.0, 3.0);
      let seenSecond: number = 0.0;
      arr.forEach((value: number, index: int, array: Float32Array): void => {
        if (index === 0) {
          array.$_set(1, 9.0);
        }
        if (index === 1) {
          seenSecond = value;
        }
      });
      expect(seenSecond).assertEqual(9.0);
    });

  });
}
