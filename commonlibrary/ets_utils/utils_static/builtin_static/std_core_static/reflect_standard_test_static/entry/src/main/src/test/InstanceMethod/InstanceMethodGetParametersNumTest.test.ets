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
  public testMethod(a: number, b: string): void {
  }
}

class MyClass004 {
  public noParams(): void {
  }

  public oneParam(a: number): void {
  }

  public twoParams(a: number, b: string): void {
  }

  public threeParams(a: number, b: string, c: boolean): void {
  }

  public manyParams(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass007 {
  public manyParams(a: number, b: string, c: boolean, d: number, e: string, f: boolean, g: number, h: string,
    i: boolean, j: number): void {
  }
}

class MyClass008 {
  public optionalParam(a: number, b?: string): void {
  }

  public multipleOptional(a: number, b?: string, c?: boolean): void {
  }
}

class MyClass009 {
  public mixedParams(a: number, c: boolean, b?: string, d?: number): void {
  }
}

class MyClass010 {
  public restParam(...args: number[]): void {
  }

  public mixedRest(a: string, ...args: number[]): void {
  }
}

class MyClass011 {
  public multipleRest(a: number, ...args1: string[]): void {
  }
}

class MyClass012 {
  public genericMethod<T>(param: T): void {
  }

  public multipleGeneric<T, U>(a: T, b: U): void {
  }
}

class MyClass022 {
  public publicMethod(a: number, b: string): void {
  }
}

class ParentClass025 {
  public parentMethod(a: number, b: string, c: boolean): void {
  }
}

class ParentClass026 {
  public overrideMethod(a: number): void {
  }
}

class ChildClass026 extends ParentClass026 {
  public override overrideMethod(a: number): void {
  }
}

class MyClass027 {
  public instanceMethod(a: number, b: string): void {
  }

  public noParams(): void {
  }
}

class MyClass028 {
  public value: number;
  public name: string;

  constructor(value: number, name: string) {
    this.value = value;
    this.name = name;
  }

  public update(value: number, name: string): void {
  }
}

class MyClass029 {
  constructor() {
  }

  public noParams(): void {
  }
}

class MyClass030 {
  public overloadMethod(): void {
  }
  public overloadMethod(value: number): void {
  }
  public overloadMethod(value: number, name: string): void {
  }
}

class MyClass031 {
  private _value: number = 0;

  get value(): number {
    return this._value;
  }
}

class MyClass032 {
  private _value: number = 0;

  set value(v: number) {
    this._value = v;
  }
}

class MyClass038 {
  public callbackParam(callback: () => void): void {
  }

  public callbackWithParam(callback: (x: number) => string): void {
  }
}

class MyClass039 {
  public promiseParam(p: Promise<string>): void {
  }

  public multiplePromise(p1: Promise<number>, p2: Promise<string>): void {
  }
}

class MyClass040 {
  public destructureParam(): void {
  }
}

class MyClass043 {
  public manyParams(p1: number, p2: number, p3: number, p4: number, p5: number, p6: number, p7: number, p8: number,
    p9: number, p10: number, p11: number, p12: number, p13: number, p14: number, p15: number): void {
  }
}

class MyClass045 {
  public mixedTypes(a: number, b: string, c: boolean, d: object, e: number[]): void {
  }
}

class MyClass046 {
  public returnVoid(a: number): void {
  }

  public returnNumber(a: number): number {
    return a;
  }

  public returnString(a: number): string {
    return "test";
  }

  public returnObject(a: number): object {
    return {};
  }
}

class CustomType050 {
}

class MyClass050 {
  public customParam(a: CustomType050): void {
  }

  public mixedCustomParams(a: CustomType050, b: number, c: string): void {
  }
}

class MyClass051 {
  public mapParam(m: Map<string, number>): void {
  }

  public setParam(s: Set<number>): void {
  }
}

class MyClass052 {
  public async asyncMethod(a: number, b: string): Promise<void> {
  }
}

abstract class AbstractClass053 {
  public abstract abstractMethod(a: number, b: string): void;
}

class EmptyClass054 {
}

class ParentClass055 {
  public parentMethod(a: number, b: string): void {
  }
}

class ChildClass055 extends ParentClass055 {
}

class ParentClass056 {
  public overrideMethod(a: number): void {
  }
}

class ChildClass056 extends ParentClass056 {
  public overrideMethod(a: number, b: string): void {
  }
}

class MyClass057 {
  public genericMethod<T>(a: T, b: T): void {
  }
}

class MyClass058 {
  public method1(): void {
  }

  public method2(a: number): void {
  }

  public method3(a: number, b: string): void {
  }
}

class MyClass059 {
  public objectParam(a: object, b: object): void {
  }
}

class MyClass060 {
  public arrayParam(a: number[], b: string[]): void {
  }
}

class MyClass061 {
  public extremeParams(a1: number, a2: string, a3: boolean, a4: number, a5: string, a6: boolean, a7: number, a8: string,
    a9: boolean, a10: number, a11: string, a12: boolean, a13: number, a14: string, a15: boolean, a16: number,
    a17: string, a18: boolean, a19: number, a20: string): void {
  }
}


export default function InstanceMethodGetParametersNumTest(): void {
  describe('InstanceMethodGetParametersNumTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0001
     * @tc.name testInstanceMethodGetParametersNum0001
     * @tc.desc Verify that getParametersNum() requires no parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let paramNum = method!.getParametersNum();
      expect(paramNum).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0002
     * @tc.name testInstanceMethodGetParametersNum0002
     * @tc.desc Verify that methods with different parameter counts return the correct numbers
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass004>();

      expect(cls.getInstanceMethod('noParams')!.getParametersNum()).assertEqual(0);
      expect(cls.getInstanceMethod('oneParam')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('twoParams')!.getParametersNum()).assertEqual(2);
      expect(cls.getInstanceMethod('threeParams')!.getParametersNum()).assertEqual(3);
      expect(cls.getInstanceMethod('manyParams')!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0003
     * @tc.name testInstanceMethodGetParametersNum0003
     * @tc.desc Verify that a method with many parameters returns the correct count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('manyParams');
      expect(method!.getParametersNum()).assertEqual(10);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0004
     * @tc.name testInstanceMethodGetParametersNum0004
     * @tc.desc Verify that optional parameters are counted in the total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass008>();

      expect(cls.getInstanceMethod('optionalParam')!.getParametersNum()).assertEqual(2);
      expect(cls.getInstanceMethod('multipleOptional')!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0005
     * @tc.name testInstanceMethodGetParametersNum0005
     * @tc.desc Verify that optional and required parameters are counted together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass009>();
      let method = cls.getInstanceMethod('mixedParams');
      expect(method!.getParametersNum()).assertEqual(4);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0006
     * @tc.name testInstanceMethodGetParametersNum0006
     * @tc.desc Verify that rest parameters are counted in the total
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass010>();

      let restMethod = cls.getInstanceMethod('restParam');
      let num1 = restMethod!.getParametersNum();
      expect(num1).assertEqual(1);

      let mixedMethod = cls.getInstanceMethod('mixedRest');
      let num2 = mixedMethod!.getParametersNum();
      expect(num2).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0007
     * @tc.name testInstanceMethodGetParametersNum0007
     * @tc.desc Verify a method containing one rest parameter and one required parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass011>();
      let method = cls.getInstanceMethod('multipleRest');
      let num = method!.getParametersNum();
      expect(num).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0008
     * @tc.name testInstanceMethodGetParametersNum0008
     * @tc.desc Verify the parameter count of generic methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass012>();

      let genMethod = cls.getInstanceMethod('genericMethod');
      expect(genMethod!.getParametersNum()).assertEqual(1);

      let multiGenMethod = cls.getInstanceMethod('multipleGeneric');
      expect(multiGenMethod!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0009
     * @tc.name testInstanceMethodGetParametersNum0009
     * @tc.desc Verify using getParametersNum() together with getParameterTypes()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass001>();
      let method = cls.getInstanceMethod('testMethod');
      let num = method!.getParametersNum();
      let paramTypes = method!.getParameterTypes();
      expect(num).assertEqual(paramTypes.length);
      expect(paramTypes[0].getName()).assertEqual('f64');
      expect(paramTypes[1].getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0010
     * @tc.name testInstanceMethodGetParametersNum0010
     * @tc.desc Verify the parameter count of a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let method = cls.getInstanceMethod('publicMethod');
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0011
     * @tc.name testInstanceMethodGetParametersNum0011
     * @tc.desc Verify the parameter count of a method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass025>();
      let method = cls.getInstanceMethod('parentMethod');
      expect(method!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0012
     * @tc.name testInstanceMethodGetParametersNum0012
     * @tc.desc Verify the parameter count of an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass026>();
      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0013
     * @tc.name testInstanceMethodGetParametersNum0013
     * @tc.desc Verify the parameter count of instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();

      let method = cls.getInstanceMethod('instanceMethod');
      expect(method!.getParametersNum()).assertEqual(2);

      let noParams = cls.getInstanceMethod('noParams');
      expect(noParams!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0014
     * @tc.name testInstanceMethodGetParametersNum0014
     * @tc.desc Verify the parameter count of an instance method on a class with a constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass028>();
      let method = cls.getInstanceMethod('update');
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0015
     * @tc.name testInstanceMethodGetParametersNum0015
     * @tc.desc Verify that an instance method with no parameters has parameter count 0
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass029>();
      let method = cls.getInstanceMethod('noParams');
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0016
     * @tc.name testInstanceMethodGetParametersNum0016
     * @tc.desc Verify parameter counts of different instance method overloads
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();
      let methods = cls.getInstanceMethods();
      let hasZero = false;
      let hasOne = false;
      let hasTwo = false;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'overloadMethod') {
          let num = methods[i].getParametersNum();
          if (num === 0) {
            hasZero = true;
          }
          if (num === 1) {
            hasOne = true;
          }
          if (num === 2) {
            hasTwo = true;
          }
        }
      }
      expect(hasZero).assertTrue();
      expect(hasOne).assertTrue();
      expect(hasTwo).assertTrue();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0017
     * @tc.name testInstanceMethodGetParametersNum0017
     * @tc.desc Verify that a getter method typically has 0 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();
      let getter = cls.getInstanceMethod('%%get-value');
      expect(getter!.getName()).assertEqual('%%get-value');
      expect(getter!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0018
     * @tc.name testInstanceMethodGetParametersNum0018
     * @tc.desc Verify that a setter method typically has 1 parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();
      let setter = cls.getInstanceMethod('%%set-value');
      expect(setter!.getName()).assertEqual('%%set-value');
      expect(setter!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0019
     * @tc.name testInstanceMethodGetParametersNum0019
     * @tc.desc Verify function type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass038>();

      let cbMethod = cls.getInstanceMethod('callbackParam');
      expect(cbMethod!.getParametersNum()).assertEqual(1);

      let cbWithParam = cls.getInstanceMethod('callbackWithParam');
      expect(cbWithParam!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0020
     * @tc.name testInstanceMethodGetParametersNum0020
     * @tc.desc Verify Promise type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass039>();

      let promiseMethod = cls.getInstanceMethod('promiseParam');
      expect(promiseMethod!.getParametersNum()).assertEqual(1);

      let multiPromise = cls.getInstanceMethod('multiplePromise');
      expect(multiPromise!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0021
     * @tc.name testInstanceMethodGetParametersNum0021
     * @tc.desc Verify a no-parameter method named destructureParam returns 0 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass040>();
      let method = cls.getInstanceMethod('destructureParam');
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0022
     * @tc.name testInstanceMethodGetParametersNum0022
     * @tc.desc Verify the parameter count of a method with a very large number of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass043>();
      let method = cls.getInstanceMethod('manyParams');
      expect(method!.getParametersNum()).assertEqual(15);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0023
     * @tc.name testInstanceMethodGetParametersNum0023
     * @tc.desc Verify that diverse parameter types do not affect the count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass045>();
      let method = cls.getInstanceMethod('mixedTypes');
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0024
     * @tc.name testInstanceMethodGetParametersNum0024
     * @tc.desc Verify that the return type does not affect the parameter count
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();

      expect(cls.getInstanceMethod('returnVoid')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('returnNumber')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('returnString')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('returnObject')!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0025
     * @tc.name testInstanceMethodGetParametersNum0025
     * @tc.desc Verify parameter count for method with custom class type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass050>();
      expect(cls.getInstanceMethod('customParam')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('mixedCustomParams')!.getParametersNum()).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0026
     * @tc.name testInstanceMethodGetParametersNum0026
     * @tc.desc Verify parameter count for methods with Map and Set parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();
      expect(cls.getInstanceMethod('mapParam')!.getParametersNum()).assertEqual(1);
      expect(cls.getInstanceMethod('setParam')!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0027
     * @tc.name testInstanceMethodGetParametersNum0027
     * @tc.desc Verify parameter count for async method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass052>();
      expect(cls.getInstanceMethod('asyncMethod')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0028
     * @tc.name testInstanceMethodGetParametersNum0028
     * @tc.desc Verify parameter count for abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass053>();
      expect(cls.getInstanceMethod('abstractMethod')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0029
     * @tc.name testInstanceMethodGetParametersNum0029
     * @tc.desc Verify empty class has no methods to count parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass054>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0030
     * @tc.name testInstanceMethodGetParametersNum0030
     * @tc.desc Verify parameter count for inherited method from child class context
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodGetParametersNum0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass055>();
      let childCls = Class.from<ChildClass055>();
      expect(parentCls.getInstanceMethod('parentMethod')!.getParametersNum()).assertEqual(2);
      let childMethod = childCls.getInstanceMethod('parentMethod');
      if (childMethod !== undefined) {
        expect(childMethod!.getParametersNum()).assertEqual(2);
      } else {
        expect(childMethod).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0031
     * @tc.name testInstanceMethodGetParametersNum0031
     * @tc.desc Verify parameter count for overridden method differs between parent and child
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let parentCls = Class.from<ParentClass056>();
      let childCls = Class.from<ChildClass056>();
      expect(parentCls.getInstanceMethod('overrideMethod')!.getParametersNum()).assertEqual(1);
      expect(childCls.getInstanceMethod('overrideMethod')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0032
     * @tc.name testInstanceMethodGetParametersNum0032
     * @tc.desc Verify parameter count for generic method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();
      expect(cls.getInstanceMethod('genericMethod')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0033
     * @tc.name testInstanceMethodGetParametersNum0033
     * @tc.desc Verify parameter count consistency with getParameterTypes for multiple methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let m1 = cls.getInstanceMethod('method1');
      let m2 = cls.getInstanceMethod('method2');
      let m3 = cls.getInstanceMethod('method3');
      expect(m1!.getParametersNum()).assertEqual(m1!.getParameterTypes().length);
      expect(m2!.getParametersNum()).assertEqual(m2!.getParameterTypes().length);
      expect(m3!.getParametersNum()).assertEqual(m3!.getParameterTypes().length);
      expect(m1!.getParametersNum()).assertEqual(0);
      expect(m2!.getParametersNum()).assertEqual(1);
      expect(m3!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0034
     * @tc.name testInstanceMethodGetParametersNum0034
     * @tc.desc Verify parameter count for method with object type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
      expect(cls.getInstanceMethod('objectParam')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0035
     * @tc.name testInstanceMethodGetParametersNum0035
     * @tc.desc Verify parameter count for method with array type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
      expect(cls.getInstanceMethod('arrayParam')!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0036
     * @tc.name testInstanceMethodGetParametersNum0036
     * @tc.desc Verify parameter count for all methods in a class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass058>();
      let methods = cls.getInstanceMethods();
      let totalParams: int = 0;
      for (let i = 0; i < methods.length; i++) {
        totalParams += methods[i].getParametersNum();
      }
      expect(totalParams).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERSNUM_0037
     * @tc.name testInstanceMethodGetParametersNum0037
     * @tc.desc Verify parameter count for method with extreme number of 20 parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParametersNum0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let method = cls.getInstanceMethod('extremeParams');
      expect(method!.getParametersNum()).assertEqual(20);
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(20);
      expect(method!.getParameterType(0)!.getName()).assertEqual(paramTypes[0].getName());
      expect(method!.getParameterType(19)!.getName()).assertEqual(paramTypes[19].getName());
    });

  });
}
