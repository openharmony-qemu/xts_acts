'use static'
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import {
  describe,
  it,
  expect,
  TestType,
  Size,
  Level,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll
} from '@ohos/hypium-binary/src/main/indexStatic';

import Utils from '../../Util.test'

// Helper function to convert to Object
function toObj(p: Object | null | undefined): Object {
  return p!
}

// Generic class for testing FixedArray casting with generics
class GenericContainer<T> {
  fld: FixedArray<T>

  constructor(...p: FixedArray<T>) {
    this.fld = p
  }

  toObj(): Object | null | undefined {
    return this.fld as Object
  }
}

// Generic function for FixedArray casting
function foo<T>(p: Object | null | undefined): FixedArray<T> {
  return p! as FixedArray<T>
}

class ClassA {}
class ClassB extends ClassA {}

export default function FixedArrayTypesTest():void {
  describe('FixedArrayTypesTest', () => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await Utils.msSleep(30);
    })

    afterEach(() => {
      // Presets a clear action, which is performed after each unit test case ends.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
    })

    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: preset action function.
    })

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0100
     * @tc.name      testFixedArrayCast0001
     * @tc.desc      Testing FixedArray<byte> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<byte> = [10, 20]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<byte>
      expect(arr[0]).assertEqual(10);
      expect(arr[1]).assertEqual(20);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0200
     * @tc.name      testFixedArrayCast0002
     * @tc.desc      Testing FixedArray<short> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<short> = [100, 200]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<short>
      expect(arr[0]).assertEqual(100);
      expect(arr[1]).assertEqual(200);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0300
     * @tc.name      testFixedArrayCast0003
     * @tc.desc      Testing FixedArray<int> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<int> = [1000, 2000]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<int>
      expect(arr[0]).assertEqual(1000);
      expect(arr[1]).assertEqual(2000);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0400
     * @tc.name      testFixedArrayCast0004
     * @tc.desc      Testing FixedArray<long> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<long> = [1000000000, 2000000000]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<long>
      expect(arr[0]).assertEqual(1000000000);
      expect(arr[1]).assertEqual(2000000000);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0500
     * @tc.name      testFixedArrayCast0005
     * @tc.desc      Testing FixedArray<float> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<float> = [1.5, 2.5]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<float>
      expect(arr[0] + arr[1]).assertEqual(4.0);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0600
     * @tc.name      testFixedArrayCast0006
     * @tc.desc      Testing FixedArray<double> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<double> = [1.5, 2.5]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<double>
      expect(arr[0] + arr[1]).assertEqual(4.0);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0700
     * @tc.name      testFixedArrayCast0007
     * @tc.desc      Testing FixedArray<char> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<string> = ['a', 'b']
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<string>
      expect(arr[0]).assertEqual('a');
      expect(arr[1]).assertEqual('b');
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0800
     * @tc.name      testFixedArrayCast0008
     * @tc.desc      Testing FixedArray<boolean> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<boolean> = [true, false]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<boolean>
      expect(arr[0]).assertTrue();
      expect(arr[1]).assertFalse();
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_0900
     * @tc.name      testFixedArrayCast0009
     * @tc.desc      Testing FixedArray<string> casting to Object and back to original type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<string> = ["hello", "world"]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<string>
      expect(arr[0]).assertEqual("hello");
      expect(arr[1]).assertEqual("world");
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1000
     * @tc.name      testFixedArrayCast0010
     * @tc.desc      Testing nested FixedArray casting to Object and back
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<FixedArray<bigint>> = [[1n, 2n], [3n, 4n]]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<Object>
      let arr0: FixedArray<bigint> = arr[0] as FixedArray<bigint>
      let arr1: FixedArray<bigint> = arr[1] as FixedArray<bigint>
      expect(arr0[0] + arr0[1] + arr1[0] + arr1[1]).assertEqual(10n);
      arr0[0] = 11n
      expect(arr0[0] + arr0[1] + arr1[0] + arr1[1]).assertEqual(20n);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1100
     * @tc.name      testFixedArrayCast0011
     * @tc.desc      Testing FixedArray type cast error to different type expects ClassCastError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<number> = [1, 2]
      let obj: Object = toObj(x)

      try {
        let a: FixedArray<string> = obj as FixedArray<string>
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof ClassCastError).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1200
     * @tc.name      testFixedArrayCast0012
     * @tc.desc      Testing FixedArray type cast error short to different type expects ClassCastError
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<number> = [1, 2]
      let obj: Object = toObj(x)

      try {
        let a: FixedArray<boolean> = obj as FixedArray<boolean>
        expect(false).assertTrue();
      } catch (e) {
        expect(e instanceof ClassCastError).assertTrue();
      }
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1300
     * @tc.name      testFixedArrayCast0013
     * @tc.desc      Testing FixedArray casting using generic function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let x: FixedArray<number> = [10, 20]
      let obj: Object = toObj(x)
      let arr = obj as FixedArray<number>
      let v: number = arr[0]
      arr[1] = arr[1] + v
      expect(arr[1]).assertEqual(30);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1400
     * @tc.name      testFixedArrayCast0014
     * @tc.desc      Testing FixedArray casting using generic function
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCast0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arr: FixedArray<number> = [10, 20]
      let obj: Object = toObj(arr)
      let arr2: FixedArray<number> = obj as FixedArray<number>
      let v: number = arr2[0]
      arr2[1] = arr2[1] + v
      expect(arr2[1]).assertEqual(30);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1500
     * @tc.name      testFixedArrayCovariance0001
     * @tc.desc      FixedArrays are covariant
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayCovariance0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let arrA: FixedArray<ClassA> = [new ClassB(), new ClassB()]
      let arrB: FixedArray<ClassB> = [new ClassB(), new ClassB()]

      arrA = arrB
      expect(arrA[0] instanceof ClassB).assertTrue();
      expect(arrA[0] instanceof ClassA).assertTrue();
      expect(arrA instanceof FixedArray<ClassA | undefined>).assertTrue();
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1600
     * @tc.name      testFixedArrayLiteral0001
     * @tc.desc      An array literal with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayLiteral0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<number> = [1, 2, 3]
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1);
      expect(a[1]).assertEqual(2);
      expect(a[2]).assertEqual(3);
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1700
     * @tc.name      testFixedArrayLiteral0002
     * @tc.desc      An array literal with string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayLiteral0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<string> = ["a", "b", "c"]
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual("a");
      expect(a[1]).assertEqual("b");
      expect(a[2]).assertEqual("c");
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1800
     * @tc.name      testFixedArrayLiteral0003
     * @tc.desc      An array literal with boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayLiteral0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<boolean> = [true, false, true]
      expect(a.length).assertEqual(3);
      expect(a[0]).assertTrue();
      expect(a[1]).assertFalse();
      expect(a[2]).assertTrue();
    });

    /**
     * @tc.number    SUB_FIXED_ARRAY_TEST_1900
     * @tc.name      testFixedArrayLiteral0004
     * @tc.desc      An array literal with bigint type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testFixedArrayLiteral0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: FixedArray<bigint> = [1n, 2n, 3n]
      expect(a.length).assertEqual(3);
      expect(a[0]).assertEqual(1n);
      expect(a[1]).assertEqual(2n);
      expect(a[2]).assertEqual(3n);
    });
  })
}
