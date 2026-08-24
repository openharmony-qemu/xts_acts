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

class JsonData {
  key: int = 0;
}

export default function FloatToString4Test2(): void {
  describe('FloatToString4Test2', () => {
    beforeAll(() => {
    });

    beforeEach(async () => {
      await Utils.msSleep(30);
    });

    afterEach(() => {
    });

    afterAll(async (): Promise<void> => {
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0100
     * @tc.name testFloatToString001
     * @tc.desc Verify toString(object literal) throws ClassCastError
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        const obj: Object = new Object();
        Float.toString({} as Object as float);
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0200
     * @tc.name testFloatToString002
     * @tc.desc Verify toString() on Float(0.5f) returns '0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.5f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0300
     * @tc.name testFloatToString003
     * @tc.desc Verify toString() on Float(0.25f) returns '0.25'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.25f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('0.25');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0400
     * @tc.name testFloatToString004
     * @tc.desc Verify toString() on Float(0.125f) returns '0.125'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 0.125f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('0.125');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0500
     * @tc.name testFloatToString005
     * @tc.desc Verify toString() on Float(1.0f/3.0f) returns a string representation
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0f / 3.0f;
      const f: Float = new Float(val);
      const result: string = f.toString();
      expect(result).assertEqual('0.33333334');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0600
     * @tc.name testFloatToString006
     * @tc.desc Verify toString() on Float(1.23456789f) returns a string with precision
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.23456789f;
      const f: Float = new Float(val);
      const result: string = f.toString();
      expect(result).assertEqual('1.2345679');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0700
     * @tc.name testFloatToString007
     * @tc.desc Verify toString() on Float(42) from int constructor returns '42'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: int = 5;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0800
     * @tc.name testFloatToString008
     * @tc.desc Verify toString() on Float(42L) from long constructor returns '42'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: long = 42;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('42');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_0900
     * @tc.name testFloatToString009
     * @tc.desc Verify toString() on Float(42.0) from double constructor returns '42'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: double = 2.0;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('2');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1000
     * @tc.name testFloatToString010
     * @tc.desc Verify toString() immutability after multiple calls returns same result
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 3.14f;
      const f: Float = new Float(val);
      const firstResult: string = f.toString();
      const secondResult: string = f.toString();
      const thirdResult: string = f.toString();
      expect(firstResult).assertEqual(secondResult);
      expect(secondResult).assertEqual(thirdResult);
    });
    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1100
     * @tc.name testFloatToString011
     * @tc.desc Verify toString() on Float(-0.0f) returns '0' equaling '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.0f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1200
     * @tc.name testFloatToString012
     * @tc.desc Verify toString() on Float.MAX_VALUE returns '3.4028235e+38'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('3.4028235e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1300
     * @tc.name testFloatToString013
     * @tc.desc Verify toString() on -Float.MAX_VALUE returns '-3.4028235e+38'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -Float.MAX_VALUE;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('-3.4028235e+38');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1400
     * @tc.name testFloatToString014
     * @tc.desc Verify toString() on Float(1.0e7f) returns '10000000'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e7f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('10000000');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1500
     * @tc.name testFloatToString015
     * @tc.desc Verify toString() on Float(1.0e-6f) returns '0.000001'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 1.0e-6f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('0.000001');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1600
     * @tc.name testFloatToString016
     * @tc.desc Verify toString() on Float(16777217.0f) returns '16777216' due to precision loss
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 16777217.0f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('16777216');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1700
     * @tc.name testFloatToString017
     * @tc.desc Verify toString() on Float(-16777215.0f) returns '-16777215'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -16777215.0f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('-16777215');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1800
     * @tc.name testFloatToString018
     * @tc.desc Verify toString() on Float(3.14159265f) returns '3.1415927'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = 3.14159265f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('3.1415927');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_1900
     * @tc.name testFloatToString019
     * @tc.desc Verify toString() on Float(-0.5f) returns '-0.5'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const val: float = -0.5f;
      const f: Float = new Float(val);
      expect(f.toString()).assertEqual('-0.5');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_2000
     * @tc.name testFloatToString020
     * @tc.desc Verify toString() on Float(0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(0.0f);
      expect(f.toString()).assertEqual('0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_FLOAT_TOSTRING_PART4_2100
     * @tc.name testFloatToString021
     * @tc.desc Verify toString() on Float(-0.0f) returns '0'
     * @tc.size MEDIUMTEST
     * @tc.type FUNCTION
     * @tc.level LEVEL2
     */
    it('testFloatToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const f: Float = new Float(-0.0f);
      expect(f.toString()).assertEqual('0');
    });

  })
}
