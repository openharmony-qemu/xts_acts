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

export default function uint32ArrayConstructorTest4(): void {
  describe('Uint32ArrayConstructorTest4', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0010
     * @tc.name testUint32ArrayConstructorFour001
     * @tc.desc Verify arity=1 Uint32Array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(2);
      src[0] = 10;
      src[1] = 20;
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(2);
      expect(result[0]).assertEqual(10);
      expect(result[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0020
     * @tc.name testUint32ArrayConstructorFour002
     * @tc.desc Verify other Uint32Array(length=0) 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(0);
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(0);
      expect(result.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0030
     * @tc.name testUint32ArrayConstructorFour003
     * @tc.desc Verify other 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(42);
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0040
     * @tc.name testUint32ArrayConstructorFour004
     * @tc.desc Verify other 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0050
     * @tc.name testUint32ArrayConstructorFour005
     * @tc.desc Verify other uint32 4294967295
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(4294967295);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(4294967295);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0060
     * @tc.name testUint32ArrayConstructorFour006
     * @tc.desc Verify other 3.14( 3) 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(3.14);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0070
     * @tc.name testUint32ArrayConstructorFour007
     * @tc.desc Verify other int32 2147483647
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(2147483647);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(2147483647);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0080
     * @tc.name testUint32ArrayConstructorFour008
     * @tc.desc Verify other 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = new Uint32Array(100);
      for (let i = 0; i < 100; i++) {
        src[i] = i;
      }
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(100);
      expect(result[0]).assertEqual(0);
      expect(result[50]).assertEqual(50);
      expect(result[99]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0090
     * @tc.name testUint32ArrayConstructorFour009
     * @tc.desc Verify other [7,7,7] 7
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 7, 7);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(7);
      expect(result[2]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0100
     * @tc.name testUint32ArrayConstructorFour010
     * @tc.desc Verify other [0,MAX,1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(0, 4294967295, 1);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4294967295);
      expect(result[2]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0110
     * @tc.name testUint32ArrayConstructorFour011
     * @tc.desc Verify other [1,2] [1,2]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0120
     * @tc.name testUint32ArrayConstructorFour012
     * @tc.desc Verify constructor(1) length 1 and result[0] 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0130
     * @tc.name testUint32ArrayConstructorFour013
     * @tc.desc Verify length length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(5, 6, 7, 8);
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(src.length);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0140
     * @tc.name testUint32ArrayConstructorFour014
     * @tc.desc Verify BYTES_PER_ELEMENT 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1);
      const result = new Uint32Array(src);
      expect(result.BYTES_PER_ELEMENT).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0150
     * @tc.name testUint32ArrayConstructorFour015
     * @tc.desc Verify byteOffset 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const result = new Uint32Array(src);
      expect(result.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0160
     * @tc.name testUint32ArrayConstructorFour016
     * @tc.desc Verify byteLength length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = new Uint32Array(src);
      expect(result.byteLength).assertEqual(12);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0170
     * @tc.name testUint32ArrayConstructorFour017
     * @tc.desc Verify buffer buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2);
      const result = new Uint32Array(src);
      expect(result.buffer.byteLength).assertEqual(src.buffer.byteLength);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0180
     * @tc.name testUint32ArrayConstructorFour018
     * @tc.desc Verify $_get
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(100, 200, 300);
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(src[0]);
      expect(result[1]).assertEqual(src[1]);
      expect(result[2]).assertEqual(src[2]);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0190
     * @tc.name testUint32ArrayConstructorFour019
     * @tc.desc Verify at
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(11, 22);
      const result = new Uint32Array(src);
      expect(result.at(0)).assertEqual(11);
      expect(result.at(1)).assertEqual(22);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0200
     * @tc.name testUint32ArrayConstructorFour020
     * @tc.desc Verify join join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = new Uint32Array(src);
      expect(result.join(',')).assertEqual('1,2,3');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0210
     * @tc.name testUint32ArrayConstructorFour021
     * @tc.desc Verify toString join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(10, 20);
      const result = new Uint32Array(src);
      expect(result.toString()).assertEqual('10,20');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0220
     * @tc.name testUint32ArrayConstructorFour022
     * @tc.desc Verify source modification does not affect constructed copy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = new Uint32Array(src);
      src[0] = 999;
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0230
     * @tc.name testUint32ArrayConstructorFour023
     * @tc.desc Verify copy modification does not affect source TypedArray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(1, 2, 3);
      const result = new Uint32Array(src);
      result[0] = 888;
      expect(src[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0240
     * @tc.name testUint32ArrayConstructorFour024
     * @tc.desc Verify buffer ( buffer )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src = Uint32Array.of(7, 8);
      const result = new Uint32Array(src);
      src[0] = 4294967295;
      expect(result[0]).assertEqual(7);
      expect(result[1]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0250
     * @tc.name testUint32ArrayConstructorFour025
     * @tc.desc Verify arity=1 Array<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(3);
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0260
     * @tc.name testUint32ArrayConstructorFour026
     * @tc.desc Verify Array<number> 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [];
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0270
     * @tc.name testUint32ArrayConstructorFour027
     * @tc.desc Verify 42.0 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [42.0];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(42);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0280
     * @tc.name testUint32ArrayConstructorFour028
     * @tc.desc Verify -3.14 4294967293
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-3.14];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(4294967293);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0290
     * @tc.name testUint32ArrayConstructorFour029
     * @tc.desc Verify 0x80000000(2147483648)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0x80000000];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(2147483648);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0300
     * @tc.name testUint32ArrayConstructorFour030
     * @tc.desc Verify -2^53+1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [-9007199254740991];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0310
     * @tc.name testUint32ArrayConstructorFour031
     * @tc.desc Verify 8 0o17 15
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0o17];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(15);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0320
     * @tc.name testUint32ArrayConstructorFour032
     * @tc.desc Verify 1e10 1410065408
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1e10];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(1410065408);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0330
     * @tc.name testUint32ArrayConstructorFour033
     * @tc.desc Verify [1.0,2.0,3.0]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(1);
      expect(result[1]).assertEqual(2);
      expect(result[2]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0340
     * @tc.name testUint32ArrayConstructorFour034
     * @tc.desc Verify [0,4294967295,-1]
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [0, 4294967295, -1];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(4294967295);
      expect(result[2]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0350
     * @tc.name testUint32ArrayConstructorFour035
     * @tc.desc Verify [5,5,5] 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [5, 5, 5];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(5);
      expect(result[2]).assertEqual(5);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0360
     * @tc.name testUint32ArrayConstructorFour036
     * @tc.desc Verify constructor(Array<number>) length 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [10, 20, 30, 40];
      const result = new Uint32Array(src);
      expect(result.length).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0370
     * @tc.name testUint32ArrayConstructorFour037
     * @tc.desc Verify constructor(Array<number>) $_get values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [100, 200, 300];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(100);
      expect(result[1]).assertEqual(200);
      expect(result[2]).assertEqual(300);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0380
     * @tc.name testUint32ArrayConstructorFour038
     * @tc.desc Verify Number join
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [1.0, 2.0, 3.0];
      const result = new Uint32Array(src);
      expect(result.join('|')).assertEqual('1|2|3');
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0390
     * @tc.name testUint32ArrayConstructorFour039
     * @tc.desc Verify Number 65535.99 65535
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [65535.99];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(65535);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0400
     * @tc.name testUint32ArrayConstructorFour040
     * @tc.desc Verify Number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: Array<number> = [4294967295, 4294967296, 4294967297];
      const result = new Uint32Array(src);
      expect(result[0]).assertEqual(4294967295);
      expect(result[1]).assertEqual(0);
      expect(result[2]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0410
     * @tc.name testUint32ArrayConstructorFour041
     * @tc.desc Verify arity=3 undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.length).assertEqual(2);
      expect(result.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0420
     * @tc.name testUint32ArrayConstructorFour042
     * @tc.desc Verify 4 undefined 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(4);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.length).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0430
     * @tc.name testUint32ArrayConstructorFour043
     * @tc.desc Verify 12 undefined 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.length).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0440
     * @tc.name testUint32ArrayConstructorFour044
     * @tc.desc Verify 400 undefined 100
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(400);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.length).assertEqual(100);
      expect(result.byteLength).assertEqual(400);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0450
     * @tc.name testUint32ArrayConstructorFour045
     * @tc.desc Verify byteOffset 4 length undefined 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, 4, undefined);
      expect(result.length).assertEqual(1);
      expect(result.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0460
     * @tc.name testUint32ArrayConstructorFour046
     * @tc.desc Verify byteOffset 8 length undefined 0( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, 8, undefined);
      expect(result.length).assertEqual(0);
      expect(result.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0470
     * @tc.name testUint32ArrayConstructorFour047
     * @tc.desc Verify byteOffset undefined 0 length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, 0);
      expect(result.length).assertEqual(0);
      expect(result.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0480
     * @tc.name testUint32ArrayConstructorFour048
     * @tc.desc Verify byteOffset undefined 0 length 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, 1);
      expect(result.length).assertEqual(1);
      expect(result[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0490
     * @tc.name testUint32ArrayConstructorFour049
     * @tc.desc Verify byteOffset undefined 0 length 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, 2);
      expect(result.length).assertEqual(2);
      expect(result.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0500
     * @tc.name testUint32ArrayConstructorFour050
     * @tc.desc Verify 12 byteOffset 4 length undefined 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const result = new Uint32Array(buf, 4, undefined);
      expect(result.length).assertEqual(2);
      expect(result.byteOffset).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0510
     * @tc.name testUint32ArrayConstructorFour051
     * @tc.desc Verify byteOffset 0.0 length undefined 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, 0.0, undefined);
      expect(result.byteOffset).assertEqual(0);
      expect(result.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0520
     * @tc.name testUint32ArrayConstructorFour052
     * @tc.desc Verify byteOffset 4.0 length undefined 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, 4.0, undefined);
      expect(result.byteOffset).assertEqual(4);
      expect(result.length).assertEqual(1);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0530
     * @tc.name testUint32ArrayConstructorFour053
     * @tc.desc Verify length 1.9 byteOffset undefined 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, 1.9);
      expect(result.length).assertEqual(1);
      expect(result.byteLength).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0540
     * @tc.name testUint32ArrayConstructorFour054
     * @tc.desc Verify byteOffset 1 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 1, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0550
     * @tc.name testUint32ArrayConstructorFour055
     * @tc.desc Verify byteOffset 2 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 2, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0560
     * @tc.name testUint32ArrayConstructorFour056
     * @tc.desc Verify byteOffset 3 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 3, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0570
     * @tc.name testUint32ArrayConstructorFour057
     * @tc.desc Verify byteOffset 5 4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 5, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0580
     * @tc.name testUint32ArrayConstructorFour058
     * @tc.desc Verify byteOffset -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -1, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0590
     * @tc.name testUint32ArrayConstructorFour059
     * @tc.desc Verify byteOffset -4 ( )
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, -4, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0600
     * @tc.name testUint32ArrayConstructorFour060
     * @tc.desc Verify byteOffset 12 8 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 12, undefined);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0610
     * @tc.name testUint32ArrayConstructorFour061
     * @tc.desc Verify byteOffset 4 length 2 8 (4+8=12 8) RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 4, 2);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0620
     * @tc.name testUint32ArrayConstructorFour062
     * @tc.desc Verify length -1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, undefined, -1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0630
     * @tc.name testUint32ArrayConstructorFour063
     * @tc.desc Verify length -4 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, undefined, -4);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0640
     * @tc.name testUint32ArrayConstructorFour064
     * @tc.desc Verify byteOffset 6 length 1 RangeError
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      try {
        new Uint32Array(buf, 6, 1);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('RangeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0650
     * @tc.name testUint32ArrayConstructorFour065
     * @tc.desc Verify constructor(buf,off,len) byteLength 8
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.byteLength).assertEqual(8);
    });

    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0660
     * @tc.name testUint32ArrayConstructorFour066
     * @tc.desc Verify byteOffset 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const result = new Uint32Array(buf, 4, undefined);
      expect(result.byteOffset).assertEqual(4);
    });
    
    
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0670
     * @tc.name testUint32ArrayConstructorFour067
     * @tc.desc Verify buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result.buffer.byteLength).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0680
     * @tc.name testUint32ArrayConstructorFour068
     * @tc.desc Verify 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const result = new Uint32Array(buf, undefined, undefined);
      expect(result[0]).assertEqual(0);
      expect(result[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0690
     * @tc.name testUint32ArrayConstructorFour069
     * @tc.desc Verify constructor undefined offset shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Uint32Array(buf, undefined, undefined);
      const part = new Uint32Array(buf, 4, undefined);
      part[0] = 99;
      expect(full[1]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0700
     * @tc.name testUint32ArrayConstructorFour070
     * @tc.desc Verify constructor undefined length shared buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const full = new Uint32Array(buf, undefined, undefined);
      const off = new Uint32Array(buf, 4, undefined);
      off[1] = 77;
      expect(full[2]).assertEqual(77);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0710
     * @tc.name testUint32ArrayConstructorFour071
     * @tc.desc Verify constructor full $_set reflects to offset view
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const full = new Uint32Array(buf, undefined, undefined);
      const off = new Uint32Array(buf, 8, undefined);
      full[2] = 55;
      expect(off[0]).assertEqual(55);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0720
     * @tc.name testUint32ArrayConstructorFour072
     * @tc.desc Verify constructor offset views isolated
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const firstView = new Uint32Array(buf, 0, 1);
      const secondView = new Uint32Array(buf, 4, 1);
      firstView[0] = 10;
      expect(secondView[0]).assertEqual(0);
      expect(firstView[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0730
     * @tc.name testUint32ArrayConstructorFour073
     * @tc.desc Verify length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(12);
      const v = new Uint32Array(buf, 4, undefined);
      const full = new Uint32Array(buf, undefined, undefined);
      v[1] = 88;
      expect(full[2]).assertEqual(88);
      expect(v.length).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0740
     * @tc.name testUint32ArrayConstructorFour074
     * @tc.desc Verify byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint32Array(buf, undefined, undefined);
      const off = new Uint32Array(buf, 8, undefined);
      full[2] = 444;
      expect(off[0]).assertEqual(444);
      expect(off.byteOffset).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0750
     * @tc.name testUint32ArrayConstructorFour075
     * @tc.desc Verify constructor undefined offset -1 to uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const full = new Uint32Array(buf, undefined, undefined);
      const off = new Uint32Array(buf, 4, undefined);
      off[0] = -1;
      expect(full[1]).assertEqual(4294967295);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0760
     * @tc.name testUint32ArrayConstructorFour076
     * @tc.desc Verify constructor empty buffer undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(0);
      const v = new Uint32Array(buf, undefined, undefined);
      expect(v.length).assertEqual(0);
      expect(v.byteLength).assertEqual(0);
      expect(v.buffer.byteLength).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0770
     * @tc.name testUint32ArrayConstructorFour077
     * @tc.desc Verify length undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(16);
      const full = new Uint32Array(buf, undefined, undefined);
      const off = new Uint32Array(buf, 4, undefined);
      full[1] = 2024;
      full[3] = 4048;
      expect(off[0]).assertEqual(2024);
      expect(off[2]).assertEqual(4048);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_CONSTRUCTOR_FOUR_0780
     * @tc.name testUint32ArrayConstructorFour078
     * @tc.desc Verify uint32
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayConstructorFour078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const buf = new ArrayBuffer(8);
      const firstView = new Uint32Array(buf, undefined, undefined);
      const secondView = new Uint32Array(buf, undefined, undefined);
      firstView[0] = 4294967295;
      firstView[1] = 0xFFFFFFFF;
      expect(secondView[0]).assertEqual(4294967295);
      expect(secondView[1]).assertEqual(4294967295);
    });

  });
}
