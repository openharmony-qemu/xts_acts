/*
 * Copyright (c) 2026 SwanLink (Jiangsu) Technology Development Co., LTD.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
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
} from '@ohos/hypium';
import { testMethodDecoratorSymbolComputedMethodKeyInTs } from './MethodDecoratorPartHelper';

class MethodDecoratorTrace {
  public value: string = '';
  public key: string = '';
  public count: number = 0;

  public record(value: string, key: string): void {
    this.value = value;
    this.key = key;
    this.count++;
  }
}

function methodResult(trace: MethodDecoratorTrace, methodValue: string): string {
  return trace.value + ':' + trace.key + ':' + trace.count.toString() + ':' + methodValue;
}

function createMethodDecorator(
  trace: MethodDecoratorTrace,
  value: string
): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    trace.record(value, key);
  };
}

const factoryNoParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryNoParamDecorator(): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryNoParamTrace, 'factoryNoParam');
}
class MethodDecoratorFactoryNoParamCase {
  @factoryNoParamDecorator()
  public readValue(): string {
    return 'factoryNoParamReturn';
  }
}

const factorySingleStringTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factorySingleStringDecorator(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factorySingleStringTrace, value);
}
class MethodDecoratorFactorySingleStringCase {
  @factorySingleStringDecorator('singleString')
  public readValue(): string {
    return 'singleStringReturn';
  }
}

const factorySingleNumberTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factorySingleNumberDecorator(value: number): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factorySingleNumberTrace, value.toString());
}
class MethodDecoratorFactorySingleNumberCase {
  @factorySingleNumberDecorator(2024)
  public readValue(): string {
    return 'singleNumberReturn';
  }
}

const factorySingleBooleanTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factorySingleBooleanDecorator(value: boolean): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factorySingleBooleanTrace, value ? 'true' : 'false');
}
class MethodDecoratorFactorySingleBooleanCase {
  @factorySingleBooleanDecorator(true)
  public readValue(): string {
    return 'singleBooleanReturn';
  }
}

const factoryMultiParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryMultiParamDecorator(
  name: string,
  id: number,
  enable: boolean
): (_target: Object, _key: string, _descriptor: Object) => void {
  const value: string = name + ':' + id.toString() + ':' + (enable ? 'true' : 'false');
  return createMethodDecorator(factoryMultiParamTrace, value);
}
class MethodDecoratorFactoryMultiParamCase {
  @factoryMultiParamDecorator('multiParam', 100, false)
  public readValue(): string {
    return 'multiParamReturn';
  }
}

const factoryArrowParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryArrowParamDecorator(fn: () => string): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryArrowParamTrace, fn());
}
class MethodDecoratorFactoryArrowParamCase {
  @factoryArrowParamDecorator(() => 'arrowParam')
  public readValue(): string {
    return 'arrowParamReturn';
  }
}

const factoryNormalFuncParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function normalFuncSource(): string {
  return 'normalFuncParam';
}
function factoryNormalFuncParamDecorator(fn: () => string): (_target: Object, _key: string, _descriptor: Object)
=> void {
  return createMethodDecorator(factoryNormalFuncParamTrace, fn());
}
class MethodDecoratorFactoryNormalFuncCase {
  @factoryNormalFuncParamDecorator(normalFuncSource)
  public readValue(): string {
    return 'normalFuncReturn';
  }
}

const factoryIIFEParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryIIFEParamDecorator(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryIIFEParamTrace, value);
}
class MethodDecoratorFactoryIIFECase {
  @factoryIIFEParamDecorator(((): string => 'iifeParam')())
  public readValue(): string {
    return 'iifeParamReturn';
  }
}

const factoryImportedBindingTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryImportedBindingDecorator(value: number): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryImportedBindingTrace, value.toString());
}
class MethodDecoratorFactoryImportedBindingCase {
  @factoryImportedBindingDecorator(TestType.FUNCTION)
  public readValue(): string {
    return 'importedBindingReturn';
  }
}

const factoryLocalConstTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
const LOCAL_CONST_VALUE: string = 'localConstParam';
function factoryLocalConstDecorator(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(factoryLocalConstTrace, value);
}
class MethodDecoratorFactoryLocalConstCase {
  @factoryLocalConstDecorator(LOCAL_CONST_VALUE)
  public readValue(): string {
    return 'localConstReturn';
  }
}

const factoryReturnDecoratorTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryReturnDecorator(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    factoryReturnDecoratorTrace.record(value, key);
  };
}
class MethodDecoratorFactoryReturnCase {
  @factoryReturnDecorator('returnDecorator')
  public readValue(): string {
    return 'returnDecoratorReturn';
  }
}

const factoryClosureTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryClosureDecorator(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  const prefix: string = 'closure:';
  return (_target: Object, key: string, _descriptor: Object): void => {
    factoryClosureTrace.record(prefix + value, key);
  };
}
class MethodDecoratorFactoryClosureCase {
  @factoryClosureDecorator('factory')
  public readValue(): string {
    return 'closureReturn';
  }
}

const evalOrderArray: string[] = [];
const factoryEvalOrderTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function evalOrderFactory(tag: string): (_target: Object, _key: string, _descriptor: Object) => void {
  evalOrderArray.push(tag);
  return createMethodDecorator(factoryEvalOrderTrace, tag);
}
class MethodDecoratorEvalOrderCase {
  @evalOrderFactory('first')
  @evalOrderFactory('second')
  public readValue(): string {
    return 'evalOrderReturn';
  }
}

const multiFactoryTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function multiFactoryFirst(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    multiFactoryTrace.record(value, key);
  };
}
function multiFactorySecond(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    multiFactoryTrace.record(value, key);
  };
}
class MethodDecoratorMultiFactoryCase {
  @multiFactoryFirst('factoryFirst')
  @multiFactorySecond('factorySecond')
  public readValue(): string {
    return 'multiFactoryReturn';
  }
}

const transformLoweringTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function transformLoweringFactory(prefix: string): (_target: Object, _key: string, _descriptor: Object) => void {
  const suffix: string = ':lowered';
  return (_target: Object, key: string, _descriptor: Object): void => {
    transformLoweringTrace.record(prefix + suffix, key);
  };
}
class MethodDecoratorTransformLoweringCase {
  @transformLoweringFactory('transform')
  public readValue(): string {
    return 'transformLoweringReturn';
  }
}

const MODULE_SCOPE_VALUE: string = 'moduleScope';
const moduleScopeTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function moduleScopeFactory(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    moduleScopeTrace.record(MODULE_SCOPE_VALUE + ':' + value, key);
  };
}
class MethodDecoratorModuleScopeCase {
  @moduleScopeFactory('factory')
  public readValue(): string {
    return 'moduleScopeReturn';
  }
}

interface IDecoratorContainer {
  methodDecorator: (_target: Object, _key: string, _descriptor: Object) => void;
}
const objectLiteralDecoratorTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
const ObjectLiteralDecorators: IDecoratorContainer = {
  methodDecorator: (_target: Object, key: string, _descriptor: Object): void => {
    objectLiteralDecoratorTrace.record('objectLiteral', key);
  }
};
class MethodDecoratorObjectLiteralCase {
  @ObjectLiteralDecorators.methodDecorator
  public readValue(): string {
    return 'objectLiteralReturn';
  }
}

const importDecoratorFuncTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function importedMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  importDecoratorFuncTrace.record('importedFunc', key);
}
class MethodDecoratorImportFuncCase {
  @importedMethodDecorator
  public readValue(): string {
    return 'importFuncReturn';
  }
}

const importFactoryTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function importedMethodFactory(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(importFactoryTrace, value);
}
class MethodDecoratorImportFactoryCase {
  @importedMethodFactory('importFactory')
  public readValue(): string {
    return 'importFactoryReturn';
  }
}

const importDecoratorParamTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function importParamFactory(value: number): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(importDecoratorParamTrace, value.toString());
}
class MethodDecoratorImportParamCase {
  @importParamFactory(Level.LEVEL2)
  public readValue(): string {
    return 'importParamReturn';
  }
}

const exportClassTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function exportClassDecorator(_target: Object, key: string, _descriptor: Object): void {
  exportClassTrace.record('exportClass', key);
}
export class MethodDecoratorExportClassCase {
  @exportClassDecorator
  public readValue(): string {
    return 'exportClassReturn';
  }
}

const defaultExportTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function defaultExportDecorator(_target: Object, key: string, _descriptor: Object): void {
  defaultExportTrace.record('defaultExport', key);
}
class MethodDecoratorDefaultExportCase {
  @defaultExportDecorator
  public readValue(): string {
    return 'defaultExportReturn';
  }
}

const moduleInitOrder: string[] = [];
function moduleInitOrderDecorator(tag: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, _key: string, _descriptor: Object): void => {
    moduleInitOrder.push(tag);
  };
}
class ModuleInitOrderCase1 {
  @moduleInitOrderDecorator('class1')
  public method1(): void {}
}
class ModuleInitOrderCase2 {
  @moduleInitOrderDecorator('class2')
  public method2(): void {}
}

const loweringImportBindingTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function loweringImportBindingFactory(value: number): (_target: Object, _key: string, _descriptor: Object) => void {
  return createMethodDecorator(loweringImportBindingTrace, value.toString());
}
class MethodDecoratorLoweringImportCase {
  @loweringImportBindingFactory(Size.MEDIUMTEST)
  public readValue(): string {
    return 'loweringImportReturn';
  }
}

let moduleVar: string = 'moduleVarValue';
const moduleVarTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function moduleVarDecorator(_target: Object, key: string, _descriptor: Object): void {
  moduleVarTrace.record(moduleVar, key);
}
class MethodDecoratorModuleVarCase {
  @moduleVarDecorator
  public readValue(): string {
    return 'moduleVarReturn';
  }
}

const importedFactoryReturnTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function importedFactoryReturn(value: string): (_target: Object, _key: string, _descriptor: Object) => void {
  return (_target: Object, key: string, _descriptor: Object): void => {
    importedFactoryReturnTrace.record(value, key);
  };
}
class MethodDecoratorImportedFactoryReturnCase {
  @importedFactoryReturn('importedFactory')
  public readValue(): string {
    return 'importedFactoryReturn';
  }
}

const importedDecoratorLocalBodyTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function importedDecoratorForLocalBody(_target: Object, key: string, _descriptor: Object): void {
  importedDecoratorLocalBodyTrace.record('importedLocal', key);
}
class MethodDecoratorImportedLocalBodyCase {
  @importedDecoratorForLocalBody
  public readValue(): string {
    const localStr: string = 'localBody';
    return localStr + 'Return';
  }
}

interface LocalClassInterface {
  readValue(): string;
}
const localFunctionDecoratorTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function localFunctionDecorator(_target: Object, key: string, _descriptor: Object): void {
  localFunctionDecoratorTrace.record('localFunction', key);
}
function createLocalClass(): LocalClassInterface {
  class LocalFunctionCase {
    @localFunctionDecorator
    public readValue(): string {
      return 'localFuncReturn';
    }
  }
  return new LocalFunctionCase();
}

const objLiteralMethodTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function objectLiteralMethodDecorator(_target: Object, key: string, _descriptor: Object): void {
  objLiteralMethodTrace.record('objLiteralMethod', key);
}
class ObjLiteralMethodDecoratorCase {
  @objectLiteralMethodDecorator
  public readValue(): string {
    return 'objLiteralMethodReturn';
  }
}

const factoryNullableArgTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function factoryNullableArgDecorator(value: Object | null): (_target: Object, _key: string, _descriptor: Object)
=> void {
  return createMethodDecorator(factoryNullableArgTrace, String(value));
}
class MethodDecoratorFactoryNullableArgCase {
  @factoryNullableArgDecorator(null)
  public readValue(): string {
    return 'factoryNullableArgReturn';
  }
}

const plainIdentifierTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function plainIdentifierDecorator(_target: Object, key: string, _descriptor: Object): void {
  plainIdentifierTrace.record('plainIdentifier', key);
}
class MethodDecoratorPlainIdentifierCase {
  @plainIdentifierDecorator
  public readValue(): string {
    return 'plainIdentifierReturn';
  }
}

const targetConstructorNameTrace: MethodDecoratorTrace = new MethodDecoratorTrace();
function targetConstructorNameDecorator(_target: Object, key: string, _descriptor: Object): void {
  const targetType: string = _target.constructor.name;
  targetConstructorNameTrace.record('targetConstructorName:' + targetType, key);
}
class MethodDecoratorTargetConstructorNameCase {
  @targetConstructorNameDecorator
  public readValue(): string {
    return 'targetConstructorNameReturn';
  }
}

export default function MethodDecoratorPart03Test(): void {
  describe('MethodDecoratorPart03Test', () => {
    beforeAll(() => {});
    beforeEach(async () => {});
    afterEach(() => {});
    afterAll(() => {});

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4200
     * @tc.name      testClassMethodDecoratorFactoryNoParam0001
     * @tc.desc      Verify method decorator factory can be called without arguments.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryNoParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryNoParamCase = new MethodDecoratorFactoryNoParamCase();
      expect(methodResult(factoryNoParamTrace, obj.readValue()))
        .assertEqual('factoryNoParam:readValue:1:factoryNoParamReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4300
     * @tc.name      testClassMethodDecoratorFactorySingleString0001
     * @tc.desc      Verify method decorator factory can receive a single string parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactorySingleString0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactorySingleStringCase = new MethodDecoratorFactorySingleStringCase();
      expect(methodResult(factorySingleStringTrace, obj.readValue()))
        .assertEqual('singleString:readValue:1:singleStringReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4400
     * @tc.name      testClassMethodDecoratorFactorySingleNumber0001
     * @tc.desc      Verify method decorator factory can receive a single number parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactorySingleNumber0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactorySingleNumberCase = new MethodDecoratorFactorySingleNumberCase();
      expect(methodResult(factorySingleNumberTrace, obj.readValue()))
        .assertEqual('2024:readValue:1:singleNumberReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4500
     * @tc.name      testClassMethodDecoratorFactorySingleBoolean0001
     * @tc.desc      Verify method decorator factory can receive a single boolean parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactorySingleBoolean0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactorySingleBooleanCase = new MethodDecoratorFactorySingleBooleanCase();
      expect(methodResult(factorySingleBooleanTrace, obj.readValue()))
        .assertEqual('true:readValue:1:singleBooleanReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4600
     * @tc.name      testClassMethodDecoratorFactoryMultiParam0001
     * @tc.desc      Verify method decorator factory can receive multiple parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryMultiParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryMultiParamCase = new MethodDecoratorFactoryMultiParamCase();
      const result: string = methodResult(
        factoryMultiParamTrace,
        obj.readValue()
      );
      expect(result).assertEqual('multiParam:100:false:readValue:1:multiParamReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4700
     * @tc.name      testClassMethodDecoratorFactoryArrowParam0001
     * @tc.desc      Verify method decorator factory can receive an arrow function parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryArrowParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryArrowParamCase = new MethodDecoratorFactoryArrowParamCase();
      expect(methodResult(factoryArrowParamTrace, obj.readValue()))
        .assertEqual('arrowParam:readValue:1:arrowParamReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4800
     * @tc.name      testClassMethodDecoratorFactoryNormalFunc0001
     * @tc.desc      Verify method decorator factory can receive a normal function parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryNormalFunc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryNormalFuncCase = new MethodDecoratorFactoryNormalFuncCase();
      expect(methodResult(factoryNormalFuncParamTrace, obj.readValue()))
        .assertEqual('normalFuncParam:readValue:1:normalFuncReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_4900
     * @tc.name      testClassMethodDecoratorFactoryIIFE0001
     * @tc.desc      Verify method decorator factory can receive an IIFE parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryIIFE0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryIIFECase = new MethodDecoratorFactoryIIFECase();
      expect(methodResult(factoryIIFEParamTrace, obj.readValue())).assertEqual('iifeParam:readValue:1:iifeParamReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5000
     * @tc.name      testClassMethodDecoratorFactoryImportedBinding0001
     * @tc.desc      Verify method decorator factory can receive an imported binding parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryImportedBinding0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryImportedBindingCase = new MethodDecoratorFactoryImportedBindingCase();
      const expectedValue: string = TestType.FUNCTION.toString();
      expect(methodResult(factoryImportedBindingTrace, obj.readValue()))
        .assertEqual(expectedValue + ':readValue:1:importedBindingReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5100
     * @tc.name      testClassMethodDecoratorFactoryLocalConst0001
     * @tc.desc      Verify method decorator factory can receive a local const parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryLocalConst0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryLocalConstCase = new MethodDecoratorFactoryLocalConstCase();
      expect(methodResult(factoryLocalConstTrace, obj.readValue()))
        .assertEqual('localConstParam:readValue:1:localConstReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5200
     * @tc.name      testClassMethodDecoratorFactoryReturn0001
     * @tc.desc      Verify method decorator factory returns a method decorator function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryReturnCase = new MethodDecoratorFactoryReturnCase();
      expect(methodResult(factoryReturnDecoratorTrace, obj.readValue()))
        .assertEqual('returnDecorator:readValue:1:returnDecoratorReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5300
     * @tc.name      testClassMethodDecoratorFactoryClosure0001
     * @tc.desc      Verify method decorator factory returns a closure method decorator function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryClosure0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryClosureCase = new MethodDecoratorFactoryClosureCase();
      expect(methodResult(factoryClosureTrace, obj.readValue()))
        .assertEqual('closure:factory:readValue:1:closureReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5400
     * @tc.name      testClassMethodDecoratorEvalOrder0001
     * @tc.desc      Verify method decorator factory evaluation order.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorEvalOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      expect(evalOrderArray[0]).assertEqual('first');
      expect(evalOrderArray[1]).assertEqual('second');
      const obj: MethodDecoratorEvalOrderCase = new MethodDecoratorEvalOrderCase();
      expect(methodResult(factoryEvalOrderTrace, obj.readValue())).assertEqual('first:readValue:2:evalOrderReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5500
     * @tc.name      testClassMethodDecoratorMultiFactory0001
     * @tc.desc      Verify factory with multiple method decorators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorMultiFactory0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorMultiFactoryCase = new MethodDecoratorMultiFactoryCase();
      expect(methodResult(multiFactoryTrace, obj
        .readValue())).assertEqual('factoryFirst:readValue:2:multiFactoryReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5600
     * @tc.name      testClassMethodDecoratorTransformLowering0001
     * @tc.desc      Verify factory with transform lowering.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorTransformLowering0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorTransformLoweringCase = new MethodDecoratorTransformLoweringCase();
      expect(methodResult(transformLoweringTrace, obj.readValue()))
        .assertEqual('transform:lowered:readValue:1:transformLoweringReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5700
     * @tc.name      testClassMethodDecoratorModuleScope0001
     * @tc.desc      Verify factory with module scope.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorModuleScope0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorModuleScopeCase = new MethodDecoratorModuleScopeCase();
      expect(methodResult(moduleScopeTrace, obj.readValue()))
        .assertEqual('moduleScope:factory:readValue:1:moduleScopeReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5800
     * @tc.name      testClassMethodDecoratorObjectLiteral0001
     * @tc.desc      Verify method decorator can be applied to class method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorObjectLiteral0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorObjectLiteralCase = new MethodDecoratorObjectLiteralCase();
      expect(methodResult(objectLiteralDecoratorTrace, obj.readValue()))
        .assertEqual('objectLiteral:readValue:1:objectLiteralReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_5900
     * @tc.name      testClassMethodDecoratorImportFunc0001
     * @tc.desc      Verify imported method decorator function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImportFunc0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImportFuncCase = new MethodDecoratorImportFuncCase();
      expect(methodResult(importDecoratorFuncTrace, obj.readValue()))
        .assertEqual('importedFunc:readValue:1:importFuncReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6000
     * @tc.name      testClassMethodDecoratorImportFactory0001
     * @tc.desc      Verify imported method decorator factory.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImportFactory0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImportFactoryCase = new MethodDecoratorImportFactoryCase();
      expect(methodResult(importFactoryTrace, obj.readValue()))
        .assertEqual('importFactory:readValue:1:importFactoryReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6100
     * @tc.name      testClassMethodDecoratorImportParam0001
     * @tc.desc      Verify imported decorator with parameters.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImportParam0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImportParamCase = new MethodDecoratorImportParamCase();
      const expectedValue: string = Level.LEVEL2.toString();
      expect(methodResult(importDecoratorParamTrace, obj.readValue()))
        .assertEqual(expectedValue + ':readValue:1:importParamReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6200
     * @tc.name      testClassMethodDecoratorExportClass0001
     * @tc.desc      Verify exported class with method decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorExportClass0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorExportClassCase = new MethodDecoratorExportClassCase();
      expect(methodResult(exportClassTrace, obj.readValue())).assertEqual('exportClass:readValue:1:exportClassReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6300
     * @tc.name      testClassMethodDecoratorDefaultExport0001
     * @tc.desc      Verify default exported class with method decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorDefaultExport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorDefaultExportCase = new MethodDecoratorDefaultExportCase();
      expect(methodResult(defaultExportTrace, obj.readValue()))
        .assertEqual('defaultExport:readValue:1:defaultExportReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6400
     * @tc.name      testClassMethodDecoratorModuleInitOrder0001
     * @tc.desc      Verify module initialization order with decorators.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorModuleInitOrder0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      new ModuleInitOrderCase1();
      new ModuleInitOrderCase2();
      expect(moduleInitOrder[0]).assertEqual('class1');
      expect(moduleInitOrder[1]).assertEqual('class2');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6500
     * @tc.name      testClassMethodDecoratorLoweringImport0001
     * @tc.desc      Verify decorator lowering with imported binding.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorLoweringImport0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorLoweringImportCase = new MethodDecoratorLoweringImportCase();
      const expectedValue: string = Size.MEDIUMTEST.toString();
      expect(methodResult(loweringImportBindingTrace, obj.readValue()))
        .assertEqual(expectedValue + ':readValue:1:loweringImportReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6600
     * @tc.name      testClassMethodDecoratorModuleVar0001
     * @tc.desc      Verify method decorator with module variable.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorModuleVar0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorModuleVarCase = new MethodDecoratorModuleVarCase();
      expect(methodResult(moduleVarTrace, obj.readValue())).assertEqual('moduleVarValue:readValue:1:moduleVarReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6700
     * @tc.name      testClassMethodDecoratorImportedFactoryReturn0001
     * @tc.desc      Verify imported factory returns method decorator.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImportedFactoryReturn0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImportedFactoryReturnCase = new MethodDecoratorImportedFactoryReturnCase();
      expect(methodResult(importedFactoryReturnTrace, obj.readValue()))
        .assertEqual('importedFactory:readValue:1:importedFactoryReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6800
     * @tc.name      testClassMethodDecoratorImportedLocalBody0001
     * @tc.desc      Verify imported decorator with local method body.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorImportedLocalBody0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorImportedLocalBodyCase = new MethodDecoratorImportedLocalBodyCase();
      expect(methodResult(importedDecoratorLocalBodyTrace, obj.readValue()))
        .assertEqual('importedLocal:readValue:1:localBodyReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_6900
     * @tc.name      testClassMethodDecoratorLocalFunction0001
     * @tc.desc      Verify decorator applied to local function.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorLocalFunction0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: LocalClassInterface = createLocalClass();
      expect(methodResult(localFunctionDecoratorTrace, obj.readValue()))
        .assertEqual('localFunction:readValue:1:localFuncReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_7000
     * @tc.name      testClassMethodDecoratorObjLiteralMethod0001
     * @tc.desc      Verify decorator applied to object literal method.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorObjLiteralMethod0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: ObjLiteralMethodDecoratorCase = new ObjLiteralMethodDecoratorCase();
      expect(methodResult(objLiteralMethodTrace, obj.readValue()))
        .assertEqual('objLiteralMethod:readValue:1:objLiteralMethodReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_7100
     * @tc.name      testClassMethodDecoratorFactoryNullableArg0001
     * @tc.desc      Verify method decorator factory can receive a null (nullable) factory argument.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorFactoryNullableArg0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorFactoryNullableArgCase = new MethodDecoratorFactoryNullableArgCase();
      expect(methodResult(factoryNullableArgTrace, obj.readValue()))
        .assertEqual('null:readValue:1:factoryNullableArgReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_7200
     * @tc.name      testClassMethodDecoratorPlainIdentifier0001
     * @tc.desc      Verify method decorator can be applied by a plain identifier without factory parentheses.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorPlainIdentifier0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorPlainIdentifierCase = new MethodDecoratorPlainIdentifierCase();
      expect(methodResult(plainIdentifierTrace, obj.readValue()))
        .assertEqual('plainIdentifier:readValue:1:plainIdentifierReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_7300
     * @tc.name      testClassMethodDecoratorTargetConstructorName0001
     * @tc.desc      Verify method decorator receives the class prototype as target and can read its constructor name.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorTargetConstructorName0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, () => {
      const obj: MethodDecoratorTargetConstructorNameCase = new MethodDecoratorTargetConstructorNameCase();
      expect(methodResult(targetConstructorNameTrace, obj.readValue()))
        .assertEqual('targetConstructorName:MethodDecoratorTargetConstructorNameCase:'
          + 'readValue:1:targetConstructorNameReturn');
    });

    /**
     * @tc.number    SUB_DECORATOR_METHOD_PASS_7400
     * @tc.name      testClassMethodDecoratorSymbolComputedMethodKey0001
     * @tc.desc      Verify decorator with Symbol computed method key through TypeScript helper.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 2
     */
    it('testClassMethodDecoratorSymbolComputedMethodKey0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      () => {
        expect(testMethodDecoratorSymbolComputedMethodKeyInTs())
          .assertEqual('symbolComputedKey:Symbol(testMethod):1:symbolComputedKeyReturn');
      }
    );
  });
}
