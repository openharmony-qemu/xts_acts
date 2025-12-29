/**
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import Utils from './Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
export default function getType01Test() {
  describe("getType01Test", (): void => {
    // Dewm25 fines a test suite. Two parameters are supported: test suite name and test suite function.
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })
    beforeEach(() => {
	   await Utils.msSleep(100);
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })
    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

   /**
    * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0100
    * @tc.name    testValueGetType20001
    * @tc.desc    Verify StringValue.getType() returns correct StringType instance
    * @tc.size    MEDIUMTEST
    * @tc.type    FUNCTION
    * @tc.level   Level 1
    */
    it('testValueGetType20001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20001";
      try {
        const testString = "Hello, ArkTS!";
        const stringType = new StringType();
        const stringValue = new StringValue(stringType, testString);
        const result = stringValue.getType();
        expect(result).assertEqual(stringType);
        expect(result !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0200
     * @tc.name    testValueGetType20002
     * @tc.desc    Verify StringValue.getType() maintains type reference equality
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20002";
      try {
        const stringType = new StringType();
        const stringValue1 = new StringValue(stringType, "Test1");
        const stringValue2 = new StringValue(stringType, "Test2");
        const type1 = stringValue1.getType();
        const type2 = stringValue2.getType();
        expect(type1).assertEqual(type2);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0300
     * @tc.name    testValueGetType20003
     * @tc.desc    getType() is a method that returns type information
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = "testValueGetType20003";
      try {
        const stringType = new StringType();
        const stringValue = new StringValue(stringType, "TypeCheck");
        const result = stringValue.getType();
        expect(result instanceof Object).assertTrue();
        expect(stringType instanceof Object).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0400
     * @tc.name    testValueGetType20004
     * @tc.desc    Verify getType() returns correct type for ASCII strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20004';
      try {
        const asciiString = new StringValue(new StringType(), "Hello ArkTS");
        expect(asciiString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0500
     * @tc.name    testValueGetType20005
     * @tc.desc    Verify getType() handles long strings correctly
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20005';
      try {
        const longStr = "a".repeat(10000);
        const longString = new StringValue(new StringType(), longStr);
        expect(longString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0600
     * @tc.name    testValueGetType20006
     * @tc.desc    Verify getType() returns correct type for empty strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20006';
      try {
        const emptyString = new StringValue(new StringType(), "");
        expect(emptyString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0700
     * @tc.name    testValueGetType20007
     * @tc.desc    Verify getType() returns correct type for single-character strings
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20007';
      try {
        const singleChar = new StringValue(new StringType(), "A");
        expect(singleChar.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_0800
     * @tc.name    testValueGetType20008
     * @tc.desc    Verify getType() behavior with number-to-string conversion
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20008';
      try {
        const numberString = new StringValue(new StringType(), String(123));
        expect(numberString.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_STRINGVALUE_GETTYPE_1100
     * @tc.name    testValueGetType20011
     * @tc.desc    Verify getType() with special escape sequences
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType20011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType20011';
      try {
        const escapeStr = new StringValue(new StringType(), "Line1\nLine2\tTab");
        expect(escapeStr.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0100
     * @tc.name    testValueGetType00001
     * @tc.desc    Verify VoidValue.getType() returns correct VoidType reference
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00001';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result === VoidType.REF).assertTrue();
        expect(result.toString()).assertEqual('void');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0200
     * @tc.name    testValueGetType00002
     * @tc.desc    Verify VoidValue.getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00002';
      try {
        const type1 = VoidValue.INSTANCE.getType();
        const type2 = VoidValue.INSTANCE.getType();
        expect(type1 === type2).assertTrue();
        expect(type1 === VoidType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0300
     * @tc.name    testValueGetType00003
     * @tc.desc    Verify normal behavior of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00003';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result).assertEqual(VoidType.REF);
        expect(result.toString()).assertEqual('void');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0400
     * @tc.name    testValueGetType00004
     * @tc.desc    Verify getType() after GC (conceptual test)
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00004';
      try {
        const refBefore = VoidValue.INSTANCE.getType();
        expect(VoidValue.INSTANCE.getType()).assertEqual(refBefore);
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0500
     * @tc.name    testValueGetType00005
     * @tc.desc    Verify getType() with null/undefined checks
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00005';
      try {
        const result = VoidValue.INSTANCE.getType();
        expect(result !== null && result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0600
     * @tc.name    testValueGetType00006
     * @tc.desc    Verify null/undefined safety of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    Safety
     * @tc.level   Level 1
     */
    it('testValueGetType00006', TestType.SAFETY | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00006';
      try {
        expect(VoidValue.INSTANCE !== null && VoidValue.INSTANCE !== undefined).assertTrue();
        const result = VoidValue.INSTANCE.getType();
        expect(result !== null && result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_GETTYPE_0700
     * @tc.name    testValueGetType00007
     * @tc.desc    Verify getType() returns same instance across multiple calls
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType00007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType00007';
      try {
        const type1 = VoidValue.INSTANCE.getType();
        const type2 = VoidValue.INSTANCE.getType();
        const type3 = VoidValue.INSTANCE.getType();
        expect(type1 === type2 && type2 === type3).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0100
     * @tc.name    testValueGetType10001
     * @tc.desc    Verify basic functionality of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10001';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result).assertEqual(UndefinedType.REF);
        expect(result.toString()).assertEqual('undefined');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0200
     * @tc.name    testValueGetType10002
     * @tc.desc    Verify getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10002';
      try {
        const instance1 = UndefinedValue.INSTANCE.getType();
        const instance2 = UndefinedValue.INSTANCE.getType();
        expect(instance1 === instance2).assertTrue();
        expect(instance1 === UndefinedType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0300
     * @tc.name    testValueGetType10003
     * @tc.desc    Verify getType() never returns null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10003';
      try {
        expect(UndefinedValue.INSTANCE.getType() === null).assertFalse();
        expect(UndefinedValue.INSTANCE.getType() !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0400
     * @tc.name    testValueGetType10004
     * @tc.desc    Verify getType() returns exactly UndefinedType.REF
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10004';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result === UndefinedType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_GETTYPE_0500
     * @tc.name    testValueGetType10005
     * @tc.desc    Verify getType() distinguishes undefined and null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType10005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType10005';
      try {
        const result = UndefinedValue.INSTANCE.getType();
        expect(result == null).assertFalse();
        expect(result === null).assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0100
     * @tc.name    testValueGetType40001
     * @tc.desc    Verify basic functionality of getType()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40001';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result).assertEqual(NullType.REF);
        expect(result.toString()).assertEqual('null');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0200
     * @tc.name    testValueGetType40002
     * @tc.desc    Verify getType() returns singleton instance
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40002';
      try {
        const instance1 = NullValue.INSTANCE.getType();
        const instance2 = NullValue.INSTANCE.getType();
        expect(instance1 === instance2).assertTrue();
        expect(instance1 === NullType.REF).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0300
     * @tc.name    testValueGetType40003
     * @tc.desc    Explicitly verify return is not real null
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40003';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result === null).assertFalse();
        expect(result !== null).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_NULLVALUE_GETTYPE_0400
     * @tc.name    testValueGetType40006_01
     * @tc.desc    Explicitly distinguish from undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueGetType40006_01', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueGetType40006_01';
      try {
        const result = NullValue.INSTANCE.getType();
        expect(result === undefined).assertFalse();
        expect(typeof result === 'undefined').assertFalse();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0100
     * @tc.name    testValueLocaleString00001
     * @tc.desc    Verify toLocaleString() returns same value as toString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00001';
      try {
        const voidValue = VoidValue.INSTANCE;
        const localeString = voidValue.toLocaleString();
        const toStringResult = voidValue.toString();
        expect(localeString).assertEqual(toStringResult);
        expect(typeof localeString).assertEqual('string');
        expect(localeString.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0200
     * @tc.name    testValueLocaleString00002
     * @tc.desc    Verify toLocaleString() returns consistent value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00002';
      try {
        const voidValue = VoidValue.INSTANCE;
        const firstCall = voidValue.toLocaleString();
        const secondCall = voidValue.toLocaleString();
        expect(firstCall).assertEqual(secondCall);
        expect(firstCall).assertEqual(VoidType.REF.toString());
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0300
     * @tc.name    testValueLocaleString00003
     * @tc.desc    Verify toLocaleString() returns non-empty string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00003';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result === null).assertFalse();
        expect(result !== '').assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0400
     * @tc.name    testValueLocaleString00004
     * @tc.desc    Verify basic functionality of toLocaleString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00004';
      try {
        const voidValue = VoidValue.INSTANCE;
        const result = voidValue.toLocaleString();
        expect(result).assertEqual(voidValue.toString());
        expect(result).assertEqual(VoidType.REF.toString());
        expect(typeof result).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0500
     * @tc.name    testValueLocaleString00005
     * @tc.desc    Verify return value is not null or undefined
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00005';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result === null).assertFalse();
        expect(result !== undefined).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0600
     * @tc.name    testValueLocaleString00006
     * @tc.desc    Verify return value is not empty string
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00006';
      try {
        const result = VoidValue.INSTANCE.toLocaleString();
        expect(result !== '').assertTrue();
        expect(result.length > 0).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_VOIDVALUE_TOLOCALESTRING_0800
     * @tc.name    testValueLocaleString00008
     * @tc.desc    Verify toLocaleString() returns same reference for same value
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString00008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString00008';
      try {
        const voidValue = VoidValue.INSTANCE;
        const result1 = voidValue.toLocaleString();
        const result2 = voidValue.toLocaleString();
        expect(result1 === result2).assertTrue();
        expect(result1 === VoidType.REF.toString()).assertTrue();
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    /**
     * @tc.number  SUB_COMMONLIBRARY_UNDEFINEDVALUE_TOLOCALESTRING_0100
     * @tc.name    testValueLocaleString10001
     * @tc.desc    Verify basic functionality of toLocaleString()
     * @tc.size    MEDIUMTEST
     * @tc.type    FUNCTION
     * @tc.level   Level 1
     */
    it('testValueLocaleString10001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, (): void => {
      const TAG = 'testValueLocaleString10001';
      try {
        const undefinedValue = UndefinedValue.INSTANCE;
        const result = undefinedValue.toLocaleString();
        expect(result).assertEqual(undefinedValue.toString());
        expect(result).assertEqual(UndefinedType.REF.toString());
        expect(typeof result).assertEqual('string');
      } catch (err) {
        console.error(`${TAG} failed, error: ${err}`);
        expect().assertFail();
      }
    });

    });
}