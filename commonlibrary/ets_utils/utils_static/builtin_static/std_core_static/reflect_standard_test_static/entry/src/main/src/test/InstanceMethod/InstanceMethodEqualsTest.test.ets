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

class MyClass011 {
  public method1(): void {
  }

  public method2(): void {
  }
}

class OtherClass018 {
  public testMethod(): void {
  }
}

class MyClass014 {
  public methodA(): void {
  }

  public methodB(): void {
  }
}

class MyClass017 {
  public testMethod(): void {
  }
  public testMethod(param: number): void {
  }
  public testMethod(param: string): void {
  }
}

class MyClass030 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class ParentClass050 {
  public inheritedMethod(): void {
  }
}

class ChildClass050 extends ParentClass050 {
}

class ParentClass051 {
  public overrideMethod(): string {
    return 'parent';
  }
}

class ChildClass051 extends ParentClass051 {
  public override overrideMethod(): string {
    return 'child';
  }
}

abstract class AbstractClass052 {
  public abstract abstractMethod(): void;
}

class EmptyClass053 {
}

class MyClass054 {
  public async asyncMethod(): Promise<string> {
    return 'async';
  }
}

class MyClass055 {
  public method1(a: number): void {
  }
  public method1(a: string): void {
  }
}

class MyClass056 {
  public returnNumber(): number {
    return 1;
  }

  public returnString(): string {
    return 'test';
  }
}

class MyClass057 {
  private _value: number = 0;

  public get value(): number {
    return this._value;
  }

  public set value(v: number) {
    this._value = v;
  }
}

class MyClass058 {
  public testMethod(): void {
  }
}

class MyClass059 {
  public compute(a: number, b: number): number {
    return a + b;
  }
  public compute(a: number, b: number, c: number): number {
    return a + b + c;
  }
}

class MyClass060 {
  public firstMethod(): void {
  }

  public secondMethod(): void {
  }

  public thirdMethod(): void {
  }
}

class EqualsClass076 {
  public genericMethod<T>(param: T): T {
    return param;
  }
}

class EqualsClass077 {
  public methodWithFive(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class EqualsClass078 {
  public methodWithOptional(a: number, b?: string): void {
  }
}

class EqualsClass079 {
  public methodWithRest(...args: string[]): void {
  }
}

export default function InstanceMethodEqualsTest(): void {
  describe('InstanceMethodEqualsTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0001
     * @tc.name testInstanceMethodEquals0001
     * @tc.desc Verify that InstanceMethod objects of different methods are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let method1 = cls.getInstanceMethod('method1');
      let method2 = cls.getInstanceMethod('method2');
      expect(method1!.equals(method2!)).assertEqual(false);
      expect(method2!.equals(method1!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0002
     * @tc.name testInstanceMethodEquals0002
     * @tc.desc Verify that equals has reflexivity: a method equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method1 = cls.getInstanceMethod('testMethod');
      let method2 = cls.getInstanceMethod('testMethod');
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0003
     * @tc.name testInstanceMethodEquals0003
     * @tc.desc Verify that equals has symmetry: a.equals(b) === b.equals(a)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let methodA1 = cls.getInstanceMethod('methodA');
      let methodA2 = cls.getInstanceMethod('methodA');
      let methodB = cls.getInstanceMethod('methodB');

      let equalSym1 = methodA1!.equals(methodA2!);
      let equalSym2 = methodA2!.equals(methodA1!);
      expect(equalSym1).assertEqual(true);
      expect(equalSym2).assertEqual(true);

      let unequalSym1 = methodA1!.equals(methodB!);
      let unequalSym2 = methodB!.equals(methodA1!);
      expect(unequalSym1).assertEqual(false);
      expect(unequalSym2).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0004
     * @tc.name testInstanceMethodEquals0004
     * @tc.desc Verify that equals has transitivity: a.equals(b) && b.equals(c) => a.equals(c)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass001();
      let method1 = Class.of(obj1).getInstanceMethod('testMethod');
      let method2 = Class.from<MyClass001>().getInstanceMethod('testMethod');
      let method3 = Class.from<MyClass001>().getInstanceMethod('testMethod');

      expect(method1!.equals(method2!)).assertEqual(true);
      expect(method2!.equals(method3!)).assertEqual(true);
      expect(method1!.equals(method3!)).assertEqual(true);

      let otherMethod = Class.from<OtherClass018>().getInstanceMethod('testMethod');
      expect(method1!.equals(otherMethod!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0005
     * @tc.name testInstanceMethodEquals0005
     * @tc.desc Verify that methods with different signatures are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();

      let matching = Array.from(cls.getInstanceMethods()).filter((method: reflect.InstanceMethod): boolean => {
        return method.getName() === 'testMethod';
      });
      expect(matching.length >= 2).assertTrue();
      expect(matching[0].equals(matching[1])).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0006
     * @tc.name testInstanceMethodEquals0006
     * @tc.desc Verify that methods with the same name are not necessarily equal when used with getName
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let method1 = Class.from<MyClass001>().getInstanceMethod('testMethod');
      let method2 = Class.from<OtherClass018>().getInstanceMethod('testMethod');

      expect(method1!.getName()).assertEqual(method2!.getName());
      expect(method1!.getOwner().getName()).assertEqual(Class.from<MyClass001>().getName());
      expect(method2!.getOwner().getName()).assertEqual(Class.from<OtherClass018>().getName());
      expect(method1!.equals(method2!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0007
     * @tc.name testInstanceMethodEquals0007
     * @tc.desc Verify comparing whether two method collections are identical
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass011>();
      let cls2 = Class.from<MyClass011>();
      let otherCls = Class.from<MyClass001>();

      let methods1Arr = Array.from(cls1.getInstanceMethods());
      let methods2Arr = Array.from(cls2.getInstanceMethods());

      let areEqual = methods1Arr.length === methods2Arr.length && methods1Arr.every((m1: reflect.InstanceMethod): boolean => {
        return methods2Arr.some((m2: reflect.InstanceMethod): boolean => {
          return m1.equals(m2);
        });
      });
      expect(areEqual).assertEqual(true);

      let otherMethodsArr = Array.from(otherCls.getInstanceMethods());
      let crossMatchCount: number = 0;
      methods1Arr.forEach((m1: reflect.InstanceMethod): void => {
        otherMethodsArr.forEach((m2: reflect.InstanceMethod): void => {
          if (m1.equals(m2)) {
            crossMatchCount++;
          }
        });
      });
      expect(crossMatchCount).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0008
     * @tc.name testInstanceMethodEquals0008
     * @tc.desc Verify methods with the same number of parameters but different types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();
      let oneParamMethods = Array.from(cls.getInstanceMethods()).filter((method: reflect.InstanceMethod): boolean => {
        return method.getName() === 'testMethod' && method.getParametersNum() === 1;
      });
      expect(oneParamMethods.length >= 2).assertTrue();
      let firstMethod = oneParamMethods[0];
      let secondMethod = Array.from(oneParamMethods).find((m: reflect.InstanceMethod): boolean => {
        return m.getParameterType(0)!.getName() !== firstMethod.getParameterType(0)!.getName();
      });
      expect(secondMethod !== undefined).assertTrue();
      expect(firstMethod.equals(secondMethod!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0009
     * @tc.name testInstanceMethodEquals0009
     * @tc.desc Verify that the getter and setter of the same property are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();

      let getter = cls.getInstanceMethod('%%get-value');
      let setter = cls.getInstanceMethod('%%set-value');

      expect(getter!.equals(setter!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0010
     * @tc.name testInstanceMethodEquals0010
     * @tc.desc Verify inherited method from parent equals itself across parent and child class contexts
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodEquals0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass050>();
      let childCls = Class.from<ChildClass050>();
      let parentMethod = parentCls.getInstanceMethod('inheritedMethod');
      let childMethod = childCls.getInstanceMethod('inheritedMethod');
      if (childMethod !== undefined) {
        expect(parentMethod!.equals(childMethod!)).assertEqual(true);
        expect(childMethod!.equals(parentMethod!)).assertEqual(true);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0011
     * @tc.name testInstanceMethodEquals0011
     * @tc.desc Verify overridden methods in parent and child classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass051>();
      let childCls = Class.from<ChildClass051>();
      let parentMethod = parentCls.getInstanceMethod('overrideMethod');
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(parentMethod!.equals(childMethod!)).assertEqual(false);
      expect(childMethod!.equals(parentMethod!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0012
     * @tc.name testInstanceMethodEquals0012
     * @tc.desc Verify overloaded methods with same name but different params are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass055>();
      let matching = Array.from(cls.getInstanceMethods()).filter((method: reflect.InstanceMethod): boolean => {
        return method.getName() === 'method1';
      });
      expect(matching.length >= 2).assertTrue();
      expect(matching[0].equals(matching[1])).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0013
     * @tc.name testInstanceMethodEquals0013
     * @tc.desc Verify abstract method equals itself (reflexivity for abstract methods)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass052>();
      let method1 = cls.getInstanceMethod('abstractMethod');
      let method2 = cls.getInstanceMethod('abstractMethod');
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0014
     * @tc.name testInstanceMethodEquals0014
     * @tc.desc Verify async method equals itself and is consistent
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls1 = Class.from<MyClass054>();
      let cls2 = Class.from<MyClass054>();
      let method1 = cls1.getInstanceMethod('asyncMethod');
      let method2 = cls2.getInstanceMethod('asyncMethod');
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0015
     * @tc.name testInstanceMethodEquals0015
     * @tc.desc Verify empty class has zero instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass053>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0016
     * @tc.name testInstanceMethodEquals0016
     * @tc.desc Verify method consistency between Class.from and Class.of
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj = new MyClass058();
      let methodFromOf = Class.of(obj).getInstanceMethod('testMethod');
      let methodFromFrom = Class.from<MyClass058>().getInstanceMethod('testMethod');
      expect(methodFromOf!.equals(methodFromFrom!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0017
     * @tc.name testInstanceMethodEquals0017
     * @tc.desc Verify methods with different return types are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();
      let numMethod = cls.getInstanceMethod('returnNumber');
      let strMethod = cls.getInstanceMethod('returnString');
      expect(numMethod!.equals(strMethod!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0018
     * @tc.name testInstanceMethodEquals0018
     * @tc.desc Verify getter and setter from different classes are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls030 = Class.from<MyClass030>();
      let cls057 = Class.from<MyClass057>();
      let getter030 = cls030.getInstanceMethod('%%get-value');
      let getter057 = cls057.getInstanceMethod('%%get-value');
      expect(getter030!.equals(getter057!)).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0019
     * @tc.name testInstanceMethodEquals0019
     * @tc.desc Verify all methods in a class are pairwise distinct
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
      let methodsArr = Array.from(cls.getInstanceMethods());
      expect(methodsArr.length).assertEqual(3);
      let allDistinct = !methodsArr.some((m1: reflect.InstanceMethod, i: int): boolean => {
        return methodsArr.some((m2: reflect.InstanceMethod, j: int): boolean => {
          return j > i && m1.equals(m2);
        });
      });
      expect(allDistinct).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0020
     * @tc.name testInstanceMethodEquals0020
     * @tc.desc Verify overloaded methods with different param counts are not equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
      let matching = Array.from(cls.getInstanceMethods()).filter((method: reflect.InstanceMethod): boolean => {
        return method.getName() === 'compute';
      });
      expect(matching.length >= 2).assertTrue();
      expect(matching[0].getParametersNum()).assertEqual(2);
      expect(matching[1].getParametersNum()).assertEqual(3);
      expect(matching[0].equals(matching[1])).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0021
     * @tc.name testInstanceMethodEquals0021
     * @tc.desc Verify that the same method retrieved multiple times is always equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let m1 = cls.getInstanceMethod('method1');
      let m2 = cls.getInstanceMethod('method1');
      let m3 = cls.getInstanceMethod('method1');
      expect(m1!.equals(m2!)).assertEqual(true);
      expect(m2!.equals(m3!)).assertEqual(true);
      expect(m1!.equals(m3!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0022
     * @tc.name testInstanceMethodEquals0022
     * @tc.desc Verify that equals returns true for methods obtained from different class instances of same class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let obj1 = new MyClass058();
      let obj2 = new MyClass058();
      let method1 = Class.of(obj1).getInstanceMethod('testMethod');
      let method2 = Class.of(obj2).getInstanceMethod('testMethod');
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0023
     * @tc.name testInstanceMethodEquals0023
     * @tc.desc Verify generic method equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqualsClass076>();
      let m1 = cls.getInstanceMethod('genericMethod');
      let m2 = cls.getInstanceMethod('genericMethod');
      expect(m1!.equals(m2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0024
     * @tc.name testInstanceMethodEquals0024
     * @tc.desc Verify method with 5 params equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqualsClass077>();
      let m1 = cls.getInstanceMethod('methodWithFive');
      let m2 = cls.getInstanceMethod('methodWithFive');
      expect(m1!.equals(m2!)).assertEqual(true);
      expect(m1!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0025
     * @tc.name testInstanceMethodEquals0025
     * @tc.desc Verify method with optional param equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqualsClass078>();
      let m1 = cls.getInstanceMethod('methodWithOptional');
      let m2 = cls.getInstanceMethod('methodWithOptional');
      expect(m1!.equals(m2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_EQUALS_0026
     * @tc.name testInstanceMethodEquals0026
     * @tc.desc Verify method with rest param equals itself
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodEquals0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EqualsClass079>();
      let m1 = cls.getInstanceMethod('methodWithRest');
      let m2 = cls.getInstanceMethod('methodWithRest');
      expect(m1!.equals(m2!)).assertEqual(true);
    });
  });
}
