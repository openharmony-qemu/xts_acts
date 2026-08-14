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
import Utils from './../Util.test';

class AL001 implements ArrayLike<number> {
  length: int = 0;
  private data: number[] = [];

  constructor(length: int, vals: number[]) {
    this.length = length;
    for (let i: int = 0; i < vals.length; i++) {
      this.data.push(vals[i]);
    }
  }

  $_set(i: int, v: number): void {
    this.data[i] = v;
  }

  $_get(i: int): number {
    if (i < 0 || i >= this.data.length) {
      return 0;
    }
    return this.data[i];
  }
}

export default function int8ArrayFromPart05Test(): void {
  describe('Int8ArrayFromPart05Test', (): void => {
    beforeAll((): void => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach((): void => {});

    afterAll(async (): Promise<void> => {
      await Utils.releaseAfterEachTest();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0100
     * @tc.name int8ArrayFromPart05Test001
     * @tc.desc Verify Int8Array.from() with empty array returns empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r: Int8Array = Int8Array.from(new Array<number>());
      expect(r.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0200
     * @tc.name int8ArrayFromPart05Test002
     * @tc.desc Verify Int8Array.from(new AL001(0, [])) returns length 0 and byteLength 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(0, []));
      expect(r.length).assertEqual(0);
      expect(r.byteLength).assertEqual(0);
      let r1: int = r.buffer.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0300
     * @tc.name int8ArrayFromPart05Test003
     * @tc.desc Verify Int8Array.from(new AL001(-1, []))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(-1, []));
      expect(r.length).assertEqual(0);
      let r1: int = r.byteLength;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
      let r2: int = r.buffer.byteLength;
      let e2: int = 0;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0400
     * @tc.name int8ArrayFromPart05Test004
     * @tc.desc Verify Int8Array.from(new AL001(1, [50]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [50]));
      let r1: int = r.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0500
     * @tc.name int8ArrayFromPart05Test005
     * @tc.desc Verify Int8Array.from(new AL001(2, [10, 20]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [10, 20]));
      let r1: int = r.length;
      let e1: int = 2;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(0);
      let e2: int = 10;
      expect(r2).assertEqual(e2);
      let r3: number = r.$_get(1);
      let e3: int = 20;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0600
     * @tc.name int8ArrayFromPart05Test006
     * @tc.desc Verify Int8Array.from(new AL001(128, vals))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const vals: number[] = [];
      for (let i: number = 0; i < 128; i++) {
        vals.push((i % 64) - 32);
      }
      const r: Int8Array = Int8Array.from(new AL001(128, vals));
      let r1: int = r.length;
      let e1: int = 128;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(0);
      let e2: int = -32;
      expect(r2).assertEqual(e2);
      let r3: number = r.$_get(127);
      let e3: int = 31;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0700
     * @tc.name int8ArrayFromPart05Test007
     * @tc.desc Verify Int8Array.from(new AL001(0, [1, 2, 3]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(0, [1, 2, 3]));
      let r1: int = r.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0800
     * @tc.name int8ArrayFromPart05Test008
     * @tc.desc Verify Int8Array.from(new AL001(1, [7]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [7]));
      let r1: int = r.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = r.$_get(0);
      let e2: int = 7;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_0900
     * @tc.name int8ArrayFromPart05Test009
     * @tc.desc Verify Int8Array.from(new AL001(2147483647, [])) throws OutOfMemoryError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        Int8Array.from(new AL001(2147483647, []));
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('OutOfMemoryError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1000
     * @tc.name int8ArrayFromPart05Test010
     * @tc.desc Verify Int8Array.from(new AL001(1, [-128]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-128]));
      let r1: number = r.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1100
     * @tc.name int8ArrayFromPart05Test011
     * @tc.desc Verify Int8Array.from(new AL001(1, [127])) returns $_get(0) equal to 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [127]));
      let r1: number = r.$_get(0);
      let e1: int = 127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1200
     * @tc.name int8ArrayFromPart05Test012
     * @tc.desc Verify Int8Array.from(new AL001(1, [0]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [0]));
      let r1: number = r.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1300
     * @tc.name int8ArrayFromPart05Test013
     * @tc.desc Verify Int8Array.from(new AL001(1, [-1]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-1]));
      let r1: number = r.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1400
     * @tc.name int8ArrayFromPart05Test014
     * @tc.desc Verify Int8Array.from(new AL001(1, [128]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [128]));
      let r1: number = r.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1500
     * @tc.name int8ArrayFromPart05Test015
     * @tc.desc Verify Int8Array.from(new AL001(1, [-129]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-129]));
      let r1: number = r.$_get(0);
      let e1: int = 127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1600
     * @tc.name int8ArrayFromPart05Test016
     * @tc.desc Verify Int8Array.from(new AL001(1, [255]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [255]));
      let r1: number = r.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1700
     * @tc.name int8ArrayFromPart05Test017
     * @tc.desc Verify Int8Array.from(new AL001(1, [256]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [256]));
      let r1: number = r.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1800
     * @tc.name int8ArrayFromPart05Test018
     * @tc.desc Verify Int8Array.from(new AL001(1, [200]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [200]));
      let r1: number = r.$_get(0);
      let e1: int = -56;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_1900
     * @tc.name int8ArrayFromPart05Test019
     * @tc.desc Verify Int8Array.from(new AL001(1, [Number.NaN]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [Number.NaN]));
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2000
     * @tc.name int8ArrayFromPart05Test020
     * @tc.desc Verify Int8Array.from(new AL001(1, [Number.POSITIVE_INFINITY]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [Number.POSITIVE_INFINITY]));
      let r1: number = r.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2100
     * @tc.name int8ArrayFromPart05Test021
     * @tc.desc Verify Int8Array.from(new AL001(1, [Number.NEGATIVE_INFINITY]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [Number.NEGATIVE_INFINITY]));
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2200
     * @tc.name int8ArrayFromPart05Test022
     * @tc.desc Verify Int8Array.from(new AL001(1, [1.9]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [1.9]));
      let r1: number = r.$_get(0);
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2300
     * @tc.name int8ArrayFromPart05Test023
     * @tc.desc Verify Int8Array.from(new AL001(1, [-1.9]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-1.9]));
      let r1: number = r.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2400
     * @tc.name int8ArrayFromPart05Test024
     * @tc.desc Verify Int8Array.from(new AL001(1, [0.5]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [0.5]));
      let r1: number = r.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2500
     * @tc.name int8ArrayFromPart05Test025
     * @tc.desc Verify Int8Array.from(new AL001(1, [127.9]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [127.9]));
      let r1: number = r.$_get(0);
      let e1: int = 127;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2600
     * @tc.name int8ArrayFromPart05Test026
     * @tc.desc Verify Int8Array.from(new AL001(1, [-128.9]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-128.9]));
      let r1: number = r.$_get(0);
      let e1: int = -128;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2700
     * @tc.name int8ArrayFromPart05Test027
     * @tc.desc Verify Int8Array.from(new AL001(1, [-0.5]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-0.5]));
      let r1: number = r.$_get(0);
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2800
     * @tc.name int8ArrayFromPart05Test028
     * @tc.desc Verify Int8Array.from(new AL001(1, [2147483647]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [2147483647]));
      let r1: number = r.$_get(0);
      let e1: int = -1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_2900
     * @tc.name int8ArrayFromPart05Test029
     * @tc.desc Verify Int8Array.from(new AL001(1, [-2147483648]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-2147483648]));
      expect(r.$_get(0)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3000
     * @tc.name int8ArrayFromPart05Test030
     * @tc.desc Verify Int8Array.from(new AL001(4, [0, 128, -129, 127]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(4, [0, 128, -129, 127]));
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(127);
      expect(r.$_get(3)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3100
     * @tc.name int8ArrayFromPart05Test031
     * @tc.desc Verify Int8Array.from(new AL001(3, [127, 127, 127]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [127, 127, 127]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(2)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3200
     * @tc.name int8ArrayFromPart05Test032
     * @tc.desc Verify Int8Array.from(new AL001(3, [0, 0, 0]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [0, 0, 0]));
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3300
     * @tc.name int8ArrayFromPart05Test033
     * @tc.desc Verify Int8Array.from(new AL001(3, [127, 0, -128]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [127, 0, -128]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3400
     * @tc.name int8ArrayFromPart05Test034
     * @tc.desc Verify Int8Array.from(new AL001(4, [1.9, -1.9, 0.5, 127.9]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(4, [1.9, -1.9, 0.5, 127.9]));
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3500
     * @tc.name int8ArrayFromPart05Test035
     * @tc.desc Verify Int8Array.from(new AL001(2, [256, -256]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [256, -256]));
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3600
     * @tc.name int8ArrayFromPart05Test036
     * @tc.desc Verify Int8Array.from(new AL001(4, [127, -128, 0, -1]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(4, [127, -128, 0, -1]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(1)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3700
     * @tc.name int8ArrayFromPart05Test037
     * @tc.desc Verify Int8Array.from(new AL001(3, [1, 2, 3])) returns correct values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [1, 2, 3]));
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      let r1: int = r.byteLength;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: int = r.buffer.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: int = r.byteOffset;
      let e3: int = 0;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3800
     * @tc.name int8ArrayFromPart05Test038
     * @tc.desc Verify Int8Array.from(new AL001(3, [127, 128, 129]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [127, 128, 129]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(1)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(-127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_3900
     * @tc.name int8ArrayFromPart05Test039
     * @tc.desc Verify Int8Array.from(new AL001(3, [5, 5, 5]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [5, 5, 5]));
      expect(r.$_get(0)).assertEqual(5);
      expect(r.$_get(1)).assertEqual(5);
      expect(r.$_get(2)).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4000
     * @tc.name int8ArrayFromPart05Test040
     * @tc.desc Verify Int8Array.from(new AL001(1, [100]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [100]));
      expect(r.$_get(0)).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4100
     * @tc.name int8ArrayFromPart05Test041
     * @tc.desc Verify Int8Array.from(new AL001(1, [-100]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(1, [-100]));
      expect(r.$_get(0)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4200
     * @tc.name int8ArrayFromPart05Test042
     * @tc.desc Verify Int8Array.from(new AL001(2, [100, -100]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [100, -100]));
      expect(r.$_get(0)).assertEqual(100);
      expect(r.$_get(1)).assertEqual(-100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4300
     * @tc.name int8ArrayFromPart05Test043
     * @tc.desc Verify Int8Array.from(new AL001(5, [10, 20]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(5, [10, 20]));
      expect(r.length).assertEqual(5);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4400
     * @tc.name int8ArrayFromPart05Test044
     * @tc.desc Verify Int8Array.from(new AL001(3, [10, 20, 30, 40]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [10, 20, 30, 40]));
      expect(r.length).assertEqual(3);
      expect(r.$_get(0)).assertEqual(10);
      expect(r.$_get(1)).assertEqual(20);
      expect(r.$_get(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4500
     * @tc.name int8ArrayFromPart05Test045
     * @tc.desc Verify Int8Array.from(new AL001(2, [128, -128]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [128, -128]));
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(1)).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4600
     * @tc.name int8ArrayFromPart05Test046
     * @tc.desc Verify Int8Array.from(new AL001(2, [127, -129]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [127, -129]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(1)).assertEqual(127);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4700
     * @tc.name int8ArrayFromPart05Test047
     * @tc.desc Verify Int8Array.from(al) return length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: AL001 = new AL001(3, [1, 2, 3]);
      const r: Int8Array = Int8Array.from(al);
      let r1: int = r.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4800
     * @tc.name int8ArrayFromPart05Test048
     * @tc.desc Verify Int8Array.from(new AL001(2, [1, 2])) BYTES_PER_ELEMENT is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(2, [1, 2]));
      expect(r.BYTES_PER_ELEMENT).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_4900
     * @tc.name int8ArrayFromPart05Test049
     * @tc.desc Verify Int8Array.from(new AL001(3, [11, 22, 33])) returns $_get(0) equal to 11
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [11, 22, 33]));
      expect(r.$_get(0)).assertEqual(11);
      expect(r.at(-1)).assertEqual(33);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5000
     * @tc.name int8ArrayFromPart05Test050
     * @tc.desc Verify Int8Array.from(new AL001(4, [1, 2, 3, 4]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(4, [1, 2, 3, 4]));
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(2);
      expect(r.$_get(2)).assertEqual(3);
      expect(r.$_get(3)).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5100
     * @tc.name int8ArrayFromPart05Test051
     * @tc.desc Verify Int8Array.from() creates independent copy; mutating result does not affect source ArrayLike object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: AL001 = new AL001(2, [10, 20]);
      const r: Int8Array = Int8Array.from(al);
      r.$_set(0, 99);
      expect(al.$_get(0)).assertEqual(10);
      expect(r.$_get(0)).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5200
     * @tc.name int8ArrayFromPart05Test052
     * @tc.desc Verify Int8Array.from(al) same source
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [1, 2, 3]));
      expect(r.byteOffset).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5300
     * @tc.name int8ArrayFromPart05Test053
     * @tc.desc Verify Int8Array.from(al) returns a new independent buffer on each call
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: AL001 = new AL001(2, [1, 2]);
      const r1: Int8Array = Int8Array.from(al);
      const r2: Int8Array = Int8Array.from(al);
      expect(r1.buffer).not().assertEqual(r2.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5400
     * @tc.name int8ArrayFromPart05Test054
     * @tc.desc Verify Int8Array.from creates independent copies; mutating one does not affect the other
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: AL001 = new AL001(2, [1, 2]);
      const r1: Int8Array = Int8Array.from(al);
      const r2: Int8Array = Int8Array.from(al);
      r1.$_set(0, 50);
      expect(r1.$_get(0)).assertEqual(50);
      expect(r2.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5500
     * @tc.name int8ArrayFromPart05Test055
     * @tc.desc Verify after Int8Array.from call source arrayLike is not modified (length and first element unchanged)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const al: AL001 = new AL001(3, [7, 8, 9]);
      const r: Int8Array = Int8Array.from(al);
      expect(r.length).assertEqual(3);
      expect(al.length).assertEqual(3);
      expect(al.$_get(0)).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5600
     * @tc.name int8ArrayFromPart05Test056
     * @tc.desc Verify Int8Array.from with null array-like throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let al: AL001 | null = null;
      try {
        Int8Array.from(al!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5700
     * @tc.name int8ArrayFromPart05Test057
     * @tc.desc Verify Int8Array.from with undefined array-like throws NullPointerError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let al: AL001 | undefined = undefined;
      try {
        Int8Array.from(al!);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('NullPointerError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5800
     * @tc.name int8ArrayFromPart05Test058
     * @tc.desc Verify Int8Array.from(new AL001(4, [128, 255, 256, 200]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(4, [128, 255, 256, 200]));
      expect(r.$_get(0)).assertEqual(-128);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
      expect(r.$_get(3)).assertEqual(-56);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_5900
     * @tc.name int8ArrayFromPart05Test059
     * @tc.desc Verify Int8Array.from(new AL001(3, [-129, -256, -257]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [-129, -256, -257]));
      expect(r.$_get(0)).assertEqual(127);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_6000
     * @tc.name int8ArrayFromPart05Test060
     * @tc.desc Verify Int8Array.from(new AL001(3, [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY])) returns all zeros
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(
        new AL001(3, [Number.NaN, Number.POSITIVE_INFINITY, Number.NEGATIVE_INFINITY]),
      );
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(0);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_6100
     * @tc.name int8ArrayFromPart05Test061
     * @tc.desc Verify Int8Array.from(new AL001(3, [1.9, -1.9, -0.5]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(3, [1.9, -1.9, -0.5]));
      expect(r.$_get(0)).assertEqual(1);
      expect(r.$_get(1)).assertEqual(-1);
      expect(r.$_get(2)).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FROM_PART05_TEST_6200
     * @tc.name int8ArrayFromPart05Test062
     * @tc.desc Verify Int8Array.from(new AL001(8, [0, 128, -129, Number.NaN, 1.9, 255, -128, 127]))
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayFromPart05Test062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const r: Int8Array = Int8Array.from(new AL001(8, [0, 128, -129, Number.NaN, 1.9, 255, -128, 127]));
      expect(r.$_get(0)).assertEqual(0);
      expect(r.$_get(1)).assertEqual(-128);
      expect(r.$_get(2)).assertEqual(127);
      expect(r.$_get(3)).assertEqual(0);
      expect(r.$_get(4)).assertEqual(1);
      expect(r.$_get(5)).assertEqual(-1);
      expect(r.$_get(6)).assertEqual(-128);
      expect(r.$_get(7)).assertEqual(127);
    });
  });
}
