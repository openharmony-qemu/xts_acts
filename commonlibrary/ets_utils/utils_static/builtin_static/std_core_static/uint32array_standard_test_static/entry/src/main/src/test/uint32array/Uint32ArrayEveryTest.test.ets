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

export default function uint32ArrayEveryTest(): void {
  describe('Uint32ArrayEveryTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0100
     * @tc.name testUint32ArrayEveryPartOne001
     * @tc.desc Verify arity-0 true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.every((): boolean => true);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0200
     * @tc.name testUint32ArrayEveryPartOne002
     * @tc.desc Verify arity-1 element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.every((element: number): boolean => element > 0);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0300
     * @tc.name testUint32ArrayEveryPartOne003
     * @tc.desc Verify arity-2 element index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.every((element: number, index: int): boolean => index < 3);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0400
     * @tc.name testUint32ArrayEveryPartOne004
     * @tc.desc Verify arity-3 array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.every((element: number, index: int, array: Uint32Array): boolean => array.length === 3);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0500
     * @tc.name testUint32ArrayEveryPartOne005
     * @tc.desc Verify index 0 element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5);
      const r = arr.every((element: number, index: int = 0): boolean => element === 5);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0600
     * @tc.name testUint32ArrayEveryPartOne006
     * @tc.desc Verify const
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      const pred = (element: number, index: int, array: Uint32Array): boolean => element > 0;
      const r = arr.every(pred);
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0700
     * @tc.name testUint32ArrayEveryPartOne007
     * @tc.desc Verify behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      const r = arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (element >= 10) {
          return true;
        }
        return false;
      });
      expect(r).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0800
     * @tc.name testUint32ArrayEveryPartOne008
     * @tc.desc Verify element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(77, 88);
      let first: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        first = element;
        return false;
      });
      expect(first).assertEqual(77);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_0900
     * @tc.name testUint32ArrayEveryPartOne009
     * @tc.desc Verify index array[index] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22, 33);
      let ok: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (array[index] !== element) {
          ok = false;
          return false;
        }
        return true;
      });
      expect(ok).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1000
     * @tc.name testUint32ArrayEveryPartOne010
     * @tc.desc Verify element = 0 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 0, 0);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1100
     * @tc.name testUint32ArrayEveryPartOne011
     * @tc.desc Verify element = 2147483648 int32 MAX+1 uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(2147483648);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1200
     * @tc.name testUint32ArrayEveryPartOne012
     * @tc.desc Verify element = 65536 0x10000 16 +1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(65536);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(65536);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1300
     * @tc.name testUint32ArrayEveryPartOne013
     * @tc.desc Verify element = 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(100, 100);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1400
     * @tc.name testUint32ArrayEveryPartOne014
     * @tc.desc Verify element $_set(4294967296) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr[0] = 4294967296;
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1500
     * @tc.name testUint32ArrayEveryPartOne015
     * @tc.desc Verify element $_set(9007199254740991)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(1);
      arr[0] = 9007199254740991;
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1600
     * @tc.name testUint32ArrayEveryPartOne016
     * @tc.desc Verify element Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.9, 2.1];
      const arr = new Uint32Array(src);
      let captured: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured.push(element);
        return true;
      });
      expect(captured[0]).assertEqual(1);
      expect(captured[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1700
     * @tc.name testUint32ArrayEveryPartOne017
     * @tc.desc Verify element 0 MAX int32MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(0, 4294967295, 2147483647);
      let captured: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured.push(element);
        return true;
      });
      expect(captured[0]).assertEqual(0);
      expect(captured[1]).assertEqual(4294967295);
      expect(captured[2]).assertEqual(2147483647);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1800
     * @tc.name testUint32ArrayEveryPartOne018
     * @tc.desc Verify element 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      let allZero: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (element !== 0) {
          allZero = false;
          return false;
        }
        return true;
      });
      expect(allZero).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_1900
     * @tc.name testUint32ArrayEveryPartOne019
     * @tc.desc Verify element MAX fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.fill(4294967295);
      let allMax: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (element !== 4294967295) {
          allMax = false;
          return false;
        }
        return true;
      });
      expect(allMax).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2000
     * @tc.name testUint32ArrayEveryPartOne020
     * @tc.desc Verify element with
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const arr = base.with(1, 200);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (index === 1) {
          captured = element;
        }
        return true;
      });
      expect(captured).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2100
     * @tc.name testUint32ArrayEveryPartOne021
     * @tc.desc Verify element set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(3);
      arr.set(Uint32Array.of(7, 8, 9));
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2200
     * @tc.name testUint32ArrayEveryPartOne022
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let firstIdx: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        firstIdx = index;
        return false;
      });
      expect(firstIdx).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2300
     * @tc.name testUint32ArrayEveryPartOne023
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let lastIdx: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        lastIdx = index;
        return true;
      });
      expect(lastIdx).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2400
     * @tc.name testUint32ArrayEveryPartOne024
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(42);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = index;
        return true;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2500
     * @tc.name testUint32ArrayEveryPartOne025
     * @tc.desc Verify index 0,1,2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let seq: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        seq.push(index);
        return true;
      });
      expect(seq[0]).assertEqual(0);
      expect(seq[1]).assertEqual(1);
      expect(seq[2]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2600
     * @tc.name testUint32ArrayEveryPartOne026
     * @tc.desc Verify index number number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = index;
        return false;
      });
      expect(captured).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2700
     * @tc.name testUint32ArrayEveryPartOne027
     * @tc.desc Verify index length length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let maxIdx: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        maxIdx = index;
        return true;
      });
      expect(maxIdx).assertEqual(arr.length - 1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2800
     * @tc.name testUint32ArrayEveryPartOne028
     * @tc.desc Verify index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(5, 5, 5, 5);
      let seq: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        seq.push(index);
        return true;
      });
      expect(seq[3]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_2900
     * @tc.name testUint32ArrayEveryPartOne029
     * @tc.desc Verify index [0,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(11, 22);
      let seq: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        seq.push(index);
        return true;
      });
      expect(seq.length).assertEqual(2);
      expect(seq[1]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3000
     * @tc.name testUint32ArrayEveryPartOne030
     * @tc.desc Verify index 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30, 40);
      let prev: number = -1;
      let stepOk: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (prev >= 0 && index - prev !== 1) {
          stepOk = false;
          return false;
        }
        prev = index;
        return true;
      });
      expect(stepOk).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3100
     * @tc.name testUint32ArrayEveryPartOne031
     * @tc.desc Verify index array[index]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(33, 66, 99);
      let ok: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (array[index] !== arr[index]) {
          ok = false;
          return false;
        }
        return true;
      });
      expect(ok).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3200
     * @tc.name testUint32ArrayEveryPartOne032
     * @tc.desc Verify index index index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      let seq: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        seq.push(index);
        return true;
      });
      expect(seq.length).assertEqual(3);
      expect(seq[2]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3300
     * @tc.name testUint32ArrayEveryPartOne033
     * @tc.desc Verify array.length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let capturedLen: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3400
     * @tc.name testUint32ArrayEveryPartOne034
     * @tc.desc Verify array length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3, 4);
      let firstLen: number = -1;
      let lastLen: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (index === 0) {
          firstLen = array.length;
        }
        lastLen = array.length;
        return true;
      });
      expect(firstLen).assertEqual(lastLen);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3500
     * @tc.name testUint32ArrayEveryPartOne035
     * @tc.desc Verify array.byteLength length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let capturedBl: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        capturedBl = array.byteLength;
        return false;
      });
      expect(capturedBl).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3600
     * @tc.name testUint32ArrayEveryPartOne036
     * @tc.desc Verify array $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(7, 8, 9);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = array[2];
        return true;
      });
      expect(captured).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3700
     * @tc.name testUint32ArrayEveryPartOne037
     * @tc.desc Verify array subarray every array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const view = base.subarray(1, 3);
      let capturedLen: number = -1;
      view.every((element: number, index: int, array: Uint32Array): boolean => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3800
     * @tc.name testUint32ArrayEveryPartOne038
     * @tc.desc Verify array slice every array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3, 4);
      const copy = base.slice(0, 2);
      let capturedLen: number = -1;
      copy.every((element: number, index: int, array: Uint32Array): boolean => {
        capturedLen = array.length;
        return false;
      });
      expect(capturedLen).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_3900
     * @tc.name testUint32ArrayEveryPartOne039
     * @tc.desc Verify array map every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const base = Uint32Array.of(1, 2, 3);
      const mapped = base.map((val: number, idx: int, arr: Uint32Array): number => val + 10);
      let captured: number = -1;
      mapped.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(13);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4000
     * @tc.name testUint32ArrayEveryPartOne040
     * @tc.desc Verify array fill every element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(2);
      arr.fill(42);
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return true;
      });
      expect(captured).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4100
     * @tc.name testUint32ArrayEveryPartOne041
     * @tc.desc Verify array every array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const outer = Uint32Array.of(1, 2);
      const inner = Uint32Array.of(10, 20);
      let innerLen: number = -1;
      outer.every((oe: number, oi: int, oa: Uint32Array): boolean => {
        inner.every((ie: number, ii: int, ia: Uint32Array): boolean => {
          innerLen = ia.length;
          return false;
        });
        return false;
      });
      expect(innerLen).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4200
     * @tc.name testUint32ArrayEveryPartOne042
     * @tc.desc Verify array every $_set
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(1, 2, 3);
      arr[0] = 100;
      let captured: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured = element;
        return false;
      });
      expect(captured).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4300
     * @tc.name testUint32ArrayEveryPartOne043
     * @tc.desc Verify every 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(0);
      let count: number = 0;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        count = count + 1;
        return true;
      });
      expect(count).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4400
     * @tc.name testUint32ArrayEveryPartOne044
     * @tc.desc Verify Uint32Array() every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array();
      let called: boolean = false;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4500
     * @tc.name testUint32ArrayEveryPartOne045
     * @tc.desc Verify false element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let captured: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured.push(element);
        return false;
      });
      expect(captured.length).assertEqual(1);
      expect(captured[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4600
     * @tc.name testUint32ArrayEveryPartOne046
     * @tc.desc Verify false element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let captured: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        captured.push(element);
        return element < 30;
      });
      expect(captured.length).assertEqual(3);
      expect(captured[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4700
     * @tc.name testUint32ArrayEveryPartOne047
     * @tc.desc Verify element index (0,10),(1,20),(2,30)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(10, 20, 30);
      let pairs: number[] = [];
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        pairs.push(index * 1000 + element);
        return true;
      });
      expect(pairs[0]).assertEqual(10);
      expect(pairs[1]).assertEqual(1020);
      expect(pairs[2]).assertEqual(2030);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4800
     * @tc.name testUint32ArrayEveryPartOne048
     * @tc.desc Verify element index
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint32Array(5);
      arr.fill(7);
      let firstPair: number = -1;
      let lastPair: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (index === 0) {
          firstPair = index * 1000 + element;
        }
        if (index === arr.length - 1) {
          lastPair = index * 1000 + element;
        }
        return true;
      });
      expect(firstPair).assertEqual(7);
      expect(lastPair).assertEqual(4007);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_4900
     * @tc.name testUint32ArrayEveryPartOne049
     * @tc.desc Verify element MAX index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(4294967295, 0);
      let pair0: number = -1;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        if (index === 0) {
          pair0 = element;
        }
        return true;
      });
      expect(pair0).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_EVERY_PARTONE_5000
     * @tc.name testUint32ArrayEveryPartOne050
     * @tc.desc Verify array at(index) element at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayEveryPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint32Array.of(15, 25, 35);
      let ok: boolean = true;
      arr.every((element: number, index: int, array: Uint32Array): boolean => {
        const v = array.at(index);
        if (v === undefined || v !== element) {
          ok = false;
          return false;
        }
        return true;
      });
      expect(ok).assertTrue();
    });

  });
}
