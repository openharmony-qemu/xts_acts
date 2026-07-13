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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../Util.test';

export default function SparseArrayToStringTest(): void {
  describe('SparseArrayToStringTest', (): void => {
    beforeAll((): void => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);

    });
    afterEach((): void => {
    });
    afterAll((): void => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0100
     * @tc.name testSparseArrayToString001
     * @tc.desc Test SparseArray.toString, verify method result (typeof result equals 'string')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString001', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result: string = arr.toString()
        expect(typeof result).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0200
     * @tc.name testSparseArrayToString002
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString002', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(typeof arr.toString()).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0300
     * @tc.name testSparseArrayToString003
     * @tc.desc Test SparseArray.toString, verify method result (result equals '')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString003', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        let result = arr.toString()
        expect(result).assertEqual('')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0400
     * @tc.name testSparseArrayToString004
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1,2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString004', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let result = arr.toString()
        expect(result).assertEqual('1,2,3')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0500
     * @tc.name testSparseArrayToString005
     * @tc.desc Test SparseArray.toString, verify method result (result equals ',1,2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString005', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1)
        arr.push(1, 2, 3)
        let result = arr.toString()
        expect(result).assertEqual(',1,2,3')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0600
     * @tc.name testSparseArrayToString006
     * @tc.desc Test SparseArray.toString, verify method result (result equals ',10,,30,')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString006', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[1] = 10
        arr[3] = 30
        let result = arr.toString()
        expect(result).assertEqual(',10,,30,')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0700
     * @tc.name testSparseArrayToString007
     * @tc.desc Test SparseArray.toString, verify method result (result equals 'a,b,c')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString007', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>('a', 'b', 'c')
        let result = arr.toString()
        expect(result).assertEqual('a,b,c')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0800
     * @tc.name testSparseArrayToString008
     * @tc.desc Test SparseArray.toString, verify method result (result equals '100,,200')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString008', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3)
        arr[0] = 100
        arr[2] = 200
        let result = arr.toString()
        expect(result).assertEqual('100,,200')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_0900
     * @tc.name testSparseArrayToString009
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1,,,,,,,,,10')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString009', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        arr[0] = 1
        arr[9] = 10
        let result = arr.toString()
        expect(result).assertEqual('1,,,,,,,,,10')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1000
     * @tc.name testSparseArrayToString010
     * @tc.desc Test SparseArray.toString, verify method result (result equals '42')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString010', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        arr.push(42)
        let result = arr.toString()
        expect(result).assertEqual('42')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1100
     * @tc.name testSparseArrayToString011
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1,2,undefined')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString011', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | undefined>(1, 2, undefined)
        let result = arr.toString()
        expect(result).assertEqual('1,2,undefined')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1200
     * @tc.name testSparseArrayToString012
     * @tc.desc Test SparseArray.toString, verify method result (result equals 'null,1,null')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString012', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | null>(null, 1, null)
        let result = arr.toString()
        expect(result).assertEqual('null,1,null')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1300
     * @tc.name testSparseArrayToString013
     * @tc.desc Test SparseArray.toString, verify method result (result equals '0,1,0')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString013', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(0, 1, 0)
        let result = arr.toString()
        expect(result).assertEqual('0,1,0')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1400
     * @tc.name testSparseArrayToString014
     * @tc.desc Test SparseArray.toString, verify method result (result equals '-1,-2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString014', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(-1, -2, 3)
        let result = arr.toString()
        expect(result).assertEqual('-1,-2,3')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1500
     * @tc.name testSparseArrayToString015
     * @tc.desc Test SparseArray.toString, verify method result (result equals ',hello,')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString015', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>('', 'hello', '')
        let result = arr.toString()
        expect(result).assertEqual(',hello,')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1600
     * @tc.name testSparseArrayToString016
     * @tc.desc Test SparseArray.toString, verify method result (result equals ',,test,a,b')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString016', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<string>(',', 'test', 'a,b')
        let result = arr.toString()
        expect(result).assertEqual(',,test,a,b')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1700
     * @tc.name testSparseArrayToString017
     * @tc.desc Test SparseArray.toString, verify method result (typeof result equals 'string')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString017', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let result = arr.toString()
        expect(typeof result).assertEqual('string')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1800
     * @tc.name testSparseArrayToString018
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString018', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3)
        let result = arr.toString()
        expect(result!.length).assertLarger(0)
        expect(result.split(',').length).assertEqual(3)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_1900
     * @tc.name testSparseArrayToString019
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString019', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000)
        for (let i = 0; i < 1000; i++) {
          arr[i] = i
        }
        let result = arr.toString()
        expect(result.split(',').length).assertEqual(1000)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2000
     * @tc.name testSparseArrayToString020
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString020', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(16)
        arr[0] = 1
        let result = arr.toString()
        expect(result.indexOf('1')).assertEqual(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2100
     * @tc.name testSparseArrayToString021
     * @tc.desc Test SparseArray.toString, verify method result (result equals ',,,,,,,,,')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString021', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10)
        let result = arr.toString()
        expect(result).assertEqual(',,,,,,,,,')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2200
     * @tc.name testSparseArrayToString022
     * @tc.desc Test SparseArray.toString, verify method result (arr.length equals 0, result equals '')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString022', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>()
        expect(arr.length).assertEqual(0)
        let result = arr.toString()
        expect(result).assertEqual('')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2300
     * @tc.name testSparseArrayToString023
     * @tc.desc toString on [3,5,5], verify comma-separated representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString023', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(3, 5, 5);
        const result = arr.toString();
        expect(result).assertEqual("3,5,5");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2400
     * @tc.name testSparseArrayToString024
     * @tc.desc toString on [6,3,5], verify comma-separated representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString024', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(6, 3, 5);
        const result = arr.toString();
        expect(result).assertEqual("6,3,5");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2500
     * @tc.name testSparseArrayToString025
     * @tc.desc toString on [7,4,3], verify comma-separated representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString025', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(7, 4, 3);
        const result = arr.toString();
        expect(result).assertEqual("7,4,3");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2600
     * @tc.name testSparseArrayToString026
     * @tc.desc toString on [1,5,4], verify comma-separated representation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString026', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 5, 4);
        const result = arr.toString();
        expect(result).assertEqual("1,5,4");
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2700
     * @tc.name testSparseArrayToString027
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString027', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1)
        arr.push(1, 2, 3)
        expect(arr.toString()).assertEqual(',1,2,3')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2800
     * @tc.name testSparseArrayToString028
     * @tc.desc Test SparseArray.toString, verify method result (debugStr equals '10,,20,,40')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString028', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(5)
        arr[0] = 10
        arr[2] = 20
        arr[4] = 40
        let debugStr = arr.toString()
        expect(debugStr).assertEqual('10,,20,,40')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_2900
     * @tc.name testSparseArrayToString029
     * @tc.desc Test SparseArray.toString, verify method result (values.length equals 5)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString029', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1, 2, 3, 4, 5)
        let csv = arr.toString()
        let values = csv.split(',')
        expect(values.length).assertEqual(5)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3000
     * @tc.name testSparseArrayToString030
     * @tc.desc Test SparseArray.toString, verify method result (serialized equals '10,20,30')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString030', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10, 20, 30)
        let serialized = arr.toString()
        expect(serialized).assertEqual('10,20,30')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3100
     * @tc.name testSparseArrayToString031
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString031', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(10000)
        for (let i = 0; i < 10000; i++) {
          arr[i] = i
        }
        let startTime = Date.now()
        let result = arr.toString()
        let endTime = Date.now()
        expect(endTime - startTime).assertLarger(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3200
     * @tc.name testSparseArrayToString032
     * @tc.desc Test SparseArray.toString, verify method result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString032', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>(1000)
        for (let i = 0; i < 1000; i++) {
          arr[i] = i
        }
        let result = arr.toString()
        expect(result!.length).assertLarger(0)
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3300
     * @tc.name testSparseArrayToString033
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1.5,2.5,3.5')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString033', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<number>(1.5, 2.5, 3.5)
        let result = arr.toString()
        expect(result).assertEqual('1.5,2.5,3.5')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3400
     * @tc.name testSparseArrayToString034
     * @tc.desc Test SparseArray.toString, verify method result (result equals 'true,false,true')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString034', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<boolean>(true, false, true)
        let result = arr.toString()
        expect(result).assertEqual('true,false,true')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3500
     * @tc.name testSparseArrayToString035
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1,2,3')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString035', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<bigint>(1n, 2n, 3n)
        let result = arr.toString()
        expect(result).assertEqual('1,2,3')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3600
     * @tc.name testSparseArrayToString036
     * @tc.desc Test SparseArray.toString, verify method result (result equals '1,two,true')
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString036', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int | string | boolean>(1, 'two', true)
        let result = arr.toString()
        expect(result).assertEqual('1,two,true')
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3700
     * @tc.name testSparseArrayToString037
     * @tc.desc toString on SparseArray<byte> joins byte values as comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString037', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<byte>(10 as byte, 127 as byte, 20 as byte);
        const result = arr.toString();
        expect(result).assertEqual('10,127,20');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3800
     * @tc.name testSparseArrayToString038
     * @tc.desc toString on SparseArray<short> joins short values as comma-separated string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString038', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<short>(100 as short, 200 as short, 300 as short);
        expect(arr.toString()).assertEqual('100,200,300');
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_3900
     * @tc.name testSparseArrayToString039
     * @tc.desc toString on SparseArray with 65535-char string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString039', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const longElem = "y".repeat(65535);
        const arr = new SparseArray<string>(longElem);
        const result = arr.toString();
        expect(result.length).assertEqual(65535);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4000
     * @tc.name testSparseArrayToString040
     * @tc.desc toString on SparseArray with 32768-char string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString040', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chunk = "m".repeat(32768);
        const arr = new SparseArray<string>(chunk);
        expect(arr.toString().length).assertEqual(32768);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4100
     * @tc.name testSparseArrayToString041
     * @tc.desc toString on SparseArray with 65536-char string element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString041', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const chunk = "t".repeat(65536);
        const arr = new SparseArray<string>(chunk);
        expect(arr.toString().length).assertEqual(65536);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4200
     * @tc.name testSparseArrayToString042
     * @tc.desc toString on SparseArray with hex literal 0xFF element
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString042', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<int>();
        arr[0] = 0xFF;
        expect(arr.toString()).assertEqual("255");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4300
     * @tc.name testSparseArrayToString043
     * @tc.desc toString on SparseArray<long> joins long values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString043', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<long>(1 as long, 10000000000 as long);
        expect(arr.toString()).assertEqual("1,10000000000");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4400
     * @tc.name testSparseArrayToString044
     * @tc.desc toString on SparseArray<float> joins float values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString044', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<float>(1.0f, 2.5f);
        expect(arr.toString()).assertEqual("1,2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4500
     * @tc.name testSparseArrayToString045
     * @tc.desc toString on SparseArray<double> joins double values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString045', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<double>(1.25, 2.5);
        expect(arr.toString()).assertEqual("1.25,2.5");
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_SPARSE_ARRAY_TO_STRING_4600
     * @tc.name testSparseArrayToString046
     * @tc.desc toString on SparseArray<char> joins char values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testSparseArrayToString046', Short.toInt(TestType.FUNCTION) | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
        const arr = new SparseArray<char>(c'A', c'B');
        expect(arr.toString()).assertEqual("A,B");
    });

  });
}
