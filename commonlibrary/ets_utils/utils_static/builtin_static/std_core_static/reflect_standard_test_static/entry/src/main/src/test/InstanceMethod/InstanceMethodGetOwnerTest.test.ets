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
  afterAll,
  afterEach,
  beforeAll,
  beforeEach,
  describe,
  expect,
  it,
  Level,
  Size,
  TestType
} from '../../../../hypium/index';
import Utils from './../Util.test';

function assertOwnerNameMatches(actualName: string, expectedName: string): void {
  expect(actualName).assertEqual(expectedName);
}

class MyClass001 {
  public testMethod(): void {
  }
}

class MyClass004 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class ParentClass007 {
  public parentMethod(): void {
  }
}

class ParentClass008 {
  public overrideMethod(): void {
  }
}

class ChildClass008 extends ParentClass008 {
  public override overrideMethod(): void {
  }
}

interface MyInterface010 {
  interfaceMethod(): void;
}

class MyClass010 implements MyInterface010 {
  public interfaceMethod(): void {
  }
}

abstract class AbstractClass011 {
  public abstractMethod(): void {
  }
}

class MyClass016 {
  public method1(): void {
  }

  public method2(): void {
  }

  public method3(): void {
  }
}

class MyClass020 {
  public testMethod(): string {
    return 'test';
  }
}

class MyClass021 {
  public testMethod(param1: number, param2: string): void {
  }
}

class MyClass022 {
  public publicMethod(): void {
  }

  private privateMethod(): void {
  }

  protected protectedMethod(): void {
  }
}

class GenericClass023<T> {
  public genericMethod(param: T): void {
  }
}

namespace MyNamespace024 {
  export class MyClass {
    public testMethod(): void {
    }
  }
}

class MyClass025 {
  public async asyncMethod(): Promise<void> {
  }
}

class MyClass026 {
  public generatorMethod(): void {
  }
}

class MyClass027 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(v: number) {
    this._value = v;
  }
}

class MyClass028 {
  public testMethod(): string {
    return 'test';
  }
}

class MyClass031 {
  public method1(): void {
  }

  public method2(): void {
  }
}

class GrandParentClass033 {
  public grandParentMethod(): void {
  }
}

class ParentClass033 extends GrandParentClass033 {
  public parentMethod(): void {
  }
}

class ChildClass033 extends ParentClass033 {
  public childMethod(): void {
  }
}

class MyClass034 {
  public overloadMethod(param: number): void {
  }
  public overloadMethod(param: string): void {
  }
  public overloadMethod(param: boolean): void {
  }
}

class SingletonClass038 {
  private static instance: SingletonClass038 | undefined = undefined;

  private constructor() {
  }

  public static getInstance(): SingletonClass038 {
    let instance = SingletonClass038.instance;
    if (instance === undefined) {
      instance = new SingletonClass038();
      SingletonClass038.instance = instance;
    }
    return instance;
  }

  public testMethod(): void {
  }
}

class EmptyClass050 {
}

class GrandGrandParent051 {
  public deepMethod(): void {
  }
}

class MidParent051 extends GrandGrandParent051 {
}

class DeepChild051 extends MidParent051 {
}

class MyClass052 {
  public returnNumber(): number {
    return 1;
  }

  public returnString(): string {
    return 'test';
  }

  public returnBoolean(): boolean {
    return true;
  }
}

class MyClass053 {
  public zeroParams(): void {
  }

  public twoParams(a: number, b: string): void {
  }

  public fiveParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class ParentClass054 {
  public baseMethod(): void {
  }
}

class ChildClass054 extends ParentClass054 {
}

class MyClass055 {
  public testMethod(): string {
    return 'test';
  }
}

class AbstractClass056 {
  public concreteMethod(): void {
  }
}

class MyClass057 {
  public methodA(): void {
  }

  public methodB(): void {
  }

  public methodC(): void {
  }
}

class ParentClass058 {
  public sharedMethod(): void {
  }
}

class ChildClass058 extends ParentClass058 {
  public override sharedMethod(): void {
  }
}

class ParentClass059 {
  public baseMethod(): void {
  }
}

class EmptyChildClass059 extends ParentClass059 {
}

class GrandParentClass060 {
  public deepMethod(): void {
  }
}

class MidParentClass060 extends GrandParentClass060 {
}

class ChildClass060 extends MidParentClass060 {
}

export default function InstanceMethodGetOwnerTest(): void {
  describe('InstanceMethodGetOwnerTest', (): void => {
    beforeAll(() => {
    });
    beforeEach(async (): Promise<void> => {
      await Utils.msSleep(30);
    });
    afterEach(() => {
    });
    afterAll(() => {
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0001
     * @tc.name testInstanceMethodGetOwner0001
     * @tc.desc Verify getOwner for public methods and private or protected lookups returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();

      let pubMethod = cls.getInstanceMethod('publicMethod');
      assertOwnerNameMatches(pubMethod!.getOwner().getName(), Class.from<MyClass004>().getName());

      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();

      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0002
     * @tc.name testInstanceMethodGetOwner0002
     * @tc.desc Verify that getOwner returns the declaring parent class for a parent class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass007>();
      let method = cls.getInstanceMethod('parentMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<ParentClass007>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0003
     * @tc.name testInstanceMethodGetOwner0003
     * @tc.desc Verify that getOwner returns the child class for an overridden method in the child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass008>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      assertOwnerNameMatches(childMethod!.getOwner().getName(), Class.from<ChildClass008>().getName());

      let parentCls = Class.from<ParentClass008>();
      let parentMethod = parentCls.getInstanceMethod('overrideMethod');
      assertOwnerNameMatches(parentMethod!.getOwner().getName(), Class.from<ParentClass008>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0004
     * @tc.name testInstanceMethodGetOwner0004
     * @tc.desc Verify getOwner for an interface method implementation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();
      let method = cls.getInstanceMethod('interfaceMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass010>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0005
     * @tc.name testInstanceMethodGetOwner0005
     * @tc.desc Verify getOwner for an abstract class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let abstractCls = Class.from<AbstractClass011>();
      let abstractMethod = abstractCls.getInstanceMethod('abstractMethod');
      assertOwnerNameMatches(abstractMethod!.getOwner().getName(), Class.from<AbstractClass011>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0006
     * @tc.name testInstanceMethodGetOwner0006
     * @tc.desc Verify multiple methods of the same class report the expected owner class name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass016>();
      let method1 = cls.getInstanceMethod('method1');
      let method2 = cls.getInstanceMethod('method2');
      let method3 = cls.getInstanceMethod('method3');
      assertOwnerNameMatches(method1!.getOwner().getName(), Class.from<MyClass016>().getName());
      assertOwnerNameMatches(method2!.getOwner().getName(), Class.from<MyClass016>().getName());
      assertOwnerNameMatches(method3!.getOwner().getName(), Class.from<MyClass016>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0007
     * @tc.name testInstanceMethodGetOwner0007
     * @tc.desc Verify using getOwner() together with getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getName()).assertEqual('testMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass001>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0008
     * @tc.name testInstanceMethodGetOwner0008
     * @tc.desc Verify using getOwner() together with getReturnType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();
      let method = cls.getInstanceMethod('testMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass020>().getName());
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0009
     * @tc.name testInstanceMethodGetOwner0009
     * @tc.desc Verify using getOwner() together with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('testMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass021>().getName());
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0010
     * @tc.name testInstanceMethodGetOwner0010
     * @tc.desc Verify using getOwner() together with isPublic and private or protected lookups returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();

      let pubMethod = cls.getInstanceMethod('publicMethod');
      assertOwnerNameMatches(pubMethod!.getOwner().getName(), Class.from<MyClass022>().getName());
      expect(pubMethod!.isPublic()).assertTrue();

      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();

      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0011
     * @tc.name testInstanceMethodGetOwner0011
     * @tc.desc Verify getOwner for a generic class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<GenericClass023<number>>();
      let method = cls.getInstanceMethod('genericMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<GenericClass023<number>>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0012
     * @tc.name testInstanceMethodGetOwner0012
     * @tc.desc Verify getOwner for a class method inside a namespace
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyNamespace024.MyClass>();
      let method = cls.getInstanceMethod('testMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyNamespace024.MyClass>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0013
     * @tc.name testInstanceMethodGetOwner0013
     * @tc.desc Verify getOwner for a normal method named generatorMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let method = cls.getInstanceMethod('generatorMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass026>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0014
     * @tc.name testInstanceMethodGetOwner0014
     * @tc.desc Verify getOwner for getter and setter methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let getter = cls.getInstanceMethod('%%get-value');
      assertOwnerNameMatches(getter!.getOwner().getName(), Class.from<MyClass027>().getName());

      let setter = cls.getInstanceMethod('%%set-value');
      assertOwnerNameMatches(setter!.getOwner().getName(), Class.from<MyClass027>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0015
     * @tc.name testInstanceMethodGetOwner0015
     * @tc.desc Verify using getOwner() for method permission validation
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let owner = method!.getOwner();
      assertOwnerNameMatches(owner.getName(), Class.from<MyClass001>().getName());
      expect(method!.isPublic()).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0016
     * @tc.name testInstanceMethodGetOwner0016
     * @tc.desc Verify dynamic method invocation using getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let obj = new MyClass028();
      let method = cls.getInstanceMethod('testMethod');
      let owner = method!.getOwner();
      let targetMethod = owner.getInstanceMethod(method!.getName());
      expect(targetMethod!.getName()).assertEqual('testMethod');
      let result = targetMethod!.invoke(obj) as string;
      expect(result).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0017
     * @tc.name testInstanceMethodGetOwner0017
     * @tc.desc Verify getting all methods of a class and checking their getOwner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(2);
      Array.from(methods).forEach((method: reflect.InstanceMethod): void => {
        assertOwnerNameMatches(method.getOwner().getName(), Class.from<MyClass031>().getName());
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0018
     * @tc.name testInstanceMethodGetOwner0018
     * @tc.desc Verify getOwner of methods declared across a multi-level class hierarchy
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandParentCls = Class.from<GrandParentClass033>();
      let parentCls = Class.from<ParentClass033>();
      let childCls = Class.from<ChildClass033>();

      let grandParentMethod = grandParentCls.getInstanceMethod('grandParentMethod');
      assertOwnerNameMatches(grandParentMethod!.getOwner().getName(), Class.from<GrandParentClass033>().getName());

      let parentMethod = parentCls.getInstanceMethod('parentMethod');
      assertOwnerNameMatches(parentMethod!.getOwner().getName(), Class.from<ParentClass033>().getName());

      let childMethod = childCls.getInstanceMethod('childMethod');
      assertOwnerNameMatches(childMethod!.getOwner().getName(), Class.from<ChildClass033>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0019
     * @tc.name testInstanceMethodGetOwner0019
     * @tc.desc Verify getOwner of overloaded methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass034>();
      let overloadCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.getName() === 'overloadMethod') {
          overloadCount++;
          assertOwnerNameMatches(method.getOwner().getName(), Class.from<MyClass034>().getName());
        }
      });
      expect(overloadCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0020
     * @tc.name testInstanceMethodGetOwner0020
     * @tc.desc Verify getOwner for a singleton class method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<SingletonClass038>();
      let method = cls.getInstanceMethod('testMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<SingletonClass038>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0021
     * @tc.name testInstanceMethodGetOwner0021
     * @tc.desc Verify getOwner for empty class has no methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass050>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0022
     * @tc.name testInstanceMethodGetOwner0022
     * @tc.desc Verify getInstanceMethod returns undefined for inherited method on child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let deepCls = Class.from<DeepChild051>();
      let method = deepCls.getInstanceMethod('deepMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0023
     * @tc.name testInstanceMethodGetOwner0023
     * @tc.desc Verify getOwner for methods with different return types all point to same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      let numMethod = cls.getInstanceMethod('returnNumber');
      let strMethod = cls.getInstanceMethod('returnString');
      let boolMethod = cls.getInstanceMethod('returnBoolean');
      assertOwnerNameMatches(numMethod!.getOwner().getName(), Class.from<MyClass052>().getName());
      assertOwnerNameMatches(strMethod!.getOwner().getName(), Class.from<MyClass052>().getName());
      assertOwnerNameMatches(boolMethod!.getOwner().getName(), Class.from<MyClass052>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0024
     * @tc.name testInstanceMethodGetOwner0024
     * @tc.desc Verify getOwner for methods with different parameter counts all point to same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let m0 = cls.getInstanceMethod('zeroParams');
      let m2 = cls.getInstanceMethod('twoParams');
      let m5 = cls.getInstanceMethod('fiveParams');
      assertOwnerNameMatches(m0!.getOwner().getName(), Class.from<MyClass053>().getName());
      assertOwnerNameMatches(m2!.getOwner().getName(), Class.from<MyClass053>().getName());
      assertOwnerNameMatches(m5!.getOwner().getName(), Class.from<MyClass053>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0025
     * @tc.name testInstanceMethodGetOwner0025
     * @tc.desc Verify getOwner consistency between Class.from and Class.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass055();
      let methodFromOf = Class.of(obj).getInstanceMethod('testMethod');
      let methodFromFrom = Class.from<MyClass055>().getInstanceMethod('testMethod');
      assertOwnerNameMatches(methodFromOf!.getOwner().getName(), methodFromFrom!.getOwner().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0026
     * @tc.name testInstanceMethodGetOwner0026
     * @tc.desc Verify getInstanceMethod returns undefined for inherited method on child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass054>();
      let childCls = Class.from<ChildClass054>();
      let parentMethod = parentCls.getInstanceMethod('baseMethod');
      let childMethod = childCls.getInstanceMethod('baseMethod');
      assertOwnerNameMatches(parentMethod!.getOwner().getName(), Class.from<ParentClass054>().getName());
      expect(childMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0027
     * @tc.name testInstanceMethodGetOwner0027
     * @tc.desc Verify getOwner for all methods in class returns correct owner
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      let expectedOwner = Class.from<MyClass057>().getName();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        assertOwnerNameMatches(method.getOwner().getName(), expectedOwner);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0028
     * @tc.name testInstanceMethodGetOwner0028
     * @tc.desc Verify getOwner for overridden method in child points to child, parent method points to parent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass058>();
      let childCls = Class.from<ChildClass058>();
      let parentMethod = parentCls.getInstanceMethod('sharedMethod');
      let childMethod = childCls.getInstanceMethod('sharedMethod');
      assertOwnerNameMatches(parentMethod!.getOwner().getName(), Class.from<ParentClass058>().getName());
      assertOwnerNameMatches(childMethod!.getOwner().getName(), Class.from<ChildClass058>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0029
     * @tc.name testInstanceMethodGetOwner0029
     * @tc.desc Verify getOwner for a concrete method in a regular class points to the declaring class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass056>();
      let method = cls.getInstanceMethod('concreteMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<AbstractClass056>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0030
     * @tc.name testInstanceMethodGetOwner0030
     * @tc.desc Verify getOwner result can be used to re-retrieve the method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let method = cls.getInstanceMethod('testMethod');
      let owner = method!.getOwner();
      let relookedUp = owner.getInstanceMethod(method!.getName());
      expect(relookedUp!.getName()).assertEqual('testMethod');
      assertOwnerNameMatches(relookedUp!.getOwner().getName(), Class.from<MyClass055>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0031
     * @tc.name testInstanceMethodGetOwner0031
     * @tc.desc Verify getOwner for getter and setter both point to the same declaring class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let getter = cls.getInstanceMethod('%%get-value');
      let setter = cls.getInstanceMethod('%%set-value');
      let getterOwner = getter!.getOwner().getName();
      let setterOwner = setter!.getOwner().getName();
      assertOwnerNameMatches(getterOwner, Class.from<MyClass027>().getName());
      assertOwnerNameMatches(setterOwner, Class.from<MyClass027>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0032
     * @tc.name testInstanceMethodGetOwner0032
     * @tc.desc Verify getOwner for async method points to the declaring class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let method = cls.getInstanceMethod('asyncMethod');
      assertOwnerNameMatches(method!.getOwner().getName(), Class.from<MyClass025>().getName());
      expect(method!.isAsync()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0033
     * @tc.name testInstanceMethodGetOwner0033
     * @tc.desc Verify getInstanceMethod returns undefined for inherited methods on child class; child's own method is accessible
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass033>();
      let grandMethod = childCls.getInstanceMethod('grandParentMethod');
      let parentMethod = childCls.getInstanceMethod('parentMethod');
      let childMethod = childCls.getInstanceMethod('childMethod');
      expect(grandMethod).assertUndefined();
      expect(parentMethod).assertUndefined();
      assertOwnerNameMatches(childMethod!.getOwner().getName(), Class.from<ChildClass033>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0034
     * @tc.name testInstanceMethodGetOwner0034
     * @tc.desc Verify getInstanceMethod returns undefined for inherited method on child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass059>();
      let childCls = Class.from<EmptyChildClass059>();
      let parentMethod = parentCls.getInstanceMethod('baseMethod');
      assertOwnerNameMatches(parentMethod!.getOwner().getName(), Class.from<ParentClass059>().getName());
      let childMethod = childCls.getInstanceMethod('baseMethod');
      expect(childMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETOWNER_0035
     * @tc.name testInstanceMethodGetOwner0035
     * @tc.desc Verify getInstanceMethod returns undefined for inherited method on child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetOwner0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let grandCls = Class.from<GrandParentClass060>();
      let childCls = Class.from<ChildClass060>();
      let grandMethod = grandCls.getInstanceMethod('deepMethod');
      assertOwnerNameMatches(grandMethod!.getOwner().getName(), Class.from<GrandParentClass060>().getName());
      let childMethod = childCls.getInstanceMethod('deepMethod');
      expect(childMethod).assertUndefined();
    });

  });
}
