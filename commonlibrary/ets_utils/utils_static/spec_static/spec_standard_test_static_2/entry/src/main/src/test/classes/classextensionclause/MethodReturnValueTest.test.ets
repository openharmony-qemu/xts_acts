'use static';
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
} from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from '../../Util.test'

class Parent {
  public getValue(): number {
    return 100;
  }
}

class Child extends Parent {
  public getValue(): number {
    return 200;
  }
}

class Parent1 {
  protected getValue(): number {
    return 100;
  }

  public getParentValue(): number {
    return this.getValue();
  }
}

class Child1 extends Parent1 {
  protected getValue(): number {
    return 200;
  }

  public getChildValue(): number {
    return this.getValue();
  }
}

class GrandParent {
  public getValue(): number {
    return 100;
  }
}

class Parent2 extends GrandParent {
  public getValue(): number {
    return 200;
  }
}

class Child2 extends Parent2 {
  public getValue(): number {
    return 300;
  }
}

class GrandParent2 {
  public getValue(): number {
    return 100;
  }
}

class Parent3 extends GrandParent2 {
  public getValue(): number {
    return super.getValue() + 100;
  }
}

class Child3 extends Parent3 {
  public getValue(): number {
    return super.getValue() + 100;
  }
}

class GrandParent3 {
  protected getValue(): number {
    return 100;
  }

  public getGrandParentValue(): number {
    return this.getValue();
  }
}

class Parent4 extends GrandParent3 {
  protected getValue(): number {
    return 200;
  }

  public getParentValue(): number {
    return this.getValue();
  }
}

class Child4 extends Parent4 {
  protected getValue(): number {
    return 300;
  }

  public getChildValue(): number {
    return this.getValue();
  }
}

class Parent5 {
  getValue(): number {
    return 100;
  }
}

class Child5 extends Parent5 {
  getValue(): number {
    return 200;
  }
}

class GrandParent4 {
  getValue(): number {
    return 100;
  }
}

class Parent6 extends GrandParent4 {
  getValue(): number {
    return 200;
  }
}

class Child6 extends Parent6 {
  getValue(): number {
    return 300;
  }
}

class GrandParent5 {
  getValue(): number {
    return 100;
  }
}

class Parent7 extends GrandParent5 {
  getValue(): number {
    return super.getValue() + 100;
  }
}

class Child7 extends Parent7 {
  getValue(): number {
    return super.getValue() + 100;
  }
}

class Parent8 {
  static staticMethod(): string {
    return "Parent's static method";
  }
}

class Child8 extends Parent8 {
  static staticMethod(): string {
    const result = Parent8.staticMethod();
    return `${result} and Child's additional logic`;
  }
}

class Parent9 {
  public getValue(): number {
    return 100;
  }
}

class Child9 extends Parent9 {
}

class Parent10 {
  public getValue(): string {
    return "100";
  }
}

class Child10 extends Parent10 {
}

class Parent11 {
  public getValue(): byte {
    return 100;
  }
}

class Child11 extends Parent11 {
}

class Parent12 {
  public getValue(): short {
    return 100;
  }
}

class Child12 extends Parent12 {
}

class Parent13 {
  public getValue(): int {
    return 100;
  }
}

class Child13 extends Parent13 {
}

class Parent14 {
  public getValue(): long {
    return 100;
  }
}

class Child14 extends Parent14 {
}

class Parent15 {
  public getValue(): double {
    return 100;
  }
}

class Child15 extends Parent15 {
}

class Parent16 {
  public getValue(): float {
    return 100;
  }
}

class Child16 extends Parent16 {
}


class Parent17 {
  public getValue(): never {
    throw new Error('This method always throws an error');
  }
}

class Child17 extends Parent17 {
}

class Parent18 {
  public getValue(): char {
    return Int.toChar(100);
  }
}

class Child18 extends Parent18 {
}

class Parent19 {
  public getValue(): boolean {
    return true;
  }
}

class Child19 extends Parent19 {
}

class Parent20 {
  public getValue(): [] {
    return [];
  }
}

class Child20 extends Parent20 {
}

interface Person {
  name: string;
  age: number;
  hobbies: string[];
}

class Parent21 {
  public createGenericObject(): Person {
    return {
      name: "John",
      age: 30,
      hobbies: ["reading", "swimming"]
    };
  }
}

class Child21 extends Parent21 {
}

class Parent22 {
  public getValue(): bigint {
    return 123n;
  }
}

class Child22 extends Parent22 {
}

class Parent23 {
  private isExecuted = false;

  public getValue(): void {
    console.log("some operations");
    this.isExecuted = true;
  }

  public wasExecuted(): boolean {
    return this.isExecuted;
  }
}

class Child23 extends Parent23 {
}


export default function MethodReturnValueTest(): void {
  describe('MethodReturnValueTest', () => {
    // Defines a test suite. Two parameters are supported: test suite name and test suite function.
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
      // This API supports only one parameter: clear action function.
    })
    afterAll(() => {
      // Presets a clear action, which is performed after all test cases of the test suite end.
      // This API supports only one parameter: clear action function.
    })

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0100
     * @tc.name      testMethodReturnValue0001
     * @tc.desc      The method returns a value of number and the modifier is public to verify that the rewrite works
     * correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0001", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(200);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0200
     * @tc.name      testMethodReturnValue0002
     * @tc.desc      The method returns a value of number and the modifier is protected to verify that the rewrite
     * works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0002", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent1();
      let parentValue: number = parent.getParentValue();
      expect(parentValue).assertEqual(100);
      let child = new Child1();
      let childValue: number = child.getChildValue();
      expect(childValue).assertEqual(200);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0300
     * @tc.name      testMethodReturnValue0003
     * @tc.desc      In multi-layer inheritance, the return value of the method is number, and the modifier is public.
     * Verify that the rewrite works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0003", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParent = new GrandParent();
      let grandParentValue: number = grandParent.getValue();
      expect(grandParentValue).assertEqual(100);
      let parent = new Parent2();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(200);
      let child = new Child2();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(300);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0400
     * @tc.name      testMethodReturnValue0004
     * @tc.desc       In multi-layer inheritance, the parent class method is called in the subclass method method,
     * with the modifier public, to verify that the rewrite works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0004", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParent = new GrandParent2();
      let grandParentValue: number = grandParent.getValue();
      expect(grandParentValue).assertEqual(100);
      let parent = new Parent3();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(200);
      let child = new Child3();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(300);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0500
     * @tc.name      testMethodReturnValue0005
     * @tc.desc      In multi-layer inheritance, the return value of the method is number, and the modifier is
     * protected. Verify that the rewrite works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0005", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParent = new GrandParent3();
      let grandParentValue: number = grandParent.getGrandParentValue();
      expect(grandParentValue).assertEqual(100);
      let parent = new Parent4();
      let parentValue: number = parent.getParentValue();
      expect(parentValue).assertEqual(200);
      let child = new Child4();
      let childValue: number = child.getChildValue();
      expect(childValue).assertEqual(300);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0600
     * @tc.name      testMethodReturnValue0006
     * @tc.desc      The method returns a value of number and the modifier is internal to verify that the rewrite
     * works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0006", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent5();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child5();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(200);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0700
     * @tc.name      testMethodReturnValue0007
     * @tc.desc       In multi-layer inheritance, the return value of the method is number, and the modifier is
     * internal. Verify that the rewrite works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0007", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParent = new GrandParent4();
      let grandParentValue: number = grandParent.getValue();
      expect(grandParentValue,).assertEqual(100);
      let parent = new Parent6();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(200);
      let child = new Child6();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(300);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0800
     * @tc.name      testMethodReturnValue0008
     * @tc.desc      In multi-layer inheritance, the parent class method is called in the subclass method method,
     * and the modifier is internal. Verify that the rewrite works correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0008", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParent = new GrandParent5();
      let grandParentValue: number = grandParent.getValue();
      expect(grandParentValue).assertEqual(100);
      let parent = new Parent7();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(200);
      let child = new Child7();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(300);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_0900
     * @tc.name      testMethodReturnValue0009
     * @tc.desc      The method returns a value of number and the modifier is public to verify that the rewrite works
     * correctly
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0009", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      expect(Parent8.staticMethod()).assertEqual("Parent's static method");
      expect(Child8.staticMethod()).assertEqual("Parent's static method and Child's additional logic");
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1000
     * @tc.name      testMethodReturnValue0010
     * @tc.desc      The return value of the method is number, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0010", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent9();
      let parentValue: number = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child9();
      let childValue: number = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1100
     * @tc.name      testMethodReturnValue0011
     * @tc.desc      The return value of the method is string, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0011", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent10();
      let parentValue: string = parent.getValue();
      expect(parentValue).assertEqual("100");
      let child = new Child10();
      let childValue: string = child.getValue();
      expect(childValue).assertEqual("100");
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1200
     * @tc.name      testMethodReturnValue0012
     * @tc.desc      The return value of the method is byte, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0012", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent11();
      let parentValue: byte = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child11();
      let childValue: byte = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1300
     * @tc.name      testMethodReturnValue0013
     * @tc.desc      The return value of the method is short, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0013", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent12();
      let parentValue: short = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child12();
      let childValue: short = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1400
     * @tc.name      testMethodReturnValue0014
     * @tc.desc      The return value of the method is int, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0014", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent13();
      let parentValue: int = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child13();
      let childValue: int = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1500
     * @tc.name      testMethodReturnValue0015
     * @tc.desc      The return value of the method is long, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0015", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent14();
      let parentValue: long = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child14();
      let childValue: long = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1600
     * @tc.name      testMethodReturnValue0016
     * @tc.desc      The return value of the method is double, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0016", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent15();
      let parentValue: double = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child15();
      let childValue: double = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1700
     * @tc.name      testMethodReturnValue0017
     * @tc.desc      The return value of the method is float, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0017", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent16();
      let parentValue: float = parent.getValue();
      expect(parentValue).assertEqual(100);
      let child = new Child16();
      let childValue: float = child.getValue();
      expect(childValue).assertEqual(100);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1800
     * @tc.name      testMethodReturnValue0018
     * @tc.desc      The return value of the method is never, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0018", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent17();
      try {
        let parentValue: never = parent.getValue();
      } catch (error) {
        if (error instanceof Error) {
          expect(error.message).assertEqual('This method always throws an error');
        } else {
          throw new Error('Unexpected error type');
        }
      }
      let child = new Child17();
      try {
        let childValue: never = child.getValue();
      } catch (error) {
        if (error instanceof Error) {
          expect(error.message).assertEqual('This method always throws an error');
        } else {
          throw new Error('Unexpected error type');
        }
      }
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_1900
     * @tc.name      testMethodReturnValue0019
     * @tc.desc      The return value of the method is boolean, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0019", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent19();
      let parentValue: boolean = parent.getValue();
      expect(parentValue).assertEqual(true);
      let child = new Child19();
      let childValue: boolean = child.getValue();
      expect(childValue).assertEqual(true);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_2000
     * @tc.name      testMethodReturnValue0020
     * @tc.desc      The return value of the method is [], and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0020", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent20();
      let parentValue: [] = parent.getValue();
      expect(parentValue.toString()).assertEqual("");
      let child = new Child20();
      let childValue: [] = child.getValue();
      expect(childValue.toString()).assertEqual("");
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_2100
     * @tc.name      testMethodReturnValue0021
     * @tc.desc      The return value of the method is [], and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0021", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent21();
      let obj1: Person = parent.createGenericObject();
      expect(obj1.name).assertEqual("John");
      expect(obj1.age).assertEqual(30);
      expect(obj1.hobbies[0]).assertEqual("reading");
      expect(obj1.hobbies[1]).assertEqual("swimming");
      let child = new Child21();
      let obj2: Person = child.createGenericObject();
      expect(obj2.name).assertEqual("John");
      expect(obj2.age).assertEqual(30);
      expect(obj2.hobbies[0]).assertEqual("reading");
      expect(obj2.hobbies[1]).assertEqual("swimming");
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_2200
     * @tc.name      testMethodReturnValue0022
     * @tc.desc      The return value of the method is bigint, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0022", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent22();
      let parentValue: bigint = parent.getValue();
      expect(parentValue).assertEqual(123n);
      let child = new Child22();
      let childValue: bigint = child.getValue();
      expect(childValue).assertEqual(123n);
    });

    /**
     * @tc.number    SUB_METHOD_RETURN_VALUE_2300
     * @tc.name      testMethodReturnValue0023
     * @tc.desc      The return value of the method is void, and the modifier is public
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it("testMethodReturnValue0023", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parent = new Parent23();
      parent.getValue();
      expect(parent.wasExecuted()).assertEqual(true);
      let child = new Child23();
      child.getValue();
      expect(child.wasExecuted()).assertEqual(true);
    });
  })
}
