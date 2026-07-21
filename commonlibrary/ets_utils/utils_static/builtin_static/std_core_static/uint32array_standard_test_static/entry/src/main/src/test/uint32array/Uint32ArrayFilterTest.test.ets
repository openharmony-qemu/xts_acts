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

export default function uint32ArrayFilterTest(): void {
  describe('Uint32ArrayFilterTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0100
     * @tc.name testUint32ArrayFilterPartOne001
     * @tc.desc Verify filter arity=1 ( fn),
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(5, 10, 15);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 7);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(10);
      expect(res[1]).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0200
     * @tc.name testUint32ArrayFilterPartOne002
     * @tc.desc Verify arity=1 filter,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 0);
      expect(res.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0300
     * @tc.name testUint32ArrayFilterPartOne003
     * @tc.desc Verify arity=1 filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 42);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0400
     * @tc.name testUint32ArrayFilterPartOne004
     * @tc.desc Verify true literal,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(3, 7, 11);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => true);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(3);
      expect(res[2]).assertEqual(11);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0500
     * @tc.name testUint32ArrayFilterPartOne005
     * @tc.desc Verify val > ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 5, 9, 2);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 4);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(5);
      expect(res[1]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0600
     * @tc.name testUint32ArrayFilterPartOne006
     * @tc.desc Verify val === ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(2, 2, 3, 2);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 2);
      expect(res.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0700
     * @tc.name testUint32ArrayFilterPartOne007
     * @tc.desc Verify val !== ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(2, 2, 3, 2);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val !== 2);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0800
     * @tc.name testUint32ArrayFilterPartOne008
     * @tc.desc Verify val % 2 !== 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 6);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val % 2 !== 0);
      expect(res.length).assertEqual(2);
      expect(res[1]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_0900
     * @tc.name testUint32ArrayFilterPartOne009
     * @tc.desc Verify val > 0, uint32 boundary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 1, 4294967295);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 0);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(1);
      expect(res[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1000
     * @tc.name testUint32ArrayFilterPartOne010
     * @tc.desc Verify val === 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 5, 0, 9);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 0);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(0);
      expect(res[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1100
     * @tc.name testUint32ArrayFilterPartOne011
     * @tc.desc Verify val === uint32.MAX( ),
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 4294967295, 4294967295, 0);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 4294967295);
      expect(res.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1200
     * @tc.name testUint32ArrayFilterPartOne012
     * @tc.desc Verify val > MAX-1( 4294967294), MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4294967294, 4294967295, 0);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 4294967294);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(4294967295);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1300
     * @tc.name testUint32ArrayFilterPartOne013
     * @tc.desc Verify val * 2 > 10,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 5, 6, 2);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val * 2 > 10);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1400
     * @tc.name testUint32ArrayFilterPartOne014
     * @tc.desc Verify val > 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 7);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(8);
      expect(res[1]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1500
     * @tc.name testUint32ArrayFilterPartOne015
     * @tc.desc Verify val > 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 8);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(9);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1600
     * @tc.name testUint32ArrayFilterPartOne016
     * @tc.desc Verify [0],filter val === 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 0);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1700
     * @tc.name testUint32ArrayFilterPartOne017
     * @tc.desc Verify [4294967295]( MAX),filter val === MAX
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4294967295);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 4294967295);
      expect(res.length).assertEqual(1);
    });


    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1800
     * @tc.name testUint32ArrayFilterPartOne018
     * @tc.desc Verify [0o17]( 15),filter val === 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0o17);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 15);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(15);
    });


    
    
    
    
    
    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_1900
     * @tc.name testUint32ArrayFilterPartOne019
     * @tc.desc Verify [1, 2, 3, 4, 5],filter val >= 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val >= 3);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(3);
      expect(res[2]).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2000
     * @tc.name testUint32ArrayFilterPartOne020
     * @tc.desc Verify index === 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index === 0);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2100
     * @tc.name testUint32ArrayFilterPartOne021
     * @tc.desc Verify index === length-1,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40);
      const res: Uint32Array = src.filter(
        (val: number, index: int, array: Uint32Array): boolean => index === array.length - 1
      );
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2200
     * @tc.name testUint32ArrayFilterPartOne022
     * @tc.desc Verify index % 2 === 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(11, 22, 33, 44, 55);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index % 2 === 0);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(11);
      expect(res[2]).assertEqual(55);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2300
     * @tc.name testUint32ArrayFilterPartOne023
     * @tc.desc Verify index % 2 !== 0,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(11, 22, 33, 44, 55);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index % 2 !== 0);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(22);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2400
     * @tc.name testUint32ArrayFilterPartOne024
     * @tc.desc Verify index < 2,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9, 10);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index < 2);
      expect(res.length).assertEqual(2);
      expect(res[1]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2500
     * @tc.name testUint32ArrayFilterPartOne025
     * @tc.desc Verify index >= length-2,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 8, 9, 10);
      const res: Uint32Array = src.filter(
        (val: number, index: int, array: Uint32Array): boolean => index >= array.length - 2
      );
      expect(res.length).assertEqual(2);
      expect(res[1]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2600
     * @tc.name testUint32ArrayFilterPartOne026
     * @tc.desc Verify index !== val,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(0, 1, 5, 3);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index !== val);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(5);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2700
     * @tc.name testUint32ArrayFilterPartOne027
     * @tc.desc Verify index > 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(100, 200, 300, 400);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => index > 0);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(200);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2800
     * @tc.name testUint32ArrayFilterPartOne028
     * @tc.desc Verify index === length-1 val > 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(2, 4, 6, 8);
      const res: Uint32Array = src.filter(
        (val: number, index: int, array: Uint32Array): boolean => index === array.length - 1 && val > 5
      );
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_2900
     * @tc.name testUint32ArrayFilterPartOne029
     * @tc.desc Verify array.length,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      let captured: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        captured = array.length;
        return val > 2;
      });
      expect(captured).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3000
     * @tc.name testUint32ArrayFilterPartOne030
     * @tc.desc Verify array[index], val ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30);
      let consistent: boolean = true;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        if (array[index] !== val) {
          consistent = false;
        }
        return true;
      });
      expect(consistent).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3100
     * @tc.name testUint32ArrayFilterPartOne031
     * @tc.desc Verify array === ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      let sameRef: boolean = false;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        if (array === src) {
          sameRef = true;
        }
        return false;
      });
      expect(sameRef).assertTrue();
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3200
     * @tc.name testUint32ArrayFilterPartOne032
     * @tc.desc Verify array[0]( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(42, 1, 2);
      let firstVal: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        firstVal = array[0];
        return false;
      });
      expect(firstVal).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3300
     * @tc.name testUint32ArrayFilterPartOne033
     * @tc.desc Verify array.byteLength, length*4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      let bytes: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        bytes = array.byteLength;
        return false;
      });
      expect(bytes).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3400
     * @tc.name testUint32ArrayFilterPartOne034
     * @tc.desc Verify array.length-1 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 77);
      let lastVal: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        lastVal = array[array.length - 1];
        return false;
      });
      expect(lastVal).assertEqual(77);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3500
     * @tc.name testUint32ArrayFilterPartOne035
     * @tc.desc Verify array.length , val < length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val < array.length);
      expect(res.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3600
     * @tc.name testUint32ArrayFilterPartOne036
     * @tc.desc Verify RangeError,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2);
      try {
        src.filter((val: number, index: int, array: Uint32Array): boolean => {
          throw new RangeError('range');
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3700
     * @tc.name testUint32ArrayFilterPartOne037
     * @tc.desc Verify filter throws at index 1 visited count is 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30);
      let visited: number = 0;
      try {
        src.filter((val: number, index: int, array: Uint32Array): boolean => {
          visited = visited + 1;
          if (index === 1) {
            throw new Error('error');
          }
          return true;
        });
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('Error');
      }
      expect(visited).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3800
     * @tc.name testUint32ArrayFilterPartOne038
     * @tc.desc Verify filter threshold length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      let threshold: number = 3;
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > threshold);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_3900
     * @tc.name testUint32ArrayFilterPartOne039
     * @tc.desc Verify val >
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(2, 4, 6, 8, 10);
      let sum: number = 0;
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => {
        sum = sum + val;
        return val > sum / (index + 1);
      });
      expect(res.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4000
     * @tc.name testUint32ArrayFilterPartOne040
     * @tc.desc Verify val ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(5, 10, 15);
      let seq: string = '';
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        seq = seq + val + ',';
        return false;
      });
      expect(seq).assertEqual('5,10,15,');
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4100
     * @tc.name testUint32ArrayFilterPartOne041
     * @tc.desc Verify filter on empty array callback not called returns empty
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of();
      let called: boolean = false;
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => {
        called = true;
        return true;
      });
      expect(called).assertFalse();
      expect(res.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4200
     * @tc.name testUint32ArrayFilterPartOne042
     * @tc.desc Verify filter val===7 from [7] returns single element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val === 7);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(7);
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4300
     * @tc.name testUint32ArrayFilterPartOne043
     * @tc.desc Verify / ,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val % 2 === 0);
      expect(res.length).assertEqual(3);
      expect(res[0]).assertEqual(2);
      expect(res[1]).assertEqual(4);
      expect(res[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4400
     * @tc.name testUint32ArrayFilterPartOne044
     * @tc.desc Verify filter val>30 from [10,20,30,40,50] returns two elements
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 30);
      expect(res.length).assertEqual(2);
      expect(res[1]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4500
     * @tc.name testUint32ArrayFilterPartOne045
     * @tc.desc Verify filter val>30 from [50,40,30,20,10] returns [50,40]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(50, 40, 30, 20, 10);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 30);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(50);
      expect(res[1]).assertEqual(40);
    });


    
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4600
     * @tc.name testUint32ArrayFilterPartOne046
     * @tc.desc Verify filter val%2===0 from 50 elements returns 25 evens
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = new Uint32Array(50);
      for (let i = 0; i < 50; i++) {
        src[i] = i;
      }
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val % 2 === 0);
      expect(res.length).assertEqual(25);
      expect(res[0]).assertEqual(0);
      expect(res[24]).assertEqual(48);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4700
     * @tc.name testUint32ArrayFilterPartOne047
     * @tc.desc Verify filter val>50 from [100,1,2,3] returns [100]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(100, 1, 2, 3);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 50);
      expect(res.length).assertEqual(1);
      expect(res[0]).assertEqual(100);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4800
     * @tc.name testUint32ArrayFilterPartOne048
     * @tc.desc Verify filter aligned with src
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(11, 22, 33, 44);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val >= 22);
      expect(res[0]).assertEqual(src[1]);
      expect(res[1]).assertEqual(src[2]);
      expect(res[2]).assertEqual(src[3]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_4900
     * @tc.name testUint32ArrayFilterPartOne049
     * @tc.desc Verify filter val%2===0 from [1..6] byteLength equals 12
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5, 6);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val % 2 === 0);
      expect(res.length).assertEqual(3);
      expect(res.byteLength).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5000
     * @tc.name testUint32ArrayFilterPartOne050
     * @tc.desc Verify byteLength *4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(10, 20, 30, 40, 50);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 15);
      expect(res.length).assertEqual(4);
      expect(res.byteLength).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5100
     * @tc.name testUint32ArrayFilterPartOne051
     * @tc.desc Verify filter byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(30, 10, 50, 20, 40);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 25);
      expect(res[0]).assertEqual(30);
      expect(res[1]).assertEqual(50);
      expect(res[2]).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5200
     * @tc.name testUint32ArrayFilterPartOne052
     * @tc.desc Verify filter val<3 from [1,2,3] returns [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val < 3);
      expect(res.length).assertEqual(2);
      expect(res[0]).assertEqual(1);
      expect(res[1]).assertEqual(2);
    });


    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5300
     * @tc.name testUint32ArrayFilterPartOne053
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4, 5);
      const before: number = src.length;
      src.filter((val: number, index: int, array: Uint32Array): boolean => val > 2);
      expect(src.length).assertEqual(before);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5400
     * @tc.name testUint32ArrayFilterPartOne054
     * @tc.desc Verify filter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(11, 22, 33, 44);
      src.filter((val: number, index: int, array: Uint32Array): boolean => val > 20);
      expect(src[0]).assertEqual(11);
      expect(src[1]).assertEqual(22);
      expect(src[2]).assertEqual(33);
      expect(src[3]).assertEqual(44);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5500
     * @tc.name testUint32ArrayFilterPartOne055
     * @tc.desc Verify filter byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3);
      const beforeBytes: number = src.byteLength;
      src.filter((val: number, index: int, array: Uint32Array): boolean => val > 1);
      expect(src.byteLength).assertEqual(beforeBytes);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5600
     * @tc.name testUint32ArrayFilterPartOne056
     * @tc.desc Verify filter (MAX )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4294967295, 0, 1);
      src.filter((val: number, index: int, array: Uint32Array): boolean => val === 0);
      expect(src[0]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5700
     * @tc.name testUint32ArrayFilterPartOne057
     * @tc.desc Verify filter buffer,
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(1, 2, 3, 4);
      const res: Uint32Array = src.filter((val: number, index: int, array: Uint32Array): boolean => val > 2);
      res[0] = 999;
      expect(src[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5800
     * @tc.name testUint32ArrayFilterPartOne058
     * @tc.desc Verify (val, index, array),val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(100, 200, 300);
      let firstVal: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        if (index === 0) firstVal = val;
        return false;
      });
      expect(firstVal).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_5900
     * @tc.name testUint32ArrayFilterPartOne059
     * @tc.desc Verify index 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(9, 9, 9);
      let firstIdx: number = -1;
      let secondIdx: number = -1;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        if (index === 0) { firstIdx = 0; }
        if (index === 1) { secondIdx = 1; }
        return false;
      });
      expect(firstIdx).assertEqual(0);
      expect(secondIdx).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_6000
     * @tc.name testUint32ArrayFilterPartOne060
     * @tc.desc Verify array Uint32Array,length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(4, 5, 6);
      let arrLen: number = 0;
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        arrLen = array.length;
        return false;
      });
      expect(arrLen).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILTER_PARTONE_6100
     * @tc.name testUint32ArrayFilterPartOne061
     * @tc.desc Verify val
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFilterPartOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Uint32Array = Uint32Array.of(7, 14, 21);
      let valSeq: string = '';
      src.filter((val: number, index: int, array: Uint32Array): boolean => {
        valSeq = valSeq + val + '/';
        return false;
      });
      expect(valSeq).assertEqual('7/14/21/');
    });

  });
}
