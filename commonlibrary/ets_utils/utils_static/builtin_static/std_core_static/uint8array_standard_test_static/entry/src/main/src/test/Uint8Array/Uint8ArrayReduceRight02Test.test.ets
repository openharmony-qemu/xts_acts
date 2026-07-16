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

export default function Uint8ArrayReduceRight02Test(): void {
  describe('Uint8ArrayReduceRight02Test', () => {
    beforeAll(() => {});

    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    afterEach(() => {});

    afterAll(() => {});

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0100
     * @tc.name testUint8ArrayReduceRight001
     * @tc.desc Verify reduceRight with 1 parameter (callbackfn only), result type is number
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0200
     * @tc.name testUint8ArrayReduceRight002
     * @tc.desc Verify reduceRight subtraction with [10,20,30], result 30-20-10=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0300
     * @tc.name testUint8ArrayReduceRight003
     * @tc.desc Verify reduceRight subtraction with [100,50,25], result 25-50-100=-125
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 50, 25);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0400
     * @tc.name testUint8ArrayReduceRight004
     * @tc.desc Verify reduceRight subtraction with [5,3,1], result 1-3-5=-7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 3, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0500
     * @tc.name testUint8ArrayReduceRight005
     * @tc.desc Verify reduceRight subtraction with [30,20,10,5], result 5-10-20-30=-55
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(30, 20, 10, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-55);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0600
     * @tc.name testUint8ArrayReduceRight006
     * @tc.desc Verify reduceRight addition with [10,20,30], result 30+20+10=60
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0700
     * @tc.name testUint8ArrayReduceRight007
     * @tc.desc Verify reduceRight addition with [1,2,3,4], result 4+3+2+1=10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0800
     * @tc.name testUint8ArrayReduceRight008
     * @tc.desc Verify reduceRight addition with [100,200,50], result 50+200+100=350
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 200, 50);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(350);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_0900
     * @tc.name testUint8ArrayReduceRight009
     * @tc.desc Verify reduceRight multiplication with [2,3,4], result 4*3*2=24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p * c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1000
     * @tc.name testUint8ArrayReduceRight010
     * @tc.desc Verify reduceRight multiplication with [5,5,5], result 5*5*5=125
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 5, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p * c);
      expect(result).assertEqual(125);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1100
     * @tc.name testUint8ArrayReduceRight011
     * @tc.desc Verify reduceRight multiplication with [1,2,3,4], result 4*3*2*1=24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p * c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1200
     * @tc.name testUint8ArrayReduceRight012
     * @tc.desc Verify reduceRight division with [100,20,2], result 2/20/100=0.001
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(100, 20, 2);
      const result: number = arr.reduceRight((p: number, c: number): number => p / c);
      expect(result).assertEqual(0.001);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1300
     * @tc.name testUint8ArrayReduceRight013
     * @tc.desc Verify reduceRight modulo with [23,7,10], result 10%7=3, 3%23=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(23, 7, 10);
      const result: number = arr.reduceRight((p: number, c: number): number => p % c);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1400
     * @tc.name testUint8ArrayReduceRight014
     * @tc.desc Verify reduceRight bitwise OR with [1,2,4], result 4|2|1=7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p | c);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1500
     * @tc.name testUint8ArrayReduceRight015
     * @tc.desc Verify reduceRight bitwise AND with [7,6,5], result 5&6=4, 4&7=4
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(7, 6, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p & c);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1600
     * @tc.name testUint8ArrayReduceRight016
     * @tc.desc Verify reduceRight bitwise XOR with [1,2,3], result 3^2=1, 1^1=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number): number => p ^ c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1700
     * @tc.name testUint8ArrayReduceRight017
     * @tc.desc Verify reduceRight left shift with [1,2,3], result 3<<2=12, 12<<1=24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number): number => p << c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1800
     * @tc.name testUint8ArrayReduceRight018
     * @tc.desc Verify reduceRight Math.pow with [2,3,4], result pow(4,3)=64, pow(64,2)=4096
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => Math.pow(p, c));
      expect(result).assertEqual(4096);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_1900
     * @tc.name testUint8ArrayReduceRight019
     * @tc.desc Verify reduceRight Math.min with [5,10,3], result min(3,10)=3, min(3,5)=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 3);
      const result: number = arr.reduceRight((p: number, c: number): number => Math.min(p, c));
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2000
     * @tc.name testUint8ArrayReduceRight020
     * @tc.desc Verify reduceRight Math.max with [5,10,3], result max(3,10)=10, max(10,5)=10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 3);
      const result: number = arr.reduceRight((p: number, c: number): number => Math.max(p, c));
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2100
     * @tc.name testUint8ArrayReduceRight021
     * @tc.desc Verify reduceRight average (p+c)/2 with [10,20,30], result (30+20)/2=25, (25+10)/2=17.5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => (p + c) / 2);
      expect(result).assertEqual(17.5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2200
     * @tc.name testUint8ArrayReduceRight022
     * @tc.desc Verify reduceRight Math.abs(p-c) with [5,10,30], result |30-10|=20, |20-5|=15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 10, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => Math.abs(p - c));
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2300
     * @tc.name testUint8ArrayReduceRight023
     * @tc.desc Verify reduceRight (p+c)%256 with [200,100,50], result (50+100)%256=150, (150+200)%256=94
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(200, 100, 50);
      const result: number = arr.reduceRight((p: number, c: number): number => (p + c) % 256);
      expect(result).assertEqual(94);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2400
     * @tc.name testUint8ArrayReduceRight024
     * @tc.desc Verify reduceRight reverse subtraction c-p with [10,20,30], result 20-30=-10, 10-(-10)=20
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => c - p);
      expect(result).assertEqual(20);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2500
     * @tc.name testUint8ArrayReduceRight025
     * @tc.desc Verify reduceRight multiply by 0 with [1,2,3], result always 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number): number => p * 0);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2600
     * @tc.name testUint8ArrayReduceRight026
     * @tc.desc Verify reduceRight identity return constant 1 with [10,20,30]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((): number => 1);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2700
     * @tc.name testUint8ArrayReduceRight027
     * @tc.desc Verify reduceRight addition with element 0 [0,5,10], result 10+5+0=15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 5, 10);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2800
     * @tc.name testUint8ArrayReduceRight028
     * @tc.desc Verify reduceRight addition with element 255 [255,1,1], result 1+1+255=257
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 1, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(257);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_2900
     * @tc.name testUint8ArrayReduceRight029
     * @tc.desc Verify reduceRight addition with element 127 [127,1,1], result 1+1+127=129
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(127, 1, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(129);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3000
     * @tc.name testUint8ArrayReduceRight030
     * @tc.desc Verify reduceRight addition with element 128 [128,1,1], result 1+1+128=130
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(128, 1, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(130);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3100
     * @tc.name testUint8ArrayReduceRight031
     * @tc.desc Verify reduceRight addition with 0/255 mixed [0,255,0,255], result 255+0+255+0=510
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255, 0, 255);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(510);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3200
     * @tc.name testUint8ArrayReduceRight032
     * @tc.desc Verify reduceRight bitwise AND with all 255 [255,255,255], result 255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(255, 255, 255);
      const result: number = arr.reduceRight((p: number, c: number): number => p & c);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3300
     * @tc.name testUint8ArrayReduceRight033
     * @tc.desc Verify reduceRight bitwise OR with all 0 [0,0,0], result 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 0, 0);
      const result: number = arr.reduceRight((p: number, c: number): number => p | c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3400
     * @tc.name testUint8ArrayReduceRight034
     * @tc.desc Verify reduceRight Math.max with [0,255,127], result max(127,255)=255, max(255,0)=255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0, 255, 127);
      const result: number = arr.reduceRight((p: number, c: number): number => Math.max(p, c));
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3500
     * @tc.name testUint8ArrayReduceRight035
     * @tc.desc Verify reduceRight with overflow values 256/257 truncated to [0,1], result 0+1=1
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([256, 257]);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3600
     * @tc.name testUint8ArrayReduceRight036
     * @tc.desc Verify reduceRight with negative values [-1,-2] wrapped to [255,254], result 255+254=509
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-1, -2]);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(509);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3700
     * @tc.name testUint8ArrayReduceRight037
     * @tc.desc Verify reduceRight with float truncation [1.9,2.1] stored as [1,2], result 1+2=3
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([1.9, 2.1]);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3800
     * @tc.name testUint8ArrayReduceRight038
     * @tc.desc Verify reduceRight with hex literals [0x10,0x20,0x30], result 48+32+16=96
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0x10, 0x20, 0x30);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(96);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_3900
     * @tc.name testUint8ArrayReduceRight039
     * @tc.desc Verify reduceRight with binary literals [0b1,0b10,0b100], result 4+2+1=7
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0b1, 0b10, 0b100);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(7);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4000
     * @tc.name testUint8ArrayReduceRight040
     * @tc.desc Verify reduceRight with octal literals [0o10,0o20], result 16+8=24
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(0o10, 0o20);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(24);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4100
     * @tc.name testUint8ArrayReduceRight041
     * @tc.desc Verify reduceRight with scientific notation [1e0,2e0,3e0], result 3+2+1=6
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1e0, 2e0, 3e0);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4200
     * @tc.name testUint8ArrayReduceRight042
     * @tc.desc Verify reduceRight with powers of 2 [1,2,4,8,16,32,64,128], result sum=255
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 4, 8, 16, 32, 64, 128);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(255);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4300
     * @tc.name testUint8ArrayReduceRight043
     * @tc.desc Verify reduceRight with single element [42], callback not called, returns 42
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let called: boolean = false;
      const arr: Uint8Array = Uint8Array.of(42);
      const result: number = arr.reduceRight((p: number, c: number): number => { called = true; return p + c; });
      expect(called).assertFalse();
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4400
     * @tc.name testUint8ArrayReduceRight044
     * @tc.desc Verify reduceRight with two elements [10,20] addition, result 20+10=30
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4500
     * @tc.name testUint8ArrayReduceRight045
     * @tc.desc Verify reduceRight with two elements [10,20] subtraction, result 20-10=10
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4600
     * @tc.name testUint8ArrayReduceRight046
     * @tc.desc Verify reduceRight with 100 elements of 1, result sum=100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i: int = 0; i < 100; i++) {
        src.push(1);
      }
      const arr: Uint8Array = new Uint8Array(src);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4700
     * @tc.name testUint8ArrayReduceRight047
     * @tc.desc Verify reduceRight with 1000 elements of 1, result sum=1000
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const src: number[] = [];
      for (let i: int = 0; i < 1000; i++) {
        src.push(1);
      }
      const arr: Uint8Array = new Uint8Array(src);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(1000);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4800
     * @tc.name testUint8ArrayReduceRight048
     * @tc.desc Verify reduceRight with three identical elements [5,5,5] addition, result 15
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 5, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_4900
     * @tc.name testUint8ArrayReduceRight049
     * @tc.desc Verify reduceRight right-to-left order with [1,2,3,4,5] subtraction, result -5
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5000
     * @tc.name testUint8ArrayReduceRight050
     * @tc.desc Verify reduceRight right-to-left order with [5,4,3,2,1] subtraction, result -13
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(5, 4, 3, 2, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-13);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5100
     * @tc.name testUint8ArrayReduceRight051
     * @tc.desc Verify reduceRight right-to-left order with [10,20,30,40,50] subtraction, result -50
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40, 50);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c);
      expect(result).assertEqual(-50);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5200
     * @tc.name testUint8ArrayReduceRight052
     * @tc.desc Verify reduceRight right-to-left order with [2,3,4] double subtraction p-c-c, result -6
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p - c - c);
      expect(result).assertEqual(-6);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5300
     * @tc.name testUint8ArrayReduceRight053
     * @tc.desc Verify reduceRight right-to-left order with [2,3,4] division p/c, result 0.666...
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(2, 3, 4);
      const result: number = arr.reduceRight((p: number, c: number): number => p / c);
      expect(result).assertEqual(0.6666666666666666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5400
     * @tc.name testUint8ArrayReduceRight054
     * @tc.desc Verify reduceRight callback receives correct indices [10,20,30,40]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: number[] = [];
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      let expectedIndex: int = arr.length - 2;
      arr.reduceRight((p: number, c: number): number => {
        indices.push(expectedIndex);
        expectedIndex--;
        return p + c;
      });
      expect(indices[0]).assertEqual(2);
      expect(indices[1]).assertEqual(1);
      expect(indices[2]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5500
     * @tc.name testUint8ArrayReduceRight055
     * @tc.desc Verify reduceRight callback index with two elements [5,10], only 1 call with index=0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: number[] = [];
      const arr: Uint8Array = Uint8Array.of(5, 10);
      let expectedIndex: int = arr.length - 2;
      arr.reduceRight((p: number, c: number): number => {
        indices.push(expectedIndex);
        expectedIndex--;
        return p + c;
      });
      expect(indices.length).assertEqual(1);
      expect(indices[0]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5600
     * @tc.name testUint8ArrayReduceRight056
     * @tc.desc Verify reduceRight callback indices with six elements [1,2,3,4,5,6]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const indices: number[] = [];
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5, 6);
      let expectedIndex: int = arr.length - 2;
      arr.reduceRight((p: number, c: number): number => {
        indices.push(expectedIndex);
        expectedIndex--;
        return p + c;
      });
      expect(indices[0]).assertEqual(4);
      expect(indices[1]).assertEqual(3);
      expect(indices[2]).assertEqual(2);
      expect(indices[3]).assertEqual(1);
      expect(indices[4]).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5700
     * @tc.name testUint8ArrayReduceRight057
     * @tc.desc Verify reduceRight callback array parameter is same reference as original array
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => {
        if (i === 1) {
          expect(a).assertEqual(arr);
        }
        return p + c;
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5800
     * @tc.name testUint8ArrayReduceRight058
     * @tc.desc Verify reduceRight callback array parameter modification is visible
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => {
        a[0] = 99;
        return p + c;
      });
      expect(arr[0]).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_5900
     * @tc.name testUint8ArrayReduceRight059
     * @tc.desc Verify reduceRight with pre-defined const arrow function
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const fn = (p: number, c: number): number => p + c;
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight(fn);
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6000
     * @tc.name testUint8ArrayReduceRight060
     * @tc.desc Verify reduceRight with multi-statement callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => {
        const tmp: number = p + c;
        return tmp;
      });
      expect(result).assertEqual(60);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6100
     * @tc.name testUint8ArrayReduceRight061
     * @tc.desc Verify reduceRight callback ignores curr, uses prev and index (p,c,i) => p + i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number, i: int): number => p + i);
      expect(result).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6200
     * @tc.name testUint8ArrayReduceRight062
     * @tc.desc Verify reduceRight callback ignores prev, uses cur and index (p,c,i) => c + i
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number, i: int): number => c + i);
      expect(result).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6300
     * @tc.name testUint8ArrayReduceRight063
     * @tc.desc Verify reduceRight callback uses array parameter (p,c,i,a) => p + a[0]
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const result: number = arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => p + a[0]);
      expect(result).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6400
     * @tc.name testUint8ArrayReduceRight064
     * @tc.desc Verify reduceRight callback returns c (uses current), result is first element
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => c);
      expect(result).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6500
     * @tc.name testUint8ArrayReduceRight065
     * @tc.desc Verify reduceRight with single element [99] returns itself 99
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(99);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(99);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6600
     * @tc.name testUint8ArrayReduceRight066
     * @tc.desc Verify reduceRight with two elements [15,25] addition, result 40
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(15, 25);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(40);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6700
     * @tc.name testUint8ArrayReduceRight067
     * @tc.desc Verify reduceRight with four elements [10,20,30,40] addition, result 100
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(100);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6800
     * @tc.name testUint8ArrayReduceRight068
     * @tc.desc Verify reduceRight with float return value [3,2,1] division, result 0.166666...
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(3, 2, 1);
      const result: number = arr.reduceRight((p: number, c: number): number => p / c);
      expect(result).assertEqual(0.16666666666666666);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_6900
     * @tc.name testUint8ArrayReduceRight069
     * @tc.desc Verify reduceRight does not change original array length
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const lenBefore: int = arr.length;
      arr.reduceRight((p: number, c: number): number => p + c);
      expect(arr.length).assertEqual(lenBefore);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7000
     * @tc.name testUint8ArrayReduceRight070
     * @tc.desc Verify reduceRight does not modify original array elements
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      arr.reduceRight((p: number, c: number): number => p + c);
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
      expect(arr[2]).assertEqual(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7100
     * @tc.name testUint8ArrayReduceRight071
     * @tc.desc Verify reduceRight with [1,2,3,4,5] multiplication, result 120
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3, 4, 5);
      const result: number = arr.reduceRight((p: number, c: number): number => p * c);
      expect(result).assertEqual(120);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7200
     * @tc.name testUint8ArrayReduceRight072
     * @tc.desc Verify reduceRight with all 200 elements addition, result 600
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight072', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(200);
      for (let i: int = 0; i < 200; i++) {
        arr.set([3], i);
      }
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(600);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7300
     * @tc.name testUint8ArrayReduceRight073
     * @tc.desc Verify reduceRight with negative values truncated [-1,-2,-3] stored as [255,254,253], result 762
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([-1, -2, -3]);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(762);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7400
     * @tc.name testUint8ArrayReduceRight074
     * @tc.desc Verify reduceRight with large overflow values [512,1024] stored as [0,0], result 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array([512, 1024]);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7500
     * @tc.name testUint8ArrayReduceRight075
     * @tc.desc Verify reduceRight with all-zero array length=5, result 0
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = new Uint8Array(5);
      const result: number = arr.reduceRight((p: number, c: number): number => p + c);
      expect(result).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7600
     * @tc.name testUint8ArrayReduceRight076
     * @tc.desc Verify reduceRight on empty array without initialValue throws TypeError
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        new Uint8Array().reduceRight((p: number, c: number): number => p + c);
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7700
     * @tc.name testUint8ArrayReduceRight077
     * @tc.desc Verify reduceRight on empty array sets hasError to true when exception occurs
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let hasError: boolean = false;
      try {
        new Uint8Array().reduceRight((p: number, c: number): number => p + c);
      } catch (e) {
        hasError = true;
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
      expect(hasError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7800
     * @tc.name testUint8ArrayReduceRight078
     * @tc.desc Verify reduceRight captures ordinary Error thrown in callback
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const arr: Uint8Array = Uint8Array.of(10, 20, 30);
        arr.reduceRight((p: number, c: number): number => {
          throw new Error('callback error');
        });
        expect().assertFail();
      } catch (e) {
        expect((e as Error).name).assertEqual('Error');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_7900
     * @tc.name testUint8ArrayReduceRight079
     * @tc.desc Verify reduceRight array state after callback throws error
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      try {
        arr.reduceRight((p: number, c: number): number => {
          throw new Error('stop');
        });
      } catch (e) {
        expect(arr.length).assertEqual(3);
        expect((e as Error).name).assertEqual('Error');
        expect(arr[0]).assertEqual(10);
        expect(arr[1]).assertEqual(20);
        expect(arr[2]).assertEqual(30);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8000
     * @tc.name testUint8ArrayReduceRight080
     * @tc.desc Verify reduceRight returns NaN when callback returns NaN
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => Number.NaN);
      expect(isNaN(result)).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8100
     * @tc.name testUint8ArrayReduceRight081
     * @tc.desc Verify reduceRight returns Infinity when callback returns Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => Number.POSITIVE_INFINITY);
      expect(result).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8200
     * @tc.name testUint8ArrayReduceRight082
     * @tc.desc Verify reduceRight returns -Infinity when callback returns -Infinity
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      const result: number = arr.reduceRight((p: number, c: number): number => Number.NEGATIVE_INFINITY);
      expect(result).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8300
     * @tc.name testUint8ArrayReduceRight083
     * @tc.desc Verify reduceRight callback modifies array affecting subsequent iterations
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30, 40);
      const result: number = arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => {
        if (i === 2) {
          a[0] = 100;
        }
        return p + c;
      });
      expect(result).assertEqual(190);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8400
     * @tc.name testUint8ArrayReduceRight084
     * @tc.desc Verify callback calling another Uint8Array's reduceRight
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(1, 2, 3);
      const copy: Uint8Array = new Uint8Array(arr);
      const result: number = arr.reduceRight((p: number, c: number): number => {
        return p + c + copy.reduceRight((p2: number, c2: number): number => p2 + c2);
      });
      expect(result).assertEqual(18);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8500
     * @tc.name testUint8ArrayReduceRight085
     * @tc.desc Verify reduceRight accessing out-of-bounds index via arr parameter
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      let caughtError: boolean = false;
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => p + a[99]);
      } catch (e) {
        caughtError = true;
        expect(Class.of(e as Object).getName()).assertEqual('std.core.RangeError');
      }
      expect(caughtError).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8600
     * @tc.name testUint8ArrayReduceRight086
     * @tc.desc Verify reduceRight on empty array does not trigger callback and does not modify external state
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let sideEffect: number = 0;
      try {
        new Uint8Array().reduceRight((p: number, c: number): number => {
          sideEffect = 1;
          return p + c;
        });
        expect().assertFail();
      } catch (e) {
        expect(sideEffect).assertEqual(0);
        expect(Class.of(e as Object).getName()).assertEqual('std.core.TypeError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_UINT8ARRAY_REDUCE_RIGHT02_8700
     * @tc.name testUint8ArrayReduceRight087
     * @tc.desc Verify reduceRight array modifications that occurred before callback error are preserved
     * @tc.type Function
     * @tc.size MediumTest
     * @tc.level LEVEL2
     */
    it('testUint8ArrayReduceRight087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Uint8Array = Uint8Array.of(10, 20, 30);
      try {
        arr.reduceRight((p: number, c: number, i: int, a: Uint8Array): number => {
          if (i === 0) {
            a[2] = 99;
            throw new Error('stop');
          }
          return p + c;
        });
      } catch (e) {
        expect(arr[2]).assertEqual(99);
        expect((e as Error).name).assertEqual('Error');
      }
    });
  });
}