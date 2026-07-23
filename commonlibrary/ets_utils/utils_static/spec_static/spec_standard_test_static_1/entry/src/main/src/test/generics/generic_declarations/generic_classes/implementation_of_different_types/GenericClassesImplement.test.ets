'use static'
/*---
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import Utils from "../../../../Util.test";

import {
  expect,
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  TestType,
  Size,
  Level
} from "../../../../../../../hypium/index"

interface GenericInterface_0<T> {
  process(data: T): T;
}
class GenericImplementation_0<T> implements GenericInterface_0<T> {
  process(data: T): T {
    return data;
  }
}

interface GenericInterface_1<T> {
  process(data: T): T;
}
class GenericImplementation_1<T> implements GenericInterface_1<T> {
  process(data: T): T {
    return data;
  }
}

class CustomClassWithPrivateProp_0 {
  private privateValue: number;
  constructor(value: number) {
    this.privateValue = value;
  }
  getValue() {
    return this.privateValue;
  }
}
class CustomClassWithProtectedProp_0 {
  protected protectedValue: number;
  constructor(value: number) {
    this.protectedValue = value;
  }
  getValue() {
    return this.protectedValue;
  }
}

export default function GenericClassesImplementTest(): void {
  describe("GenericClassesImplementTest", () => {
    beforeAll(() => {
    })
    beforeEach(async () => {
      await Utils.msSleep(30);
    })
    afterEach(() => {
    })
    afterAll(() => {
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_0100
     * @tc.name      testGenericClassesImplement0001
     * @tc.desc      Generic implementation with various numeric values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_0<number> = new GenericImplementation_0<number>();

      expect(impl.process(10)).assertEqual(10);
      expect(impl.process(1000000)).assertEqual(1000000);
      expect(impl.process(-10)).assertEqual(-10);
      expect(impl.process(-1000000)).assertEqual(-1000000);
      expect(impl.process(0)).assertEqual(0);
      expect(impl.process(0.1)).assertEqual(0.1);
      expect(impl.process(1000000.1)).assertEqual(1000000.1);
      expect(impl.process(-0.1)).assertEqual(-0.1);
      expect(impl.process(-1000000.1)).assertEqual(-1000000.1);
      expect(impl.process(0.0)).assertEqual(0.0);
      expect(impl.process(Number.MAX_SAFE_INTEGER)).assertEqual(Number.MAX_SAFE_INTEGER);
      expect(impl.process(Number.MIN_SAFE_INTEGER)).assertEqual(Number.MIN_SAFE_INTEGER);
      expect(impl.process(Number.MAX_VALUE)).assertEqual(Number.MAX_VALUE);
      expect(impl.process(Number.MIN_VALUE)).assertEqual(Number.MIN_VALUE);
      expect(impl.process(Infinity)).assertEqual(Infinity);
      expect(impl.process(Number.MIN_VALUE * 10)).assertEqual(Number.MIN_VALUE * 10);
      expect(isNaN(impl.process(NaN))).assertEqual(true);
      expect(impl.process(2)).assertEqual(2);
      expect(impl.process(0o10)).assertEqual(8);
      expect(impl.process(16)).assertEqual(16);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_1100
     * @tc.name      testGenericClassesImplement0011
     * @tc.desc      Generic implementation with boolean
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_0<boolean> = new GenericImplementation_0<boolean>();
      expect(impl.process(true)).assertEqual(true);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_1200
     * @tc.name      testGenericClassesImplement0012
     * @tc.desc      Generic implementation with string and char values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_0<string> = new GenericImplementation_0<string>();
      expect(impl.process("abc")).assertEqual("abc");
      expect(impl.process("")).assertEqual("");

      let impl1: GenericInterface_1<string> = new GenericImplementation_1<string>();
      expect(impl1.process("3.14")).assertEqual("3.14");
      expect(impl1.process("1.23e+5")).assertEqual("1.23e+5");
      const multiLine = 'Line 1\nLine 2\nLine 3';
      expect(impl1.process(multiLine)).assertEqual(multiLine);
      expect(impl1.process("abc123")).assertEqual("abc123");
      expect(impl1.process("Special@#Symbols$%Test")).assertEqual("Special@#Symbols$%Test");
      expect(impl1.process("!!@@##$$%")).assertEqual("!!@@##$$%");
      expect(impl1.process("Hello! This is a #test string @ with spaces.")).assertEqual("Hello! This is a #test string @ with spaces.");

      const escapeStr = 'Hello\nWorld';
      expect(impl.process(escapeStr)).assertEqual(escapeStr);
      expect(impl.process('aaaaa')).assertEqual('aaaaa');
      expect(impl.process("-123")).assertEqual("-123");
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_1400
     * @tc.name      testGenericClassesImplement0014
     * @tc.desc      Generic implementation with null and undefined
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let nullImpl: GenericInterface_0<null> = new GenericImplementation_0<null>();
      expect(nullImpl.process(null)).assertEqual(null);

      let undefImpl: GenericInterface_0<undefined> = new GenericImplementation_0<undefined>();
      expect(undefImpl.process(undefined)).assertEqual(undefined);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_2700
     * @tc.name      testGenericClassesImplement0027
     * @tc.desc      Generic implementation with bigint
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0027", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_0<bigint> = new GenericImplementation_0<bigint>();
      expect(impl.process(12345678901234567890n)).assertEqual(12345678901234567890n);
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_3800
     * @tc.name      testGenericClassesImplement0038
     * @tc.desc      Generic implementation with various array types
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0038", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numImpl: GenericInterface_1<number[]> = new GenericImplementation_1<number[]>();
      let arr1: number[] = [1];
      let res1 = numImpl.process(arr1);
      for (let i = 0; i < arr1.length; i++) { expect(res1[i]).assertEqual(arr1[i]); }

      let arr2: number[] = [1, 2, 3];
      let res2 = numImpl.process(arr2);
      for (let i = 0; i < arr2.length; i++) { expect(res2[i]).assertEqual(arr2[i]); }

      let arr3 = [0.1, 0.2, 0.3];
      let res3 = numImpl.process(arr3);
      for (let i = 0; i < arr3.length; i++) { expect(res3[i]).assertEqual(arr3[i]); }

      let arr4 = [0.1];
      let res4 = numImpl.process(arr4);
      for (let i = 0; i < arr4.length; i++) { expect(res4[i]).assertEqual(arr4[i]); }

      let boolImpl: GenericInterface_1<boolean[]> = new GenericImplementation_1<boolean[]>();
      let arr5 = [true];
      let res5 = boolImpl.process(arr5);
      for (let i = 0; i < arr5.length; i++) { expect(res5[i]).assertEqual(arr5[i]); }

      let strImpl: GenericInterface_1<string[]> = new GenericImplementation_1<string[]>();
      let arr6 = ["abc"];
      let res6 = strImpl.process(arr6);
      for (let i = 0; i < arr6.length; i++) { expect(res6[i]).assertEqual(arr6[i]); }

      let arr7 = ["abc", "def", "ghi"];
      let res7 = strImpl.process(arr7);
      for (let i = 0; i < arr7.length; i++) { expect(res7[i]).assertEqual(arr7[i]); }

      let charArr1: string[] = ['A'];
      let res8 = strImpl.process(charArr1);
      for (let i = 0; i < charArr1.length; i++) { expect(res8[i]).assertEqual(charArr1[i]); }

      let charArr2: string[] = ['A', 'B', 'C'];
      let res9 = strImpl.process(charArr2);
      for (let i = 0; i < charArr2.length; i++) { expect(res9[i]).assertEqual(charArr2[i]); }

      let emptyStrArr = ["", "", ""];
      let res10 = strImpl.process(emptyStrArr);
      for (let i = 0; i < emptyStrArr.length; i++) { expect(res10[i]).assertEqual(emptyStrArr[i]); }

      let bigIntImpl: GenericInterface_1<bigint[]> = new GenericImplementation_1<bigint[]>();
      const bigIntArr = [1n, 2n, 3n];
      let res11 = bigIntImpl.process(bigIntArr);
      for (let i = 0; i < bigIntArr.length; i++) { expect(res11[i]).assertEqual(bigIntArr[i]); }

      let undefImpl: GenericInterface_1<undefined[]> = new GenericImplementation_1<undefined[]>();
      const undefinedArr = [undefined, undefined, undefined];
      let res12 = undefImpl.process(undefinedArr);
      for (let i = 0; i < undefinedArr.length; i++) { expect(res12[i]).assertEqual(undefinedArr[i]); }
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_5000
     * @tc.name      testGenericClassesImplement0050
     * @tc.desc      Generic implementation with custom objects (private/protected props)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0050", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_1<CustomClassWithPrivateProp_0> = new GenericImplementation_1<CustomClassWithPrivateProp_0>();
      let customObj = new CustomClassWithPrivateProp_0(10);
      let result = impl.process(customObj);
      expect(result.getValue()).assertEqual(customObj.getValue());

      let impl2: GenericInterface_1<CustomClassWithProtectedProp_0> = new GenericImplementation_1<CustomClassWithProtectedProp_0>();
      let customObj2 = new CustomClassWithProtectedProp_0(10);
      let result2 = impl2.process(customObj2);
      expect(result2.getValue()).assertEqual(customObj2.getValue());
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_5200
     * @tc.name      testGenericClassesImplement0052
     * @tc.desc      Generic implementation with Date array
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0052", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let impl: GenericInterface_1<Date[]> = new GenericImplementation_1<Date[]>();
      const date1 = new Date('2023-01-01');
      const date2 = new Date('2023-12-31');
      const dateArr = [date1, date2];
      let result = impl.process(dateArr);
      for (let i = 0; i < dateArr.length; i++) {
        expect(result[i].getTime()).assertEqual(dateArr[i].getTime());
      }
    })

    /**
     * @tc.number    SUB_GENERIC_CLASSES_IMPLEMENT_5400
     * @tc.name      testGenericClassesImplement0054
     * @tc.desc      Generic implementation with union array (typed arrays + number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testGenericClassesImplement0054", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const int8Array = new Int8Array([1, 2, 3]);
      const uint16Array = new Uint16Array([4, 5, 6]);
      let impl: GenericInterface_1<(Int8Array | Uint16Array | number)[]> = new GenericImplementation_1<(Int8Array | Uint16Array | number)[]>();
      let inputArray: (Int8Array | Uint16Array | number)[] = [int8Array, 10, uint16Array, 20];
      let result = impl.process(inputArray);
      expect(result).assertEqual(inputArray);
    })
  });
}
