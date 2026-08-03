'use static'
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
  TestType,
} from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint32ArrayForEachTest2(): void {
  describe('Uint32ArrayForEachTest2', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0100
     * @tc.name testUint32ArrayForEachPartTwo001
     * @tc.desc Verify forEach length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const before = values.length;
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values.length).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0200
     * @tc.name testUint32ArrayForEachPartTwo002
     * @tc.desc Verify forEach byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const values = new Uint32Array(buf, 4, 2);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values.byteOffset).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0300
     * @tc.name testUint32ArrayForEachPartTwo003
     * @tc.desc Verify forEach toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const before = values.toString();
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values.toString()).assertEqual(before);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0400
     * @tc.name testUint32ArrayForEachPartTwo004
     * @tc.desc Verify forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(99);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0500
     * @tc.name testUint32ArrayForEachPartTwo005
     * @tc.desc Verify uint32 , forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967295);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0600
     * @tc.name testUint32ArrayForEachPartTwo006
     * @tc.desc Verify 0 , forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0700
     * @tc.name testUint32ArrayForEachPartTwo007
     * @tc.desc Verify 4294967296 0 , forEach 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(4294967296);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0800
     * @tc.name testUint32ArrayForEachPartTwo008
     * @tc.desc Verify -1 4294967295 , forEach 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(-1);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(4294967295);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_0900
     * @tc.name testUint32ArrayForEachPartTwo009
     * @tc.desc Verify , forEach 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(0, 4294967295, 2147483648);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[2]).assertEqual(2147483648);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1000
     * @tc.name testUint32ArrayForEachPartTwo010
     * @tc.desc Verify forEach 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[1]).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1100
     * @tc.name testUint32ArrayForEachPartTwo011
     * @tc.desc Verify int32 2147483647 , forEach
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(2147483647);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[0]).assertEqual(2147483647);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1200
     * @tc.name testUint32ArrayForEachPartTwo012
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42, 43, 44);
      let captured: Uint32Array = Uint32Array.of(0);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        captured = a;
      });
      expect(captured[0]).assertEqual(values[0]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1300
     * @tc.name testUint32ArrayForEachPartTwo013
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(11, 22, 33);
      let captured: Uint32Array = Uint32Array.of(0);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        captured = a;
      });
      expect(captured[2]).assertEqual(values[2]);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1400
     * @tc.name testUint32ArrayForEachPartTwo014
     * @tc.desc Verify array 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      let captured: Uint32Array = Uint32Array.of(0);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        captured = a;
      });
      expect(captured[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1500
     * @tc.name testUint32ArrayForEachPartTwo015
     * @tc.desc Verify array , 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = v * 2;
      });
      expect(values[1]).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1600
     * @tc.name testUint32ArrayForEachPartTwo016
     * @tc.desc Verify , array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      let seen: number = 0;
      values.forEach((v: number, i: int, a: Uint32Array) => {
        if (i === 0) {
          values[1] = 99;
        }
        if (i === 1) {
          seen = a[1];
        }
      });
      expect(seen).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1700
     * @tc.name testUint32ArrayForEachPartTwo017
     * @tc.desc Verify array ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        a[0] = 555;
      });
      expect(values[0]).assertEqual(555);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1800
     * @tc.name testUint32ArrayForEachPartTwo018
     * @tc.desc Verify array , length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 0;
      });
      expect(values.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_1900
     * @tc.name testUint32ArrayForEachPartTwo019
     * @tc.desc Verify subarray forEach , 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const view = base.subarray(1, 3);
      view.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 0;
      });
      expect(base[1]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2000
     * @tc.name testUint32ArrayForEachPartTwo020
     * @tc.desc Verify subarray forEach 999, 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(10, 20, 30, 40);
      const view = base.subarray(1, 3);
      view.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 999;
      });
      expect(base[2]).assertEqual(999);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2100
     * @tc.name testUint32ArrayForEachPartTwo021
     * @tc.desc Verify array v+10,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = v + 10;
      });
      expect(values[2]).assertEqual(13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2200
     * @tc.name testUint32ArrayForEachPartTwo022
     * @tc.desc Verify buffer, v1 forEach , 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const firstHalf = base.subarray(0, 2);
      firstHalf.forEach((val: number, idx: int, a: Uint32Array) => {
        a[idx] = 100;
      });
      expect(base[0]).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2300
     * @tc.name testUint32ArrayForEachPartTwo023
     * @tc.desc Verify v1 forEach , v2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(5, 6, 7, 8);
      const v1 = base.subarray(0, 2);
      const v2 = base.subarray(2, 4);
      v1.forEach((val: number, idx: int, a: Uint32Array) => {
        a[idx] = 0;
      });
      expect(v2[0]).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2400
     * @tc.name testUint32ArrayForEachPartTwo024
     * @tc.desc Verify uint32 , buffer.byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      values.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 4294967295;
      });
      expect(values.buffer.byteLength).assertEqual(12);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2500
     * @tc.name testUint32ArrayForEachPartTwo025
     * @tc.desc Verify slice forEach , ( buffer)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const copy = base.slice(0, 4);
      copy.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 0;
      });
      expect(base[0]).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2600
     * @tc.name testUint32ArrayForEachPartTwo026
     * @tc.desc Verify subarray(2,4) forEach , 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const view = base.subarray(2, 4);
      view.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 0;
      });
      expect(base[3]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2700
     * @tc.name testUint32ArrayForEachPartTwo027
     * @tc.desc Verify buffer subarray forEach, array buffer.byteLength 16
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const base = new Uint32Array(buf);
      const view = base.subarray(2, 4);
      let captured: Uint32Array = Uint32Array.of(0);
      view.forEach((v: number, i: int, a: Uint32Array) => {
        captured = a;
      });
      expect(captured.buffer.byteLength).assertEqual(16);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2800
     * @tc.name testUint32ArrayForEachPartTwo028
     * @tc.desc Verify forEach( forEach), forEach undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const r = values.forEach((v: number, i: int, a: Uint32Array) => {
        values.forEach((v2: number, i2: int, a2: Uint32Array) => {});
      });
      expect(r).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_2900
     * @tc.name testUint32ArrayForEachPartTwo029
     * @tc.desc Verify forEach does not mutate element at index 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(5, 6, 7, 8);
      values.forEach((v: number, i: int, a: Uint32Array) => {});
      expect(values[3]).assertEqual(8);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FOREACH_PARTTWO_3000
     * @tc.name testUint32ArrayForEachPartTwo030
     * @tc.desc Verify slice(1,3) forEach , length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayForEachPartTwo030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const copy = base.slice(1, 3);
      copy.forEach((v: number, i: int, a: Uint32Array) => {
        a[i] = 0;
      });
      expect(copy.length).assertEqual(2);
    });

  });
}
