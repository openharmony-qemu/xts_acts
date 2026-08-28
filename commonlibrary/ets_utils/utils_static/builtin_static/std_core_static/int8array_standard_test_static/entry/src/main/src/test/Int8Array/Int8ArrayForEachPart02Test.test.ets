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

export default function int8ArrayForEachPart02Test(): void {
  describe('Int8ArrayForEachPart02Test', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0100
     * @tc.name int8ArrayForEachPart02Test001
     * @tc.desc Verify forEach returns undefined via result variable, on empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0200
     * @tc.name int8ArrayForEachPart02Test002
     * @tc.desc Verify forEach returns undefined, on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0300
     * @tc.name int8ArrayForEachPart02Test003
     * @tc.desc Verify forEach returns undefined with empty callback, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0400
     * @tc.name int8ArrayForEachPart02Test004
     * @tc.desc Verify forEach returns undefined, on new Int8Array([-128, INT8_MAX, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, INT8_MAX, 0]);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0500
     * @tc.name int8ArrayForEachPart02Test005
     * @tc.desc Verify forEach returns undefined, on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0600
     * @tc.name int8ArrayForEachPart02Test006
     * @tc.desc Verify forEach returns undefined via result variable, on clamped Int8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, 255, -129]);
      let forEachResult = arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      expect(forEachResult).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0700
     * @tc.name int8ArrayForEachPart02Test007
     * @tc.desc Verify forEach returns undefined via inline assertion, on empty Int8Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0800
     * @tc.name int8ArrayForEachPart02Test008
     * @tc.desc Verify forEach returns undefined, on new Int8Array([9])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([9]);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_0900
     * @tc.name int8ArrayForEachPart02Test009
     * @tc.desc Verify forEach returns undefined, on new Int8Array([-1, -2, -3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1000
     * @tc.name int8ArrayForEachPart02Test010
     * @tc.desc Verify forEach returns undefined, on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1100
     * @tc.name int8ArrayForEachPart02Test011
     * @tc.desc Verify forEach returns undefined, on Int8Array.from([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([10, 20, 30]);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1200
     * @tc.name int8ArrayForEachPart02Test012
     * @tc.desc Verify forEach returns undefined, on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1300
     * @tc.name int8ArrayForEachPart02Test013
     * @tc.desc Verify forEach on subarray(1, 3) returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let arr: Int8Array = parent.subarray(1, 3);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1400
     * @tc.name int8ArrayForEachPart02Test014
     * @tc.desc Verify forEach from ArrayBuffer ArrayBuffer returns undefined, on new Int8Array(buf, 0, 6)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 0, 6);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1500
     * @tc.name int8ArrayForEachPart02Test015
     * @tc.desc Verify forEach from ArrayBuffer ArrayBuffer returns undefined, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1600
     * @tc.name int8ArrayForEachPart02Test016
     * @tc.desc Verify forEach returns undefined via inline assertion, on clamped Int8Array elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128, 255, -129]);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1700
     * @tc.name int8ArrayForEachPart02Test017
     * @tc.desc Verify forEach returns undefined after callback sums values, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      expect(
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          sum = sum + v;
        }),
      ).assertUndefined();
      expect(sum).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1800
     * @tc.name int8ArrayForEachPart02Test018
     * @tc.desc Verify forEach returns undefined after callback captures last index, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let lastIdx: number = -1;
      expect(
        arr.forEach((_v: number, i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
          lastIdx = i;
        }),
      ).assertUndefined();
      expect(lastIdx).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_1900
     * @tc.name int8ArrayForEachPart02Test019
     * @tc.desc Verify forEach returns undefined after callback captures a.length, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let captured: number = 0;
      expect(
        arr.forEach((_v: number, _i: int, a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
          captured = a.length;
        }),
      ).assertUndefined();
      expect(captured).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2000
     * @tc.name int8ArrayForEachPart02Test020
     * @tc.desc Verify forEach returns undefined, with $_get(0), on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let bag: Int8Array = new Int8Array([0]);
      expect(
        arr.forEach((v: number, _i: int, _a: Int8Array): void => {
          bag.$_set(0, bag.$_get(0) + v);
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2100
     * @tc.name int8ArrayForEachPart02Test021
     * @tc.desc Verify forEach returns undefined, on new Int8Array([1, 2])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2]);
      let outer: number = 0;
      expect(
        arr.forEach((_v: number, _i: int, a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
          outer = outer + 1;
          a.forEach((vv: number, _ii: int, _aa: Int8Array): void => {
            if (vv < INT8_MIN || vv > INT8_MAX) {
              return;
            }
          });
        }),
      ).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2200
     * @tc.name int8ArrayForEachPart02Test022
     * @tc.desc Verify forEach on empty array never invokes callback, length stays 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(0);
      let count: number = 0;
      arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(0);
      let r1: int = arr.length;
      let e1: int = 0;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2300
     * @tc.name int8ArrayForEachPart02Test023
     * @tc.desc Verify forEach invokes callback once and keeps length 1, on new Int8Array([7])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([7]);
      let received: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(7);
      let r1: int = arr.length;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2400
     * @tc.name int8ArrayForEachPart02Test024
     * @tc.desc Verify forEach passes elements 1, 2, 3 and keeps length 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r2: number = values[0];
      let e2: int = 1;
      expect(r2).assertEqual(e2);
      let r3: number = values[1];
      let e3: int = 2;
      expect(r3).assertEqual(e3);
      let r4: number = values[2];
      let e4: int = 3;
      expect(r4).assertEqual(e4);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2500
     * @tc.name int8ArrayForEachPart02Test025
     * @tc.desc Verify forEach invokes callback 100 times on new Int8Array(100)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array(100);
      let count: number = 0;
      arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(100);
      let r1: int = arr.length;
      let e1: int = 100;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2600
     * @tc.name int8ArrayForEachPart02Test026
     * @tc.desc Verify forEach passes element 30 and keeps length 3, on Int8Array.from([10, 20, 30])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.from([10, 20, 30]);
      let lastValue: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        lastValue = v;
      });
      expect(lastValue).assertEqual(30);
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2700
     * @tc.name int8ArrayForEachPart02Test027
     * @tc.desc Verify forEach passes elements 7, 8, 9, on Int8Array.of(7, 8, 9)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = Int8Array.of(7, 8, 9);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[0];
      let e1: int = 7;
      expect(r1).assertEqual(e1);
      let r2: number = values[1];
      let e2: int = 8;
      expect(r2).assertEqual(e2);
      let r3: number = values[2];
      let e3: int = 9;
      expect(r3).assertEqual(e3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2800
     * @tc.name int8ArrayForEachPart02Test028
     * @tc.desc Verify forEach passes array argument of view with length 4, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let arr: Int8Array = new Int8Array(buf, 2, 4);
      let receivedLength: number = 0;
      arr.forEach((_v: number, _i: int, a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        receivedLength = a.length;
      });
      expect(receivedLength).assertEqual(4);
      let r1: int = arr.byteLength;
      let e1: int = 4;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteOffset;
      let e2: int = 2;
      expect(r2).assertEqual(e2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_2900
     * @tc.name int8ArrayForEachPart02Test029
     * @tc.desc Verify forEach passes subarray elements 2, 3 and keeps view properties, on parent.subarray(1, 3)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent: Int8Array = new Int8Array([1, 2, 3, 4, 5]);
      let arr: Int8Array = parent.subarray(1, 3);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r5: number = values[0];
      let e5: int = 2;
      expect(r5).assertEqual(e5);
      let r6: number = values[1];
      let e6: int = 3;
      expect(r6).assertEqual(e6);
      let r1: int = arr.byteOffset;
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: int = arr.length;
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = parent.$_get(0);
      let e3: int = 1;
      expect(r3).assertEqual(e3);
      let r4: number = parent.$_get(4);
      let e4: int = 5;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3000
     * @tc.name int8ArrayForEachPart02Test030
     * @tc.desc Verify forEach on zero-length view never invokes callback, byteOffset stays 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(6);
      let arr: Int8Array = new Int8Array(buf, 6, 0);
      let count: number = 0;
      arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(0);
      let r1: int = arr.byteOffset;
      let e1: int = 6;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3100
     * @tc.name int8ArrayForEachPart02Test031
     * @tc.desc Verify forEach passes array argument sharing the same buffer, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let receivedBuf: ArrayBuffer = new ArrayBuffer(0);
      arr.forEach((_v: number, _i: int, a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        receivedBuf = a.buffer;
      });
      expect(receivedBuf).assertEqual(arr.buffer);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3200
     * @tc.name int8ArrayForEachPart02Test032
     * @tc.desc Verify forEach passes element 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3300
     * @tc.name int8ArrayForEachPart02Test033
     * @tc.desc Verify forEach passes third element 3, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[2];
      let e1: int = 3;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3400
     * @tc.name int8ArrayForEachPart02Test034
     * @tc.desc Verify forEach passes element -128, on new Int8Array([-128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128]);
      let received: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3500
     * @tc.name int8ArrayForEachPart02Test035
     * @tc.desc Verify forEach passes element INT8_MAX, on new Int8Array([INT8_MAX])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([INT8_MAX]);
      let received: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(INT8_MAX);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3600
     * @tc.name int8ArrayForEachPart02Test036
     * @tc.desc Verify forEach passes element 0, on new Int8Array([0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([0]);
      let received: number = 999;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3700
     * @tc.name int8ArrayForEachPart02Test037
     * @tc.desc Verify forEach passes second element -2, on new Int8Array([-1, -2, -3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-1, -2, -3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[1];
      let e1: int = -2;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3800
     * @tc.name int8ArrayForEachPart02Test038
     * @tc.desc Verify forEach passes truncated element -128, on new Int8Array([128])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([128]);
      let received: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(-128);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_3900
     * @tc.name int8ArrayForEachPart02Test039
     * @tc.desc Verify forEach passes truncated element -1, on new Int8Array([255])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([255]);
      let received: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        received = v;
      });
      expect(received).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4000
     * @tc.name int8ArrayForEachPart02Test040
     * @tc.desc Verify forEach passes second element 5, on new Int8Array([5, 5, 5])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([5, 5, 5]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[1];
      let e1: int = 5;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4100
     * @tc.name int8ArrayForEachPart02Test041
     * @tc.desc Verify forEach passes second element INT8_MAX, on new Int8Array([-128, INT8_MAX, 0])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([-128, INT8_MAX, 0]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[1];
      let e1: number = INT8_MAX;
      expect(r1).assertEqual(e1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4200
     * @tc.name int8ArrayForEachPart02Test042
     * @tc.desc Verify forEach does not modify array content, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r7: number = values[0];
      let e7: int = 1;
      expect(r7).assertEqual(e7);
      let r8: number = values[1];
      let e8: int = 2;
      expect(r8).assertEqual(e8);
      let r9: number = values[2];
      let e9: int = 3;
      expect(r9).assertEqual(e9);
      expect(
        arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
          if (_v < INT8_MIN || _v > INT8_MAX) {
            return;
          }
        }),
      ).assertUndefined();
      let r1: int = arr.length;
      let e1: int = 3;
      expect(r1).assertEqual(e1);
      let r2: int = arr.byteLength;
      let e2: int = 3;
      expect(r2).assertEqual(e2);
      let r3: int = arr.byteOffset;
      let e3: int = 0;
      expect(r3).assertEqual(e3);
      let r4: int = arr.buffer.byteLength;
      let e4: int = 3;
      expect(r4).assertEqual(e4);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(-1)).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4300
     * @tc.name int8ArrayForEachPart02Test043
     * @tc.desc Verify forEach passes array argument with BYTES_PER_ELEMENT 1, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let receivedBpe: number = 0;
      arr.forEach((_v: number, _i: int, a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        receivedBpe = a.BYTES_PER_ELEMENT;
      });
      expect(receivedBpe).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4400
     * @tc.name int8ArrayForEachPart02Test044
     * @tc.desc Verify forEach on view1 passes element 10, view2 element 30 intact, on shared ArrayBuffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view1: Int8Array = new Int8Array(buf, 0, 2);
      let view2: Int8Array = new Int8Array(buf, 2, 2);
      view1.$_set(0, 10);
      view2.$_set(0, 30);
      let values: Array<number> = [];
      view1.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[0];
      let e1: int = 10;
      expect(r1).assertEqual(e1);
      expect(view2.$_get(0)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4500
     * @tc.name int8ArrayForEachPart02Test045
     * @tc.desc Verify forEach passes all 4 elements 11, 22, 33, 44, on new Int8Array(buf, 0, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(4);
      let view: Int8Array = new Int8Array(buf, 0, 4);
      view.$_set(0, 11);
      view.$_set(1, 22);
      view.$_set(2, 33);
      view.$_set(3, 44);
      let values: Array<number> = [];
      view.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      let r1: number = values[0];
      let e1: int = 11;
      expect(r1).assertEqual(e1);
      let r2: number = values[1];
      let e2: int = 22;
      expect(r2).assertEqual(e2);
      let r3: number = values[2];
      let e3: int = 33;
      expect(r3).assertEqual(e3);
      let r4: number = values[3];
      let e4: int = 44;
      expect(r4).assertEqual(e4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4600
     * @tc.name int8ArrayForEachPart02Test046
     * @tc.desc Verify forEach invokes callback 4 times on view, parent element 1 intact, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int8Array = new Int8Array(buf, 0, 8);
      parent.$_set(0, 1);
      parent.$_set(1, 2);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      let count: number = 0;
      view.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(4);
      expect(parent.$_get(0)).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4700
     * @tc.name int8ArrayForEachPart02Test047
     * @tc.desc Verify forEach invokes callback 4 times on view, parent element 70 intact, on new Int8Array(buf, 2, 4)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let buf: ArrayBuffer = new ArrayBuffer(8);
      let parent: Int8Array = new Int8Array(buf, 0, 8);
      parent.$_set(6, 60);
      parent.$_set(7, 70);
      let view: Int8Array = new Int8Array(buf, 2, 4);
      let count: number = 0;
      view.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(4);
      expect(parent.$_get(7)).assertEqual(70);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4800
     * @tc.name int8ArrayForEachPart02Test048
     * @tc.desc Verify forEach twice leaves array intact, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let values: Array<number> = [];
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        values.push(v);
      });
      arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
      });
      let r1: number = values[0];
      let e1: int = 1;
      expect(r1).assertEqual(e1);
      let r2: number = values[1];
      let e2: int = 2;
      expect(r2).assertEqual(e2);
      let r3: number = values[2];
      let e3: int = 3;
      expect(r3).assertEqual(e3);
      expect(arr.length).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_4900
     * @tc.name int8ArrayForEachPart02Test049
     * @tc.desc Verify forEach callback invoked 3 times, on new Int8Array([1, 2, 3])
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let count: number = 0;
      arr.forEach((_v: number, _i: int, _a: Int8Array): void => {
        if (_v < INT8_MIN || _v > INT8_MAX) {
          return;
        }
        count = count + 1;
      });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INT8ARRAY_FOR_EACH_PART02_TEST_5000
     * @tc.name int8ArrayForEachPart02Test050
     * @tc.desc Verify forEach expects 6
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('int8ArrayForEachPart02Test050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: Int8Array = new Int8Array([1, 2, 3]);
      let sum: number = 0;
      arr.forEach((v: number, _i: int, _a: Int8Array): void => {
        sum = sum + v;
      });
      expect(sum).assertEqual(6);
    });
  });
}
