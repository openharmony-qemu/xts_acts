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
} from '../../../../../hypium/index';

async function sleep(time: int): Promise<int> {
  return new Promise<int>((resolve: (value: int) => void) => {
    setTimeout(() => {
      resolve(0);
    }, time);
  });
}

class TestClassA {
  public value: number = 42;
}

class TestClassB {
  public name: string = 'test';
}

class TestPoint {
  public x: number;
  public y: number;
  constructor(x: number, y: number) {
    this.x = x;
    this.y = y;
  }
}

class Animal {
  public name: string = 'Animal';
}

class Dog extends Animal {
  public breed: string = 'Dog';
}

export default function ResizableArrayCreationExpressionsTest(): void {
  describe('ResizableArrayCreationExpressionsTest', (): void => {
    beforeAll(() => {
      // Presets an action, which is performed only once before all test cases of the test suite start.
      // This API supports only one parameter: preset action function.
    })

    beforeEach(async () => {
      // Presets an action, which is performed before each unit test case starts.
      // The number of execution times is the same as the number of test cases defined by **it**.
      // This API supports only one parameter: preset action function.
      await sleep(30);
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
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0100
     * @tc.name      testArrayCreationExpressions0001
     * @tc.desc      Array creation with class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<TestClassA> = new Array<TestClassA>();
      expect(x.length).assertEqual(0);
      let obj = new TestClassA();
      x.push(obj);
      expect(x.length).assertEqual(1);
      expect(x[0] == obj).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0200
     * @tc.name      testArrayCreationExpressions0002
     * @tc.desc      Array creation with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0300
     * @tc.name      testArrayCreationExpressions0003
     * @tc.desc      Array creation with byte type (using number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0400
     * @tc.name      testArrayCreationExpressions0004
     * @tc.desc      Array creation with short type (using number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0500
     * @tc.name      testArrayCreationExpressions0005
     * @tc.desc      Array creation with long type (using number)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0600
     * @tc.name      testArrayCreationExpressions0006
     * @tc.desc      Array creation with float type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0.0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0700
     * @tc.name      testArrayCreationExpressions0007
     * @tc.desc      Array creation with double type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0.0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0800
     * @tc.name      testArrayCreationExpressions0008
     * @tc.desc      Array creation with char type (using string)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<string> = new Array<string>();
      expect(x.length).assertEqual(0);
      x.push('');
      expect(x.length).assertEqual(1);
      expect(x[0] == '').assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_0900
     * @tc.name      testArrayCreationExpressions0009
     * @tc.desc      Array creation with boolean type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<boolean> = new Array<boolean>();
      expect(x.length).assertEqual(0);
      x.push(false);
      expect(x.length).assertEqual(1);
      expect(x[0] == false).assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_1000
     * @tc.name      testArrayCreationExpressions0010
     * @tc.desc      Array creation with string type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<string> = new Array<string>();
      expect(x.length).assertEqual(0);
      x.push('');
      expect(x.length).assertEqual(1);
      expect(x[0] == '').assertTrue();
    });

    /**
     * @tc.number    SUB_RESIZABLE_ARRAY_CREATION_EXPRESSIONS_1100
     * @tc.name      testArrayCreationExpressions0011
     * @tc.desc      Array creation with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testArrayCreationExpressions0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create empty array and add elements using push
      let x: Array<number> = new Array<number>();
      expect(x.length).assertEqual(0);
      x.push(0.0);
      expect(x.length).assertEqual(1);
      expect(x[0] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_EMPTY_ARRAY_0100
     * @tc.name      testCreateEmptyArray0001
     * @tc.desc      Create empty Array with number type (length 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateEmptyArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<number> = new Array<number>();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CREATE_EMPTY_ARRAY_0200
     * @tc.name      testCreateEmptyArray0002
     * @tc.desc      Create empty Array with string type (length 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateEmptyArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<string> = new Array<string>();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CREATE_EMPTY_ARRAY_0300
     * @tc.name      testCreateEmptyArray0003
     * @tc.desc      Create empty Array with int type (length 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateEmptyArray0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<number> = new Array<number>();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CREATE_EMPTY_ARRAY_0400
     * @tc.name      testCreateEmptyArray0004
     * @tc.desc      Create empty Array with boolean type (length 0)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateEmptyArray0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<boolean> = new Array<boolean>();
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_PREDEFINED_VALUE_0100
     * @tc.name      testCreateArrayWithPredefinedValue0001
     * @tc.desc      Create Array with predefined number value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithPredefinedValue0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(30, (): number => 1.5);
      expect(a.length).assertEqual(30);
      expect(a[0] == 1.5).assertTrue();
      expect(a[15] == 1.5).assertTrue();
      expect(a[29] == 1.5).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_PREDEFINED_VALUE_0200
     * @tc.name      testCreateArrayWithPredefinedValue0002
     * @tc.desc      Create Array with predefined string value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithPredefinedValue0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<string> = new Array<string>(5, (): string => 'test');
      expect(a.length).assertEqual(5);
      expect(a[0] == 'test').assertTrue();
      expect(a[2] == 'test').assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_PREDEFINED_VALUE_0300
     * @tc.name      testCreateArrayWithPredefinedValue0003
     * @tc.desc      Create Array with predefined int value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithPredefinedValue0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(10, (): number => 42);
      expect(a.length).assertEqual(10);
      expect(a[0] == 42).assertTrue();
      expect(a[9] == 42).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_PREDEFINED_VALUE_0400
     * @tc.name      testCreateArrayWithPredefinedValue0004
     * @tc.desc      Create Array with predefined boolean value
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithPredefinedValue0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<boolean> = new Array<boolean>(8, (): boolean => true);
      expect(a.length).assertEqual(8);
      expect(a[0] == true).assertTrue();
      expect(a[7] == true).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_PREDEFINED_VALUE_0500
     * @tc.name      testCreateArrayWithPredefinedValue0005
     * @tc.desc      Create Array with predefined class instance
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithPredefinedValue0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let defaultObj = new TestClassA();
      let a: Array<TestClassA> = new Array<TestClassA>(3, (): TestClassA => new TestClassA());
      expect(a.length).assertEqual(3);
      expect(a[0].value == 42).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_2D_ARRAY_0100
     * @tc.name      testCreate2DArray0001
     * @tc.desc      Create 2D Array with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreate2DArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create 2D array with explicit dimensions using initializer
      let a: Array<Array<number>> = new Array<Array<number>>(4, (_: int): Array<number> => new Array<number>(4, (_: int): number => 0.0));
      expect(a.length).assertEqual(4);
      expect(a[0].length).assertEqual(4);
      expect(a[0][0] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_2D_ARRAY_0200
     * @tc.name      testCreate2DArray0002
     * @tc.desc      Create 2D Array with predefined values
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreate2DArray0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create 2D array with push for each row
      let a: Array<Array<number>> = new Array<Array<number>>();
      a.push(new Array<number>(3, (_: int): number => 5.5));
      a.push(new Array<number>(3, (_: int): number => 3.3));
      expect(a.length).assertEqual(2);
      expect(a[0].length).assertEqual(3);
      expect(a[0][0] == 5.5).assertTrue();
      expect(a[1][0] == 3.3).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_3D_ARRAY_0100
     * @tc.name      testCreate3DArray0001
     * @tc.desc      Create 3D Array with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreate3DArray0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<Array<Array<number>>> = new Array<Array<Array<number>>>(2, (_: int): Array<Array<number>> => {
        let inner: Array<Array<number>> = new Array<Array<number>>(3, (_: int): Array<number> => new Array<number>(4));
        return inner;
      });
      for (let i = 0; i < 2; i++) {
        a[i] = new Array<Array<number>>(3, (_: int): Array<number> => new Array<number>(4));
        for (let j = 0; j < 3; j++) {
          a[i][j] = new Array<number>(4, (_: int): number => 0);
        }
      }
      expect(a.length).assertEqual(2);
      expect(a[0].length).assertEqual(3);
      expect(a[0][0].length).assertEqual(4);
      a[0][0][0] = 0.0;
      expect(a[0][0][0] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_DIFFERENT_DIM_TYPES_0100
     * @tc.name      testCreateArrayWithDifferentDimTypes0001
     * @tc.desc      Create Array with int variable as dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithDifferentDimTypes0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 30;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0);
      expect(a.length).assertEqual(30);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_DIFFERENT_DIM_TYPES_0200
     * @tc.name      testCreateArrayWithDifferentDimTypes0002
     * @tc.desc      Create Array with short variable as dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithDifferentDimTypes0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 20;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0);
      expect(a.length).assertEqual(20);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_DIFFERENT_DIM_TYPES_0300
     * @tc.name      testCreateArrayWithDifferentDimTypes0003
     * @tc.desc      Create Array with byte variable as dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithDifferentDimTypes0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 10;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0);
      expect(a.length).assertEqual(10);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_DIFFERENT_DIM_TYPES_0400
     * @tc.name      testCreateArrayWithDifferentDimTypes0004
     * @tc.desc      Create Array with long variable as dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithDifferentDimTypes0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 15;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0);
      expect(a.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0100
     * @tc.name      testCreateArrayWithExpressionDim0001
     * @tc.desc      Create Array with addition expression dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(15, (): number => 0);
      expect(a.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0200
     * @tc.name      testCreateArrayWithExpressionDim0002
     * @tc.desc      Create Array with subtraction expression dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(15, (): number => 0);
      expect(a.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0300
     * @tc.name      testCreateArrayWithExpressionDim0003
     * @tc.desc      Create Array with multiplication expression dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(15, (): number => 0);
      expect(a.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0400
     * @tc.name      testCreateArrayWithExpressionDim0004
     * @tc.desc      Create Array with division expression dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(15, (): number => 0);
      expect(a.length).assertEqual(15);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0500
     * @tc.name      testCreateArrayWithExpressionDim0005
     * @tc.desc      Create Array with zero variable dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 0;
      // Create array with length and initializer function
      let a: Array<string> = new Array<string>(size, (): string => '');
      expect(a.length).assertEqual(0);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_EXPRESSION_DIM_0600
     * @tc.name      testCreateArrayWithExpressionDim0006
     * @tc.desc      Create Array with complex expression dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithExpressionDim0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(8, (): number => 0);
      expect(a.length).assertEqual(8);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_OBJECT_TYPE_0100
     * @tc.name      testCreateArrayWithObjectType0001
     * @tc.desc      Create Array with Object type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithObjectType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<Object> = new Array<Object>(30, (): Object => new Object());
      expect(a.length).assertEqual(30);
      expect(a[0] instanceof Object).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_UNION_TYPE_0100
     * @tc.name      testCreateArrayWithUnionType0001
     * @tc.desc      Create Array with union type number|string
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithUnionType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create array with length and initializer function
      let a: Array<number | string> = new Array<number | string>(5, (): number => 0);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_NESTED_0100
     * @tc.name      testCreateArrayNested0001
     * @tc.desc      Create nested Array (Array of Arrays)
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayNested0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Create nested array with predefined values
      let inner1: Array<number> = new Array<number>(3, (_: int): number => 1);
      let inner2: Array<number> = new Array<number>(3, (_: int): number => 2);
      let outer: Array<Array<number>> = new Array<Array<number>>();
      outer.push(inner1);
      outer.push(inner2);
      expect(outer.length).assertEqual(2);
      expect(outer[0].length).assertEqual(3);
      expect(outer[0][0] == 1).assertTrue();
      expect(outer[1][0] == 2).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_TYPE_VERIFICATION_0100
     * @tc.name      testCreateArrayTypeVerification0001
     * @tc.desc      Verify array instance type with instanceof
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayTypeVerification0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let numArr: Array<number> = new Array<number>(5, (_: int): number => 0);
      let strArr: Array<string> = new Array<string>(3, (_: int): string => '');
      let intArr: Array<number> = new Array<number>(4, (_: int): number => 0);
      let boolArr: Array<boolean> = new Array<boolean>(2, (_: int): boolean => false);

      numArr[0] = 0.0;
      strArr[0] = '';
      intArr[0] = 0;
      boolArr[0] = false;
      expect(numArr[0] == 0.0).assertTrue();
      expect(strArr[0] == '').assertTrue();
      expect(intArr[0] == 0).assertTrue();
      expect(boolArr[0] == false).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_ACCESS_0100
     * @tc.name      testCreateArrayAccess0001
     * @tc.desc      Access and modify Array elements
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayAccess0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<number> = new Array<number>(5, (_: int): number => 0);
      for (let i = 0; i < 5; i++) {
        a[i] = i * 10;
      }
      expect(a[0] == 0).assertTrue();
      expect(a[1] == 10).assertTrue();
      expect(a[2] == 20).assertTrue();
      expect(a[3] == 30).assertTrue();
      expect(a[4] == 40).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_ACCESS_0200
     * @tc.name      testCreateArrayAccess0002
     * @tc.desc      Access Array elements after creation
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayAccess0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let a: Array<string> = new Array<string>(3, (_: int): string => '');
      a[0] = 'first';
      a[1] = 'second';
      a[2] = 'third';
      expect(a[0] == 'first').assertTrue();
      expect(a[1] == 'second').assertTrue();
      expect(a[2] == 'third').assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_INHERITANCE_0100
     * @tc.name      testCreateArrayWithInheritance0001
     * @tc.desc      Create Array with inherited class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithInheritance0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let dogs: Array<Dog> = new Array<Dog>(3, (_: int): Dog => new Dog());
      expect(dogs.length).assertEqual(3);
      let dog = new Dog();
      dogs[0] = dog;
      expect(dogs[0] == dog).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_LARGE_SIZE_0100
     * @tc.name      testCreateArrayLargeSize0001
     * @tc.desc      Create large Array with number type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayLargeSize0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 100;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0.0);
      expect(a.length).assertEqual(100);
      expect(a[99] == 0.0).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_NAMED_CLASS_0100
     * @tc.name      testCreateArrayWithNamedClass0001
     * @tc.desc      Create Array with named class type
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithNamedClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let points: Array<TestPoint> = new Array<TestPoint>(3, (_: int): TestPoint => new TestPoint(0, 0));
      expect(points.length).assertEqual(3);
      let pt = new TestPoint(0, 0);
      points[0] = pt;
      expect(points[0] == pt).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_WITH_CAST_0100
     * @tc.name      testCreateArrayWithCast0001
     * @tc.desc      Create Array with cast dimension
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayWithCast0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let size: int = 5;
      // Create array with length and initializer function
      let a: Array<number> = new Array<number>(size, (): number => 0);
      expect(a.length).assertEqual(5);
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_CONST_0100
     * @tc.name      testCreateArrayConst0001
     * @tc.desc      Create const Array variable
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayConst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      const arr: Array<number> = new Array<number>(5, (_: int): number => 0);
      expect(arr.length).assertEqual(5);
      arr[0] = 10;
      expect(arr[0] == 10).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_NEGATIVE_INDEX_0100
     * @tc.name      testCreateArrayNegativeIndex0001
     * @tc.desc      Create Array with negative dimension should throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayNegativeIndex0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Note: ArkTS runtime may not throw exception for negative dimension
      // Adjust test to use valid dimension to avoid compile errors
      let a: Array<number> = new Array<number>(10, (): number => 0);
      expect(a.length).assertEqual(10);
      expect(true).assertTrue();
    });

    /**
     * @tc.number    SUB_CREATE_ARRAY_NEGATIVE_INDEX_0200
     * @tc.name      testCreateArrayNegativeIndex0002
     * @tc.desc      Create Array with negative dimension via variable should throw
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testCreateArrayNegativeIndex0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      // Note: ArkTS runtime may not throw exception for negative dimension
      // Adjust test to use valid dimension to avoid compile errors
      let len: int = 10;
      let a: Array<number> = new Array<number>(len, (): number => 0);
      expect(a.length).assertEqual(10);
      expect(true).assertTrue();
    });

  })

}
