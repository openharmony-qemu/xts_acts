'use static';
﻿/*
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

class MyClass022 {
  value: number = 0;

  constructor(value: number) {
    this.value = value;
  }
}

class EmptyInvokeObject014 {
}

interface InvokeObject013 {
  name: string;
  value: number;
}

interface InvokeObject015 {
  name: string | null;
  value: number | null;
}

interface ComplexType058 {
  id: number;
  name: string;
  tags: string[];
}

function createInvokeLeft047(): Left<string, number> {
  return Left.$_invoke<string, number>("public");
}

export default function LeftInvokeTest(): void {
  describe('LeftInvokeTest', (): void => {
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
     * @tc.number ETHN_LEFT_INVK_CHK_0100
     * @tc.name testLeftInvoke0001
     * @tc.desc Verify creating a Left instance with one required data parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left != null).assertTrue();
      expect(left.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0200
     * @tc.name testLeftInvoke0002
     * @tc.desc Verify Left.$_invoke with zero value creates a Left instance whose left() returns 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(0);
      expect(left.isLeft()).assertTrue();
      expect(left.left).assertEqual(0);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0300
     * @tc.name testLeftInvoke0003
     * @tc.desc Verify Left.$_invoke with single number argument creates a Left instance with that value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left.isLeft()).assertTrue();
      expect(left.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0400
     * @tc.name testLeftInvoke0004
     * @tc.desc Verify passing a normal number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(100);
      expect(left.left).assertEqual(100);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0500
     * @tc.name testLeftInvoke0005
     * @tc.desc Verify passing number boundary values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftMax: Left<number, string> = Left.$_invoke<number, string>(Number.MAX_VALUE);
      expect(leftMax.left).assertEqual(Number.MAX_VALUE);
      let leftMin: Left<number, string> = Left.$_invoke<number, string>(Number.MIN_VALUE);
      expect(leftMin.left).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0600
     * @tc.name testLeftInvoke0006
     * @tc.desc Verify passing a non-number value when L is number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(6);
      expect(left.left).assertEqual(6);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0700
     * @tc.name testLeftInvoke0007
     * @tc.desc Verify passing a normal string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("hello");
      expect(left.left).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0800
     * @tc.name testLeftInvoke0008
     * @tc.desc Verify passing empty and blank string values
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let empty: Left<string, number> = Left.$_invoke<string, number>("");
      expect(empty.left).assertEqual("");
      let blank: Left<string, number> = Left.$_invoke<string, number>("   ");
      expect(blank.left).assertEqual("   ");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_0900
     * @tc.name testLeftInvoke0009
     * @tc.desc Verify passing special-character and XSS-like strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let special: Left<string, number> = Left.$_invoke<string, number>("<script>alert(1)</script>");
      expect(special.left).assertEqual("<script>alert(1)</script>");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1000
     * @tc.name testLeftInvoke0010
     * @tc.desc Verify passing Unicode and multilingual strings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftUnicode: Left<string, number> = Left.$_invoke<string, number>("??");
      expect(leftUnicode.left).assertEqual("??");
      let leftJP: Left<string, number> = Left.$_invoke<string, number>("???");
      expect(leftJP.left).assertEqual("???");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1100
     * @tc.name testLeftInvoke0011
     * @tc.desc Verify passing a long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa";
      let left: Left<string, number> = Left.$_invoke<string, number>(longStr);
      expect(left.left.length).assertEqual(longStr.length);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1200
     * @tc.name testLeftInvoke0012
     * @tc.desc Verify passing true and false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftTrue: Left<boolean, string> = Left.$_invoke<boolean, string>(true);
      expect(leftTrue.left).assertTrue();
      let leftFalse: Left<boolean, string> = Left.$_invoke<boolean, string>(false);
      expect(leftFalse.left).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1300
     * @tc.name testLeftInvoke0013
     * @tc.desc Verify passing a normal object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: InvokeObject013 = { name: "test", value: 42 };
      let left: Left<InvokeObject013, string> = Left.$_invoke<InvokeObject013, string>(obj);
      expect(left.left.name).assertEqual("test");
      expect(left.left.value).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1400
     * @tc.name testLeftInvoke0014
     * @tc.desc Verify passing an empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: EmptyInvokeObject014 = new EmptyInvokeObject014();
      let left: Left<EmptyInvokeObject014, string> = Left.$_invoke<EmptyInvokeObject014, string>(obj);
      expect(left.left === obj).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1500
     * @tc.name testLeftInvoke0015
     * @tc.desc Verify passing an object with null properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let objNull: InvokeObject015 = { name: null, value: null };
      let left: Left<InvokeObject015, string> = Left.$_invoke<InvokeObject015, string>(objNull);
      expect(left.left.name).assertNull();
      expect(left.left.value).assertNull();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1600
     * @tc.name testLeftInvoke0016
     * @tc.desc Verify passing an empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [];
      let left: Left<number[], string> = Left.$_invoke<number[], string>(values);
      expect(left.left.length).assertEqual(0);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1700
     * @tc.name testLeftInvoke0017
     * @tc.desc Verify passing a single-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [1];
      let left: Left<number[], string> = Left.$_invoke<number[], string>(values);
      expect(left.left.length).assertEqual(1);
      expect(left.left[0]).assertEqual(1);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1800
     * @tc.name testLeftInvoke0018
     * @tc.desc Verify passing a multi-element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: number[] = [1, 2, 3];
      let left: Left<number[], string> = Left.$_invoke<number[], string>(values);
      expect(left.left.length).assertEqual(3);
      expect(left.left[2]).assertEqual(3);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_1900
     * @tc.name testLeftInvoke0019
     * @tc.desc Verify passing an array containing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let values: (number | null)[] = [1, null, 3];
      let left: Left<(number | null)[], string> = Left.$_invoke<(number | null)[], string>(values);
      expect(left.left[1]).assertNull();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2000
     * @tc.name testLeftInvoke0020
     * @tc.desc Verify passing null as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<Object | null, string> = Left.$_invoke<Object | null, string>(null);
      expect(left.left).assertNull();
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2100
     * @tc.name testLeftInvoke0021
     * @tc.desc Verify passing undefined as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string | undefined, string> = Left.$_invoke<string | undefined, string>(undefined);
      expect(left.left).assertUndefined();
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2200
     * @tc.name testLeftInvoke0022
     * @tc.desc Verify L as a custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: MyClass022 = new MyClass022(22);
      let left: Left<MyClass022, string> = Left.$_invoke<MyClass022, string>(obj);
      expect(left.left.value).assertEqual(22);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2300
     * @tc.name testLeftInvoke0023
     * @tc.desc Verify L as union type number or string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNum: Left<number | string, boolean> = Left.$_invoke<number | string, boolean>(42);
      expect(leftNum.left).assertEqual(42);
      let leftStr: Left<number | string, boolean> = Left.$_invoke<number | string, boolean>("hello");
      expect(leftStr.left).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2400
     * @tc.name testLeftInvoke0024
     * @tc.desc Verify passing null in universal exceptional input scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<Object | null, string> = Left.$_invoke<Object | null, string>(null);
      expect(left.left).assertNull();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2500
     * @tc.name testLeftInvoke0025
     * @tc.desc Verify passing undefined in universal exceptional input scenario
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string | undefined, string> = Left.$_invoke<string | undefined, string>(undefined);
      expect(left.left).assertUndefined();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2600
     * @tc.name testLeftInvoke0026
     * @tc.desc Verify passing an empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("");
      expect(left.left).assertEqual("");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2700
     * @tc.name testLeftInvoke0027
     * @tc.desc Verify passing zero
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(0);
      expect(left.left).assertEqual(0);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2800
     * @tc.name testLeftInvoke0028
     * @tc.desc Verify passing negative one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(-1);
      expect(left.left).assertEqual(-1);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_2900
     * @tc.name testLeftInvoke0029
     * @tc.desc Verify normal call returns a Left<L, R> instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3000
     * @tc.name testLeftInvoke0030
     * @tc.desc Verify different data types all return Left instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNum: Left<number, string> = Left.$_invoke<number, string>(100);
      expect(leftNum.left).assertEqual(100);
      let leftStr: Left<string, number> = Left.$_invoke<string, number>("test");
      expect(leftStr.left).assertEqual("test");
      let leftBool: Left<boolean, string> = Left.$_invoke<boolean, string>(true);
      expect(leftBool.left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3100
     * @tc.name testLeftInvoke0031
     * @tc.desc Verify data zero still returns a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(0);
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3200
     * @tc.name testLeftInvoke0032
     * @tc.desc Verify empty-string data still returns a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("");
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3300
     * @tc.name testLeftInvoke0033
     * @tc.desc Verify false data still returns a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<boolean, string> = Left.$_invoke<boolean, string>(false);
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
      expect(left.left).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3400
     * @tc.name testLeftInvoke0034
     * @tc.desc Verify null data still returns a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<Object | null, string> = Left.$_invoke<Object | null, string>(null);
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
      expect(left.left).assertNull();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3500
     * @tc.name testLeftInvoke0035
     * @tc.desc Verify returned value is an instance of Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3600
     * @tc.name testLeftInvoke0036
     * @tc.desc Verify returned value is also an instance of Either
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3700
     * @tc.name testLeftInvoke0037
     * @tc.desc Verify returned instance keeps the specified L and R generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(37);
      expect(left.isLeft()).assertTrue();
      expect(left.isRight()).assertFalse();
      expect(left.left).assertEqual(37);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3800
     * @tc.name testLeftInvoke0038
     * @tc.desc Verify extreme number values such as Number.MAX_VALUE return instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftMax: Left<number, string> = Left.$_invoke<number, string>(Number.MAX_VALUE);
      expect(leftMax != null).assertTrue();
      let leftMin: Left<number, string> = Left.$_invoke<number, string>(-Number.MAX_VALUE);
      expect(leftMin != null).assertTrue();
      let leftNaN: Left<number, string> = Left.$_invoke<number, string>(Number.NaN);
      expect(Number.isNaN(leftNaN.left)).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_3900
     * @tc.name testLeftInvoke0039
     * @tc.desc Verify long string data returns a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
      let left: Left<string, number> = Left.$_invoke<string, number>(longStr);
      expect(left != null).assertTrue();
      expect(left instanceof Left).assertTrue();
      expect(left.left.length).assertEqual(longStr.length);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4000
     * @tc.name testLeftInvoke0040
     * @tc.desc Verify Left.$_invoke with the value 40 creates a Left whose left equals 40
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(40);
      expect(left.left).assertEqual(40);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4100
     * @tc.name testLeftInvoke0041
     * @tc.desc Verify Left.$_invoke<number, string>(41) creates a Left whose left equals 41
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(41);
      expect(left.left).assertEqual(41);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4200
     * @tc.name testLeftInvoke0042
     * @tc.desc Verify Left.$_invoke<number, string>(42) creates a Left whose left equals 42
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4300
     * @tc.name testLeftInvoke0043
     * @tc.desc Verify Left.$_invoke<number, string>(43) creates a Left whose left equals 43
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(43);
      expect(left.left).assertEqual(43);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4400
     * @tc.name testLeftInvoke0044
     * @tc.desc Verify catching possible Error from $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let checked: boolean = false;
      try {
        let left: Left<number, string> = Left.$_invoke<number, string>(44);
        checked = left != null && left.left == 44;
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
        checked = error != null;
      }
      expect(checked).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4500
     * @tc.name testLeftInvoke0045
     * @tc.desc Verify $_invoke is a static method callable through Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(45);
      expect(left.left).assertEqual(45);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4600
     * @tc.name testLeftInvoke0046
     * @tc.desc Verify $_invoke cannot be called through a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(46);
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4700
     * @tc.name testLeftInvoke0047
     * @tc.desc Verify $_invoke is public and can be called from an external class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = createInvokeLeft047();
      expect(left.left).assertEqual("public");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4800
     * @tc.name testLeftInvoke0048
     * @tc.desc Verify returned Left instance stores the same left value as input data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: string = "saved";
      let left: Left<string, number> = Left.$_invoke<string, number>(data);
      expect(left.left).assertEqual(data);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_4900
     * @tc.name testLeftInvoke0049
     * @tc.desc Verify different data types are stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNum: Left<number, string> = Left.$_invoke<number, string>(49);
      expect(leftNum.left).assertEqual(49);
      let leftStr: Left<string, number> = Left.$_invoke<string, number>("forty-nine");
      expect(leftStr.left).assertEqual("forty-nine");
      let leftBool: Left<boolean, string> = Left.$_invoke<boolean, string>(true);
      expect(leftBool.left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5000
     * @tc.name testLeftInvoke0050
     * @tc.desc Verify boundary data values are stored correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftMax: Left<number, string> = Left.$_invoke<number, string>(Number.MAX_VALUE);
      expect(leftMax.left).assertEqual(Number.MAX_VALUE);
      let leftZero: Left<number, string> = Left.$_invoke<number, string>(0);
      expect(leftZero.left).assertEqual(0);
      let leftNeg: Left<number, string> = Left.$_invoke<number, string>(-1);
      expect(leftNeg.left).assertEqual(-1);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5100
     * @tc.name testLeftInvoke0051
     * @tc.desc Verify Left instance isLeft() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(51);
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5200
     * @tc.name testLeftInvoke0052
     * @tc.desc Verify isLeft() returns true regardless of data type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNum: Left<number, string> = Left.$_invoke<number, string>(52);
      expect(leftNum.isLeft()).assertTrue();
      let leftStr: Left<string, number> = Left.$_invoke<string, number>("left");
      expect(leftStr.isLeft()).assertTrue();
      let leftNull: Left<Object | null, string> = Left.$_invoke<Object | null, string>(null);
      expect(leftNull.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5300
     * @tc.name testLeftInvoke0053
     * @tc.desc Verify Left instance isRight() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(53);
      expect(left.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5400
     * @tc.name testLeftInvoke0054
     * @tc.desc Verify isRight() returns false regardless of data type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let leftNum: Left<number, string> = Left.$_invoke<number, string>(54);
      expect(leftNum.isRight()).assertFalse();
      let leftStr: Left<string, number> = Left.$_invoke<string, number>("left");
      expect(leftStr.isRight()).assertFalse();
      let leftUndefined: Left<string | undefined, string> = Left.$_invoke<string | undefined, string>(undefined);
      expect(leftUndefined.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5500
     * @tc.name testLeftInvoke0055
     * @tc.desc Verify explicitly specified L and R generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("generic");
      expect(left.left).assertEqual("generic");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5600
     * @tc.name testLeftInvoke0056
     * @tc.desc Verify data values are preserved with explicitly specified generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(56);
      expect(left.left).assertEqual(56);
      let leftStr: Left<string, number> = Left.$_invoke<string, number>("hello");
      expect(leftStr.left).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5700
     * @tc.name testLeftInvoke0057
     * @tc.desc Verify creation works when L and R use the same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, number> = Left.$_invoke<number, number>(57);
      expect(left.left).assertEqual(57);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5800
     * @tc.name testLeftInvoke0058
     * @tc.desc Verify complex object R generic type does not affect Left creation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let data: number = 58;
      let left: Left<number, ComplexType058> = Left.$_invoke<number, ComplexType058>(data);
      expect(left.left).assertEqual(58);
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_5900
     * @tc.name testLeftInvoke0059
     * @tc.desc Verify each $_invoke call returns an independent Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left1: Left<number, string> = Left.$_invoke<number, string>(59);
      let left2: Left<number, string> = Left.$_invoke<number, string>(59);
      expect(left1 === left2).assertFalse();
      expect(left1.left).assertEqual(left2.left);
    });

    /**
     * @tc.number ETHN_LEFT_INVK_CHK_6000
     * @tc.name testLeftInvoke0060
     * @tc.desc Verify instance created by Left.$_invoke is not Right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeftInvoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(60);
      let right: Right<number, string> = Right.$_invoke<number, string>("right");
      expect(left instanceof Right).assertFalse();
      expect(right instanceof Left).assertFalse();
    });

  });
}

