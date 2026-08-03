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

export default function Uint8ArrayFindIndexTest(): void {
  describe('Uint8ArrayFindIndexTest', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0010
     * @tc.name testUint8ArrayFindIndex001
     * @tc.desc Verify findIndex with 1 parameter and normal call returns expected value
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0020
     * @tc.name testUint8ArrayFindIndex002
     * @tc.desc Verify findIndex callback declares 4 parameters, the 4th is undefined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let extraParam: boolean = false;
      arr.findIndex((value: number, index: int, array: Uint8Array): boolean => {
        extraParam = true;
        return value === 2;
      });
      expect(extraParam).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0030
     * @tc.name testUint8ArrayFindIndex003
     * @tc.desc Verify empty array findIndex with callback returns -1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: int = arr.findIndex((value: number): boolean => true);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0040
     * @tc.name testUint8ArrayFindIndex004
     * @tc.desc Verify value===0 match, array [0,1,2] finds 0 returns index=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0050
     * @tc.name testUint8ArrayFindIndex005
     * @tc.desc Verify value===255 match, array [0,128,255] finds 255 returns index=2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      const result: int = arr.findIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0060
     * @tc.name testUint8ArrayFindIndex006
     * @tc.desc Verify value>0 match, array [0,1,2] returns index=1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value > 0);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0070
     * @tc.name testUint8ArrayFindIndex007
     * @tc.desc Verify value>200 match, array [50,150,250] returns index=2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(50, 150, 250);
      const result: int = arr.findIndex((value: number): boolean => value > 200);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0080
     * @tc.name testUint8ArrayFindIndex008
     * @tc.desc Verify value===0xFF(255) hexadecimal literal match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 100, 0xFF);
      const result: int = arr.findIndex((value: number): boolean => value === 0xFF);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0090
     * @tc.name testUint8ArrayFindIndex009
     * @tc.desc Verify value>127 match, array [0,100,200] finds 200
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 100, 200);
      const result: int = arr.findIndex((value: number): boolean => value > 127);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0100
     * @tc.name testUint8ArrayFindIndex010
     * @tc.desc Verify value>=128 match, array [127,128,129] finds 128
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 128, 129);
      const result: int = arr.findIndex((value: number): boolean => value >= 128);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0110
     * @tc.name testUint8ArrayFindIndex011
     * @tc.desc Verify value<100 match, array [200,50,100] finds 50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(200, 50, 100);
      const result: int = arr.findIndex((value: number): boolean => value < 100);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0120
     * @tc.name testUint8ArrayFindIndex012
     * @tc.desc Verify value%2===0 match even value, array [1,2,3] finds 2
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0130
     * @tc.name testUint8ArrayFindIndex013
     * @tc.desc Verify value%2===1 match odd value, array [2,4,5] finds 5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 4, 5);
      const result: int = arr.findIndex((value: number): boolean => value % 2 === 1);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0140
     * @tc.name testUint8ArrayFindIndex014
     * @tc.desc Verify value!==0 match non-zero, array [0,0,3] finds 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 3);
      const result: int = arr.findIndex((value: number): boolean => value !== 0);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0150
     * @tc.name testUint8ArrayFindIndex015
     * @tc.desc Verify value>100 and value<200 combined condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 100, 150, 200);
      const result: int = arr.findIndex((value: number): boolean => value > 100 && value < 200);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0160
     * @tc.name testUint8ArrayFindIndex016
     * @tc.desc Verify value===0x80(128) hexadecimal match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0x80, 200);
      const result: int = arr.findIndex((value: number): boolean => value === 0x80);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0170
     * @tc.name testUint8ArrayFindIndex017
     * @tc.desc Verify value===127 mid-value match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 127, 255);
      const result: int = arr.findIndex((value: number): boolean => value === 127);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0180
     * @tc.name testUint8ArrayFindIndex018
     * @tc.desc Verify value<=1 match, array [0,1,2] returns first satisfying index=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value <= 1);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0190
     * @tc.name testUint8ArrayFindIndex019
     * @tc.desc Verify value>=0 always true, returns first element index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42, 7, 99);
      const result: int = arr.findIndex((value: number): boolean => value >= 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0200
     * @tc.name testUint8ArrayFindIndex020
     * @tc.desc Verify index===0 match first element, returns index=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 300);
      const result: int = arr.findIndex((value: number, index: int): boolean => index === 0);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0210
     * @tc.name testUint8ArrayFindIndex021
     * @tc.desc Verify index===length-1 match last element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => index === array.length - 1);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0220
     * @tc.name testUint8ArrayFindIndex022
     * @tc.desc Verify index===2 match third element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15, 20);
      const result: int = arr.findIndex((value: number, index: int): boolean => index === 2);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0230
     * @tc.name testUint8ArrayFindIndex023
     * @tc.desc Verify index%2===0 match even index, returns first even index 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: int = arr.findIndex((value: number, index: int): boolean => index % 2 === 0);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0240
     * @tc.name testUint8ArrayFindIndex024
     * @tc.desc Verify index%2===1 match odd index, returns first odd index 1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const result: int = arr.findIndex((value: number, index: int): boolean => index % 2 === 1);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0250
     * @tc.name testUint8ArrayFindIndex025
     * @tc.desc Verify index>2 match, returns first index>2 element index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findIndex((value: number, index: int): boolean => index > 2);
      expect(result).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0260
     * @tc.name testUint8ArrayFindIndex026
     * @tc.desc Verify index<2 match, returns first index<2 element index
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 300, 400);
      const result: int = arr.findIndex((value: number, index: int): boolean => index < 2);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0270
     * @tc.name testUint8ArrayFindIndex027
     * @tc.desc Verify index>=2 and index<=3 combined range match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findIndex((value: number, index: int): boolean => index >= 2 && index <= 3);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0280
     * @tc.name testUint8ArrayFindIndex028
     * @tc.desc Verify array parameter reference is same as original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let sameRef: boolean = false;
      arr.findIndex((value: number, index: int, array: Uint8Array): boolean => {
        sameRef = array === arr;
        return false;
      });
      expect(sameRef).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0290
     * @tc.name testUint8ArrayFindIndex029
     * @tc.desc Verify array.length equals 3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(4, 5, 6);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => array.length === 3);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0300
     * @tc.name testUint8ArrayFindIndex030
     * @tc.desc Verify array[index]===value element position consistency
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => array[index] === value);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0310
     * @tc.name testUint8ArrayFindIndex031
     * @tc.desc Verify array.byteLength property value is 4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      let byteLen: number = 0;
      arr.findIndex((value: number, index: int, array: Uint8Array): boolean => {
        byteLen = array.byteLength;
        return false;
      });
      expect(byteLen).assertEqual(4);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0320
     * @tc.name testUint8ArrayFindIndex032
     * @tc.desc Verify reading adjacent element via array[index+1] for condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => {
        if (index < array.length - 1) {
          return value === array[index + 1] - 1;
        }
        return false;
      });
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0330
     * @tc.name testUint8ArrayFindIndex033
     * @tc.desc Verify value and index combined condition value+index>55
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 52);
      const result: int = arr.findIndex((value: number, index: int): boolean => value + index > 55);
      expect(result).assertEqual(4);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0340
     * @tc.name testUint8ArrayFindIndex034
     * @tc.desc Verify value>array[0] condition, starts matching from second element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(20, 25, 30, 15);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => value > array[0]);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0350
     * @tc.name testUint8ArrayFindIndex035
     * @tc.desc Verify value>2 and index<4 and array.length===5 three conditions combined
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findIndex((value: number, index: int, array: Uint8Array): boolean => {
        return value > 2 && index < 4 && array.length === 5;
      });
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0360
     * @tc.name testUint8ArrayFindIndex036
     * @tc.desc Verify value*index>100 condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const result: int = arr.findIndex((value: number, index: int): boolean => value * index > 100);
      expect(result).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0370
     * @tc.name testUint8ArrayFindIndex037
     * @tc.desc Verify value>index condition
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 3, 2);
      const result: int = arr.findIndex((value: number, index: int): boolean => value > index);
      expect(result).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0380
     * @tc.name testUint8ArrayFindIndex038
     * @tc.desc Verify callback only uses value, ignores index and array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 15);
      const result: int = arr.findIndex((value: number): boolean => value === 10);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0390
     * @tc.name testUint8ArrayFindIndex039
     * @tc.desc Verify callback uses value and index, ignores array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number, index: int): boolean => value === 2 && index === 1);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0400
     * @tc.name testUint8ArrayFindIndex040
     * @tc.desc Verify callback uses arrow function concise body returning expression
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 4, 6);
      const result: int = arr.findIndex((value: number): boolean => value % 2 === 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0410
     * @tc.name testUint8ArrayFindIndex041
     * @tc.desc Verify value>255 never found, uint8 max value 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 100, 200, 255);
      const result: int = arr.findIndex((value: number): boolean => value > 255);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0420
     * @tc.name testUint8ArrayFindIndex042
     * @tc.desc Verify value<0 never found, uint8 min value 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 50, 100);
      const result: int = arr.findIndex((value: number): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0430
     * @tc.name testUint8ArrayFindIndex043
     * @tc.desc Verify value===-1 not exists in uint8 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 255);
      const result: int = arr.findIndex((value: number): boolean => value === -1);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0440
     * @tc.name testUint8ArrayFindIndex044
     * @tc.desc Verify empty array findIndex never finds
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array();
      const result: int = arr.findIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0450
     * @tc.name testUint8ArrayFindIndex045
     * @tc.desc Verify single element array condition not matched
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(50);
      const result: int = arr.findIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0460
     * @tc.name testUint8ArrayFindIndex046
     * @tc.desc Verify Uint8Array.of(500) stores 244 and findIndex finds value 244
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(500);
      const result: int = arr.findIndex((value: number): boolean => value === 244);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0470
     * @tc.name testUint8ArrayFindIndex047
     * @tc.desc Verify callback always returns false not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(0);
      const result: int = arr.findIndex((value: number): boolean => false);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0480
     * @tc.name testUint8ArrayFindIndex048
     * @tc.desc Verify all-zero array find >0 not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 0);
      const result: int = arr.findIndex((value: number): boolean => value > 0);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0490
     * @tc.name testUint8ArrayFindIndex049
     * @tc.desc Verify all-255 array find <0 not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 255);
      const result: int = arr.findIndex((value: number): boolean => value < 0);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0500
     * @tc.name testUint8ArrayFindIndex050
     * @tc.desc Verify index>100 not found on small array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findIndex((value: number, index: int): boolean => index > 100);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0510
     * @tc.name testUint8ArrayFindIndex051
     * @tc.desc Verify contradictory condition value>200 and value<50 not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 150, 200);
      const result: int = arr.findIndex((value: number): boolean => value > 200 && value < 50);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0520
     * @tc.name testUint8ArrayFindIndex052
     * @tc.desc Verify NaN self-comparison (v!==v) not found in uint8 array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number): boolean => value !== value);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0530
     * @tc.name testUint8ArrayFindIndex053
     * @tc.desc Verify empty ArrayBuffer constructed array not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf: ArrayBuffer = new ArrayBuffer(0);
      const arr: Uint8Array = new Uint8Array(buf);
      const result: int = arr.findIndex((value: number): boolean => true);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0540
     * @tc.name testUint8ArrayFindIndex054
     * @tc.desc Verify index===-1 negative index not found on small array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number, index: int): boolean => index === -1);
      expect(result).assertEqual(-1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0550
     * @tc.name testUint8ArrayFindIndex055
     * @tc.desc Verify traversal order from index 0 to length-1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const visitedIndices: int[] = [];
      arr.findIndex((value: number, index: int): boolean => {
        visitedIndices.push(index);
        return false;
      });
      expect(visitedIndices.length).assertEqual(5);
      expect(visitedIndices[0]).assertEqual(0);
      expect(visitedIndices[1]).assertEqual(1);
      expect(visitedIndices[2]).assertEqual(2);
      expect(visitedIndices[3]).assertEqual(3);
      expect(visitedIndices[4]).assertEqual(4);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0560
     * @tc.name testUint8ArrayFindIndex056
     * @tc.desc Verify traversal stops at first match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return value === 3;
      });
      expect(result).assertEqual(2);
      expect(visitedCount).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0570
     * @tc.name testUint8ArrayFindIndex057
     * @tc.desc Verify traversal visits all elements when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(visitedCount).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0580
     * @tc.name testUint8ArrayFindIndex058
     * @tc.desc Verify traversal order on single element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42);
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return value === 42;
      });
      expect(result).assertEqual(0);
      expect(visitedCount).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0590
     * @tc.name testUint8ArrayFindIndex059
     * @tc.desc Verify traversal order on two element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const visitedIndices: int[] = [];
      arr.findIndex((value: number, index: int): boolean => {
        visitedIndices.push(index);
        return false;
      });
      expect(visitedIndices.length).assertEqual(2);
      expect(visitedIndices[0]).assertEqual(0);
      expect(visitedIndices[1]).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0600
     * @tc.name testUint8ArrayFindIndex060
     * @tc.desc Verify traversal stops at first match on large array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return value === 5;
      });
      expect(result).assertEqual(4);
      expect(visitedCount).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0610
     * @tc.name testUint8ArrayFindIndex061
     * @tc.desc Verify traversal visits all elements on large array when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(visitedCount).assertEqual(10);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0620
     * @tc.name testUint8ArrayFindIndex062
     * @tc.desc Verify traversal stops at first match on 100-element array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.set([i], i);
      }
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return value === 50;
      });
      expect(result).assertEqual(50);
      expect(visitedCount).assertEqual(51);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0630
     * @tc.name testUint8ArrayFindIndex063
     * @tc.desc Verify traversal visits all elements on 100-element array when no match
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.set([i], i);
      }
      let visitedCount: int = 0;
      const result: int = arr.findIndex((value: number): boolean => {
        visitedCount++;
        return false;
      });
      expect(result).assertEqual(-1);
      expect(visitedCount).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0640
     * @tc.name testUint8ArrayFindIndex064
     * @tc.desc Verify findIndex returns number type when element is found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 15, 25);
      const result: int = arr.findIndex((value: number): boolean => value === 15);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0650
     * @tc.name testUint8ArrayFindIndex065
     * @tc.desc Verify findIndex returns number type when element is not found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: int = arr.findIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(-1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0660
     * @tc.name testUint8ArrayFindIndex066
     * @tc.desc Verify findIndex returns number type with hexadecimal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number): boolean => value === 0x0A);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0670
     * @tc.name testUint8ArrayFindIndex067
     * @tc.desc Verify findIndex returns number type with binary comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value > 0b0);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0680
     * @tc.name testUint8ArrayFindIndex068
     * @tc.desc Verify findIndex returns number type with octal comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 8, 16);
      const result: int = arr.findIndex((value: number): boolean => value === 0o10);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0690
     * @tc.name testUint8ArrayFindIndex069
     * @tc.desc Verify findIndex returns number type with scientific notation
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 100, 200);
      const result: int = arr.findIndex((value: number): boolean => value === 1e2);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0700
     * @tc.name testUint8ArrayFindIndex070
     * @tc.desc Verify findIndex returns number type with negative comparison
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 50, 100);
      const result: int = arr.findIndex((value: number): boolean => value > -1);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0710
     * @tc.name testUint8ArrayFindIndex071
     * @tc.desc Verify callback throws Error with message 'test error', findIndex propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error('test error');
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual('test error');
      }
      expect(caught).assertTrue();
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0720
     * @tc.name testUint8ArrayFindIndex072
     * @tc.desc Verify callback throws Error with message 'string error', findIndex propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error('string error');
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual('string error');
      }
      expect(caught).assertTrue();
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0730
     * @tc.name testUint8ArrayFindIndex073
     * @tc.desc Verify callback throws Error with message '42', findIndex propagates
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error('42');
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
        expect((e as Error).message).assertEqual('42');
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0740
     * @tc.name testUint8ArrayFindIndex074
     * @tc.desc Verify error thrown on first element, callback not called for subsequent elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let visitedCount: int = 0;
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          visitedCount++;
          if (visitedCount === 1) {
            throw new Error('error on first');
          }
          return false;
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
      }
      expect(caught).assertTrue();
      expect(visitedCount).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0750
     * @tc.name testUint8ArrayFindIndex075
     * @tc.desc Verify error thrown on second element, callback not called for third element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let visitedCount: int = 0;
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          visitedCount++;
          if (visitedCount === 2) {
            throw new Error('error on second');
          }
          return false;
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
      }
      expect(caught).assertTrue();
      expect(visitedCount).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0760
     * @tc.name testUint8ArrayFindIndex076
     * @tc.desc Verify error thrown on last element, all elements visited
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      let visitedCount: int = 0;
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          visitedCount++;
          if (visitedCount === 3) {
            throw new Error('error on last');
          }
          return false;
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
      }
      expect(caught).assertTrue();
      expect(visitedCount).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0770
     * @tc.name testUint8ArrayFindIndex077
     * @tc.desc Verify findIndex on single element array (length 1)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(42);
      const result: int = arr.findIndex((value: number): boolean => value === 42);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0780
     * @tc.name testUint8ArrayFindIndex078
     * @tc.desc Verify findIndex on two element array (length 2)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const result: int = arr.findIndex((value: number): boolean => value === 20);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0790
     * @tc.name testUint8ArrayFindIndex079
     * @tc.desc Verify findIndex on 100-element array (length 100)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(100);
      for (let i: int = 0; i < 100; i++) {
        arr.set([i], i);
      }
      const result: int = arr.findIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(99);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0800
     * @tc.name testUint8ArrayFindIndex080
     * @tc.desc Verify findIndex on 256-element array (length 256)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(256);
      for (let i: int = 0; i < 256; i++) {
        arr.set([i % 256], i);
      }
      const result: int = arr.findIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(255);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0810
     * @tc.name testUint8ArrayFindIndex081
     * @tc.desc Verify findIndex on 1000-element array (length 1000)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(1000);
      for (let i: int = 0; i < 1000; i++) {
        arr.set([i % 256], i);
      }
      const result: int = arr.findIndex((value: number): boolean => value === 100);
      expect(result).assertEqual(100);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0820
     * @tc.name testUint8ArrayFindIndex082
     * @tc.desc Verify findIndex on 10000-element array (length 10000)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(10000);
      for (let i: int = 0; i < 10000; i++) {
        arr.set([i % 256], i);
      }
      const result: int = arr.findIndex((value: number): boolean => value === 200);
      expect(result).assertEqual(200);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0830
     * @tc.name testUint8ArrayFindIndex083
     * @tc.desc Verify findIndex with value 0 (uint8 min value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 20);
      const result: int = arr.findIndex((value: number): boolean => value === 0);
      expect(result).assertEqual(0);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0840
     * @tc.name testUint8ArrayFindIndex084
     * @tc.desc Verify findIndex with value 255 (uint8 max value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 10, 255);
      const result: int = arr.findIndex((value: number): boolean => value === 255);
      expect(result).assertEqual(2);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0850
     * @tc.name testUint8ArrayFindIndex085
     * @tc.desc Verify findIndex with value 128 (mid-value)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 128, 255);
      const result: int = arr.findIndex((value: number): boolean => value === 128);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0860
     * @tc.name testUint8ArrayFindIndex086
     * @tc.desc Verify findIndex with value 1 (boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 1, 2);
      const result: int = arr.findIndex((value: number): boolean => value === 1);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0870
     * @tc.name testUint8ArrayFindIndex087
     * @tc.desc Verify findIndex with value 254 (boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(253, 254, 255);
      const result: int = arr.findIndex((value: number): boolean => value === 254);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0880
     * @tc.name testUint8ArrayFindIndex088
     * @tc.desc Verify findIndex with value 253 (boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(252, 253, 254);
      const result: int = arr.findIndex((value: number): boolean => value === 253);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0890
     * @tc.name testUint8ArrayFindIndex089
     * @tc.desc Verify findIndex with value 2 (boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: int = arr.findIndex((value: number): boolean => value === 2);
      expect(result).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0900
     * @tc.name testUint8ArrayFindIndex090
     * @tc.desc Verify findIndex with value 252 (boundary)
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(251, 252, 253);
      const result: int = arr.findIndex((value: number): boolean => value === 252);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0910
     * @tc.name testUint8ArrayFindIndex091
     * @tc.desc Verify findIndex does not modify array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findIndex((value: number): boolean => value === 3);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0920
     * @tc.name testUint8ArrayFindIndex092
     * @tc.desc Verify findIndex does not modify array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const originalLength: int = arr.length;
      arr.findIndex((value: number): boolean => value === 20);
      expect(arr.length).assertEqual(originalLength);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0930
     * @tc.name testUint8ArrayFindIndex093
     * @tc.desc Verify findIndex does not modify array byteLength
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const originalByteLength: int = arr.byteLength;
      arr.findIndex((value: number): boolean => value === 2);
      expect(arr.byteLength).assertEqual(originalByteLength);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0940
     * @tc.name testUint8ArrayFindIndex094
     * @tc.desc Verify findIndex does not modify array buffer
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 150);
      const originalBuffer: ArrayBuffer = arr.buffer;
      arr.findIndex((value: number): boolean => value === 200);
      expect(arr.buffer).assertEqual(originalBuffer);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0950
     * @tc.name testUint8ArrayFindIndex095
     * @tc.desc Verify findIndex does not modify array byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const originalByteOffset: int = arr.byteOffset;
      arr.findIndex((value: number): boolean => value === 3);
      expect(arr.byteOffset).assertEqual(originalByteOffset);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0960
     * @tc.name testUint8ArrayFindIndex096
     * @tc.desc Verify findIndex does not modify array when no match found
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: int = arr.findIndex((value: number): boolean => value > 100);
      expect(result).assertEqual(-1);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0970
     * @tc.name testUint8ArrayFindIndex097
     * @tc.desc Verify findIndex does not modify array when callback throws
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let caught: boolean = false;
      try {
        arr.findIndex((value: number): boolean => {
          throw new Error('test error');
        });
      } catch (e) {
        caught = true;
        expect((e as Error).name).assertEqual('Error');
      }
      expect(caught).assertTrue();
      expect(arr.at(0)).assertEqual(10);
      expect(arr.at(1)).assertEqual(20);
      expect(arr.at(2)).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0980
     * @tc.name testUint8ArrayFindIndex098
     * @tc.desc Verify findIndex on Uint8Array.from created array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const source: number[] = [10, 20, 30, 40, 50];
      const arr: Uint8Array = Uint8Array.from(source);
      const result: int = arr.findIndex((value: number): boolean => value > 35);
      expect(result).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_0990
     * @tc.name testUint8ArrayFindIndex099
     * @tc.desc Verify findIndex on ArrayBuffer constructed Uint8Array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(5);
      const arr: Uint8Array = new Uint8Array(buffer);
      arr.set([100], 2);
      arr.set([100], 4);
      const result: int = arr.findIndex((value: number): boolean => value === 100);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_1000
     * @tc.name testUint8ArrayFindIndex100
     * @tc.desc Verify findIndex on subarray subview
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6, 7, 8);
      const sub: Uint8Array = arr.subarray(2, 6);
      const result: int = sub.findIndex((value: number): boolean => value === 5);
      expect(result).assertEqual(2);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_1010
     * @tc.name testUint8ArrayFindIndex101
     * @tc.desc Verify findIndex on ArrayBuffer view with byteOffset
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buffer: ArrayBuffer = new ArrayBuffer(10);
      const arr: Uint8Array = new Uint8Array(buffer, 2, 4);
      arr.set([99], 3);
      const result: int = arr.findIndex((value: number): boolean => value === 99);
      expect(result).assertEqual(3);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_1020
     * @tc.name testUint8ArrayFindIndex102
     * @tc.desc Verify findIndex then verify original array elements unchanged
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex102', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      arr.findIndex((value: number): boolean => value % 2 === 0);
      expect(arr.at(0)).assertEqual(1);
      expect(arr.at(1)).assertEqual(2);
      expect(arr.at(2)).assertEqual(3);
      expect(arr.at(3)).assertEqual(4);
      expect(arr.at(4)).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_FIND_INDEX_1030
     * @tc.name testUint8ArrayFindIndex103
     * @tc.desc Verify nested findIndex calls, inner and outer return correct results
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayFindIndex103', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      let innerResult: int = -1;
      const result: int = arr.findIndex((value: number, index: int): boolean => {
        if (value === 3) {
          innerResult = arr.findIndex((v: number): boolean => v === 5);
        }
        return value === 4;
      });
      expect(innerResult).assertEqual(4);
      expect(result).assertEqual(3);
    });
  });
}
