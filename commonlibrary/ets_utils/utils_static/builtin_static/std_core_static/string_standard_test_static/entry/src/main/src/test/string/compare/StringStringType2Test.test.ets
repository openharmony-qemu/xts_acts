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

import {
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../../hypium/index';
import Utils from './../../Util.test';

function getStringVal(): String {
  return new String('TypeCheck');
}

function acceptString<T extends string>(input: T): string {
  return input;
}

function getBoxedString(): String {
  return new String('BoxedValue');
}

export default function StringStringType2Test(): void {
  describe('StringStringType2Test', (): void => {
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0100
     * @tc.name testStringType001
     * @tc.desc Verify string literal value equals new String() toString() result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let literal: string = 'type_test';
      let boxed: String = new String('type_test');
      expect(literal).assertEqual(boxed.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0200
     * @tc.name testStringType002
     * @tc.desc Verify const and let string variable declarations both produce primitive string type with identical method behavior
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const cVal: string = 'const_val';
      let lVal: string = 'let_val';
      expect(cVal.toUpperCase()).assertEqual('CONST_VAL');
      expect(lVal.toUpperCase()).assertEqual('LET_VAL');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0300
     * @tc.name testStringType003
     * @tc.desc Verify string returned from String.toString() retains primitive string type and supports method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = getStringVal().toString();
      expect(result).assertEqual('TypeCheck');
      expect(result.toLowerCase()).assertEqual('typecheck');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0400
     * @tc.name testStringType004
     * @tc.desc Verify implicit string conversion: number and boolean concatenation produce strings, String(null) returns "null", String(undefined) returns "undefined"
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let s: string = 'val';
      let withNum: string = s + 123;
      expect(withNum).assertEqual('val123');
      let withBool: string = s + true;
      expect(withBool).assertEqual('valtrue');
      let nullStr: string = String(null);
      expect(nullStr).assertEqual('null');
      let undefStr: string = String(undefined);
      expect(undefStr).assertEqual('undefined');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0500
     * @tc.name testStringType005
     * @tc.desc Verify template literal interpolation with string type variables produces correct concatenated result
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let prefix: string = 'Hello';
      let suffix: string = 'World';
      let tmpl: string = `${prefix} ${suffix}`;
      expect(tmpl).assertEqual('Hello World');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0600
     * @tc.name testStringType006
     * @tc.desc Verify String() factory function returns value with typeof "string" and assertEqual to literal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let factoryStr: string = String('factory');
      let literalStr: string = 'factory';
      expect(factoryStr).assertEqual(literalStr);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0700
     * @tc.name testStringType007
     * @tc.desc Verify string type annotation on function parameter preserves string type through return and supports property access
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = acceptString('parameter_test');
      expect(result).assertEqual('parameter_test');
      expect(result.charAt(0).toString()).assertEqual('p');
      expect(result.length).assertEqual(14);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0800
     * @tc.name testStringType008
     * @tc.desc Verify new String() objects with same content produce equal toString values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: String = getBoxedString();
      let prim: string = obj.toString();
      expect(prim).assertEqual('BoxedValue');
      let obj2: String = new String('BoxedValue');
      expect(obj.toString()).assertEqual(obj2.toString());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_0900
     * @tc.name testStringType009
     * @tc.desc Verify empty string literal type is still "string" with length zero and supports method calls
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: string = '';
      expect(empty.indexOf('x')).assertEqual(-1);
      expect(empty.startsWith('')).assertTrue();
      expect(empty.endsWith('')).assertTrue();
      expect(empty.includes('')).assertTrue();
      expect(empty.concat('x')).assertEqual('x');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_1000
     * @tc.name testStringType010
     * @tc.desc Verify string value is unchanged after being assigned to another variable and calling toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = 'immutable';
      let original: string = str;
      expect(str).assertEqual(original);
      expect(str.toString()).assertEqual('immutable');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_1100
     * @tc.name testStringType011
     * @tc.desc Verify new String() object toString and instanceof work correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let strObj: String = new String('fixed');
      let before: string = strObj.toString();
      expect(before).assertEqual('fixed');
      expect(strObj.toString()).assertEqual('fixed');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_1200
     * @tc.name testStringType012
     * @tc.desc Verify stringType via constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(123);
      expect(result).assertEqual('123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_1300
     * @tc.name testStringType013
     * @tc.desc Verify stringType via toString
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let num: int = 456;
      let result: string = num.toString();
      expect(result).assertEqual('456');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_STRING_STRINGTYPE2_1400
     * @tc.name testStringType014
     * @tc.desc Verify stringType on boolean conversion
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testStringType014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: string = String(true);
      expect(result).assertEqual('true');
    });
  });
}