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

let everyThrowIdx: int = 0;
let everyThrowCount: int = 0;

function everyThrowOnFirst(v: number): boolean {
  throw new Error('fail');
}
function everyThrowAlways(v: number): boolean {
  throw new Error();
}
function everyThrowIfLarge(v: number): boolean {
  if (v > 15) {
    throw new Error('large');
  }
  return true;
}
function everyThrowAtLast(v: number): boolean {
  everyThrowIdx++;
  if (everyThrowIdx === 3) {
    throw new Error('fail');
  }
  return true;
}
function everyThrowAtSecond(v: number): boolean {
  everyThrowIdx++;
  if (everyThrowIdx === 2) {
    throw new Error('fail');
  }
  return true;
}
function everyThrowAndCount(v: number): boolean {
  everyThrowCount++;
  throw new Error('stop');
}

export default function Uint8ArrayEveryTest(): void {
  describe('Uint8ArrayEveryTest', () => {
    beforeAll(() => {});
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {});
    afterAll(() => {});
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0010
     * @tc.name testUint8ArrayEvery001
     * @tc.desc Verify every with one required parameter predicate executes normally
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0020
     * @tc.name testUint8ArrayEvery002
     * @tc.desc Verify new Uint8Array() empty array every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0030
     * @tc.name testUint8ArrayEvery003
     * @tc.desc Verify new Uint8Array(0) empty array every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0040
     * @tc.name testUint8ArrayEvery004
     * @tc.desc Verify Uint8Array.of() empty array every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of();
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0050
     * @tc.name testUint8ArrayEvery005
     * @tc.desc Verify new Uint8Array(new ArrayBuffer(0)) empty buffer view every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const arr = new Uint8Array(buf);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0060
     * @tc.name testUint8ArrayEvery006
     * @tc.desc Verify slice(0, 0) empty slice every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(1, 2, 3);
      const arr = src.slice(0, 0);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0070
     * @tc.name testUint8ArrayEvery007
     * @tc.desc Verify new Uint8Array(0.0) float length 0 empty array every returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(0.0);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0080
     * @tc.name testUint8ArrayEvery008
     * @tc.desc Verify empty array predicate never called returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called = false;
      const arr = new Uint8Array();
      const result = arr.every((v) => { called = true; return true; });
      expect(called).assertFalse();
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0090
     * @tc.name testUint8ArrayEvery009
     * @tc.desc Verify [0] element value 0 predicate >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0100
     * @tc.name testUint8ArrayEvery010
     * @tc.desc Verify [0] element value 0 predicate === 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const result = arr.every((v) => v === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0110
     * @tc.name testUint8ArrayEvery011
     * @tc.desc Verify [255] element value 255 predicate === 255 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255);
      const result = arr.every((v) => v === 255);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0120
     * @tc.name testUint8ArrayEvery012
     * @tc.desc Verify [0] element value 0 predicate > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0130
     * @tc.name testUint8ArrayEvery013
     * @tc.desc Verify [0] element value 0 predicate < 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0);
      const result = arr.every((v) => v < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0140
     * @tc.name testUint8ArrayEvery014
     * @tc.desc Verify [255] element value 255 predicate > 255 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255);
      const result = arr.every((v) => v > 255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0150
     * @tc.name testUint8ArrayEvery015
     * @tc.desc Verify [127] element value 127 predicate > 127 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(127);
      const result = arr.every((v) => v > 127);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0160
     * @tc.name testUint8ArrayEvery016
     * @tc.desc Verify [128] element value 128 predicate < 128 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(128);
      const result = arr.every((v) => v < 128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0170
     * @tc.name testUint8ArrayEvery017
     * @tc.desc Verify [1,2,3,4,5] all elements > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0180
     * @tc.name testUint8ArrayEvery018
     * @tc.desc Verify [10,20,30] all elements <= 30 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v) => v <= 30);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0190
     * @tc.name testUint8ArrayEvery019
     * @tc.desc Verify [5,10,15] all elements % 5 === 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      const result = arr.every((v) => v % 5 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0200
     * @tc.name testUint8ArrayEvery020
     * @tc.desc Verify [0,0,0] all elements === 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.every((v) => v === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0210
     * @tc.name testUint8ArrayEvery021
     * @tc.desc Verify [1,1,1] all elements === 1 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 1, 1);
      const result = arr.every((v) => v === 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0220
     * @tc.name testUint8ArrayEvery022
     * @tc.desc Verify [2,4,6,8] all elements % 2 === 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 4, 6, 8);
      const result = arr.every((v) => v % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0230
     * @tc.name testUint8ArrayEvery023
     * @tc.desc Verify [255,255,255] all elements < 256 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255, 255);
      const result = arr.every((v) => v < 256);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0240
     * @tc.name testUint8ArrayEvery024
     * @tc.desc Verify [0,128,255] all elements <= 255 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 128, 255);
      const result = arr.every((v) => v <= 255);
      expect(result).assertTrue();
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0250
     * @tc.name testUint8ArrayEvery025
     * @tc.desc Verify [100,200,250] all elements > 50 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 200, 250);
      const result = arr.every((v) => v > 50);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0260
     * @tc.name testUint8ArrayEvery026
     * @tc.desc Verify [10,20,30] all elements >= 10 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v) => v >= 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0270
     * @tc.name testUint8ArrayEvery027
     * @tc.desc Verify [1,2,3] all elements >= 1 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.every((v) => v >= 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0280
     * @tc.name testUint8ArrayEvery028
     * @tc.desc Verify [1,2,3] all elements <= 3 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.every((v) => v <= 3);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0290
     * @tc.name testUint8ArrayEvery029
     * @tc.desc Verify [0,127,128,255] all elements < 256 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v < 256);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0300
     * @tc.name testUint8ArrayEvery030
     * @tc.desc Verify [0,127,128,255] all elements > -1 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v > -1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0310
     * @tc.name testUint8ArrayEvery031
     * @tc.desc Verify [0,1,2] first element 0 not satisfy > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 1, 2);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0320
     * @tc.name testUint8ArrayEvery032
     * @tc.desc Verify [1,0,2] middle element 0 not satisfy > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 0, 2);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0330
     * @tc.name testUint8ArrayEvery033
     * @tc.desc Verify [1,2,0] last element 0 not satisfy > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 0);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0340
     * @tc.name testUint8ArrayEvery034
     * @tc.desc Verify [10,20,3] last element 3 not satisfy > 5 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 3);
      const result = arr.every((v) => v > 5);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0350
     * @tc.name testUint8ArrayEvery035
     * @tc.desc Verify [10,5,10] middle element 5 not satisfy >= 10 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 5, 10);
      const result = arr.every((v) => v >= 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0360
     * @tc.name testUint8ArrayEvery036
     * @tc.desc Verify [5,10,10] first element 5 not satisfy >= 10 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 10);
      const result = arr.every((v) => v >= 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0370
     * @tc.name testUint8ArrayEvery037
     * @tc.desc Verify [1,2,30] last element 30 not satisfy <= 20 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 30);
      const result = arr.every((v) => v <= 20);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0380
     * @tc.name testUint8ArrayEvery038
     * @tc.desc Verify [5,10,15] first element 5 not satisfy > 10 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      const result = arr.every((v) => v > 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0390
     * @tc.name testUint8ArrayEvery039
     * @tc.desc Verify [5,10,15] second element 10 not satisfy < 10 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 10, 15);
      const result = arr.every((v) => v < 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0400
     * @tc.name testUint8ArrayEvery040
     * @tc.desc Verify [10,20,30] only first element === 10 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v) => v === 10);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0410
     * @tc.name testUint8ArrayEvery041
     * @tc.desc Verify [100,200,250] first element 100 not satisfy > 200 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 200, 250);
      const result = arr.every((v) => v > 200);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0420
     * @tc.name testUint8ArrayEvery042
     * @tc.desc Verify [1,2,3] first element 1 not satisfy > 1 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.every((v) => v > 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0430
     * @tc.name testUint8ArrayEvery043
     * @tc.desc Verify [1,2,3] last element 3 not satisfy < 3 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      const result = arr.every((v) => v < 3);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0440
     * @tc.name testUint8ArrayEvery044
     * @tc.desc Verify [0,255,0,255] element 0 not satisfy > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255, 0, 255);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0450
     * @tc.name testUint8ArrayEvery045
     * @tc.desc Verify [0,255,0,255] element 255 not satisfy === 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255, 0, 255);
      const result = arr.every((v) => v === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0460
     * @tc.name testUint8ArrayEvery046
     * @tc.desc Verify [255,255,255] all elements 255 not satisfy > 255 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255, 255);
      const result = arr.every((v) => v > 255);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0470
     * @tc.name testUint8ArrayEvery047
     * @tc.desc Verify [0,0,0] all elements 0 not satisfy > 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0480
     * @tc.name testUint8ArrayEvery048
     * @tc.desc Verify predicate first element index is 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      arr.every((v, idx) => {
        expect(idx).assertEqual(0);
        return false;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0490
     * @tc.name testUint8ArrayEvery049
     * @tc.desc Verify predicate last element index is length - 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let lastIndex = -1;
      arr.every((v, idx) => { lastIndex = idx; return true; });
      expect(lastIndex).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0500
     * @tc.name testUint8ArrayEvery050
     * @tc.desc Verify predicate index from 0 increments by 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      let prevIdx = -1;
      arr.every((v, idx) => {
        expect(idx).assertEqual(prevIdx + 1);
        prevIdx = idx;
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0510
     * @tc.name testUint8ArrayEvery051
     * @tc.desc Verify index === 0 condition only first element satisfies returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v, idx) => idx === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0520
     * @tc.name testUint8ArrayEvery052
     * @tc.desc Verify index === length-1 condition only last element satisfies returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      const result = arr.every((v, idx) => idx === 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0530
     * @tc.name testUint8ArrayEvery053
     * @tc.desc Verify index < 2 condition on 4 element array returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4);
      const result = arr.every((v, idx) => idx < 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0540
     * @tc.name testUint8ArrayEvery054
     * @tc.desc Verify predicate array parameter reference equals original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let ref: Uint8Array | null = null;
      arr.every((v, idx, a) => { ref = a; return true; });
      expect(ref).assertEqual(arr);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0550
     * @tc.name testUint8ArrayEvery055
     * @tc.desc Verify predicate array.length equals original array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let len = -1;
      arr.every((v, idx, a) => { len = a.length; return true; });
      expect(len).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0560
     * @tc.name testUint8ArrayEvery056
     * @tc.desc Verify predicate array[index] access equals element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(42, 99, 7);
      arr.every((v, idx, a) => {
        expect(a[idx]).assertEqual(v);
        return true;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0570
     * @tc.name testUint8ArrayEvery057
     * @tc.desc Verify predicate array is Uint8Array instance
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      let isUint8 = false;
      arr.every((v, idx, a) => { isUint8 = a instanceof Uint8Array; return true; });
      expect(isUint8).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0580
     * @tc.name testUint8ArrayEvery058
     * @tc.desc Verify first element not satisfy predicate only called 1 time
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = Uint8Array.of(0, 1, 2);
      arr.every((v) => { count++; return v > 0; });
      expect(count).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0590
     * @tc.name testUint8ArrayEvery059
     * @tc.desc Verify all satisfy predicate called length times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = Uint8Array.of(1, 2, 3);
      arr.every((v) => { count++; return true; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0600
     * @tc.name testUint8ArrayEvery060
     * @tc.desc Verify last element not satisfy predicate called length times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = Uint8Array.of(1, 2, 0);
      arr.every((v) => { count++; return v > 0; });
      expect(count).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0610
     * @tc.name testUint8ArrayEvery061
     * @tc.desc Verify empty array predicate called 0 times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = new Uint8Array();
      arr.every((v) => { count++; return true; });
      expect(count).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0620
     * @tc.name testUint8ArrayEvery062
     * @tc.desc Verify second element not satisfy predicate called 2 times
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let count = 0;
      const arr = Uint8Array.of(1, 0, 2);
      arr.every((v) => { count++; return v > 0; });
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0630
     * @tc.name testUint8ArrayEvery063
     * @tc.desc Verify [0,127,128,255] all elements >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0640
     * @tc.name testUint8ArrayEvery064
     * @tc.desc Verify [0,127,128,255] exists element <= 127 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v > 127);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0650
     * @tc.name testUint8ArrayEvery065
     * @tc.desc Verify [0,127,128,255] exists element >= 128 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v < 128);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0660
     * @tc.name testUint8ArrayEvery066
     * @tc.desc Verify [0,127,128,255] exists odd value 127 even condition returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127, 128, 255);
      const result = arr.every((v) => v % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0670
     * @tc.name testUint8ArrayEvery067
     * @tc.desc Verify [0,255] all elements < 256 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255);
      const result = arr.every((v) => v < 256);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0680
     * @tc.name testUint8ArrayEvery068
     * @tc.desc Verify [0,255] all elements >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0690
     * @tc.name testUint8ArrayEvery069
     * @tc.desc Verify 100 elements all > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr.$_set(i, i + 1); }
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0700
     * @tc.name testUint8ArrayEvery070
     * @tc.desc Verify 100 elements first is 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr.$_set(i, 1); }
      arr.$_set(0, 0);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0710
     * @tc.name testUint8ArrayEvery071
     * @tc.desc Verify 100 elements last is 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(100);
      for (let i = 0; i < 100; i++) { arr.$_set(i, 1); }
      arr.$_set(99, 0);
      const result = arr.every((v) => v > 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0720
     * @tc.name testUint8ArrayEvery072
     * @tc.desc Verify from ArrayBuffer construction all elements >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(3);
      const arr = new Uint8Array(buf);
      arr.$_set(0, 10); arr.$_set(1, 20); arr.$_set(2, 30);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0730
     * @tc.name testUint8ArrayEvery073
     * @tc.desc Verify copy construction all elements > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint8Array.of(5, 15, 25);
      const arr = new Uint8Array(src);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0740
     * @tc.name testUint8ArrayEvery074
     * @tc.desc Verify Uint8Array.of construction multiple elements all > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(3, 6, 9, 12, 15);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0750
     * @tc.name testUint8ArrayEvery075
     * @tc.desc Verify new Uint8Array(5) default zero fill all >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array(5);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0760
     * @tc.name testUint8ArrayEvery076
     * @tc.desc Verify all satisfy condition returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 4, 6);
      const result = arr.every((v) => v % 2 === 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0770
     * @tc.name testUint8ArrayEvery077
     * @tc.desc Verify partial not satisfy condition returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(2, 3, 6);
      const result = arr.every((v) => v % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0780
     * @tc.name testUint8ArrayEvery078
     * @tc.desc Verify single element all satisfy condition returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10);
      const result = arr.every((v) => v === 10);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0790
     * @tc.name testUint8ArrayEvery079
     * @tc.desc Verify single element not satisfy condition returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10);
      const result = arr.every((v) => v === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0800
     * @tc.name testUint8ArrayEvery080
     * @tc.desc Verify multiple elements mixed boundary values all satisfy condition returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 255);
      const result = arr.every((v) => v === 0 || v === 255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0810
     * @tc.name testUint8ArrayEvery081
     * @tc.desc Verify predicate throws Error on first element propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      try {
        arr.every(everyThrowOnFirst);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0820
     * @tc.name testUint8ArrayEvery082
     * @tc.desc Verify predicate throws Error on last element propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      everyThrowIdx = 0;
      try {
        arr.every(everyThrowAtLast);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0830
     * @tc.name testUint8ArrayEvery083
     * @tc.desc Verify predicate throws Error on second element propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      everyThrowIdx = 0;
      try {
        arr.every(everyThrowAtSecond);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0840
     * @tc.name testUint8ArrayEvery084
     * @tc.desc Verify empty array predicate throws Error but never called returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = new Uint8Array();
      const result = arr.every(everyThrowAlways);
      expect(result).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0850
     * @tc.name testUint8ArrayEvery085
     * @tc.desc Verify predicate conditionally throws Error after condition check
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 20, 30);
      try {
        arr.every(everyThrowIfLarge);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0860
     * @tc.name testUint8ArrayEvery086
     * @tc.desc Verify predicate throws Error stops calling subsequent elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3);
      everyThrowCount = 0;
      try {
        arr.every(everyThrowAndCount);
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
      expect(everyThrowCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0870
     * @tc.name testUint8ArrayEvery087
     * @tc.desc Verify [0xFF] value 255 predicate === 255 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0xFF);
      const result = arr.every((v) => v === 255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0880
     * @tc.name testUint8ArrayEvery088
     * @tc.desc Verify [0x00] value 0 predicate >= 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x00);
      const result = arr.every((v) => v >= 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0890
     * @tc.name testUint8ArrayEvery089
     * @tc.desc Verify [0b11111111] binary 255 predicate === 255 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0b11111111);
      const result = arr.every((v) => v === 255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0900
     * @tc.name testUint8ArrayEvery090
     * @tc.desc Verify [0o377] octal 255 predicate === 255 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0o377);
      const result = arr.every((v) => v === 255);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0910
     * @tc.name testUint8ArrayEvery091
     * @tc.desc Verify [0x80, 0xFF] hexadecimal mix all > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0x80, 0xFF);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0920
     * @tc.name testUint8ArrayEvery092
     * @tc.desc Verify [100,100,100] all same === 100 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 100, 100);
      const result = arr.every((v) => v === 100);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0930
     * @tc.name testUint8ArrayEvery093
     * @tc.desc Verify [100,100,100] all same !== 100 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(100, 100, 100);
      const result = arr.every((v) => v !== 100);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0940
     * @tc.name testUint8ArrayEvery094
     * @tc.desc Verify [200,200,200] all same > 199 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200, 200, 200);
      const result = arr.every((v) => v > 199);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0950
     * @tc.name testUint8ArrayEvery095
     * @tc.desc Verify [200,200,200] all same > 200 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(200, 200, 200);
      const result = arr.every((v) => v > 200);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0960
     * @tc.name testUint8ArrayEvery096
     * @tc.desc Verify [0,0,0] all elements < 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 0, 0);
      const result = arr.every((v) => v < 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0970
     * @tc.name testUint8ArrayEvery097
     * @tc.desc Verify [255,255,255] all elements === 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255, 255);
      const result = arr.every((v) => v === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0980
     * @tc.name testUint8ArrayEvery098
     * @tc.desc Verify [255,255,255] all elements > 0 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(255, 255, 255);
      const result = arr.every((v) => v > 0);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_0990
     * @tc.name testUint8ArrayEvery099
     * @tc.desc Verify [127,128] all elements > 126 and < 129 returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(127, 128);
      const result = arr.every((v) => v > 126 && v < 129);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1000
     * @tc.name testUint8ArrayEvery100
     * @tc.desc Verify [127,128] odd condition 128 even not satisfy returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(127, 128);
      const result = arr.every((v) => v % 2 === 1);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1010
     * @tc.name testUint8ArrayEvery101
     * @tc.desc Verify [10,10,10,10] index < 2 on 4 elements returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 10, 10, 10);
      const result = arr.every((v, idx) => idx < 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1020
     * @tc.name testUint8ArrayEvery102
     * @tc.desc Verify [10,10,10,10] index >= 2 on 4 elements returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(10, 10, 10, 10);
      const result = arr.every((v, idx) => idx >= 2);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1030
     * @tc.name testUint8ArrayEvery103
     * @tc.desc Verify [5,5,5,5,5] all index in [0,5) range returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 5, 5, 5, 5);
      const result = arr.every((v, idx) => idx >= 0 && idx < 5);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1040
     * @tc.name testUint8ArrayEvery104
     * @tc.desc Verify [5,5,5,5,5] index < 4 fails at index 4 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery104', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(5, 5, 5, 5, 5);
      const result = arr.every((v, idx) => idx < 4);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1050
     * @tc.name testUint8ArrayEvery105
     * @tc.desc Verify [0,127] even condition fails at 127 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery105', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(0, 127);
      const result = arr.every((v) => v % 2 === 0);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1060
     * @tc.name testUint8ArrayEvery106
     * @tc.desc Verify [1,2,3,4,5] predicate v === i + 1 all match returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery106', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const result = arr.every((v, idx) => v === idx + 1);
      expect(result).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1070
     * @tc.name testUint8ArrayEvery107
     * @tc.desc Verify [1,2,3,4,5] predicate v === i fails at index 0 returns false
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery107', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const result = arr.every((v, idx) => v === idx);
      expect(result).assertFalse();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_EVERY_1080
     * @tc.name testUint8ArrayEvery108
     * @tc.desc Verify [1,2,3,4,5] predicate v > i all match returns true
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayEvery108', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr = Uint8Array.of(1, 2, 3, 4, 5);
      const result = arr.every((v, idx) => v > idx);
      expect(result).assertTrue();
    });
  });
}