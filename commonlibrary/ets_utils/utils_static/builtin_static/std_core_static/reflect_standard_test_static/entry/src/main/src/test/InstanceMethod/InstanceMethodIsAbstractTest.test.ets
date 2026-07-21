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

class MyClass005 {
  public normalMethod(): void {
  }

  public anotherNormal(): string {
    return 'test';
  }
}

abstract class MyClass007 {
  protected abstract protectedAbstractMethod(): void;
}

abstract class AbstractClass011 {
  public abstract abstractMethod(): void;

  public concreteMethod(): void {
  }
}

abstract class AbstractClass012 {
  public abstract abstractMethod(): void;
}

class ConcreteClass012 extends AbstractClass012 {
  public override abstractMethod(): void {
  }
}

abstract class ParentClass013 {
  public abstract parentAbstractMethod(): void;
}

abstract class ChildClass013 extends ParentClass013 {
  public abstract childAbstractMethod(): void;
}

abstract class MyClass014 {
  public abstract abstractVoid(): void;

  public abstract abstractNumber(): number;

  public abstract abstractString(): string;

  public abstract abstractBoolean(): boolean;

  public abstract abstractObject(): object;
}

abstract class MyClass015 {
  public abstract abstractMethod(): void;

  public concreteMethod(): void {
  }
}

abstract class AbstractClass017 {
  public abstract abstractMethod(): void;
}

class ConcreteClass017 {
  public concreteMethod(): void {
  }
}

abstract class MyClass022 {
  public abstract publicAbstract(): void;

  protected abstract protectedAbstract(): void;
}

abstract class MyClass024 {
  public abstract abstractAsyncMethod(): Promise<void>;
}

class ConcreteClass026 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }
}

interface MyInterface027 {
  abstractMethod(): void;
}

class MyClass027 implements MyInterface027 {
  public abstractMethod(): void {
  }
}

abstract class AbstractClass030 {
  public abstract abstractWithParams(a: number, b: string): void;
}

abstract class AbstractClass031 {
  public abstract abstractReturnNumber(): number;

  public abstract abstractReturnString(): string;

  public abstract abstractReturnBoolean(): boolean;
}

abstract class GrandAbstract032 {
  public abstract grandMethod(): void;
}

abstract class MidAbstract032 extends GrandAbstract032 {
  public abstract midMethod(): void;
}

class ConcreteClass032 extends MidAbstract032 {
  public override grandMethod(): void {
  }

  public override midMethod(): void {
  }
}

class EmptyClass033 {
}

class ConcreteClass034 {
  public method1(): void {
  }

  public method2(): string {
    return 'test';
  }

  public method3(a: number): boolean {
    return true;
  }
}

abstract class AbstractClass035 {
  public abstract abstractWithCustomParam(): void;

  public concreteMethod(): void {
  }

  public anotherConcrete(): string {
    return 'concrete';
  }
}

abstract class AbstractClass036 {
  public abstract asyncAbstractMethod(): Promise<string>;
}

class MyClass037 {
  public normalMethod(a: number, b: string): void {
  }
}

abstract class AbstractClass038 {
  public abstract abstractMultiParam(a: number, b: string, c: boolean): string;
}

abstract class AbstractClass040 {
  public abstract genericMethod<T>(): void;
}

abstract class AbstractClass041 {
  public abstract methodWithOptional(a: number, b?: string): void;
}

abstract class AbstractClass042 {
  public abstract methodWithDefault(a: number, b: string = 'default'): void;
}

abstract class AbstractClass043 {
  public abstract methodWithRest(...args: string[]): void;
}

class CustomType044 {
  public id: number = 0;
}

abstract class AbstractClass044 {
  public abstract returnCustom(): CustomType044;
}

abstract class AbstractClass045 {
  public abstract returnArray(): number[];
}

abstract class AbstractClass046 {
  public abstract returnMap(): Map<string, number>;
}

abstract class AbstractClass047 {
  public abstract returnSet(): Set<string>;
}

abstract class AbstractClass048 {
  public abstract returnBigint(): bigint;
}

abstract class AbstractClass049 {
  public abstract returnNever(): never;
}

abstract class Level1Abs050 {
  public abstract level1Method(): void;
}

abstract class Level2Abs050 extends Level1Abs050 {
  public abstract level2Method(): void;
}

abstract class Level3Abs050 extends Level2Abs050 {
  public abstract level3Method(): void;
}

abstract class AbstractClass051 {
  public abstract firstMethod(): void;

  public abstract secondMethod(): void;

  public abstract thirdMethod(): void;
}

interface MyInterface052 {
  requiredMethod(): void;
}

abstract class AbstractClass052 implements MyInterface052 {
  public abstract requiredMethod(): void;
}

abstract class AbstractBase053 {
  public abstract baseAbsMethod(): void;
}

abstract class PartialAbstract053 extends AbstractBase053 {
  public abstract ownAbstractMethod(): void;
}

abstract class AbstractClass054 {
  public abstract targetMethod(): void;
}

abstract class AbstractClass055 {
  public abstract manyParamMethod(a: number, b: string, c: boolean, d: number, e: string): void;
}

abstract class AbstractGetter056 {
  public abstract abstractMethod(): void;

  public get concreteGetter(): number {
    return 42;
  }
}

abstract class EmptyAbstract057 {
}

export default function InstanceMethodIsAbstractTest(): void {
  describe('InstanceMethodIsAbstractTest', (): void => {
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
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0001
     * @tc.name testInstanceMethodIsAbstract0001
     * @tc.desc Verify non-abstract method returns false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass005>();
      let normalMethod = cls.getInstanceMethod('normalMethod');
      expect(normalMethod!.isAbstract()).assertEqual(false);
      let anotherNormal = cls.getInstanceMethod('anotherNormal');
      expect(anotherNormal!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0002
     * @tc.name testInstanceMethodIsAbstract0002
     * @tc.desc Verify protected abstract method lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass007>();
      let method = cls.getInstanceMethod('protectedAbstractMethod');
      expect(method).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0003
     * @tc.name testInstanceMethodIsAbstract0003
     * @tc.desc Verify abstract method in abstract class
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass011>();
      let absMethod = absCls.getInstanceMethod('abstractMethod');
      expect(absMethod!.isAbstract()).assertEqual(true);
      let concMethod = absCls.getInstanceMethod('concreteMethod');
      expect(concMethod!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0004
     * @tc.name testInstanceMethodIsAbstract0004
     * @tc.desc Verify subclass implemented abstract method is not abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let concCls = Class.from<ConcreteClass012>();
      let method = concCls.getInstanceMethod('abstractMethod');
      expect(method!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0005
     * @tc.name testInstanceMethodIsAbstract0005
     * @tc.desc Verify subclass can also be abstract and define abstract methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let childCls = Class.from<ChildClass013>();
      let childAbs = childCls.getInstanceMethod('childAbstractMethod');
      expect(childAbs!.isAbstract()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0006
     * @tc.name testInstanceMethodIsAbstract0006
     * @tc.desc Verify abstract methods with different return types
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass014>();
      let absVoid = cls.getInstanceMethod('abstractVoid');
      expect(absVoid!.isAbstract()).assertEqual(true);
      let absNum = cls.getInstanceMethod('abstractNumber');
      expect(absNum!.isAbstract()).assertEqual(true);
      let absStr = cls.getInstanceMethod('abstractString');
      expect(absStr!.isAbstract()).assertEqual(true);
      let absBool = cls.getInstanceMethod('abstractBoolean');
      expect(absBool!.isAbstract()).assertEqual(true);
      let absObj = cls.getInstanceMethod('abstractObject');
      expect(absObj!.isAbstract()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0007
     * @tc.name testInstanceMethodIsAbstract0007
     * @tc.desc Verify identifying abstract methods using isAbstract()
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass015>();
      let abstractMethodCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isAbstract()) {
          abstractMethodCount++;
        }
      });
      expect(abstractMethodCount).assertEqual(1);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0008
     * @tc.name testInstanceMethodIsAbstract0008
     * @tc.desc Verify checking if class is abstract by inspecting methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let absCls = Class.from<AbstractClass017>();
      let hasAbstract = Array.from(absCls.getInstanceMethods()).some((method: reflect.InstanceMethod): boolean => {
        return method.isAbstract();
      });
      expect(hasAbstract).assertEqual(true);
      let concCls = Class.from<ConcreteClass017>();
      hasAbstract = Array.from(concCls.getInstanceMethods()).some((method: reflect.InstanceMethod): boolean => {
        return method.isAbstract();
      });
      expect(hasAbstract).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0009
     * @tc.name testInstanceMethodIsAbstract0009
     * @tc.desc Verify public abstract is exposed and protected abstract lookup returns undefined
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass022>();
      let pubAbs = cls.getInstanceMethod('publicAbstract');
      expect(pubAbs!.isAbstract()).assertEqual(true);
      expect(pubAbs!.isPublic()).assertEqual(true);
      let protAbs = cls.getInstanceMethod('protectedAbstract');
      expect(protAbs).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0010
     * @tc.name testInstanceMethodIsAbstract0010
     * @tc.desc Verify abstract method returning Promise has isAbstract true and isAsync false
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass024>();
      let method = cls.getInstanceMethod('abstractAsyncMethod');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0011
     * @tc.name testInstanceMethodIsAbstract0011
     * @tc.desc Verify all methods in concrete class return false for isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass026>();
      expect(cls.getInstanceMethods().length).assertEqual(2);
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isAbstract()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0012
     * @tc.name testInstanceMethodIsAbstract0012
     * @tc.desc Verify interface method implemented in class is not abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass027>();
      let method = cls.getInstanceMethod('abstractMethod');
      expect(method!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0013
     * @tc.name testInstanceMethodIsAbstract0013
     * @tc.desc Verify abstract method with parameters returns true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass030>();
      let method = cls.getInstanceMethod('abstractWithParams');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0014
     * @tc.name testInstanceMethodIsAbstract0014
     * @tc.desc Verify abstract methods with different return types all return true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass031>();
      expect(cls.getInstanceMethod('abstractReturnNumber')!.isAbstract()).assertEqual(true);
      expect(cls.getInstanceMethod('abstractReturnString')!.isAbstract()).assertEqual(true);
      expect(cls.getInstanceMethod('abstractReturnBoolean')!.isAbstract()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0015
     * @tc.name testInstanceMethodIsAbstract0015
     * @tc.desc Verify multi-level abstract class chain - concrete class implements all abstract methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass032>();
      expect(cls.getInstanceMethod('grandMethod')!.isAbstract()).assertEqual(false);
      expect(cls.getInstanceMethod('midMethod')!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0016
     * @tc.name testInstanceMethodIsAbstract0016
     * @tc.desc Verify empty class has no methods to check isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyClass033>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0017
     * @tc.name testInstanceMethodIsAbstract0017
     * @tc.desc Verify all methods in concrete class return false for isAbstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<ConcreteClass034>();
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        expect(method.isAbstract()).assertEqual(false);
      });
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0018
     * @tc.name testInstanceMethodIsAbstract0018
     * @tc.desc Verify abstract class with mix of abstract and concrete methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass035>();
      expect(cls.getInstanceMethod('abstractWithCustomParam')!.isAbstract()).assertEqual(true);
      expect(cls.getInstanceMethod('concreteMethod')!.isAbstract()).assertEqual(false);
      expect(cls.getInstanceMethod('anotherConcrete')!.isAbstract()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0019
     * @tc.name testInstanceMethodIsAbstract0019
     * @tc.desc Verify abstract method returning Promise has isAbstract true
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass036>();
      let method = cls.getInstanceMethod('asyncAbstractMethod');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isAsync()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0020
     * @tc.name testInstanceMethodIsAbstract0020
     * @tc.desc Verify normal method with parameters is not abstract
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<MyClass037>();
      let method = cls.getInstanceMethod('normalMethod');
      expect(method!.isAbstract()).assertEqual(false);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0021
     * @tc.name testInstanceMethodIsAbstract0021
     * @tc.desc Verify isAbstract combined with isPublic for abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass030>();
      let method = cls.getInstanceMethod('abstractWithParams');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.isFinal()).assertEqual(false);
      expect(method!.isNative()).assertEqual(false);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0022
     * @tc.name testInstanceMethodIsAbstract0022
     * @tc.desc Verify abstract method with multiple parameters and string return type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass038>();
      let method = cls.getInstanceMethod('abstractMultiParam');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(3);
      expect(method!.getReturnType().getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0023
     * @tc.name testInstanceMethodIsAbstract0023
     * @tc.desc Verify abstract method with generic type parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass040>();
      let method = cls.getInstanceMethod('genericMethod');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getName()).assertEqual('genericMethod');
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0024
     * @tc.name testInstanceMethodIsAbstract0024
     * @tc.desc Verify abstract method with optional parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass041>();
      let method = cls.getInstanceMethod('methodWithOptional');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0025
     * @tc.name testInstanceMethodIsAbstract0025
     * @tc.desc Verify abstract method with default value parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass042>();
      let method = cls.getInstanceMethod('methodWithDefault');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(2);
      expect(method!.getParameterType(0)!.getName()).assertEqual('f64');
      expect(method!.getParameterType(1)!.getName()).assertEqual('std.core.String');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0026
     * @tc.name testInstanceMethodIsAbstract0026
     * @tc.desc Verify abstract method with rest parameter
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass043>();
      let method = cls.getInstanceMethod('methodWithRest');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0027
     * @tc.name testInstanceMethodIsAbstract0027
     * @tc.desc Verify abstract method returning custom class type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass044>();
      let method = cls.getInstanceMethod('returnCustom');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0028
     * @tc.name testInstanceMethodIsAbstract0028
     * @tc.desc Verify abstract method returning array type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass045>();
      let method = cls.getInstanceMethod('returnArray');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Array');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0029
     * @tc.name testInstanceMethodIsAbstract0029
     * @tc.desc Verify abstract method returning Map type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass046>();
      let method = cls.getInstanceMethod('returnMap');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Map');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0030
     * @tc.name testInstanceMethodIsAbstract0030
     * @tc.desc Verify abstract method returning Set type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass047>();
      let method = cls.getInstanceMethod('returnSet');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Set');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0031
     * @tc.name testInstanceMethodIsAbstract0031
     * @tc.desc Verify abstract method returning bigint type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass048>();
      let method = cls.getInstanceMethod('returnBigint');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.BigInt');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0032
     * @tc.name testInstanceMethodIsAbstract0032
     * @tc.desc Verify abstract method returning never type
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass049>();
      let method = cls.getInstanceMethod('returnNever');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Object');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0033
     * @tc.name testInstanceMethodIsAbstract0033
     * @tc.desc Verify deeply nested abstract inheritance chain (3 levels)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<Level3Abs050>();
      let method = cls.getInstanceMethod('level3Method');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getName()).assertEqual('level3Method');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0034
     * @tc.name testInstanceMethodIsAbstract0034
     * @tc.desc Verify isAbstract combined with getName consistency across multiple methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass051>();
      let first = cls.getInstanceMethod('firstMethod');
      expect(first!.isAbstract()).assertEqual(true);
      expect(first!.getName()).assertEqual('firstMethod');
      let second = cls.getInstanceMethod('secondMethod');
      expect(second!.isAbstract()).assertEqual(true);
      expect(second!.getName()).assertEqual('secondMethod');
      let third = cls.getInstanceMethod('thirdMethod');
      expect(third!.isAbstract()).assertEqual(true);
      expect(third!.getName()).assertEqual('thirdMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0035
     * @tc.name testInstanceMethodIsAbstract0035
     * @tc.desc Verify isAbstract combined with getReturnType and getParametersNum
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass046>();
      let method = cls.getInstanceMethod('returnMap');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.isPublic()).assertEqual(true);
      expect(method!.getReturnType().getName()).assertEqual('std.core.Map');
      expect(method!.getParametersNum()).assertEqual(0);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0036
     * @tc.name testInstanceMethodIsAbstract0036
     * @tc.desc Verify multiple abstract methods in one class are all counted
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass051>();
      let abstractCount: number = 0;
      Array.from(cls.getInstanceMethods()).forEach((method: reflect.InstanceMethod): void => {
        if (method.isAbstract()) {
          abstractCount++;
        }
      });
      expect(abstractCount).assertEqual(3);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0037
     * @tc.name testInstanceMethodIsAbstract0037
     * @tc.desc Verify abstract class implementing interface with abstract method
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass052>();
      let method = cls.getInstanceMethod('requiredMethod');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getName()).assertEqual('requiredMethod');
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0038
     * @tc.name testInstanceMethodIsAbstract0038
     * @tc.desc Verify partial abstract subclass not implementing all inherited abstract methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<PartialAbstract053>();
      let own = cls.getInstanceMethod('ownAbstractMethod');
      expect(own!.isAbstract()).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0039
     * @tc.name testInstanceMethodIsAbstract0039
     * @tc.desc Verify abstract method equality - two lookups of same method are equal
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass054>();
      let method1 = cls.getInstanceMethod('targetMethod');
      let method2 = cls.getInstanceMethod('targetMethod');
      expect(method1!.isAbstract()).assertEqual(true);
      expect(method2!.isAbstract()).assertEqual(true);
      expect(method1!.equals(method2!)).assertEqual(true);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0040
     * @tc.name testInstanceMethodIsAbstract0040
     * @tc.desc Verify abstract method with many parameters (5+)
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractClass055>();
      let method = cls.getInstanceMethod('manyParamMethod');
      expect(method!.isAbstract()).assertEqual(true);
      expect(method!.getParametersNum()).assertEqual(5);
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0041
     * @tc.name testInstanceMethodIsAbstract0041
     * @tc.desc Verify that a getter is not retrievable by its bare property name via getInstanceMethod
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<AbstractGetter056>();
      let absMethod = cls.getInstanceMethod('abstractMethod');
      expect(absMethod!.isAbstract()).assertEqual(true);
      let getter = cls.getInstanceMethod('concreteGetter');
      expect(getter).assertUndefined();
    });

    /**
     * @tc.number SUB_COMMONLIBRARY_UTIL_INSTANCEMETHOD_ISABSTRACT_0042
     * @tc.name testInstanceMethodIsAbstract0042
     * @tc.desc Verify empty abstract class has zero instance methods
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level LEVEL2
     */
    it('testInstanceMethodIsAbstract0042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
      let cls = Class.from<EmptyAbstract057>();
      let methods = cls.getInstanceMethods();
      expect(methods.length).assertEqual(0);
    });
  });
}
