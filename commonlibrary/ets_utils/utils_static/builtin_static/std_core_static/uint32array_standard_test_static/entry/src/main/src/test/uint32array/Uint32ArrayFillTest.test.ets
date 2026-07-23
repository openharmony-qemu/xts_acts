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

export default function uint32ArrayFillTest(): void {
  describe('Uint32ArrayFillTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0100
     * @tc.name testUint32ArrayFillOne001
     * @tc.desc Verify fill(value)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 7;
      values.fill(value);
      expect(values[0]).assertEqual(7);
      expect(values[2]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0200
     * @tc.name testUint32ArrayFillOne002
     * @tc.desc Verify fill(value, start) start
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const value: number = 3;
      values.fill(value, 2);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(3);
      expect(values[3]).assertEqual(3);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0300
     * @tc.name testUint32ArrayFillOne003
     * @tc.desc Verify fill(value, start, end) [start, end)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 9;
      values.fill(value, 1, 4);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(9);
      expect(values[3]).assertEqual(9);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0400
     * @tc.name testUint32ArrayFillOne004
     * @tc.desc Verify fill(value, 0, 0) start end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 5;
      values.fill(value, 0, 0);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0500
     * @tc.name testUint32ArrayFillOne005
     * @tc.desc Verify fill(value, 0, length)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 8;
      values.fill(value, 0, 3);
      expect(values[0]).assertEqual(8);
      expect(values[2]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0600
     * @tc.name testUint32ArrayFillOne006
     * @tc.desc Verify value number 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 0;
      values.fill(value);
      expect(values[0]).assertEqual(0);
      expect(values[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0700
     * @tc.name testUint32ArrayFillOne007
     * @tc.desc Verify value 1 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const value: number = 1;
      values.fill(value);
      expect(values[0]).assertEqual(1);
      expect(values[1]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0800
     * @tc.name testUint32ArrayFillOne008
     * @tc.desc Verify value 127 int8 127
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const value: number = 127;
      values.fill(value);
      expect(values[0]).assertEqual(127);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_0900
     * @tc.name testUint32ArrayFillOne009
     * @tc.desc Verify value 128 int8 +1 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const value: number = 128;
      values.fill(value);
      expect(values[0]).assertEqual(128);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1000
     * @tc.name testUint32ArrayFillOne010
     * @tc.desc Verify value number 255 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const value: number = 255;
      values.fill(value);
      expect(values[0]).assertEqual(255);
      expect(values[1]).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1100
     * @tc.name testUint32ArrayFillOne011
     * @tc.desc Verify value 0b00000000 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 0b00000000;
      values.fill(value);
      expect(values[0]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1200
     * @tc.name testUint32ArrayFillOne012
     * @tc.desc Verify value 0o377 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 0o377;
      values.fill(value);
      expect(values[1]).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1300
     * @tc.name testUint32ArrayFillOne013
     * @tc.desc Verify start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, 0);
      expect(values[0]).assertEqual(6);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1400
     * @tc.name testUint32ArrayFillOne014
     * @tc.desc Verify start 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, 1);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1500
     * @tc.name testUint32ArrayFillOne015
     * @tc.desc Verify start length-1=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, 4);
      expect(values[3]).assertEqual(0);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1600
     * @tc.name testUint32ArrayFillOne016
     * @tc.desc Verify start length=5 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 6;
      values.fill(value, 5);
      expect(values[0]).assertEqual(10);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1700
     * @tc.name testUint32ArrayFillOne017
     * @tc.desc Verify start length+1=6 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 6;
      values.fill(value, 6);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1800
     * @tc.name testUint32ArrayFillOne018
     * @tc.desc Verify start -1 length+(-1)=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -1);
      expect(values[3]).assertEqual(0);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_1900
     * @tc.name testUint32ArrayFillOne019
     * @tc.desc Verify start -2 length+(-2)=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -2);
      expect(values[2]).assertEqual(0);
      expect(values[3]).assertEqual(6);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2000
     * @tc.name testUint32ArrayFillOne020
     * @tc.desc Verify start -3 length+(-3)=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -3);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2100
     * @tc.name testUint32ArrayFillOne021
     * @tc.desc Verify start -4 length+(-4)=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -4);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2200
     * @tc.name testUint32ArrayFillOne022
     * @tc.desc Verify start -length=-5 length+(-5)=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -5);
      expect(values[0]).assertEqual(6);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2300
     * @tc.name testUint32ArrayFillOne023
     * @tc.desc Verify start -length-1=-6 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 6;
      values.fill(value, -6);
      expect(values[0]).assertEqual(6);
      expect(values[4]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2400
     * @tc.name testUint32ArrayFillOne024
     * @tc.desc Verify start 100 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 6;
      values.fill(value, 100);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2500
     * @tc.name testUint32ArrayFillOne025
     * @tc.desc Verify start -100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 6;
      values.fill(value, -100);
      expect(values[0]).assertEqual(6);
      expect(values[2]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2600
     * @tc.name testUint32ArrayFillOne026
     * @tc.desc Verify start 0 fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const value: number = 6;
      values.fill(value, 0);
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2700
     * @tc.name testUint32ArrayFillOne027
     * @tc.desc Verify start 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const value: number = 6;
      values.fill(value, 0);
      expect(values[0]).assertEqual(6);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2800
     * @tc.name testUint32ArrayFillOne028
     * @tc.desc Verify end 0 start 0 end 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, 0, 0);
      expect(values[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_2900
     * @tc.name testUint32ArrayFillOne029
     * @tc.desc Verify end 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 1);
      expect(values[0]).assertEqual(7);
      expect(values[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3000
     * @tc.name testUint32ArrayFillOne030
     * @tc.desc Verify end 2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 2);
      expect(values[1]).assertEqual(7);
      expect(values[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3100
     * @tc.name testUint32ArrayFillOne031
     * @tc.desc Verify end length-1=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 4);
      expect(values[3]).assertEqual(7);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3200
     * @tc.name testUint32ArrayFillOne032
     * @tc.desc Verify end length=5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 5);
      expect(values[0]).assertEqual(7);
      expect(values[4]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3300
     * @tc.name testUint32ArrayFillOne033
     * @tc.desc Verify end length+1=6 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 6);
      expect(values[0]).assertEqual(7);
      expect(values[4]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3400
     * @tc.name testUint32ArrayFillOne034
     * @tc.desc Verify end -1 length+(-1)=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, -1);
      expect(values[3]).assertEqual(7);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3500
     * @tc.name testUint32ArrayFillOne035
     * @tc.desc Verify end -2 length+(-2)=3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, -2);
      expect(values[2]).assertEqual(7);
      expect(values[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3600
     * @tc.name testUint32ArrayFillOne036
     * @tc.desc Verify end -3 length+(-3)=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, -3);
      expect(values[1]).assertEqual(7);
      expect(values[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3700
     * @tc.name testUint32ArrayFillOne037
     * @tc.desc Verify end -4 length+(-4)=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, -4);
      expect(values[0]).assertEqual(7);
      expect(values[1]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3800
     * @tc.name testUint32ArrayFillOne038
     * @tc.desc Verify end -length=-5 0 length+(-5)=0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, 0, -5);
      expect(values[0]).assertEqual(10);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_3900
     * @tc.name testUint32ArrayFillOne039
     * @tc.desc Verify end -length-1=-6 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, 0, -6);
      expect(values[0]).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4000
     * @tc.name testUint32ArrayFillOne040
     * @tc.desc Verify end 100 length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 7;
      values.fill(value, 0, 100);
      expect(values[0]).assertEqual(7);
      expect(values[4]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4100
     * @tc.name testUint32ArrayFillOne041
     * @tc.desc Verify end -100 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 7;
      values.fill(value, 0, -100);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4200
     * @tc.name testUint32ArrayFillOne042
     * @tc.desc Verify end start start=2, end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, 2, 2);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4300
     * @tc.name testUint32ArrayFillOne043
     * @tc.desc Verify start end start=-3 2, end=4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, -3, 4);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4400
     * @tc.name testUint32ArrayFillOne044
     * @tc.desc Verify start end start=1, end=-1 4
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, 1, -1);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4500
     * @tc.name testUint32ArrayFillOne045
     * @tc.desc Verify start=-4 1, end=-2 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, -4, -2);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(4);
      expect(values[3]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4600
     * @tc.name testUint32ArrayFillOne046
     * @tc.desc Verify start 0 end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, 0, -1);
      expect(values[0]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4700
     * @tc.name testUint32ArrayFillOne047
     * @tc.desc Verify start -1 end length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, -1, 5);
      expect(values[3]).assertEqual(0);
      expect(values[4]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4800
     * @tc.name testUint32ArrayFillOne048
     * @tc.desc Verify start 1 end 3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 4;
      values.fill(value, 1, 3);
      expect(values[0]).assertEqual(10);
      expect(values[1]).assertEqual(4);
      expect(values[3]).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_4900
     * @tc.name testUint32ArrayFillOne049
     * @tc.desc Verify start -2 end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, -2, -1);
      expect(values[2]).assertEqual(0);
      expect(values[3]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5000
     * @tc.name testUint32ArrayFillOne050
     * @tc.desc Verify start 0 end 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 4;
      values.fill(value, 0, 1);
      expect(values[0]).assertEqual(4);
      expect(values[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5100
     * @tc.name testUint32ArrayFillOne051
     * @tc.desc Verify start 3 end 5
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, 3, 5);
      expect(values[2]).assertEqual(0);
      expect(values[3]).assertEqual(4);
      expect(values[4]).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5200
     * @tc.name testUint32ArrayFillOne052
     * @tc.desc Verify start -5 end -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 4;
      values.fill(value, -5, -1);
      expect(values[0]).assertEqual(4);
      expect(values[3]).assertEqual(4);
      expect(values[4]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5300
     * @tc.name testUint32ArrayFillOne053
     * @tc.desc Verify start 2 end -2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 4;
      values.fill(value, 2, -2);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(4);
      expect(values[3]).assertEqual(40);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5400
     * @tc.name testUint32ArrayFillOne054
     * @tc.desc Verify start -3 end -3
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 4;
      values.fill(value, -3, -3);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5500
     * @tc.name testUint32ArrayFillOne055
     * @tc.desc Verify fill this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 5;
      const result = values.fill(value);
      const marker: number = 99;
      result[0] = marker;
      expect(values[0]).assertEqual(99);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5600
     * @tc.name testUint32ArrayFillOne056
     * @tc.desc Verify fill assertEqual
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 5;
      const result = values.fill(value);
      expect(result).assertEqual(values);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5700
     * @tc.name testUint32ArrayFillOne057
     * @tc.desc Verify fill length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 5;
      const result = values.fill(value);
      expect(result.length).assertEqual(5);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5800
     * @tc.name testUint32ArrayFillOne058
     * @tc.desc Verify fill byteLength
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 5;
      values.fill(value);
      expect(values.byteLength).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_5900
     * @tc.name testUint32ArrayFillOne059
     * @tc.desc Verify fill byteOffset
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 5;
      values.fill(value);
      expect(values.byteOffset).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6000
     * @tc.name testUint32ArrayFillOne060
     * @tc.desc Verify fill buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const buf = values.buffer;
      const value: number = 5;
      values.fill(value);
      expect(values.buffer).assertEqual(buf);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6100
     * @tc.name testUint32ArrayFillOne061
     * @tc.desc Verify fill BYTES_PER_ELEMENT
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(5);
      const value: number = 5;
      values.fill(value);
      expect(values.BYTES_PER_ELEMENT).assertEqual(4);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6200
     * @tc.name testUint32ArrayFillOne062
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 9;
      values.fill(value, 1, 3);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(9);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6300
     * @tc.name testUint32ArrayFillOne063
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const a: number = 5;
      const b: number = 8;
      values.fill(a).fill(b);
      expect(values[0]).assertEqual(8);
      expect(values[2]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6400
     * @tc.name testUint32ArrayFillOne064
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const a: number = 5;
      const b: number = 8;
      values.fill(a).fill(b, 2, 4);
      expect(values[0]).assertEqual(5);
      expect(values[2]).assertEqual(8);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6500
     * @tc.name testUint32ArrayFillOne065
     * @tc.desc Verify fill subarray buffer
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(1, 4);
      const value: number = 7;
      view.fill(value);
      expect(values[1]).assertEqual(7);
      expect(values[3]).assertEqual(7);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6600
     * @tc.name testUint32ArrayFillOne066
     * @tc.desc Verify fill subarray
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const view = values.subarray(2, 5);
      const value: number = 7;
      view.fill(value);
      expect(values[1]).assertEqual(20);
      expect(values[2]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6700
     * @tc.name testUint32ArrayFillOne067
     * @tc.desc Verify start end no-op start=3, end=1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, 3, 1);
      expect(values[0]).assertEqual(10);
      expect(values[4]).assertEqual(50);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6800
     * @tc.name testUint32ArrayFillOne068
     * @tc.desc Verify start length no-op start=10, end=20
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 7;
      values.fill(value, 10, 20);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_6900
     * @tc.name testUint32ArrayFillOne069
     * @tc.desc Verify start end no-op start=-1 4, end=2
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, -1, 2);
      expect(values[4]).assertEqual(50);
      expect(values[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7000
     * @tc.name testUint32ArrayFillOne070
     * @tc.desc Verify start end start>end no-op start=-2 3, end=-4 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30, 40, 50);
      const value: number = 7;
      values.fill(value, -2, -4);
      expect(values[3]).assertEqual(40);
      expect(values[1]).assertEqual(20);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7100
     * @tc.name testUint32ArrayFillOne071
     * @tc.desc Verify fill length 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const value: number = 7;
      const result = values.fill(value);
      expect(result.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7200
     * @tc.name testUint32ArrayFillOne072
     * @tc.desc Verify start/end
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const value: number = 7;
      values.fill(value, 0, 10);
      expect(values.length).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7300
     * @tc.name testUint32ArrayFillOne073
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(1);
      const value: number = 7;
      values.fill(value);
      expect(values[0]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7400
     * @tc.name testUint32ArrayFillOne074
     * @tc.desc Verify start no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const value: number = 7;
      values.fill(value, 1);
      expect(values[0]).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7500
     * @tc.name testUint32ArrayFillOne075
     * @tc.desc Verify start length
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 7;
      values.fill(value, -3);
      expect(values[0]).assertEqual(7);
      expect(values[2]).assertEqual(7);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7600
     * @tc.name testUint32ArrayFillOne076
     * @tc.desc Verify end length 0 no-op
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(10, 20, 30);
      const value: number = 7;
      values.fill(value, 0, -3);
      expect(values[0]).assertEqual(10);
      expect(values[2]).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7700
     * @tc.name testUint32ArrayFillOne077
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300);
      const value: number = 1;
      values.fill(value);
      expect(values[0]).assertEqual(1);
      expect(values[2]).assertEqual(1);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7800
     * @tc.name testUint32ArrayFillOne078
     * @tc.desc Verify fill
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(100, 200, 300, 400);
      const value: number = 0;
      values.fill(value, 1, 3);
      expect(values[0]).assertEqual(100);
      expect(values[1]).assertEqual(0);
      expect(values[3]).assertEqual(400);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_7900
     * @tc.name testUint32ArrayFillOne079
     * @tc.desc Verify number 255 uint32 255 -1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 255;
      values.fill(value);
      expect(values[0]).assertEqual(255);
      expect(values[2]).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8000
     * @tc.name testUint32ArrayFillOne080
     * @tc.desc Verify number 0 uint32 0 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(99, 99, 99);
      const value: number = 0;
      values.fill(value);
      expect(values[0]).assertEqual(0);
      expect(values[2]).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8100
     * @tc.name testUint32ArrayFillOne081
     * @tc.desc Verify number 128 uint32 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 128;
      values.fill(value);
      expect(values[0]).assertEqual(128);
      expect(values[1]).assertEqual(128);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8200
     * @tc.name testUint32ArrayFillOne082
     * @tc.desc Verify number 127 128
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(2);
      const a: number = 127;
      const b: number = 128;
      values.fill(a);
      values[1] = b;
      expect(values[0]).assertEqual(127);
      expect(values[1]).assertEqual(128);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8300
     * @tc.name testUint32ArrayFillOne083
     * @tc.desc Verify number 0 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(4);
      const a: number = 0;
      const b: number = 255;
      values.fill(a, 0, 2);
      values.fill(b, 2, 4);
      expect(values[0]).assertEqual(0);
      expect(values[1]).assertEqual(0);
      expect(values[2]).assertEqual(255);
      expect(values[3]).assertEqual(255);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8400
     * @tc.name testUint32ArrayFillOne084
     * @tc.desc Verify number 255 join 255
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 255;
      values.fill(value);
      expect(values.join(',')).assertEqual('255,255,255');
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8500
     * @tc.name testUint32ArrayFillOne085
     * @tc.desc Verify number 127 lastIndexOf(127)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 127;
      values.fill(value);
      expect(values.lastIndexOf(127)).assertEqual(2);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8600
     * @tc.name testUint32ArrayFillOne086
     * @tc.desc Verify number 200 findIndex 200
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 200;
      values.fill(value);
      expect(values.findIndex((v, i, arr) => v === 200)).assertEqual(0);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8700
     * @tc.name testUint32ArrayFillOne087
     * @tc.desc Verify number 30 values 30
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 30;
      values.fill(value);
      let firstVal: number = 0;
      for (const v of values.values()) {
        firstVal = v;
        break;
      }
      expect(firstVal).assertEqual(30);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8800
     * @tc.name testUint32ArrayFillOne088
     * @tc.desc Verify number 110 reverse this
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 110;
      values.fill(value);
      const result = values.reverse();
      expect(result[0]).assertEqual(110);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_8900
     * @tc.name testUint32ArrayFillOne089
     * @tc.desc Verify number 160 reduceRight
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 160;
      values.fill(value);
      const total = values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v, 0);
      expect(total).assertEqual(480);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9000
     * @tc.name testUint32ArrayFillOne090
     * @tc.desc Verify number 170 toSorted 170
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(3);
      const value: number = 170;
      values.fill(value);
      const sorted = values.toSorted();
      expect(sorted[0]).assertEqual(170);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9100
     * @tc.name testUint32ArrayFillOne091
     * @tc.desc Verify reduceRight without initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3, 4);
      const total = values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v);
      expect(total).assertEqual(10);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9200
     * @tc.name testUint32ArrayFillOne092
     * @tc.desc Verify reduceRight with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const total = values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v, 10);
      expect(total).assertEqual(16);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9300
     * @tc.name testUint32ArrayFillOne093
     * @tc.desc Verify reduceRight on empty array throws without initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      try {
        values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v);
        expect().assertFail();
      } catch (e) {
        expect(e.name).assertEqual('TypeError');
      }
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9400
     * @tc.name testUint32ArrayFillOne094
     * @tc.desc Verify reduceRight on empty array with initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = new Uint32Array(0);
      const total = values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v, 100);
      expect(total).assertEqual(100);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9500
     * @tc.name testUint32ArrayFillOne095
     * @tc.desc Verify reduceRight single element without initial value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(42);
      const total = values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => acc + v);
      expect(total).assertEqual(42);
    });


    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT32ARRAY_FILL_ONE_9600
     * @tc.name testUint32ArrayFillOne096
     * @tc.desc Verify reduceRight processes right-to-left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testUint32ArrayFillOne096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const values = Uint32Array.of(1, 2, 3);
      const indices: number[] = [];
      values.reduceRight((acc: number, v: number, i: int, arr: Uint32Array): number => {
        indices.push(i);
        return acc + v;
      }, 0);
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });
  });
}
