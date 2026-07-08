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

interface Point023 {
  x: number;
  y: number;
}

class UserInfo083 {
  id: number = 1;
  name: string = "Alice";
}

export default function  RightTest(): void {
  describe('RightTest' as string, () => {
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
     * @tc.number ETHN_RIGHT_ITEM_CHK_0300
     * @tc.name testRight0003
     * @tc.desc Verify creating Right instance via $_invoke static method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right !== null).assertTrue();
      expect(right instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_0400
     * @tc.name testRight0004
     * @tc.desc Verify $_invoke with required data parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(100);
      expect(right.right).assertEqual(100);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_0800
     * @tc.name testRight0008
     * @tc.desc Verify Right behavior for testRight0008
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(0);
      expect(right.right).assertEqual(0);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_0900
     * @tc.name testRight0009
     * @tc.desc Verify Right behavior for testRight0009
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(-999);
      expect(right.right).assertEqual(-999);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1000
     * @tc.name testRight0010
     * @tc.desc Verify Right behavior for testRight0010
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(Number.MAX_VALUE);
      expect(right.right).assertEqual(Number.MAX_VALUE);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1100
     * @tc.name testRight0011
     * @tc.desc Verify Right behavior for testRight0011
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(Number.MIN_VALUE);
      expect(right.right).assertEqual(Number.MIN_VALUE);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1200
     * @tc.name testRight0012
     * @tc.desc Verify Right behavior for testRight0012
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(Number.NaN);
      expect(Number.isNaN(right.right)).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1300
     * @tc.name testRight0013
     * @tc.desc Verify Right behavior for testRight0013
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(Number.POSITIVE_INFINITY);
      expect(right.right).assertEqual(Number.POSITIVE_INFINITY);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1400
     * @tc.name testRight0014
     * @tc.desc Verify Right behavior for testRight0014
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(Number.NEGATIVE_INFINITY);
      expect(right.right).assertEqual(Number.NEGATIVE_INFINITY);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1500
     * @tc.name testRight0015
     * @tc.desc Verify Right behavior for testRight0015
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<number, string> = Right.$_invoke<number, string>("hello");
      expect(right.right).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1600
     * @tc.name testRight0016
     * @tc.desc Verify Right behavior for testRight0016
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<number, string> = Right.$_invoke<number, string>("");
      expect(right.right).assertEqual("");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1700
     * @tc.name testRight0017
     * @tc.desc Verify Right behavior for testRight0017
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<number, string> = Right.$_invoke<number, string>("你好世界🌍");
      expect(right.right).assertEqual("你好世界🌍");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1800
     * @tc.name testRight0018
     * @tc.desc Verify Right behavior for testRight0018
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr: string = "a".repeat(10000);
      let right: Right<number, string> = Right.$_invoke<number, string>(longStr);
      expect(right.right.length).assertEqual(10000);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_1900
     * @tc.name testRight0019
     * @tc.desc Verify Right behavior for testRight0019
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, boolean> = Right.$_invoke<string, boolean>(true);
      expect(right.right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2000
     * @tc.name testRight0020
     * @tc.desc Verify Right behavior for testRight0020
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, boolean> = Right.$_invoke<string, boolean>(false);
      expect(right.right).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2100
     * @tc.name testRight0021
     * @tc.desc Verify Right behavior for testRight0021
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, null> = Right.$_invoke<string, null>(null);
      expect(right.right === null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2200
     * @tc.name testRight0022
     * @tc.desc Verify Right behavior for testRight0022
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, undefined> = Right.$_invoke<string, undefined>(undefined);
      expect(right.right === undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2300
     * @tc.name testRight0023
     * @tc.desc Verify Right behavior for testRight0023
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let point: Point023 = { x: 10, y: 20 };
      let right: Right<string, Point023> = Right.$_invoke<string, Point023>(point);
      expect(right.right.x).assertEqual(10);
      expect(right.right.y).assertEqual(20);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2400
     * @tc.name testRight0024
     * @tc.desc Verify Right behavior for testRight0024
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let right: Right<string, number[]> = Right.$_invoke<string, number[]>(arr);
      expect(right.right.length).assertEqual(3);
      expect(right.right[0]).assertEqual(1);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2500
     * @tc.name testRight0025
     * @tc.desc Verify Right behavior for testRight0025
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number[]> = Right.$_invoke<string, number[]>([]);
      expect(right.right.length).assertEqual(0);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2600
     * @tc.name testRight0026
     * @tc.desc Verify Right behavior for testRight0026
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map: Map<string, number> = new Map<string, number>();
      map.set("key", 42);
      let right: Right<string, Map<string, number>> = Right.$_invoke<string, Map<string, number>>(map);
      expect(right.right.get("key")).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2700
     * @tc.name testRight0027
     * @tc.desc Verify Right behavior for testRight0027
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = (x: number): number => x * 2;
      let right: Right<string, (x: number) => number> = Right.$_invoke<string, (x: number) => number>(fn);
      expect(right.right(5)).assertEqual(10);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2800
     * @tc.name testRight0028
     * @tc.desc Verify Right behavior for testRight0028
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<boolean, number | string> = Right.$_invoke<boolean, number | string>(42);
      expect(right.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_2900
     * @tc.name testRight0029
     * @tc.desc Verify Right behavior for testRight0029
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<boolean, number | string> = Right.$_invoke<boolean, number | string>("hello");
      expect(right.right).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3000
     * @tc.name testRight0030
     * @tc.desc Verify Right behavior for testRight0030
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Either<string, number> = Right.$_invoke<string, number>(100);
      let outer: Right<boolean, Either<string, number>> = Right.$_invoke<boolean, Either<string, number>>(inner);
      expect(outer.right.right).assertEqual(100);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3100
     * @tc.name testRight0031
     * @tc.desc Verify Right behavior for testRight0031
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3200
     * @tc.name testRight0032
     * @tc.desc Verify Right behavior for testRight0032
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<number, string> = Right.$_invoke<number, string>("success");
      expect(right.right).assertEqual("success");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3600
     * @tc.name testRight0036
     * @tc.desc Verify Right behavior for testRight0036
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number[]> = Right.$_invoke<string, number[]>([1, 2, 3]);
      expect(right.right.length).assertEqual(3);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3700
     * @tc.name testRight0037
     * @tc.desc Verify Right behavior for testRight0037
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, Object> = Right.$_invoke<string, Object>(new Object());
      expect(right.right !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3800
     * @tc.name testRight0038
     * @tc.desc Verify Right behavior for testRight0038
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<boolean, string | number> = Right.$_invoke<boolean, string | number>("hello");
      expect(right.right).assertEqual("hello");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_3900
     * @tc.name testRight0039
     * @tc.desc Verify Right behavior for testRight0039
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<number, number> = Right.$_invoke<number, number>(42);
      expect(right.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4000
     * @tc.name testRight0040
     * @tc.desc Verify Right behavior for testRight0040
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, void> = Right.$_invoke<string, void>(undefined);
      expect(right.right === undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4100
     * @tc.name testRight0041
     * @tc.desc Verify Right behavior for testRight0041
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Either<string, number> = Right.$_invoke<string, number>(100);
      let right: Right<boolean, Either<string, number>> = Right.$_invoke<boolean, Either<string, number>>(inner);
      expect(right.right.right).assertEqual(100);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4200
     * @tc.name testRight0042
     * @tc.desc Verify Right behavior for testRight0042
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4300
     * @tc.name testRight0043
     * @tc.desc Verify Right behavior for testRight0043
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4400
     * @tc.name testRight0044
     * @tc.desc Verify Right behavior for testRight0044
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right instanceof Left).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4500
     * @tc.name testRight0045
     * @tc.desc Verify Right behavior for testRight0045
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4600
     * @tc.name testRight0046
     * @tc.desc Verify Right behavior for testRight0046
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4800
     * @tc.name testRight0048
     * @tc.desc Verify Right behavior for testRight0048
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      try {
        let value: string = right.left;
        expect(value !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_4900
     * @tc.name testRight0049
     * @tc.desc Verify Right behavior for testRight0049
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.isRight()).assertTrue();
      expect(right.isLeft()).assertFalse();
      expect(right.isLeft() !== right.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5000
     * @tc.name testRight0050
     * @tc.desc Verify Right behavior for testRight0050
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let either: Either<string, number> = Right.$_invoke<string, number>(42);
      expect(either.isRight()).assertTrue();
      expect(either.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5100
     * @tc.name testRight0051
     * @tc.desc Verify Right behavior for testRight0051
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: number = 10;
      let b: number = 2;
      let result: Either<string, number>;
      if (b === 0) {
        result = Left.$_invoke<string, number>("division by zero");
      } else {
        result = Right.$_invoke<string, number>(a / b);
      }
      expect(result.isRight()).assertTrue();
      expect(result.right).assertEqual(5);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5200
     * @tc.name testRight0052
     * @tc.desc Verify Right behavior for testRight0052
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(100);
      let value: number = right.right;
      expect(typeof value === "number").assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5300
     * @tc.name testRight0053
     * @tc.desc Verify Right behavior for testRight0053
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(0);
      expect(right !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5400
     * @tc.name testRight0054
     * @tc.desc Verify Right behavior for testRight0054
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right1: Right<string, number> = Right.$_invoke<string, number>(1);
      let right2: Right<string, number> = Right.$_invoke<string, number>(1);
      expect(right1 === right2).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_5500
     * @tc.name testRight0055
     * @tc.desc Verify Right behavior for testRight0055
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Object = new Object();
      let right: Right<string, Object> = Right.$_invoke<string, Object>(obj);
      expect(right.right === obj).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_6100
     * @tc.name testRight0061
     * @tc.desc Verify Right behavior for testRight0061
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let e1: Right<string, number> = Right.$_invoke<string, number>(42);
      try {
        let v = e1.left;
        expect(v !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
      let e2: Right<boolean, string> = Right.$_invoke<boolean, string>("ok");
      try {
        let v = e2.left;
        expect(v !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_6300
     * @tc.name testRight0063
     * @tc.desc Verify Right behavior for testRight0063
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      try {
        let value = right.left;
        expect(value !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });
    
    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_6800
     * @tc.name testRight0068
     * @tc.desc Verify Right behavior for testRight0068
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7000
     * @tc.name testRight0070
     * @tc.desc Verify Right behavior for testRight0070
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<string, number>;
      result = Right.$_invoke<string, number>(42);
      expect(result.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7300
     * @tc.name testRight0073
     * @tc.desc Verify Right behavior for testRight0073
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(result.right).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7400
     * @tc.name testRight0074
     * @tc.desc Verify Right behavior for testRight0074
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0074', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right instanceof Either).assertTrue();
      expect(right instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7500
     * @tc.name testRight0075
     * @tc.desc Verify Right behavior for testRight0075
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0075', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let either: Either<string, number> = Right.$_invoke<string, number>(42);
      expect(either.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7600
     * @tc.name testRight0076
     * @tc.desc Verify Right behavior for testRight0076
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0076', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Either<string, number>[] = [
        Left.$_invoke<string, number>("err1"),
        Right.$_invoke<string, number>(42),
        Right.$_invoke<string, number>(100)
      ];
      expect(results[0].isLeft()).assertTrue();
      expect(results[1].isRight()).assertTrue();
      expect(results[2].isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7700
     * @tc.name testRight0077
     * @tc.desc Verify Right behavior for testRight0077
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0077', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let result: number;
      if (right.isLeft()) {
        result = -1;
      } else {
        result = right.right;
      }
      expect(result).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7800
     * @tc.name testRight0078
     * @tc.desc Verify Right behavior for testRight0078
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let left: Left<string, number> = Left.$_invoke<string, number>("error");
      expect(right instanceof Left).assertFalse();
      expect(left instanceof Right).assertFalse();
      expect(right instanceof Either).assertTrue();
      expect(left instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_7900
     * @tc.name testRight0079
     * @tc.desc Verify Right behavior for testRight0079
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0079', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      expect(right.isLeft()).assertFalse();
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8000
     * @tc.name testRight0080
     * @tc.desc Verify Right behavior for testRight0080
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      expect(right.isRight()).assertTrue();
      expect(left.isRight()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8100
     * @tc.name testRight0081
     * @tc.desc Verify Right behavior for testRight0081
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(right.right).assertEqual(42);
      let left: Left<string, number> = Left.$_invoke<string, number>("err");
      try {
        let v = left.right;
        expect(v !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8200
     * @tc.name testRight0082
     * @tc.desc Verify Right behavior for testRight0082
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      try {
        let v = right.left;
        expect(v !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8300
     * @tc.name testRight0083
     * @tc.desc Verify Right behavior for testRight0083
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0083', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let user: UserInfo083 = new UserInfo083();
      let right: Right<string, UserInfo083> = Right.$_invoke<string, UserInfo083>(user);
      expect(right.isRight()).assertTrue();
      expect(right.isLeft()).assertFalse();
      expect(right.right.id).assertEqual(1);
      expect(right.right.name).assertEqual("Alice");
      try {
        let v = right.left;
        expect(v !== null).assertFail();
      } catch (error) {
        expect(error.name).assertEqual('Error');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8400
     * @tc.name testRight0084
     * @tc.desc Verify Right behavior for testRight0084
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0084', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let record: Record<string, number> = { "a": 1, "b": 2 };
      let right: Right<string, Record<string, number>> = Right.$_invoke<string, Record<string, number>>(record);
      expect(right.right["a"]).assertEqual(1);
      expect(right.right["b"]).assertEqual(2);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8500
     * @tc.name testRight0085
     * @tc.desc Verify Right behavior for testRight0085
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0085', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let handler = (msg: string): void => {};
      let right: Right<string, (msg: string) => void> = Right.$_invoke<string, (msg: string) => void>(handler);
      expect(right.right !== null).assertTrue();
      expect(typeof right.right === "function").assertTrue();
    });
    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8600
     * @tc.name testRight0086
     * @tc.desc Verify Right behavior for testRight0086
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0086', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let promise: Promise<number> = new Promise<number>((resolve: (value: number) => void) => { resolve(42); });
      let right: Right<string, Promise<number>> = Right.$_invoke<string, Promise<number>>(promise);
      expect(right.right !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8700
     * @tc.name testRight0087
     * @tc.desc Verify Right behavior for testRight0087
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0087', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let inner: Either<boolean, string> = Right.$_invoke<boolean, string>("ok");
      let right: Right<Map<string, number[]>, Either<boolean, string>> = Right.$_invoke<Map<string, number[]>, Either<boolean, string>>(inner);
      expect(right.isRight()).assertTrue();
      expect(right.right.isRight()).assertTrue();
      expect(right.right.right).assertEqual("ok");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8800
     * @tc.name testRight0088
     * @tc.desc Verify Right behavior for testRight0088
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let str: string = "123";
      let num: number = Number.parseInt(str);
      let result: Either<string, number>;
      if (Number.isNaN(num)) {
        result = Left.$_invoke<string, number>(`Cannot parse "${str}" as integer`);
      } else {
        result = Right.$_invoke<string, number>(num);
      }
      expect(result.isRight()).assertTrue();
      expect(result.right).assertEqual(123);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_8900
     * @tc.name testRight0089
     * @tc.desc Verify Right behavior for testRight0089
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let step1Result: Either<string, number> = Right.$_invoke<string, number>(10);
      if (step1Result.isRight()) {
        let n: number = step1Result.right;
        let step2Result: Either<string, number> = Right.$_invoke<string, number>(n * 2);
        expect(step2Result.isRight()).assertTrue();
        expect(step2Result.right).assertEqual(20);
      } else {
        expect(false).assertTrue();
      }
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_9000
     * @tc.name testRight0090
     * @tc.desc Verify Right behavior for testRight0090
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let results: Either<string, number>[] = [
        Left.$_invoke<string, number>("err1"),
        Right.$_invoke<string, number>(1),
        Left.$_invoke<string, number>("err2"),
        Right.$_invoke<string, number>(2)
      ];
      let successes: number[] = [];
      for (let e of results) {
        if (e.isRight()) {
          successes.push(e.right);
        }
      }
      expect(successes.length).assertEqual(2);
      expect(successes[0]).assertEqual(1);
      expect(successes[1]).assertEqual(2);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_9100
     * @tc.name testRight0091
     * @tc.desc Verify Right behavior for testRight0091
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let v1: number = right.right;
      let v2: number = right.right;
      let v3: number = right.right;
      expect(v1).assertEqual(v2);
      expect(v2).assertEqual(v3);
      expect(v1).assertEqual(42);
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_9200
     * @tc.name testRight0092
     * @tc.desc Verify Right behavior for testRight0092
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0092', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right: Right<string, number> = Right.$_invoke<string, number>(42);
      let output: string;
      if (right.isLeft()) {
        output = `Error: ${right.left}`;
      } else {
        output = `Success: ${right.right}`;
      }
      expect(output).assertEqual("Success: 42");
    });

    /**
     * @tc.number ETHN_RIGHT_ITEM_CHK_9300
     * @tc.name testRight0093
     * @tc.desc Verify Right behavior for testRight0093
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight0093', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cache: Map<string, Either<string, number>> = new Map<string, Either<string, number>>();
      cache.set("key1", Right.$_invoke<string, number>(100));
      cache.set("key2", Left.$_invoke<string, number>("not found"));
      let val1: Either<string, number> | undefined = cache.get("key1");
      expect(val1 !== undefined).assertTrue();
      if (val1 !== undefined) {
        expect(val1.isRight()).assertTrue();
        expect(val1.right).assertEqual(100);
      }
    });
  });
}
