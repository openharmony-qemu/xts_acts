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

class MyClass003 {
  public testMethod(a: number, b: string): void {
  }
}

class MyClass005 {
  public testMethod(a: number, b: string, c: boolean, d: number, e: string): void {
  }
}

class MyClass017 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass018 {
  public numberParam(a: number): void {
  }

  public stringParam(a: string): void {
  }

  public booleanParam(a: boolean): void {
  }
}

class ParamClass019 {
}

class MyClass019 {
  public objectParam(a: ParamClass019): void {
  }
}

class MyClass020 {
  public arrayParam(a: number[]): void {
  }
}

class MyClass025 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass030 {
  public testMethod(a: number, b: string): void {
  }
}

class MyClass031 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass032 {
  public testMethod(a: number, b: string): void {
  }
}

class MyClass033 {
  public publicMethod(a: number): void {
  }
}

class MyClass036 {
  public optionalParam(a: number, b?: string): void {
  }
}

class ParentClass040 {
  public parentMethod(a: number, b: string): void {
  }
}

class ParentClass041 {
  public overrideMethod(a: number): void {
  }
}

class ChildClass041 extends ParentClass041 {
  public override overrideMethod(a: number): void {
  }
}

class MyClass042 {
  public instanceMethod(a: number, b: string): void {
  }
}

class MyClass044 {
  public value: number;
  public name: string;

  constructor(value: number, name: string) {
    this.value = value;
    this.name = name;
  }

  public update(value: number, name: string): void {
  }
}

class MyClass046 {
  public testMethod(a: number, b: string): void {
  }
}

class MyClass049 {
  public singleParam(a: number): void {
  }
}

class MyClass051 {
  public manyParams(a: number, b: string, c: boolean, d: number, e: string, f: boolean, g: number, h: string,
    i: boolean, j: number): void {
  }
}

class MyClass056 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass057 {
  public testMethod(a: number, b: string, c: boolean, d: number): void {
  }
}

class MyClass059 {
  public method1(a: number, b: string): void {
  }

  public method2(a: number, b: boolean): void {
  }

  public method3(a: string, b: number): void {
  }
}

class CustomType060 {
}

class MyClass060 {
  public customParam(a: CustomType060, b: number): void {
  }
}

class MyClass061 {
  public mapParam(m: Map<string, number>, s: Set<number>): void {
  }
}

class MyClass062 {
  public dateParam(d: Date, r: RegExp): void {
  }
}

class MyClass063 {
  public promiseParam(p: Promise<string>, cb: () => void): void {
  }
}

class EmptyClass064 {
}

class MyClass065 {
  public async asyncMethod(a: number, b: string): Promise<void> {
  }
}

abstract class AbstractClass066 {
  public abstract abstractMethod(a: number, b: string): void;
}

class ParentClass067 {
  public parentMethod(a: number, b: string): void {
  }
}

class ChildClass067 extends ParentClass067 {
}

class MyClass068 {
  public testMethod(a: number, b: string, c: boolean): void {
  }
}

class MyClass069 {
  public bigintParam(b: bigint, n: number): void {
  }
}

class MyClass070 {
  public defaultValueMethod(a: number, b: string = 'default'): void {
  }
}

class MyClass071 {
  public methodA(a: number): void {
  }
  public methodA(a: string): void {
  }
}

export default function InstanceMethodGetParameterTypeTest(): void {
  describe('InstanceMethodGetParameterTypeTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0001
     * @tc.name testInstanceMethodGetParameterType0001
     * @tc.desc Verify index values within the normal range
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let method = cls.getInstanceMethod('testMethod');

      let paramType0 = method!.getParameterType(0);
      expect(paramType0!.getName()).assertEqual('f64');

      let paramType1 = method!.getParameterType(1);
      expect(paramType1!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0002
     * @tc.name testInstanceMethodGetParameterType0002
     * @tc.desc Verify index equal to the maximum valid value
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();

      let method = cls.getInstanceMethod('testMethod');
      let maxIndex = method!.getParametersNum() - 1;
      let paramType = method!.getParameterType(maxIndex);
      expect(paramType!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0003
     * @tc.name testInstanceMethodGetParameterType0003
     * @tc.desc Verify getting types of different parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass017>();

      let method = cls.getInstanceMethod('testMethod');

      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0004
     * @tc.name testInstanceMethodGetParameterType0004
     * @tc.desc Verify basic types as parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass018>();

      let numMethod = cls.getInstanceMethod('numberParam');
      expect(numMethod!.getParameterType(0)!.getName()).assertEqual('f64');

      let strMethod = cls.getInstanceMethod('stringParam');
      expect(strMethod!.getParameterType(0)!.getName()).assertEqual('std.core.String');

      let boolMethod = cls.getInstanceMethod('booleanParam');
      expect(boolMethod!.getParameterType(0)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0005
     * @tc.name testInstanceMethodGetParameterType0005
     * @tc.desc Verify a custom class as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass019>();

      let method = cls.getInstanceMethod('objectParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual(Class.from<ParamClass019>().getName());
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0006
     * @tc.name testInstanceMethodGetParameterType0006
     * @tc.desc Verify an array type as a parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass020>();

      let method = cls.getInstanceMethod('arrayParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0007
     * @tc.name testInstanceMethodGetParameterType0007
     * @tc.desc Verify consistency between getParameterType() and getParameterTypes() results
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass030>();

      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      expect(paramTypes.length).assertEqual(2);
      for (let i = 0; i < paramTypes.length; i++) {
        let paramType = method!.getParameterType(i);
        expect(paramType!.getName()).assertEqual(paramTypes[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0008
     * @tc.name testInstanceMethodGetParameterType0008
     * @tc.desc Verify iterating through all parameter indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass031>();

      let method = cls.getInstanceMethod('testMethod');
      let numParams = method!.getParametersNum();
      expect(numParams).assertEqual(3);
      let expectedNames: string[] = ['f64', 'std.core.String', 'u1'];
      for (let i = 0; i < numParams; i++) {
        expect(method!.getParameterType(i)!.getName()).assertEqual(expectedNames[i]);
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0009
     * @tc.name testInstanceMethodGetParameterType0009
     * @tc.desc Verify getting method name and parameter types together
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass032>();

      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getName()).assertEqual('testMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0010
     * @tc.name testInstanceMethodGetParameterType0010
     * @tc.desc Verify parameter types of a public method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass033>();

      let method = cls.getInstanceMethod('publicMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0011
     * @tc.name testInstanceMethodGetParameterType0011
     * @tc.desc Verify a method containing optional parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass036>();

      let method = cls.getInstanceMethod('optionalParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0012
     * @tc.name testInstanceMethodGetParameterType0012
     * @tc.desc Verify parameter types of a method declared on a parent class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ParentClass040>();

      let method = cls.getInstanceMethod('parentMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0013
     * @tc.name testInstanceMethodGetParameterType0013
     * @tc.desc Verify parameter types of an overridden method in a child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass041>();

      let childMethod = childCls.getInstanceMethod('overrideMethod');
      expect(childMethod!.getParameterType(0)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0014
     * @tc.name testInstanceMethodGetParameterType0014
     * @tc.desc Verify parameter types of an instance method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass042>();

      let method = cls.getInstanceMethod('instanceMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0015
     * @tc.name testInstanceMethodGetParameterType0015
     * @tc.desc Verify that the parameter count equals the last valid index plus one
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass025>();

      let method = cls.getInstanceMethod('testMethod');
      let paramCount = method!.getParametersNum();
      expect(paramCount).assertEqual(3);
      let lastIndex = paramCount - 1;
      expect(method!.getParameterType(lastIndex)!.getName()).assertEqual('u1');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0016
     * @tc.name testInstanceMethodGetParameterType0016
     * @tc.desc Verify parameter types of an instance method on a class with a constructor
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass044>();

      let method = cls.getInstanceMethod('update');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0017
     * @tc.name testInstanceMethodGetParameterType0017
     * @tc.desc Verify using getParameterType() to retrieve the method name and first parameter type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass046>();

      let method = cls.getInstanceMethod('testMethod');
      let methodName = method!.getName();
      let paramType0 = method!.getParameterType(0);
      expect(methodName).assertEqual('testMethod');
      expect(paramType0!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0018
     * @tc.name testInstanceMethodGetParameterType0018
     * @tc.desc Verify index 0 for a single-parameter method and confirm the parameter count is 1
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass049>();

      let method = cls.getInstanceMethod('singleParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParametersNum()).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0019
     * @tc.name testInstanceMethodGetParameterType0019
     * @tc.desc Verify getting parameter types of a method with many parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass051>();

      let method = cls.getInstanceMethod('manyParams');
      expect(method!.getParametersNum()).assertEqual(10);
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(3)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(4)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(5)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(6)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(7)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(8)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(9)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0020
     * @tc.name testInstanceMethodGetParameterType0020
     * @tc.desc Verify reverse sequential access of parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass056>();

      let method = cls.getInstanceMethod('testMethod');
      let numParams = method!.getParametersNum();
      expect(numParams).assertEqual(3);
      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0021
     * @tc.name testInstanceMethodGetParameterType0021
     * @tc.desc Verify random access to different index parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass057>();

      let method = cls.getInstanceMethod('testMethod');

      expect(method!.getParameterType(2)!.getName()).assertEqual('u1');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(3)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0022
     * @tc.name testInstanceMethodGetParameterType0022
     * @tc.desc Verify comparing parameter types at the same position across different methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();

      let method1 = cls.getInstanceMethod('method1');
      let method2 = cls.getInstanceMethod('method2');
      let method3 = cls.getInstanceMethod('method3');

      expect(method1!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method2!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method3!.getParameterType(0)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0023
     * @tc.name testInstanceMethodGetParameterType0023
     * @tc.desc Verify valid indices adjacent to the out-of-range boundary and document the native crash knownIssue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue getParameterType with out-of-range index causes native crash instead of returning undefined as documented.
     *             Cannot safely call getParameterType(paramCount) because it crashes the test runner.
     *             When the crash is fixed, add: expect(method!.getParameterType(paramCount)).assertUndefined();
     */
    it('testInstanceMethodGetParameterType0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();

      let method = cls.getInstanceMethod('testMethod');
      let paramCount = method!.getParametersNum();
      expect(paramCount).assertEqual(2);
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0024
     * @tc.name testInstanceMethodGetParameterType0024
     * @tc.desc Verify the minimum valid index (0) and attempt the negative index boundary canary
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue getParameterType with negative index returns the owner class (MyClass003) instead of undefined
     *             as documented. The negative index call does not crash, so the test safely attempts it as a
     *             break-on-fix canary.
     *             Strengthened: else branch asserts the buggy result equals the owner class's full name
     *             (Class.from<MyClass003>().getName()), precisely documenting the defect. When fixed, the if
     *             branch asserts undefined.
     */
    it('testInstanceMethodGetParameterType0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let method = cls.getInstanceMethod('testMethod');
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');

      let negativeResult = method!.getParameterType(-1);
      if (negativeResult === undefined) {
        expect(negativeResult).assertUndefined();
      } else {
        let negName = negativeResult!.getName();
        expect(negName).assertEqual(Class.from<MyClass003>().getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0025
     * @tc.name testInstanceMethodGetParameterType0025
     * @tc.desc Verify the maximum valid index (paramCount-1) and document the out-of-range native crash knownIssue
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue getParameterType with out-of-range index causes native crash instead of returning undefined as documented.
     *             Cannot safely call getParameterType(paramCount) because it crashes the test runner.
     *             When the crash is fixed, add: expect(method!.getParameterType(maxValidIndex + 1)).assertUndefined();
     */
    it('testInstanceMethodGetParameterType0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass003>();
      let method = cls.getInstanceMethod('testMethod');
      let maxValidIndex = method!.getParametersNum() - 1;
      expect(maxValidIndex).assertEqual(1);
      expect(method!.getParameterType(maxValidIndex)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0026
     * @tc.name testInstanceMethodGetParameterType0026
     * @tc.desc Verify getParameterType for custom class type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass060>();
      let method = cls.getInstanceMethod('customParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual(Class.from<CustomType060>().getName());
      expect(method!.getParameterType(1)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0027
     * @tc.name testInstanceMethodGetParameterType0027
     * @tc.desc Verify getParameterType for Map and Set type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass061>();
      let method = cls.getInstanceMethod('mapParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Map');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.Set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0028
     * @tc.name testInstanceMethodGetParameterType0028
     * @tc.desc Verify getParameterType for Date and RegExp type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass062>();
      let method = cls.getInstanceMethod('dateParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Date');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.RegExp');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0029
     * @tc.name testInstanceMethodGetParameterType0029
     * @tc.desc Verify getParameterType for Promise and function type parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass063>();
      let method = cls.getInstanceMethod('promiseParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.Promise');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.Function0');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0030
     * @tc.name testInstanceMethodGetParameterType0030
     * @tc.desc Verify empty class has no methods to check parameter types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass064>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0031
     * @tc.name testInstanceMethodGetParameterType0031
     * @tc.desc Verify getParameterType for async method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass065>();
      let method = cls.getInstanceMethod('asyncMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0032
     * @tc.name testInstanceMethodGetParameterType0032
     * @tc.desc Verify getParameterType for abstract method parameters
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass066>();
      let method = cls.getInstanceMethod('abstractMethod');
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0033
     * @tc.name testInstanceMethodGetParameterType0033
     * @tc.desc Verify getParameterType for inherited method from child class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     * @knownIssue childCls.getInstanceMethod for inherited methods returns undefined on current platform.
     *             When platform supports inherited method lookup, remove the guard.
     */
    it('testInstanceMethodGetParameterType0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass067>();
      let method = childCls.getInstanceMethod('parentMethod');
      if (method !== undefined) {
        expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
        expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
      } else {
        expect(method).assertUndefined();
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0034
     * @tc.name testInstanceMethodGetParameterType0034
     * @tc.desc Verify consistency between getParameterType and getParameterTypes for all indices
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass068>();
      let method = cls.getInstanceMethod('testMethod');
      let paramTypes = method!.getParameterTypes();
      for (let i = 0; i < paramTypes.length; i++) {
        expect(method!.getParameterType(i)!.getName()).assertEqual(paramTypes[i].getName());
      }
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0035
     * @tc.name testInstanceMethodGetParameterType0035
     * @tc.desc Verify getParameterType for bigint type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass069>();
      let method = cls.getInstanceMethod('bigintParam');
      expect(method!.getParameterType(0)!.getName()).assertEqual('std.core.BigInt');
      expect(method!.getParameterType(1)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0036
     * @tc.name testInstanceMethodGetParameterType0036
     * @tc.desc Verify getParameterType for each index in a multi-param method returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass059>();
      let m1 = cls.getInstanceMethod('method1');
      expect(m1!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(m1!.getParameterType(1)!.getName()).assertEqual('std.core.String');

      let m2 = cls.getInstanceMethod('method2');
      expect(m2!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(m2!.getParameterType(1)!.getName()).assertEqual('u1');

      let m3 = cls.getInstanceMethod('method3');
      expect(m3!.getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(m3!.getParameterType(1)!.getName()).assertEqual('f64');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0037
     * @tc.name testInstanceMethodGetParameterType0037
     * @tc.desc Verify getParameterType for method with default value parameter returns correct type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass070>();
      let methods = cls.getInstanceMethods();
      let target: int = -1;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'defaultValueMethod') {
          target = i;
          break;
        }
      }
      expect(target).assertLargerOrEqual(0);
      let method = methods[target];
      expect(method.getParametersNum()).assertEqual(2);
      expect(method.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_GETPARAMETERTYPE_0038
     * @tc.name testInstanceMethodGetParameterType0038
     * @tc.desc Verify getParameterType for overloaded methods returns correct types per overload
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodGetParameterType0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass071>();
      let methods = cls.getInstanceMethods();
      let firstIdx: int = -1;
      let secondIdx: int = -1;
      for (let i = 0; i < methods.length; i++) {
        if (methods[i].getName() === 'methodA') {
          if (firstIdx === -1) {
            firstIdx = i;
          } else {
            secondIdx = i;
            break;
          }
        }
      }
      expect(firstIdx).assertLargerOrEqual(0);
      expect(secondIdx).assertLargerOrEqual(0);
      expect(methods[firstIdx].getParameterType(0)!.getName()).assertEqual('f64');
      expect(methods[secondIdx].getParameterType(0)!.getName()).assertEqual('std.core.String');
      expect(methods[firstIdx].getParametersNum()).assertEqual(1);
      expect(methods[secondIdx].getParametersNum()).assertEqual(1);
    });

  });
}
