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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from '../Util.test';

export default function uint16ArrayEvery01Test(): void {
  describe('Uint16ArrayEvery01Test', () => {
    beforeAll(() => {
    });

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0001
     * @tc.name testUint16ArrayEveryOne001
     * @tc.desc Verify [1,2,3] 1 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v >= 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0002
     * @tc.name testUint16ArrayEveryOne002
     * @tc.desc Verify [0,0,0] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0003
     * @tc.name testUint16ArrayEveryOne003
     * @tc.desc Verify [65535,65535] 65535 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535, 65535);
        let result: boolean = arr.every((v: number): boolean => v === 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0004
     * @tc.name testUint16ArrayEveryOne004
     * @tc.desc Verify [1] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0005
     * @tc.name testUint16ArrayEveryOne005
     * @tc.desc Verify [0] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0006
     * @tc.name testUint16ArrayEveryOne006
     * @tc.desc Verify [65535] 65535 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v <= 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0007
     * @tc.name testUint16ArrayEveryOne007
     * @tc.desc Verify [100,200,300] 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100, 200, 300);
        let result: boolean = arr.every((v: number): boolean => v >= 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0008
     * @tc.name testUint16ArrayEveryOne008
     * @tc.desc Verify [32768,40000,50000] 30000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(32768, 40000, 50000);
        let result: boolean = arr.every((v: number): boolean => v > 30000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0009
     * @tc.name testUint16ArrayEveryOne009
     * @tc.desc Verify [1,65535,32768] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 65535, 32768);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0010
     * @tc.name testUint16ArrayEveryOne010
     * @tc.desc Verify [10,20,30,40,50] 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30, 40, 50);
        let result: boolean = arr.every((v: number): boolean => v < 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0011
     * @tc.name testUint16ArrayEveryOne011
     * @tc.desc Verify [1,2,3,4,5] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0012
     * @tc.name testUint16ArrayEveryOne012
     * @tc.desc Verify 0xFF,0x7F,0x00 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFF, 0x7F, 0x00);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0013
     * @tc.name testUint16ArrayEveryOne013
     * @tc.desc Verify 0o77777,0o100000,0o177777 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0o77777, 0o100000, 0o177777);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0014
     * @tc.name testUint16ArrayEveryOne014
     * @tc.desc Verify 0b1,0b10,0b100 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0b1, 0b10, 0b100);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0015
     * @tc.name testUint16ArrayEveryOne015
     * @tc.desc Verify [10000,20000,30000] 5000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10000, 20000, 30000);
        let result: boolean = arr.every((v: number): boolean => v > 5000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0016
     * @tc.name testUint16ArrayEveryOne016
     * @tc.desc Verify [0xFFFF] 0xFFFF every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFFFF);
        let result: boolean = arr.every((v: number): boolean => v === 0xFFFF);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0017
     * @tc.name testUint16ArrayEveryOne017
     * @tc.desc Verify [1,1,1,1] 1 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 1, 1);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0018
     * @tc.name testUint16ArrayEveryOne018
     * @tc.desc Verify [2,4,6,8] every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(2, 4, 6, 8);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0019
     * @tc.name testUint16ArrayEveryOne019
     * @tc.desc Verify [1,3,5,7] every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 3, 5, 7);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 1);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0020
     * @tc.name testUint16ArrayEveryOne020
     * @tc.desc Verify [0,0xFFFF,0x8000] 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0xFFFF, 0x8000);
        let result: boolean = arr.every((v: number): boolean => v >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0021
     * @tc.name testUint16ArrayEveryOne021
     * @tc.desc Verify [50000,50000] 50000 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(50000, 50000);
        let result: boolean = arr.every((v: number): boolean => v >= 50000);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0022
     * @tc.name testUint16ArrayEveryOne022
     * @tc.desc Verify [4,5,6] 5 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(4, 5, 6);
        let result: boolean = arr.every((v: number): boolean => v > 5);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0023
     * @tc.name testUint16ArrayEveryOne023
     * @tc.desc Verify [1,2,3] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0024
     * @tc.name testUint16ArrayEveryOne024
     * @tc.desc Verify [0,1,2] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 2);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0025
     * @tc.name testUint16ArrayEveryOne025
     * @tc.desc Verify [0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0026
     * @tc.name testUint16ArrayEveryOne026
     * @tc.desc Verify [1] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0027
     * @tc.name testUint16ArrayEveryOne027
     * @tc.desc Verify [65535] 65535 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v < 65535);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0028
     * @tc.name testUint16ArrayEveryOne028
     * @tc.desc Verify [65535,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535, 0);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0029
     * @tc.name testUint16ArrayEveryOne029
     * @tc.desc Verify [100,200,300] 500 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100, 200, 300);
        let result: boolean = arr.every((v: number): boolean => v > 500);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0030
     * @tc.name testUint16ArrayEveryOne030
     * @tc.desc Verify [1,2,3,4,5] 10 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let result: boolean = arr.every((v: number): boolean => v > 10);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0031
     * @tc.name testUint16ArrayEveryOne031
     * @tc.desc Verify 0xFFFF,0x0000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFFFF, 0x0000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0032
     * @tc.name testUint16ArrayEveryOne032
     * @tc.desc Verify 0o177777,0o000000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0o177777, 0o000000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0033
     * @tc.name testUint16ArrayEveryOne033
     * @tc.desc Verify 0b1111111111111111,0b0000000000000000 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0b1111111111111111, 0b0000000000000000);
        let result: boolean = arr.every((v: number): boolean => v !== 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0034
     * @tc.name testUint16ArrayEveryOne034
     * @tc.desc Verify [10000,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10000, 0);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0035
     * @tc.name testUint16ArrayEveryOne035
     * @tc.desc Verify [1,1,2] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 2);
        let result: boolean = arr.every((v: number): boolean => v === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0036
     * @tc.name testUint16ArrayEveryOne036
     * @tc.desc Verify [1] 1 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1);
        let result: boolean = arr.every((v: number): boolean => v > 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0037
     * @tc.name testUint16ArrayEveryOne037
     * @tc.desc Verify [65535] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(65535);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0038
     * @tc.name testUint16ArrayEveryOne038
     * @tc.desc Verify [0,0,1] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 0, 1);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0039
     * @tc.name testUint16ArrayEveryOne039
     * @tc.desc Verify [1,0,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 0, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0040
     * @tc.name testUint16ArrayEveryOne040
     * @tc.desc Verify [0,1,0] 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 0);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0041
     * @tc.name testUint16ArrayEveryOne041
     * @tc.desc Verify [2,4,6,7] every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(2, 4, 6, 7);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0042
     * @tc.name testUint16ArrayEveryOne042
     * @tc.desc Verify [1,3,5,6] every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 3, 5, 6);
        let result: boolean = arr.every((v: number): boolean => v % 2 === 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0043
     * @tc.name testUint16ArrayEveryOne043
     * @tc.desc Verify [100] 200 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(100);
        let result: boolean = arr.every((v: number): boolean => v > 200);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0044
     * @tc.name testUint16ArrayEveryOne044
     * @tc.desc Verify [50000] 50000 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(50000);
        let result: boolean = arr.every((v: number): boolean => v < 50000);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0045
     * @tc.name testUint16ArrayEveryOne045
     * @tc.desc Verify every(() => false) true vacuous truth
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array();
        let result: boolean = arr.every((): boolean => false);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0046
     * @tc.name testUint16ArrayEveryOne046
     * @tc.desc Verify element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let capturedV: number = 0;
        arr.every((v: number, i: int): boolean => {
          capturedV = v;
          return false;
        });
        expect(capturedV).assertEqual(10);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0047
     * @tc.name testUint16ArrayEveryOne047
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let capturedI: int = -1;
        arr.every((v: number, i: int): boolean => {
          capturedI = i;
          return false;
        });
        expect(capturedI).assertEqual(0);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0048
     * @tc.name testUint16ArrayEveryOne048
     * @tc.desc Verify index 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let prevI: int = -1;
        let monotonic: boolean = true;
        let callCount: int = 0;
        let result: boolean = arr.every((v: number, i: int): boolean => {
          if (i !== prevI + 1) {
            monotonic = false;
          }
          prevI = i;
          callCount++;
          return true;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
        expect(prevI).assertEqual(2);
        expect(monotonic).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0049
     * @tc.name testUint16ArrayEveryOne049
     * @tc.desc Verify index length-1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let lastI: int = -1;
        arr.every((v: number, i: int): boolean => {
          lastI = i;
          return true;
        });
        expect(lastI).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0050
     * @tc.name testUint16ArrayEveryOne050
     * @tc.desc Verify array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let arrayCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          arrayCheck = (a === arr);
          return false;
        });
        expect(arrayCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0051
     * @tc.name testUint16ArrayEveryOne051
     * @tc.desc Verify array.length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let lenCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          lenCheck = (a.length === 3);
          return false;
        });
        expect(lenCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0052
     * @tc.name testUint16ArrayEveryOne052
     * @tc.desc Verify array[index] element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let elemCheck: boolean = false;
        arr.every((v: number, i: int, a: Uint16Array): boolean => {
          elemCheck = (a[i] === v);
          return false;
        });
        expect(elemCheck).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0053
     * @tc.name testUint16ArrayEveryOne053
     * @tc.desc Verify every invokes the predicate for all three elements when all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(4, 5, 6);
        let callCount: int = 0;
        arr.every((v: number): boolean => {
          callCount++;
          return true;
        });
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0054
     * @tc.name testUint16ArrayEveryOne054
     * @tc.desc Verify [1,0,2] every>0 index 1 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 0, 2);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(2);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0055
     * @tc.name testUint16ArrayEveryOne055
     * @tc.desc Verify [0,1,2] every>0 index 0 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 1, 2);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0056
     * @tc.name testUint16ArrayEveryOne056
     * @tc.desc Verify [0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(1);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0057
     * @tc.name testUint16ArrayEveryOne057
     * @tc.desc Verify [1,2,3] 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertTrue();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0058
     * @tc.name testUint16ArrayEveryOne058
     * @tc.desc Verify [1,1,0,1] index 2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 1, 0, 1);
        let callCount: int = 0;
        let result: boolean = arr.every((v: number): boolean => {
          callCount++;
          return v > 0;
        });
        expect(result).assertFalse();
        expect(callCount).assertEqual(3);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0059
     * @tc.name testUint16ArrayEveryOne059
     * @tc.desc Verify 100 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arr[i] = 1;
        }
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0060
     * @tc.name testUint16ArrayEveryOne060
     * @tc.desc Verify 100 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(100);
        for (let i: int = 0; i < 100; i++) {
          arr[i] = 1;
        }
        arr[0] = 0;
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0061
     * @tc.name testUint16ArrayEveryOne061
     * @tc.desc Verify index every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i < arr.length);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0062
     * @tc.name testUint16ArrayEveryOne062
     * @tc.desc Verify index 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i >= 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0063
     * @tc.name testUint16ArrayEveryOne063
     * @tc.desc Verify index 0 index 0 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i > 0);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0064
     * @tc.name testUint16ArrayEveryOne064
     * @tc.desc Verify index 1 index 1+ every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => i < 1);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0065
     * @tc.name testUint16ArrayEveryOne065
     * @tc.desc Verify index element every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int): boolean => (i === 0 && v === 10) || i > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0066
     * @tc.name testUint16ArrayEveryOne066
     * @tc.desc Verify a[i] v every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a[i] === v);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0067
     * @tc.name testUint16ArrayEveryOne067
     * @tc.desc Verify a.length i every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a.length > i);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0068
     * @tc.name testUint16ArrayEveryOne068
     * @tc.desc Verify a Uint16Array every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a instanceof Uint16Array);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0069
     * @tc.name testUint16ArrayEveryOne069
     * @tc.desc Verify a.BYTES_PER_ELEMENT 2 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => a.BYTES_PER_ELEMENT === 2);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0070
     * @tc.name testUint16ArrayEveryOne070
     * @tc.desc Verify [1,50,99] 0 100 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 50, 99);
        let result: boolean = arr.every((v: number): boolean => v > 0 && v < 100);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0071
     * @tc.name testUint16ArrayEveryOne071
     * @tc.desc Verify [1,100,99] 0 100 100 100 every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 100, 99);
        let result: boolean = arr.every((v: number): boolean => v > 0 && v < 100);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0072
     * @tc.name testUint16ArrayEveryOne072
     * @tc.desc Verify [0x100,0x200,0x300] 0xFF every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0x100, 0x200, 0x300);
        let result: boolean = arr.every((v: number): boolean => v > 0xFF);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0073
     * @tc.name testUint16ArrayEveryOne073
     * @tc.desc Verify [0xFF,0x100] 0xFF every false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0xFF, 0x100);
        let result: boolean = arr.every((v: number): boolean => v > 0xFF);
        expect(result).assertFalse();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0074
     * @tc.name testUint16ArrayEveryOne074
     * @tc.desc Verify [0,65535,32768] Uint16 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(0, 65535, 32768);
        let result: boolean = arr.every((v: number): boolean => v >= 0 && v <= 65535);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0075
     * @tc.name testUint16ArrayEveryOne075
     * @tc.desc Verify [10,20,30] typeof number every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number): boolean => typeof v === 'number');
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0076
     * @tc.name testUint16ArrayEveryOne076
     * @tc.desc Verify new Uint16Array(5) 0 every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(5);
        let result: boolean = arr.every((v: number): boolean => v === 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0077
     * @tc.name testUint16ArrayEveryOne077
     * @tc.desc Verify new Uint16Array([10,20,30]) FixedArray every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array([10, 20, 30]);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0078
     * @tc.name testUint16ArrayEveryOne078
     * @tc.desc Verify Uint16Array.of(1,2,3) every true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let result: boolean = arr.every((v: number): boolean => v > 0);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0079
     * @tc.name testUint16ArrayEveryOne079
     * @tc.desc Verify every
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let threshold: number = 5;
        let result: boolean = arr.every((v: number): boolean => v > threshold);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0080
     * @tc.name testUint16ArrayEveryOne080
     * @tc.desc Verify every visits all elements and accumulates their sum when predicate returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let sum: number = 0;
        arr.every((v: number): boolean => {
          sum = sum + v;
          return true;
        });
        expect(sum).assertEqual(60);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0081
     * @tc.name testUint16ArrayEveryOne081
     * @tc.desc Verify every callback can double the current element through the array parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(10, 20, 30);
        let result: boolean = arr.every((v: number, i: int, a: Uint16Array): boolean => {
          a[i] = v * 2;
          return true;
        });
        expect(result).assertTrue();
        expect(arr.at(0)).assertEqual(20);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0082
     * @tc.name testUint16ArrayEveryOne082
     * @tc.desc Verify every on subarray view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(5, 10, 15, 20, 25);
        let view: Uint16Array = arr.subarray(1, 4);
        let result: boolean = view.every((v: number): boolean => v >= 10);
        expect(result).assertTrue();
        expect(view.length).assertEqual(3);
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0083
     * @tc.name testUint16ArrayEveryOne083
     * @tc.desc Verify predicate throws error is propagated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3);
        let callCount: int = 0;
        const markerError = new Error('test error');
        try {
          arr.every((v: number): boolean => {
            callCount++;
            throw markerError;
          });
          expect().assertFail();
        } catch (e) {
          expect(e).assertEqual(markerError);
          expect(callCount).assertEqual(1);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0084
     * @tc.name testUint16ArrayEveryOne084
     * @tc.desc Verify every does not modify original array when predicate is read-only
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        let original: Uint16Array = Uint16Array.of(1, 2, 3, 4, 5);
        arr.every((v: number): boolean => v > 0);
        expect(arr.length).assertEqual(original.length);
        for (let i: int = 0; i < arr.length; i++) {
          expect(arr[i]).assertEqual(original[i]);
        }
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0085
     * @tc.name testUint16ArrayEveryOne085
     * @tc.desc Verify every on array after fill()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(5);
        arr.fill(42);
        let result: boolean = arr.every((v: number): boolean => v === 42);
        expect(result).assertTrue();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT16ARRAY_EVERY_ONE_0086
     * @tc.name testUint16ArrayEveryOne086
     * @tc.desc Verify every on array after set()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint16ArrayEveryOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      {
        let arr: Uint16Array = new Uint16Array(4);
        arr.set([10, 20, 30], 0);
        let result: boolean = arr.every((v: number, i: int): boolean => i < 3 ? v === (i + 1) * 10 : v === 0);
        expect(result).assertTrue();
      }
    });

  });
}
