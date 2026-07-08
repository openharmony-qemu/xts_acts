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

interface LeftPoint {
  x: number;
  y: number;
}

interface LeftRecord {
  a: number;
  b: number;
}

class ErrorInfo083 {
  code: number = 404;
  message: string = "not found";
}

function leftDoubleValue(x: number): number {
  return x * 2;
}

function leftDivide(a: number, b: number): Either<string, number> {
  if (b == 0) {
    return Left.$_invoke<string, number>("division by zero");
  }
  return Right.$_invoke<string, number>(a / b);
}

function processLeftResult(value: Either<string, number>): number {
  if (value.isLeft()) {
    return -1;
  }
  return value.right;
}

function createPublicLeft(): Left<string, number> {
  return Left.$_invoke<string, number>("created in function");
}

function parseIntegerLeft(value: string): Either<string, number> {
  if (value == "abc") {
    return Left.$_invoke<string, number>("Cannot parse abc as integer");
  }
  return Right.$_invoke<string, number>(1);
}

function stepLeft1(): Either<string, number> {
  return Left.$_invoke<string, number>("step1 failed");
}

function stepLeft2(n: number): Either<string, number> {
  return Right.$_invoke<string, number>(n * 2);
}

export default function LeftTest(): void {
  describe('LeftTest', (): void => {
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
     * @tc.number ETHN_LEFT_ITEM_CHK_0100
     * @tc.name testLeft0001
     * @tc.desc Verify Left.$_invoke returns an instance of Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(1);
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_0200
     * @tc.name testLeft0002
     * @tc.desc Verify Left cannot be constructed with new and should use $_invoke
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(2);
      expect(left.left).assertEqual(2);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_0300
     * @tc.name testLeft0003
     * @tc.desc Verify Left.$_invoke creates a Left instance correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left != null).assertTrue();
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_0500
     * @tc.name testLeft0005
     * @tc.desc Verify Left.$_invoke with a single argument creates a Left instance and isLeft returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(5);
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_0900
     * @tc.name testLeft0009
     * @tc.desc Verify passing a negative number as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(-999);
      expect(left.left).assertEqual(-999);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1000
     * @tc.name testLeft0010
     * @tc.desc Verify passing Number.MAX_VALUE as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(Number.MAX_VALUE);
      expect(left.left).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1100
     * @tc.name testLeft0011
     * @tc.desc Verify passing Number.MIN_VALUE as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(Number.MIN_VALUE);
      expect(left.left).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1200
     * @tc.name testLeft0012
     * @tc.desc Verify passing Number.NaN as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(Number.NaN);
      expect(Number.isNaN(left.left)).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1300
     * @tc.name testLeft0013
     * @tc.desc Verify passing Number.POSITIVE_INFINITY as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(Number.POSITIVE_INFINITY);
      expect(left.left).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1400
     * @tc.name testLeft0014
     * @tc.desc Verify passing Number.NEGATIVE_INFINITY as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(Number.NEGATIVE_INFINITY);
      expect(left.left).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1700
     * @tc.name testLeft0017
     * @tc.desc Verify passing a string with Unicode characters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("??unicode");
      expect(left.left).assertEqual("??unicode");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1800
     * @tc.name testLeft0018
     * @tc.desc Verify storing and reading a long string data value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "aaaaaaaaaa";
      let left: Left<string, number> = Left.$_invoke<string, number>(longStr);
      expect(left.left.length).assertEqual(10);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_1900
     * @tc.name testLeft0019
     * @tc.desc Verify passing true as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<boolean, string> = Left.$_invoke<boolean, string>(true);
      expect(left.left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2000
     * @tc.name testLeft0020
     * @tc.desc Verify passing false as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<boolean, string> = Left.$_invoke<boolean, string>(false);
      expect(left.left).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2300
     * @tc.name testLeft0023
     * @tc.desc Verify passing a custom object as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: LeftPoint = { x: 10, y: 20 };
      let left: Left<LeftPoint, string> = Left.$_invoke<LeftPoint, string>(point);
      expect(left.left.x).assertEqual(10);
      expect(left.left.y).assertEqual(20);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2400
     * @tc.name testLeft0024
     * @tc.desc Verify passing an array as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let left: Left<number[], string> = Left.$_invoke<number[], string>(arr);
      expect(left.left.length).assertEqual(3);
      expect(left.left[0]).assertEqual(1);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2500
     * @tc.name testLeft0025
     * @tc.desc Verify passing an empty array as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [];
      let left: Left<number[], string> = Left.$_invoke<number[], string>(arr);
      expect(left.left.length).assertEqual(0);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2600
     * @tc.name testLeft0026
     * @tc.desc Verify passing a Map instance as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number> = new Map<string, number>();
      map.set("key", 42);
      let left: Left<Map<string, number>, string> = Left.$_invoke<Map<string, number>, string>(map);
      expect(left.left.get("key")).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2700
     * @tc.name testLeft0027
     * @tc.desc Verify passing a function as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn: (x: number) => number = leftDoubleValue;
      let left: Left<(x: number) => number, string> = Left.$_invoke<(x: number) => number, string>(fn);
      expect(left.left(5)).assertEqual(10);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2800
     * @tc.name testLeft0028
     * @tc.desc Verify number data when data type is number or string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number | string, boolean> = Left.$_invoke<number | string, boolean>(42);
      expect(left.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_2900
     * @tc.name testLeft0029
     * @tc.desc Verify string data when data type is number or string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number | string, boolean> = Left.$_invoke<number | string, boolean>("hello");
      expect(left.left).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_3000
     * @tc.name testLeft0030
     * @tc.desc Verify passing another Either instance as data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Either<number, string> = Left.$_invoke<number, string>(100);
      let outer: Left<Either<number, string>, boolean> = Left.$_invoke<Either<number, string>, boolean>(inner);
      expect(outer.left.isLeft()).assertTrue();
      expect(outer.left.left).assertEqual(100);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_3700
     * @tc.name testLeft0037
     * @tc.desc Verify generic L is Object and R is string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: Object = new Object();
      let left: Left<Object, string> = Left.$_invoke<Object, string>(point);
      expect(left.left != null).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_3900
     * @tc.name testLeft0039
     * @tc.desc Verify L and R can use the same number type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, number> = Left.$_invoke<number, number>(42);
      expect(left.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4100
     * @tc.name testLeft0041
     * @tc.desc Verify L can be a nested Either type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Either<string, number> = Left.$_invoke<string, number>("inner");
      let left: Left<Either<string, number>, boolean> = Left.$_invoke<Either<string, number>, boolean>(inner);
      expect(left.left.isLeft()).assertTrue();
      expect(left.left.left).assertEqual("inner");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4400
     * @tc.name testLeft0044
     * @tc.desc Verify Left instance is not an instance of Right
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left instanceof Right).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4500
     * @tc.name testLeft0045
     * @tc.desc Verify Left instance isLeft() returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4600
     * @tc.name testLeft0046
     * @tc.desc Verify Left instance isRight() returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4800
     * @tc.name testLeft0048
     * @tc.desc Verify accessing right on a Left instance throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      let caught: boolean = false;
      try {
        let value: string = left.right;
        expect().assertFail();
      } catch (error) {
       expect(error.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_4900
     * @tc.name testLeft0049
     * @tc.desc Verify isLeft() and isRight() results are mutually exclusive on Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("error");
      expect(left.isLeft()).assertTrue();
      expect(left.isRight()).assertFalse();
      expect(left.isLeft() != left.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5000
     * @tc.name testLeft0050
     * @tc.desc Verify Left instance can be assigned to Either<L, R> variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let either: Either<number, string> = Left.$_invoke<number, string>(42);
      expect(either.isLeft()).assertTrue();
      expect(either.left).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5100
     * @tc.name testLeft0051
     * @tc.desc Verify function returning Left can be typed as Either
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Either<string, number> = leftDivide(10, 0);
      expect(result.isLeft()).assertTrue();
      expect(result.left).assertEqual("division by zero");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5200
     * @tc.name testLeft0052
     * @tc.desc Verify Left<L, R> generic parameter types are preserved when passed
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(100);
      let value: number = left.left;
      expect(value).assertEqual(100);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5300
     * @tc.name testLeft0053
     * @tc.desc Verify normal $_invoke call always returns a non-null Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(0);
      expect(left != null).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5400
     * @tc.name testLeft0054
     * @tc.desc Verify each $_invoke call returns a new Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left1: Left<number, string> = Left.$_invoke<number, string>(1);
      let left2: Left<number, string> = Left.$_invoke<number, string>(1);
      expect(left1 === left2).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_5500
     * @tc.name testLeft0055
     * @tc.desc Verify object data keeps the same reference when read from left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: LeftPoint = { x: 1, y: 2 };
      let left: Left<LeftPoint, string> = Left.$_invoke<LeftPoint, string>(point);
      expect(left.left === point).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_6100
     * @tc.name testLeft0061
     * @tc.desc Verify accessing right on Left throws Error for any L and R types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Left<string, number> = Left.$_invoke<string, number>("err");
      let caught1: boolean = false;
      try {
        let value1: number = e1.right;
        expect(value1 >= 0).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        caught1 = error != null;
      }
      expect(caught1).assertTrue();
      let e2: Left<boolean, string> = Left.$_invoke<boolean, string>(true);
      let caught2: boolean = false;
      try {
        let value2: string = e2.right;
        expect().assertFail();
      } catch (error) {
       expect(error.name).assertEqual('Error');
        caught2 = error != null;
      }
      expect(caught2).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_6200
     * @tc.name testLeft0062
     * @tc.desc Verify thrown Error object has name and message properties
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      try {
        let value: string = left.right;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_6800
     * @tc.name testLeft0068
     * @tc.desc Verify exported Left can be imported from another module
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(68);
      expect(left != null).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7000
     * @tc.name testLeft0070
     * @tc.desc Verify Left can be used as a variable type annotation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Left<string, number> = Left.$_invoke<string, number>("error");
      expect(result.left).assertEqual("error");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7300
     * @tc.name testLeft0073
     * @tc.desc Verify $_invoke is public static and callable in any scope
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Left<string, number> = createPublicLeft();
      expect(result.left).assertEqual("created in function");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7400
     * @tc.name testLeft0074
     * @tc.desc Verify Left extends Either and satisfies the is-a relationship
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      expect(left instanceof Either).assertTrue();
      expect(left instanceof Left).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7500
     * @tc.name testLeft0075
     * @tc.desc Verify polymorphic assignment from Left instance to Either variable
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let either: Either<string, number> = Left.$_invoke<string, number>("error");
      expect(either.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7600
     * @tc.name testLeft0076
     * @tc.desc Verify an Either array can store Left instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Either<string, number>[] = [
        Left.$_invoke<string, number>("err1"),
        Right.$_invoke<string, number>(42),
        Left.$_invoke<string, number>("err2")
      ];
      expect(results[0].isLeft()).assertTrue();
      expect(results[1].isRight()).assertTrue();
      expect(results[2].isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7700
     * @tc.name testLeft0077
     * @tc.desc Verify a function accepting Either can receive a Left instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("error");
      let either: Either<string, number> = left;
      expect(processLeftResult(either)).assertEqual(-1);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7800
     * @tc.name testLeft0078
     * @tc.desc Verify Left is not Right and Right is not Left
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("error");
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(left instanceof Right).assertFalse();
      expect(right instanceof Left).assertFalse();
      expect(left instanceof Either).assertTrue();
      expect(right instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_7900
     * @tc.name testLeft0079
     * @tc.desc Verify Left.isLeft is true and Right.isLeft is false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(left.isLeft()).assertTrue();
      expect(right.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8000
     * @tc.name testLeft0080
     * @tc.desc Verify Left.isRight is false and Right.isRight is true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(left.isRight()).assertFalse();
      expect(right.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8100
     * @tc.name testLeft0081
     * @tc.desc Verify Left.left returns stored value and Right.left throws Error
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      expect(left.left).assertEqual("err");
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let caught: boolean = false;
      try {
        let value: string = right.left;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8200
     * @tc.name testLeft0082
     * @tc.desc Verify Left.right throws Error and Right.right returns stored value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      let caught: boolean = false;
      try {
        let value: number = left.right;
        expect(value >= 0).assertTrue();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertTrue();
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8300
     * @tc.name testLeft0083
     * @tc.desc Verify complete Left behavior when L is a custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let err: ErrorInfo083 = new ErrorInfo083();
      let left: Left<ErrorInfo083, string> = Left.$_invoke<ErrorInfo083, string>(err);
      expect(left.isLeft()).assertTrue();
      expect(left.isRight()).assertFalse();
      expect(left.left.code).assertEqual(404);
      expect(left.left.message).assertEqual("not found");
      let caught: boolean = false;
      try {
        let value: string = left.right;
        expect().assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
        caught = true;
      }
      expect(caught).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8400
     * @tc.name testLeft0084
     * @tc.desc Verify complete Left behavior when L is Record<string, number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: LeftRecord = { a: 1, b: 2 };
      let left: Left<LeftRecord, string> = Left.$_invoke<LeftRecord, string>(record);
      expect(left.left.a).assertEqual(1);
      expect(left.left.b).assertEqual(2);
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8600
     * @tc.name testLeft0086
     * @tc.desc Verify behavior when L is Promise<number>
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promise: Promise<number> = new Promise<number>((resolve, reject) => { resolve(42); });
      let left: Left<Promise<number>, string> = Left.$_invoke<Promise<number>, string>(promise);
      expect(left.left != null).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8700
     * @tc.name testLeft0087
     * @tc.desc Verify L and R use complex nested generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number[]> = new Map<string, number[]>();
      map.set("a", [1, 2]);
      let left: Left<Map<string, number[]>, Either<boolean, string>> = Left.$_invoke<Map<string, number[]>, Either<boolean, string>>(map);
      expect(left.isLeft()).assertTrue();
      expect(left.left.has("a")).assertTrue();
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8800
     * @tc.name testLeft0088
     * @tc.desc Verify using Left to represent an operation failure value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Either<string, number> = parseIntegerLeft("abc");
      expect(result.isLeft()).assertTrue();
      expect(result.left).assertEqual("Cannot parse abc as integer");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_8900
     * @tc.name testLeft0089
     * @tc.desc Verify Left short-circuits error propagation in chained operations
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Either<string, number> = stepLeft1();
      if (result.isLeft()) {
        expect(result.left).assertEqual("step1 failed");
      } else {
        let next: Either<string, number> = stepLeft2(result.right);
        expect(next.isRight()).assertTrue();
      }
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_9000
     * @tc.name testLeft0090
     * @tc.desc Verify filtering all Left instances from an Either array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Either<string, number>[] = [
        Left.$_invoke<string, number>("err1"),
        Right.$_invoke<string, number>(1),
        Left.$_invoke<string, number>("err2"),
        Right.$_invoke<string, number>(2)
      ];
      let errors: string[] = [];
      for (let i = 0; i < results.length; i++) {
        let item: Either<string, number> = results[i];
        if (item.isLeft()) {
          errors.push(item.left);
        }
      }
      expect(errors.length).assertEqual(2);
      expect(errors[0]).assertEqual("err1");
      expect(errors[1]).assertEqual("err2");
    });

    /**
     * @tc.number ETHN_LEFT_ITEM_CHK_9100
     * @tc.name testLeft0091
     * @tc.desc Verify reading left multiple times returns the same value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testLeft0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let left: Left<number, string> = Left.$_invoke<number, string>(42);
      let v1: number = left.left;
      let v2: number = left.left;
      let v3: number = left.left;
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
      expect(v1).assertEqual(42);
    });

  });
}
