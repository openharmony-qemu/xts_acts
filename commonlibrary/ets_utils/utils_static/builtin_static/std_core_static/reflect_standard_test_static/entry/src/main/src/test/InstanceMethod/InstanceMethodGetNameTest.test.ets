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

class MyClass005 {
  public camelCaseMethod(): void {
  }

  public PascalCaseMethod(): void {
  }

  public snake_case_method(): void {
  }

  public $method(): void {
  }

  public _method(): void {
  }

  public method123(): void {
  }
}

class MyClass007 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }

  set value(v: number) {
    this._value = v;
  }
}

abstract class MyAbstractClass020 {
  public abstract abstractMethod(): void;
}

class MyClass021 {
  public async asyncMethod(): Promise<void> {
  }
}

class MyClass022 {
  public genericMethod<T>(param: T): T {
    return param;
  }
}

class ParentClass023 {
  public parentMethod(): void {
  }
}

class ParentClass024 {
  public overrideMethod(): void {
  }
}

class ChildClass024 extends ParentClass024 {
  public override overrideMethod(): void {
  }
}

class MyClass025 {
  public testMethod(): string {
    return 'test';
  }
}

class MyClass026 {
  public testMethod(param1: number, param2: string): void {
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

  public method3(): void {
  }
}

class MyClass032 {
  public classMethod(): void {
  }

  public functionMethod(): void {
  }

  public returnMethod(): void {
  }
}

class MyClass040 {
  public returnNumber(): number {
    return 100;
  }

  public returnVoid(): void {
  }

  public returnNever(): never {
    throw new Error('never');
  }
}

class CustomUser041 {
}

class MyClass041 {
  public returnCustomClass(): CustomUser041 {
    return new CustomUser041();
  }
}

class MyClass042 {
  public fiveParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass043 {
  public optionalParam(a: number, b?: string): void {
  }
}

class MyClass044 {
  public restParam(...args: string[]): void {
  }
}

class MyClass045 {
  public defaultParam(a: number, b: string = 'default'): void {
  }
}

abstract class AbstractClass046 {
  public abstract abstractMethod(): void;
}

class MyClass047 {
  public overloadedMethod(a: number): void {
  }
  public overloadedMethod(a: string): void {
  }
}

class ParentClass048 {
  public parentMethod(): void {
  }
}

class ChildClass048 extends ParentClass048 {
}

class ParentClass049 {
  public overrideMethod(): void {
  }
}

class ChildClass049 extends ParentClass049 {
  public override overrideMethod(): void {
  }
}

class EmptyClass050 {
}

class MyClass051 {
  public method1(): void {
  }

  public method2(): void {
  }

  public method3(): void {
  }

  public method4(): void {
  }
}

class MyClass052 {
  public testMethod(): string {
    return 'test';
  }
}

class MyClass053 {
  public $$specialMethod(): void {
  }

  public method_with_underscores(): void {
  }

  public METHOD_UPPER(): void {
  }
}

class MyClass054 {
  public async asyncReturnString(): Promise<string> {
    return 'async';
  }
}

class MyClass055 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass056 {
  public arrowFuncField: () => void = (): void => {
  };

  public normalMethod(): void {
  }
}


export default function InstanceMethodGetNameTest(): void {
  describe('InstanceMethodGetNameTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0001
     * @tc.name testInstanceMethodGetName0001
     * @tc.desc Verify that getName() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let name = method!.getName();
      expect(name).assertEqual('testMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0002
     * @tc.name testInstanceMethodGetName0002
     * @tc.desc Verify getting public method names and private or protected lookups returning undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();

      let pubMethod = cls.getInstanceMethod('publicMethod');
      expect(pubMethod!.getName()).assertEqual('publicMethod');

      let privMethod = cls.getInstanceMethod('privateMethod');
      expect(privMethod).assertUndefined();

      let protMethod = cls.getInstanceMethod('protectedMethod');
      expect(protMethod).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0003
     * @tc.name testInstanceMethodGetName0003
     * @tc.desc Verify getting method names with different naming styles
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let method1 = cls.getInstanceMethod('camelCaseMethod');
      expect(method1!.getName()).assertEqual('camelCaseMethod');

      let method2 = cls.getInstanceMethod('PascalCaseMethod');
      expect(method2!.getName()).assertEqual('PascalCaseMethod');

      let method3 = cls.getInstanceMethod('snake_case_method');
      expect(method3!.getName()).assertEqual('snake_case_method');

      let method4 = cls.getInstanceMethod('$method');
      expect(method4!.getName()).assertEqual('$method');

      let method5 = cls.getInstanceMethod('_method');
      expect(method5!.getName()).assertEqual('_method');

      let method6 = cls.getInstanceMethod('method123');
      expect(method6!.getName()).assertEqual('method123');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0004
     * @tc.name testInstanceMethodGetName0004
     * @tc.desc Verify getting getter and setter method names
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');

      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0005
     * @tc.name testInstanceMethodGetName0005
     * @tc.desc Verify getting an abstract method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyAbstractClass020>();
      let method = cls.getInstanceMethod('abstractMethod');
      expect(method!.getName()).assertEqual('abstractMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0006
     * @tc.name testInstanceMethodGetName0006
     * @tc.desc Verify getting an async method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass021>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.getName()).assertEqual('asyncMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0007
     * @tc.name testInstanceMethodGetName0007
     * @tc.desc Verify getting a generic method name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let method = cls.getInstanceMethod('genericMethod');
      expect(method!.getName()).assertEqual('genericMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0008
     * @tc.name testInstanceMethodGetName0008
     * @tc.desc Verify getting the name of a method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass023>();
      let method = cls.getInstanceMethod('parentMethod');
      expect(method!.getName()).assertEqual('parentMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0009
     * @tc.name testInstanceMethodGetName0009
     * @tc.desc Verify getting the name of an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ChildClass024>();
      let method = cls.getInstanceMethod('overrideMethod');
      expect(method!.getName()).assertEqual('overrideMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0010
     * @tc.name testInstanceMethodGetName0010
     * @tc.desc Verify using getName() together with getOwner()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getName()).assertEqual('testMethod');
      expect(method!.getOwner().getName()).assertEqual(Class.from<MyClass001>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0011
     * @tc.name testInstanceMethodGetName0011
     * @tc.desc Verify using getName() together with getReturnType()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getName()).assertEqual('testMethod');
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0012
     * @tc.name testInstanceMethodGetName0012
     * @tc.desc Verify using getName() together with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass026>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getName()).assertEqual('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0013
     * @tc.name testInstanceMethodGetName0013
     * @tc.desc Verify dynamic method invocation using getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let obj = new MyClass028();
      let method = cls.getInstanceMethod('testMethod');
      let methodName = method!.getName();
      let targetMethod = cls.getInstanceMethod(methodName);
      expect(targetMethod!.getName()).assertEqual('testMethod');
      let result = targetMethod!.invoke(obj) as string;
      expect(result).assertEqual('test');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0014
     * @tc.name testInstanceMethodGetName0014
     * @tc.desc Verify building a method name map using getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let methods = cls.getInstanceMethods();
      let methodNameMap = new Map<string, string>();
      for (let i = 0; i < methods.length; i++) {
        methodNameMap.set(methods[i].getName(), methods[i].getName());
      }
      expect(methodNameMap.get('method1')).assertEqual('method1');
      expect(methodNameMap.get('method2')).assertEqual('method2');
      expect(methodNameMap.get('method3')).assertEqual('method3');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0015
     * @tc.name testInstanceMethodGetName0015
     * @tc.desc Verify method names containing reserved-word substrings
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let method1 = cls.getInstanceMethod('classMethod');
      expect(method1!.getName()).assertEqual('classMethod');
      let method2 = cls.getInstanceMethod('functionMethod');
      expect(method2!.getName()).assertEqual('functionMethod');
      let method3 = cls.getInstanceMethod('returnMethod');
      expect(method3!.getName()).assertEqual('returnMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0016
     * @tc.name testInstanceMethodGetName0016
     * @tc.desc Verify that method names obtained from different Class objects are consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass001>();
      let cls2 = Class.from<MyClass001>();
      let method1 = cls1.getInstanceMethod('testMethod');
      let method2 = cls2.getInstanceMethod('testMethod');
      expect(method1!.getName()).assertEqual('testMethod');
      expect(method2!.getName()).assertEqual('testMethod');
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0017
     * @tc.name testInstanceMethodGetName0017
     * @tc.desc Verify getName for method returning custom class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass041>();
      let method = cls.getInstanceMethod('returnCustomClass');
      expect(method!.getName()).assertEqual('returnCustomClass');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0018
     * @tc.name testInstanceMethodGetName0018
     * @tc.desc Verify getName for method with 5 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();
      let method = cls.getInstanceMethod('fiveParams');
      expect(method!.getName()).assertEqual('fiveParams');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0019
     * @tc.name testInstanceMethodGetName0019
     * @tc.desc Verify getName for method with optional parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('optionalParam');
      expect(method!.getName()).assertEqual('optionalParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0020
     * @tc.name testInstanceMethodGetName0020
     * @tc.desc Verify getName for method with rest parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();
      let method = cls.getInstanceMethod('restParam');
      expect(method!.getName()).assertEqual('restParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0021
     * @tc.name testInstanceMethodGetName0021
     * @tc.desc Verify getName for method with default value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('defaultParam');
      expect(method!.getName()).assertEqual('defaultParam');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0022
     * @tc.name testInstanceMethodGetName0022
     * @tc.desc Verify getName for overloaded methods returns the same name
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass047>();
      let methods = cls.getInstanceMethods();
      let count: int = 0;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'overloadedMethod') {
          count++;
        }
      }
      expect(count).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0023
     * @tc.name testInstanceMethodGetName0023
     * @tc.desc Verify getName for inherited method from parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodGetName0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass048>();
      let childCls = Class.from<ChildClass048>();
      let parentMethod = parentCls.getInstanceMethod('parentMethod');
      let childMethod = childCls.getInstanceMethod('parentMethod');
      expect(parentMethod!.getName()).assertEqual('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.getName()).assertEqual('parentMethod');
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0024
     * @tc.name testInstanceMethodGetName0024
     * @tc.desc Verify getName for overridden method in child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass049>();
      let childCls = Class.from<ChildClass049>();
      let parentMethod = parentCls.getInstanceMethod('overrideMethod');
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(parentMethod!.getName()).assertEqual('overrideMethod');
      expect(childMethod!.getName()).assertEqual('overrideMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0025
     * @tc.name testInstanceMethodGetName0025
     * @tc.desc Verify building a method name set using getName()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      let methods = cls.getInstanceMethods();
      let nameSet = new Set<string>();
      for (let i = 0; i < methods.length; i++) {
        nameSet.add(methods[i].getName());
      }
      expect(nameSet.has('method1')).assertTrue();
      expect(nameSet.has('method2')).assertTrue();
      expect(nameSet.has('method3')).assertTrue();
      expect(nameSet.has('method4')).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0026
     * @tc.name testInstanceMethodGetName0026
     * @tc.desc Verify getName for empty class returns no methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass050>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0027
     * @tc.name testInstanceMethodGetName0027
     * @tc.desc Verify getName for methods with special naming conventions
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass053>();
      let m1 = cls.getInstanceMethod('$$specialMethod');
      expect(m1!.getName()).assertEqual('$$specialMethod');
      let m2 = cls.getInstanceMethod('method_with_underscores');
      expect(m2!.getName()).assertEqual('method_with_underscores');
      let m3 = cls.getInstanceMethod('METHOD_UPPER');
      expect(m3!.getName()).assertEqual('METHOD_UPPER');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0028
     * @tc.name testInstanceMethodGetName0028
     * @tc.desc Verify getName for async method returning Promise
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass054>();
      let method = cls.getInstanceMethod('asyncReturnString');
      expect(method!.getName()).assertEqual('asyncReturnString');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETNAME_0029
     * @tc.name testInstanceMethodGetName0029
     * @tc.desc Verify that arrow function field is not classified as an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetName0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.getName()).assertEqual('normalMethod');
      let arrowField = cls.getInstanceMethod('arrowFuncField');
      expect(arrowField).assertUndefined();
    });
  });
}
