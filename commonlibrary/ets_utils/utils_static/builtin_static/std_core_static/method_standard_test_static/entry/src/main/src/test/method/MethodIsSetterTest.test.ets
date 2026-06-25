'use static'
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class IsSetterNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsSetterSetterSample {
    private _value: int = 0;
    set setValue(v: int) {
        this._value = v;
    }
}

class IsSetterGetterSample {
    private _value: int = 0;
    get getValue(): int {
        return this._value;
    }
}

class IsSetterPrivateSetterSample {
    private _value: int = 0;
    private set privateSetter(v: int) {
        this._value = v;
    }
}

class IsSetterGetterAndSetterSample {
    private _name: string = "";
    get name(): string {
        return this._name;
    }
    set name(value: string) {
        this._name = value;
    }
    normalMethod(): void {}
}

class IsSetterClassA {
    private _a: int = 0;
    set propA(v: int) {
        this._a = v;
    }
}

class IsSetterClassB {
    private _b: string = "";
    set propB(v: string) {
        this._b = v;
    }
}

class IsSetterCtorHelper {
  constructor() {}
  regularMethod(): void {}
}

class IsSetterStaticClass {
  private static _staticProp: int = 0;
  public static set staticProp(v: int) {
    IsSetterStaticClass._staticProp = v;
  }
}

class IsSetterAsyncClass {
  async asyncMethod(): Promise<void> {}
}

class IsSetterFinalClass {
  private _finalVal: int = 0;
  final set finalProp(v: int) {
    this._finalVal = v;
  }
}

class IsSetterNativeClass {
  native doNative(): void;
}

abstract class IsSetterAbstractClass {
  abstract doAbstract(): void;
}

class IsSetterParent {
  private _parentVal: string = "";
  set parentVal(v: string) {
    this._parentVal = v;
  }
}

class IsSetterChild extends IsSetterParent {}

class IsSetterMixedClass {
  private _instVal: int = 0;
  private static _statVal: int = 0;
  get instVal(): int {
    return this._instVal;
  }
  set instVal(v: int) {
    this._instVal = v;
  }
  static get staticVal(): int {
    return IsSetterMixedClass._statVal;
  }
  static set staticVal(v: int) {
    IsSetterMixedClass._statVal = v;
  }
  plainMethod(): void {}
}

class IsSetterOverloadSample {
  method(value: int): void {}
  method(value: int, text: string): void {}
}

class IsSetterVariousTypesSample {
  private _value: int = 0;
  private _flag: boolean = false;
  private _obj: Object = new Object();

  set value(v: int) {
    this._value = v;
  }

  set flag(v: boolean) {
    this._flag = v;
  }

  set obj(v: Object) {
    this._obj = v;
  }

  set none(v: void) {
  }
}

class IsSetterAccessSample {
  private _secret: string = "";
  protected _helper: string = "";
  private _open: string = "";

  protected set helper(v: string) {
    this._helper = v;
  }

  public set open(v: string) {
    this._open = v;
  }

  private get secret(): string {
    return this._secret;
  }

  protected doWork(): void {}
}

abstract class IsSetterAbstractAccessorSample {
  abstract set data(v: string);

  set info(v: int) {
  }

  get info(): int {
    return 42;
  }

  abstract run(): void;

  static set defaultValue(v: string) {
  }
}

class IsSetterAbstractAccessorImpl extends IsSetterAbstractAccessorSample {
  set data(v: string) {
  }

  run(): void {}
}

interface IsSetterNameInterface {
  name: string;
}

class IsSetterInterfaceImpl implements IsSetterNameInterface {
  private _name: string = "";

  get name(): string {
    return this._name;
  }

  set name(v: string) {
    this._name = v;
  }
}

class IsSetterInterfaceMethodImpl {
  name(v: string): void {}
}

class IsSetterOverrideParent {
  private _value: int = 0;

  set value(v: int) {
    this._value = v;
  }
}

class IsSetterOverrideChild extends IsSetterOverrideParent {
  override set value(v: int) {
  }

  valueMethod(v: int): void {}
}

class IsSetterMethodParent {
  foo(v: string): void {}
}

class IsSetterMethodChild {
  set foo(v: string) {
  }
}

class IsSetterGrandParent {
  set token(v: string) {
  }
}

class IsSetterMiddleChild extends IsSetterGrandParent {
}

class IsSetterGrandChild extends IsSetterMiddleChild {
}

class IsSetterStaticParent {
  static set version(v: int) {
  }
}

class IsSetterStaticChild extends IsSetterStaticParent {
}

class IsSetterStaticHideChild extends IsSetterStaticParent {
  static version(v: int): void {}
}

class IsSetterComputedNameSample {
  set mySetterProp(v: string) {
  }

  get mySetterProp(): string {
    return "";
  }

  set unicodeSetter(v: string) {
  }

  set classSetter(v: string) {
  }
}

class IsSetterReadWriteSample {
  private _readOnly: int = 1;
  private _writeOnly: int = 0;

  get readOnly(): int {
    return this._readOnly;
  }

  set writeOnly(v: int) {
    this._writeOnly = v;
  }
}

class IsSetterGenericSample<T> {
  private items: T[] = [];

  set value(v: T) {
    this.items.push(v);
  }
}

class IsSetterComplexParamSample {
  set data(v: Map<string, Set<int>>) {
  }

  private _count: int = 0;

  set count(v: int) {
    this._count = v;
  }

  set danger(v: int) {
    throw new Error("danger");
  }
}

class IsSetterSuperParent {
  set value(v: int) {
  }
}

class IsSetterSuperChild extends IsSetterSuperParent {
  set parentValue(v: int) {
    super.value = v;
  }
}

class IsSetterKeywordNameSample {
  setValueMethod(v: string): void {}

  get setValue(): string {
    return "";
  }

  static setMethod(v: string): void {}
}

class IsSetterClassExpressionLikeSample {
  set data(v: int) {
  }
}

class IsSetterNamedExpressionLikeSample {
  set info(v: int) {
  }
}

function findIsSetterMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
  for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
    const method = classType.getMethod(i);
    if (method.getName() === name) {
      if (wantStatic === undefined || method.isStatic() === wantStatic) {
        return method;
      }
    }
  }
  expect().assertFail();
  throw new Error(`Missing method: ${name}`);
}

export default function MethodIsSetterTest(): void {
    describe('MethodIsSetterTest', () => {
        beforeAll(() => {
        });
        beforeEach(async () => {
            await Utils.msSleep(30);
        });
        afterEach(() => {
        });
        afterAll(() => {
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0100
         * @tc.name testMethodIsSetter001
         * @tc.desc Verify that isSetter returns true for a private setter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterPrivateSetterSample>() as ClassType).getMethodByName("%%set-privateSetter");
            let result = method.isSetter();
            expect(result).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0200
         * @tc.name testMethodIsSetter002
         * @tc.desc Verify that typeof isSetter return value is "boolean"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterNormalSample>() as ClassType).getMethodByName("add");
            let result = method.isSetter();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0300
         * @tc.name testMethodIsSetter003
         * @tc.desc Verify that multiple calls to isSetter on the same Method return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterNormalSample>() as ClassType).getMethodByName("add");
            let r1 = method.isSetter();
            expect(r1).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0400
         * @tc.name testMethodIsSetter004
         * @tc.desc Verify that isSetter returns true for setter methods in different classes
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            let methodA = (Type.from<IsSetterClassA>() as ClassType).getMethodByName("%%set-propA");
            let methodB = (Type.from<IsSetterClassB>() as ClassType).getMethodByName("%%set-propB");
            expect(methodA.isSetter()).assertEqual(true);
            expect(methodB.isSetter()).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0500
         * @tc.name testMethodIsSetter005
         * @tc.desc Verify that isSetter still works after non-existent method lookup throws TypeError
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                (Type.from<IsSetterNormalSample>() as ClassType).getMethodByName("nonExist");
                expect().assertFail();
            } catch (error) {
                expect(error.name).assertEqual("TypeError");
                const setter = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
                expect(setter.isSetter()).assertTrue();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0600
         * @tc.name testMethodIsSetter006
         * @tc.desc Verify that isSetter returns false for a class constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<IsSetterCtorHelper>() as ClassType).getConstructor(0);
            let result = ctor.isSetter();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0700
         * @tc.name testMethodIsSetter007
         * @tc.desc Verify that isSetter returns true for a static setter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsSetterStaticClass>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "%%set-staticProp") {
                    method = m;
                    break;
                }
            }
            let result = method!.isSetter();
            expect(result).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0800
         * @tc.name testMethodIsSetter008
         * @tc.desc Verify that isSetter returns false for an async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAsyncClass>() as ClassType).getMethodByName("asyncMethod");
            let result = method.isSetter();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_0900
         * @tc.name testMethodIsSetter009
         * @tc.desc Verify that isSetter returns true for a final setter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterFinalClass>() as ClassType).getMethodByName("%%set-finalProp");
            let result = method.isSetter();
            expect(result).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1000
         * @tc.name testMethodIsSetter010
         * @tc.desc Verify that isSetter returns false for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterNativeClass>() as ClassType).getMethodByName("doNative");
            let result = method.isSetter();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1100
         * @tc.name testMethodIsSetter011
         * @tc.desc Verify that isSetter returns false for an abstract method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAbstractClass>() as ClassType).getMethodByName("doAbstract");
            let result = method.isSetter();
            expect(result).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1200
         * @tc.name testMethodIsSetter012
         * @tc.desc Verify that isSetter returns true for an inherited setter from parent class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterChild>() as ClassType).getMethodByName("%%set-parentVal");
            let result = method.isSetter();
            expect(result).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1300
         * @tc.name testMethodIsSetter013
         * @tc.desc Verify isSetter on multiple mixed methods including instance and static getters/setters in a single class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsSetterMixedClass>() as ClassType;
            const count = classType.getMethodsNum();
            let instGetter: Method | undefined = undefined;
            let instSetter: Method | undefined = undefined;
            let staticGetter: Method | undefined = undefined;
            let staticSetter: Method | undefined = undefined;
            let plain: Method | undefined = classType.getMethodByName("plainMethod");
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                const name = m.getName();
                if (name === "%%get-instVal") {
                    instGetter = m;
                } else if (name === "%%set-instVal") {
                    instSetter = m;
                } else if (name === "%%get-staticVal") {
                    staticGetter = m;
                } else if (name === "%%set-staticVal") {
                    staticSetter = m;
                }
            }
            expect(instGetter!.isSetter()).assertEqual(false);
            expect(instSetter!.isSetter()).assertEqual(true);
            expect(staticGetter!.isSetter()).assertEqual(false);
            expect(staticSetter!.isSetter()).assertEqual(true);
            expect(plain.isSetter()).assertEqual(false);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1400
         * @tc.name testMethodIsSetter014
         * @tc.desc Verify int parameter setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterVariousTypesSample>() as ClassType).getMethodByName("%%set-value");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1500
         * @tc.name testMethodIsSetter015
         * @tc.desc Verify boolean parameter setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterVariousTypesSample>() as ClassType).getMethodByName("%%set-flag");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1600
         * @tc.name testMethodIsSetter016
         * @tc.desc Verify Object parameter setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterVariousTypesSample>() as ClassType).getMethodByName("%%set-obj");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1700
         * @tc.name testMethodIsSetter017
         * @tc.desc Verify void parameter setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterVariousTypesSample>() as ClassType).getMethodByName("%%set-none");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1800
         * @tc.name testMethodIsSetter018
         * @tc.desc Verify getter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterGetterSample>() as ClassType).getMethodByName("%%get-getValue");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_1900
         * @tc.name testMethodIsSetter019
         * @tc.desc Verify static getter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterMixedClass>() as ClassType, "%%get-staticVal", true);
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2000
         * @tc.name testMethodIsSetter020
         * @tc.desc Verify ordinary method is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterCtorHelper>() as ClassType).getMethodByName("regularMethod");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2100
         * @tc.name testMethodIsSetter021
         * @tc.desc Verify protected setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterAccessSample>() as ClassType, "%%set-helper");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2200
         * @tc.name testMethodIsSetter022
         * @tc.desc Verify public setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAccessSample>() as ClassType).getMethodByName("%%set-open");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2300
         * @tc.name testMethodIsSetter023
         * @tc.desc Verify private getter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterAccessSample>() as ClassType, "%%get-secret");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2400
         * @tc.name testMethodIsSetter024
         * @tc.desc Verify protected ordinary method is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterAccessSample>() as ClassType, "doWork");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2500
         * @tc.name testMethodIsSetter025
         * @tc.desc Verify concrete setter in abstract class is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAbstractAccessorSample>() as ClassType).getMethodByName("%%set-info");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2600
         * @tc.name testMethodIsSetter026
         * @tc.desc Verify concrete getter in abstract class is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAbstractAccessorSample>() as ClassType).getMethodByName("%%get-info");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2700
         * @tc.name testMethodIsSetter027
         * @tc.desc Verify abstract method is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterAbstractAccessorSample>() as ClassType).getMethodByName("run");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2800
         * @tc.name testMethodIsSetter028
         * @tc.desc Verify static setter in abstract class is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterAbstractAccessorSample>() as ClassType, "%%set-defaultValue", true);
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_2900
         * @tc.name testMethodIsSetter029
         * @tc.desc Verify interface setter implementation is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterInterfaceImpl>() as ClassType).getMethodByName("%%set-name");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3000
         * @tc.name testMethodIsSetter030
         * @tc.desc Verify ordinary method with interface-like name is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterInterfaceMethodImpl>() as ClassType).getMethodByName("name");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3100
         * @tc.name testMethodIsSetter031
         * @tc.desc Verify child overriding parent setter remains setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterOverrideChild>() as ClassType).getMethodByName("%%set-value");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3200
         * @tc.name testMethodIsSetter032
         * @tc.desc Verify ordinary child method is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterOverrideChild>() as ClassType).getMethodByName("valueMethod");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3300
         * @tc.name testMethodIsSetter033
         * @tc.desc Verify child setter with parent method name is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterMethodChild>() as ClassType).getMethodByName("%%set-foo");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3400
         * @tc.name testMethodIsSetter034
         * @tc.desc Verify grandparent setter inherited through multi-level chain is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterGrandChild>() as ClassType).getMethodByName("%%set-token");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3500
         * @tc.name testMethodIsSetter035
         * @tc.desc Verify static setter declared on parent class is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterStaticParent>() as ClassType, "%%set-version", true);
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3600
         * @tc.name testMethodIsSetter036
         * @tc.desc Verify static ordinary method hiding static setter name is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterStaticHideChild>() as ClassType, "version", true);
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3700
         * @tc.name testMethodIsSetter037
         * @tc.desc Verify computed property setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComputedNameSample>() as ClassType).getMethodByName("%%set-mySetterProp");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3800
         * @tc.name testMethodIsSetter038
         * @tc.desc Verify computed property getter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComputedNameSample>() as ClassType).getMethodByName("%%get-mySetterProp");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_3900
         * @tc.name testMethodIsSetter039
         * @tc.desc Verify computed unicode setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComputedNameSample>() as ClassType).getMethodByName("%%set-unicodeSetter");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4000
         * @tc.name testMethodIsSetter040
         * @tc.desc Verify computed reserved-word setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComputedNameSample>() as ClassType).getMethodByName("%%set-classSetter");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4100
         * @tc.name testMethodIsSetter041
         * @tc.desc Verify setter is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterGetterAndSetterSample>() as ClassType).getMethodByName("%%set-name");
            expect(method.isSetter()).assertTrue();
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4200
         * @tc.name testMethodIsSetter042
         * @tc.desc Verify abstract setter is abstract and setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsSetterMethod(Type.from<IsSetterAbstractAccessorSample>() as ClassType, "%%set-data");
            expect(method.isAbstract()).assertTrue();
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4300
         * @tc.name testMethodIsSetter043
         * @tc.desc Verify final setter is final and setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterFinalClass>() as ClassType).getMethodByName("%%set-finalProp");
            expect(method.isFinal()).assertTrue();
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4400
         * @tc.name testMethodIsSetter044
         * @tc.desc Verify constructor is constructor and not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterCtorHelper>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4500
         * @tc.name testMethodIsSetter045
         * @tc.desc Verify user setter is not native
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
            expect(method.isNative()).assertFalse();
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4600
         * @tc.name testMethodIsSetter046
         * @tc.desc Verify setter getName returns internal setter name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
            expect(method.getName()).assertEqual("%%set-setValue");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4700
         * @tc.name testMethodIsSetter047
         * @tc.desc Verify setter result type metadata is available
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
            expect(method.getType().getResultType() !== undefined).assertTrue();
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4800
         * @tc.name testMethodIsSetter048
         * @tc.desc Verify setter owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodIsSetterTest.test.IsSetterSetterSample");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_4900
         * @tc.name testMethodIsSetter049
         * @tc.desc Verify write-only setter without getter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterReadWriteSample>() as ClassType).getMethodByName("%%set-writeOnly");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5000
         * @tc.name testMethodIsSetter050
         * @tc.desc Verify read-only getter without setter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterReadWriteSample>() as ClassType).getMethodByName("%%get-readOnly");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5100
         * @tc.name testMethodIsSetter051
         * @tc.desc Verify generic class setter is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterGenericSample<string>>() as ClassType).getMethodByName("%%set-value");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5200
         * @tc.name testMethodIsSetter052
         * @tc.desc Verify setter with complex parameter type is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComplexParamSample>() as ClassType).getMethodByName("%%set-data");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5300
         * @tc.name testMethodIsSetter053
         * @tc.desc Verify setter with side effect is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsSetterComplexParamSample();
            sample.count = 3;
            const method = (Type.from<IsSetterComplexParamSample>() as ClassType).getMethodByName("%%set-count");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5400
         * @tc.name testMethodIsSetter054
         * @tc.desc Verify throwing setter is still setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterComplexParamSample>() as ClassType).getMethodByName("%%set-danger");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5500
         * @tc.name testMethodIsSetter055
         * @tc.desc Verify setter using super is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSuperChild>() as ClassType).getMethodByName("%%set-parentValue");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5600
         * @tc.name testMethodIsSetter056
         * @tc.desc Verify ordinary method with set-like name is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterKeywordNameSample>() as ClassType).getMethodByName("setValueMethod");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5700
         * @tc.name testMethodIsSetter057
         * @tc.desc Verify getter with set-like name is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterKeywordNameSample>() as ClassType).getMethodByName("%%get-setValue");
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5800
         * @tc.name testMethodIsSetter058
         * @tc.desc Verify setter data is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterClassExpressionLikeSample>() as ClassType).getMethodByName("%%set-data");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_5900
         * @tc.name testMethodIsSetter059
         * @tc.desc Verify setter info is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterNamedExpressionLikeSample>() as ClassType).getMethodByName("%%set-info");
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_6000
         * @tc.name testMethodIsSetter060
         * @tc.desc Verify setter repeated calls return true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsSetterSetterSample>() as ClassType).getMethodByName("%%set-setValue");
            expect(method.isSetter()).assertTrue();
            expect(method.isSetter()).assertTrue();
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_6100
         * @tc.name testMethodIsSetter061
         * @tc.desc Verify comprehensive class identifies only setters as setters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsSetterMixedClass>() as ClassType;
            expect(classType.getMethodByName("%%set-instVal").isSetter()).assertTrue();
            expect(findIsSetterMethod(classType, "%%set-staticVal", true).isSetter()).assertTrue();
            expect(classType.getMethodByName("%%get-instVal").isSetter()).assertFalse();
            expect(classType.getMethodByName("plainMethod").isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_SETTER_6200
         * @tc.name testMethodIsSetter062
         * @tc.desc Verify overloaded methods are not setters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsSetter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsSetterOverloadSample>() as ClassType;
            let oneParamMethod: Method | undefined = undefined;
            let twoParamMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const method = classType.getMethod(i);
                if (method.getName() === "method") {
                    const parameterCount = method.getType().getParametersNum();
                    if (parameterCount === 1) {
                        oneParamMethod = method;
                    } else if (parameterCount === 2) {
                        twoParamMethod = method;
                    }
                }
            }
            expect(oneParamMethod !== undefined).assertTrue();
            expect(twoParamMethod !== undefined).assertTrue();
            expect(oneParamMethod!.isSetter()).assertFalse();
            expect(twoParamMethod!.isSetter()).assertFalse();
        });
    });
}
