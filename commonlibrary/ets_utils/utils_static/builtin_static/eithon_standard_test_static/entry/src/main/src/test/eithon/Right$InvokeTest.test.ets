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

class MyClass036 {
  value: number = 0;
}

interface TestObject {
  name: string;
  value: number;
}

interface NestedObject {
  inner: TestObject;
}

interface KeyObject {
  key: string | null;
}

export default function Right$InvokeTest(): void {
  describe('Right$InvokeTest' as string, () => {
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
     * @tc.number ETHN_RIGHT_INVK_CHK_0100
     * @tc.name testRight$Invoke0001
     * @tc.desc Verify creating Right instance with one required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0500
     * @tc.name testRight$Invoke0005
     * @tc.desc Verify creating Right with normal number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(100);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0600
     * @tc.name testRight$Invoke0006
     * @tc.desc Verify creating Right with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(0);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0700
     * @tc.name testRight$Invoke0007
     * @tc.desc Verify creating Right with negative number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(-1);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0800
     * @tc.name testRight$Invoke0008
     * @tc.desc Verify creating Right with floating point number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(3.14159);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0900
     * @tc.name testRight$Invoke0009
     * @tc.desc Verify creating Right with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.MAX_VALUE);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1000
     * @tc.name testRight$Invoke0010
     * @tc.desc Verify creating Right with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.MIN_VALUE);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1100
     * @tc.name testRight$Invoke0011
     * @tc.desc Verify creating Right with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.NaN);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1200
     * @tc.name testRight$Invoke0012
     * @tc.desc Verify creating Right with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.POSITIVE_INFINITY);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1300
     * @tc.name testRight$Invoke0013
     * @tc.desc Verify creating Right with negative Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.NEGATIVE_INFINITY);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1600
     * @tc.name testRight$Invoke0016
     * @tc.desc Verify creating Right with normal string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("hello");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1700
     * @tc.name testRight$Invoke0017
     * @tc.desc Verify creating Right with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1800
     * @tc.name testRight$Invoke0018
     * @tc.desc Verify creating Right with whitespace string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>(" ");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_1900
     * @tc.name testRight$Invoke0019
     * @tc.desc Verify creating Right with special characters string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("@#$%^&*()");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2000
     * @tc.name testRight$Invoke0020
     * @tc.desc Verify creating Right with Unicode string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("你好世界🌍");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2100
     * @tc.name testRight$Invoke0021
     * @tc.desc Verify creating Right with long string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let longStr = "a".repeat(10000);
      let result = Right.$_invoke<number, string>(longStr);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2200
     * @tc.name testRight$Invoke0022
     * @tc.desc Verify creating Right with XSS string without script execution
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("<script>alert('xss')</script>");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2300
     * @tc.name testRight$Invoke0023
     * @tc.desc Verify creating Right with newline characters string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("line1\nline2\ttab");
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2400
     * @tc.name testRight$Invoke0024
     * @tc.desc Verify creating Right with true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, boolean>(true);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2500
     * @tc.name testRight$Invoke0025
     * @tc.desc Verify creating Right with false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, boolean>(false);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2600
     * @tc.name testRight$Invoke0026
     * @tc.desc Verify creating Right with normal object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: TestObject = { name: "test", value: 123 };
      let result = Right.$_invoke<string, TestObject>(obj);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2700
     * @tc.name testRight$Invoke0027
     * @tc.desc Verify creating Right with empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, Record<string, string>>({});
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2800
     * @tc.name testRight$Invoke0028
     * @tc.desc Verify creating Right with object containing null property
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: KeyObject = { key: null };
      let result = Right.$_invoke<string, KeyObject>(obj);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_2900
     * @tc.name testRight$Invoke0029
     * @tc.desc Verify creating Right with nested object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: NestedObject = { inner: { name: "deep", value: 42 } };
      let result = Right.$_invoke<string, NestedObject>(obj);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3000
     * @tc.name testRight$Invoke0030
     * @tc.desc Verify creating Right with empty array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number[]>([]);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3100
     * @tc.name testRight$Invoke0031
     * @tc.desc Verify creating Right with single element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number[]>([1]);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3200
     * @tc.name testRight$Invoke0032
     * @tc.desc Verify creating Right with multiple element array
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number[]>([1, 2, 3, 4, 5]);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3300
     * @tc.name testRight$Invoke0033
     * @tc.desc Verify creating Right with array containing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, (number | null)[]>([1, null, 3]);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3400
     * @tc.name testRight$Invoke0034
     * @tc.desc Verify behavior when passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, null>(null);
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3500
     * @tc.name testRight$Invoke0035
     * @tc.desc Verify behavior when passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, undefined>(undefined);
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3600
     * @tc.name testRight$Invoke0036
     * @tc.desc Verify creating Right with custom class instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass036();
      let result = Right.$_invoke<string, MyClass036>(obj);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3700
     * @tc.name testRight$Invoke0037
     * @tc.desc Verify creating Right with Map instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let map = new Map<string, number>();
      map.set("key", 1);
      let result = Right.$_invoke<string, Map<string, number>>(map);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3800
     * @tc.name testRight$Invoke0038
     * @tc.desc Verify creating Right with function as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let fn = (x: number): number => x * 2;
      let result = Right.$_invoke<string, (x: number) => number>(fn);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_3900
     * @tc.name testRight$Invoke0039
     * @tc.desc Verify creating Right with union type value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result1 = Right.$_invoke<string, number | string>(42);
      let result2 = Right.$_invoke<string, number | string>("hello");
      expect(result1 !== null).assertTrue();
      expect(result2 !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4200
     * @tc.name testRight$Invoke0042
     * @tc.desc Verify behavior when passing empty string as exceptional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, string>("");
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4300
     * @tc.name testRight$Invoke0043
     * @tc.desc Verify behavior when passing whitespace string as exceptional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, string>(" ");
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4400
     * @tc.name testRight$Invoke0044
     * @tc.desc Verify behavior when passing zero as exceptional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(0);
      expect(result !== null).assertTrue()
    });
    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4500
     * @tc.name testRight$Invoke0045
     * @tc.desc Verify behavior when passing negative one as exceptional value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(-1);
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4600
     * @tc.name testRight$Invoke0046
     * @tc.desc Verify return value is Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4700
     * @tc.name testRight$Invoke0047
     * @tc.desc Verify return instance is not null and not undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result !== null).assertTrue();
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4800
     * @tc.name testRight$Invoke0048
     * @tc.desc Verify Right instance correctly stores number data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_4900
     * @tc.name testRight$Invoke0049
     * @tc.desc Verify Right instance correctly stores string data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("hello");
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5000
     * @tc.name testRight$Invoke0050
     * @tc.desc Verify Right instance correctly stores boolean data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, boolean>(true);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5100
     * @tc.name testRight$Invoke0051
     * @tc.desc Verify Right instance correctly stores object data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new Map<string, string>();
      obj.set("key", "value");
      let result = Right.$_invoke<string, Map<string, string>>(obj);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5200
     * @tc.name testRight$Invoke0052
     * @tc.desc Verify Right instance correctly stores array data
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: number[] = [1, 2, 3];
      let result = Right.$_invoke<string, number[]>(arr);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5400
     * @tc.name testRight$Invoke0054
     * @tc.desc Verify return value is instance of Either class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result instanceof Either).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5500
     * @tc.name testRight$Invoke0055
     * @tc.desc Verify type inference with L=string R=number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5600
     * @tc.name testRight$Invoke0056
     * @tc.desc Verify type inference with L=number R=string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<number, string> = Right.$_invoke<number, string>("test");
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5700
     * @tc.name testRight$Invoke0057
     * @tc.desc Verify complex generic type inference
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<Error, string[]> = Right.$_invoke<Error, string[]>(["a", "b"]);
      expect(result !== undefined).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5800
     * @tc.name testRight$Invoke0058
     * @tc.desc Verify automatic type inference without generic parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_5900
     * @tc.name testRight$Invoke0059
     * @tc.desc Verify return instance with Number.MAX_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.MAX_VALUE);
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6000
     * @tc.name testRight$Invoke0060
     * @tc.desc Verify return instance with Number.MIN_VALUE
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.MIN_VALUE);
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6100
     * @tc.name testRight$Invoke0061
     * @tc.desc Verify return instance with NaN
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.NaN);
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6200
     * @tc.name testRight$Invoke0062
     * @tc.desc Verify return instance with Infinity
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(Number.POSITIVE_INFINITY);
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6300
     * @tc.name testRight$Invoke0063
     * @tc.desc Verify return instance with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("");
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6400
     * @tc.name testRight$Invoke0064
     * @tc.desc Verify return instance with empty object
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, Record<string, string>>({});
      expect(result instanceof Right).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6600
     * @tc.name testRight$Invoke0066
     * @tc.desc Verify type mismatch when R=number but passing string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result: Right<string, number> = Right.$_invoke<string, number>(42);
      expect(result !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6700
     * @tc.name testRight$Invoke0067
     * @tc.desc Verify type mismatch when R=Object but passing number
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj: Record<string, number> = { "value": 42 };
      let result: Right<string, Record<string, number>> = Right.$_invoke<string, Record<string, number>>(obj);
      expect(result.right === obj).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6800
     * @tc.name testRight$Invoke0068
     * @tc.desc Verify behavior when explicitly passing null
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = Right.$_invoke<string, null>(null);
      } catch (error) {
        expect(error.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_6900
     * @tc.name testRight$Invoke0069
     * @tc.desc Verify behavior when explicitly passing undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      try {
        let result = Right.$_invoke<string, undefined>(undefined);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_7000
     * @tc.name testRight$Invoke0070
     * @tc.desc Verify behavior when passing null variable as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string | null = null;
      try {
        let result = Right.$_invoke<string, string>(val as string);
      } catch (e) {
        expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_7100
     * @tc.name testRight$Invoke0071
     * @tc.desc Verify behavior when passing undefined variable as parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val: string | undefined = undefined;
      try {
        let result = Right.$_invoke<string, string>(val as string);
      } catch (e) {
       expect(e.name).assertEqual('ClassCastError');
      }
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_7300
     * @tc.name testRight$Invoke0073
     * @tc.desc Verify $_invoke cannot be called from Right instance
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0073', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let instance = Right.$_invoke<string, number>(42);
      expect(instance !== null).assertTrue()
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_7800
     * @tc.name testRight$Invoke0078
     * @tc.desc Verify right property stores boolean value correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0078', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, boolean>(false);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_8100
     * @tc.name testRight$Invoke0081
     * @tc.desc Verify right property stores zero correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0081', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(0);
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_8200
     * @tc.name testRight$Invoke0082
     * @tc.desc Verify right property stores empty string correctly
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0082', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("");
      expect(result.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_8800
     * @tc.name testRight$Invoke0088
     * @tc.desc Verify isLeft() returns false for number value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0088', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(42);
      expect(result.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_8900
     * @tc.name testRight$Invoke0089
     * @tc.desc Verify isLeft() returns false for string value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0089', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("hello");
      expect(result.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9000
     * @tc.name testRight$Invoke0090
     * @tc.desc Verify isLeft() returns false with empty string
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, string>("");
      expect(result.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9100
     * @tc.name testRight$Invoke0091
     * @tc.desc Verify isLeft() returns false with zero value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0091', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<string, number>(0);
      expect(result.isLeft()).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9400
     * @tc.name testRight$Invoke0094
     * @tc.desc Verify correct behavior when L and R are same type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0094', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<number, number>(42);
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9500
     * @tc.name testRight$Invoke0095
     * @tc.desc Verify complex nested generic types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0095', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let result = Right.$_invoke<Error, Map<string, number[]>>(new Map<string, number[]>());
      expect(result !== null).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9600
     * @tc.name testRight$Invoke0096
     * @tc.desc Verify independence across multiple calls with different generics
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0096', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = Right.$_invoke<string, number>(42);
      let r2 = Right.$_invoke<number, string>("hello");
      expect(r1.isRight()).assertTrue();
      expect(r2.isRight()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9700
     * @tc.name testRight$Invoke0097
     * @tc.desc Verify multiple calls return different instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0097', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let r1 = Right.$_invoke<string, number>(42);
      let r2 = Right.$_invoke<string, number>(42);
      expect(r1 !== r2).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9800
     * @tc.name testRight$Invoke0098
     * @tc.desc Verify same parameter value returns different instance references
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0098', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let val = 42;
      let r1 = Right.$_invoke<string, number>(val);
      let r2 = Right.$_invoke<string, number>(val);
      expect(r1 === r2).assertFalse();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_9900
     * @tc.name testRight$Invoke0099
     * @tc.desc Verify behavioral difference between Right and Left instances
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0099', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right = Right.$_invoke<string, number>(42);
      let left = Left.$_invoke<string, number>("error");
      expect(right.isRight()).assertTrue();
      expect(left.isLeft()).assertTrue();
    });

    /**
     * @tc.number ETHN_RIGHT_INVK_CHK_0000
     * @tc.name testRight$Invoke0100
     * @tc.desc Verify Right instance isLeft always returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 2
     */
    it('testRight$Invoke0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let right = Right.$_invoke<string, number>(42);
      expect(right.isLeft()).assertFalse();
      expect(right.isRight()).assertTrue();
    });
  });
}
