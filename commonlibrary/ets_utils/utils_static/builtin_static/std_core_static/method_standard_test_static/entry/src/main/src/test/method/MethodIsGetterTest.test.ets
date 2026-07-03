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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '../../../../hypium/index';
import Utils from './../Util.test';

class IsGetterNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsGetterGetterSample {
    private _name: string = "test";
    get name(): string {
        return this._name;
    }
}

class IsGetterSetterSample {
    private _name: string = "test";
    set name(value: string) {
        this._name = value;
    }
}

class IsGetterPrivateGetterSample {
    private _data: string = "hidden";
    private get data(): string {
        return this._data;
    }
}

class IsGetterGetterSetterSample {
    private _value: int = 10;
    get value(): int {
        return this._value;
    }
    set value(v: int) {
        this._value = v;
    }
}

class IsGetterCtorSample {
    constructor() {}
}

class IsGetterStaticGetterSample {
    private static _value: string = "static";
    static get value(): string {
        return IsGetterStaticGetterSample._value;
    }
}

class IsGetterAsyncSample {
    async doAsync(): Promise<string> {
        return "done";
    }
}

class IsGetterFinalSample {
    final doFinal(): void {}
}

class IsGetterNativeSample {
    native doNative(): void;
}

class IsGetterBothAccessorSample {
    private _data: string = "both";
    get data(): string {
        return this._data;
    }
    set data(value: string) {
        this._data = value;
    }
}

class IsGetterMultiPropSample {
    private _a: string = "a";
    private _b: int = 1;
    get a(): string {
        return this._a;
    }
    get b(): int {
        return this._b;
    }
    normalMethod(): void {}
}

class IsGetterDiffClassASample {
    get prop(): string {
        return "A";
    }
}

class IsGetterDiffClassBSample {
    get prop(): string {
        return "B";
    }
}

class IsGetterParentWithGetter {
    private _prop: string = "parentProp";
    get prop(): string {
        return this._prop;
    }
}

class IsGetterChildOfGetter extends IsGetterParentWithGetter {
}

class IsGetterVariousTypesSample {
    private _strVal: string = "hello";
    private _intVal: int = 42;
    private _boolVal: boolean = true;
    get strVal(): string {
        return this._strVal;
    }
    get intVal(): int {
        return this._intVal;
    }
    get boolVal(): boolean {
        return this._boolVal;
    }
}

class IsGetterOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

class IsGetterObjectVoidSample {
    get obj(): Object {
        return new Object();
    }

    get none(): void {
        return undefined;
    }
}

class IsGetterStaticSetterSample {
    private static _version: int = 1;

    static set version(value: int) {
        IsGetterStaticSetterSample._version = value;
    }
}

class IsGetterAccessSample {
    private _secret: string = "secret";
    protected _helper: string = "helper";
    private _write: string = "";

    protected get helper(): string {
        return this._helper;
    }

    public get open(): string {
        return "open";
    }

    private set secret(value: string) {
        this._write = value;
    }

    protected doWork(): void {}
}

abstract class IsGetterAbstractAccessorSample {
    abstract get data(): string;

    get info(): int {
        return 42;
    }

    set info(value: int) {
    }

    abstract run(): void;

    static get defaultValue(): string {
        return "default";
    }
}

class IsGetterAbstractAccessorImpl extends IsGetterAbstractAccessorSample {
    get data(): string {
        return "data";
    }

    run(): void {}
}

interface IsGetterNameInterface {
    readonly name: string;
}

class IsGetterInterfaceImpl implements IsGetterNameInterface {
    get name(): string {
        return "impl";
    }
}

class IsGetterInterfaceMethodImpl {
    name(): string {
        return "method";
    }
}

class IsGetterOverrideParent {
    get value(): int {
        return 1;
    }
}

class IsGetterOverrideChild extends IsGetterOverrideParent {
    override get value(): int {
        return 2;
    }

    get foo(): string {
        return "child";
    }
}

class IsGetterGrandParent {
    get token(): string {
        return "grand";
    }
}

class IsGetterMiddleChild extends IsGetterGrandParent {
}

class IsGetterGrandChild extends IsGetterMiddleChild {
}

class IsGetterStaticParent {
    static get version(): int {
        return 1;
    }
}

class IsGetterStaticChild extends IsGetterStaticParent {
}

class IsGetterStaticHideChild extends IsGetterStaticParent {
    static version(): int {
        return 2;
    }
}

class IsGetterFinalAccessorSample {
    final get data(): string {
        return "final";
    }
}

class IsGetterNameTypeOwnerSample {
    get value(): int {
        return 10;
    }
}

class IsGetterReadWriteSample {
    private _readOnly: int = 1;
    private _writeOnly: int = 0;

    get readOnly(): int {
        return this._readOnly;
    }

    set writeOnly(value: int) {
        this._writeOnly = value;
    }
}

class IsGetterGenericSample<T> {
    private item: T;

    constructor(item: T) {
        this.item = item;
    }

    get value(): T {
        return this.item;
    }
}

class IsGetterComplexReturnSample {
    get data(): Map<string, Set<int>> {
        return new Map<string, Set<int>>();
    }

    get self(): IsGetterComplexReturnSample {
        return this;
    }

    get promise(): Promise<int> {
        return Promise.resolve(1);
    }
}

class IsGetterSideEffectSample {
    private count: int = 0;

    get counter(): int {
        const value = this.count;
        this.count += 1;
        return value;
    }

    get danger(): int {
        throw new Error("danger");
    }
}

class IsGetterSuperParent {
    get value(): int {
        return 1;
    }
}

class IsGetterSuperChild extends IsGetterSuperParent {
    get parentValue(): int {
        return super.value;
    }
}

class IsGetterKeywordNameSample {
    getValueMethod(): string {
        return "method";
    }

    set getValue(value: string) {
    }

    static getMethod(): string {
        return "static";
    }
}

class IsGetterNoGetterSample {
    foo(): void {}

    bar(): int {
        return 1;
    }
}

class IsGetterInvokeSample {
    private _value: int = 42;

    get value(): int {
        return this._value;
    }
}

class IsGetterClassExpressionLikeSample {
    get data(): int {
        return 1;
    }
}

class IsGetterNamedExpressionLikeSample {
    get info(): int {
        return 2;
    }
}

class IsGetterCombinedSample {
    private _value: int = 1;

    get value(): int {
        return this._value;
    }

    set value(v: int) {
        this._value = v;
    }

    static get version(): int {
        return 1;
    }

    static set version(v: int) {
    }

    method(): void {}
}

class IsGetterComputedNameSample {
    get myGetterProp(): string {
        return "computed";
    }

    get unicodeGetter(): string {
        return "unicode";
    }

    get classGetter(): string {
        return "reserved";
    }
}

function findIsGetterMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodIsGetterTest(): void {
    describe('MethodIsGetterTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0100
         * @tc.name testMethodIsGetter001
         * @tc.desc Verify that isGetter returns false for a normal instance method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNormalSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isGetter();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0200
         * @tc.name testMethodIsGetter002
         * @tc.desc Verify that isGetter returns true for a private getter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterPrivateGetterSample>() as ClassType).getMethodByName("%%get-data");
            let result: boolean = method.isGetter();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0300
         * @tc.name testMethodIsGetter003
         * @tc.desc Verify that isGetter return value is strictly boolean, not truthy/falsy values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNormalSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isGetter();
            expect(result).assertEqual(false);
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0400
         * @tc.name testMethodIsGetter004
         * @tc.desc Verify that multiple calls to isGetter on the same Method object return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGetterSample>() as ClassType).getMethodByName("%%get-name");
            let result1 = method.isGetter();
            let result2 = method.isGetter();
            let result3 = method.isGetter();
            expect(result1).assertEqual(result2);
            expect(result2).assertEqual(result3);
            expect(result1).assertEqual(true);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0500
         * @tc.name testMethodIsGetter005
         * @tc.desc Verify that isGetter returns true for a getter method even when a setter with the same name exists
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGetterSetterSample>() as ClassType).getMethodByName("%%get-value");
            let result: boolean = method.isGetter();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0600
         * @tc.name testMethodIsGetter006
         * @tc.desc Verify that isGetter returns boolean for a normal instance method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNormalSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isGetter();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0700
         * @tc.name testMethodIsGetter007
         * @tc.desc Verify that isGetter returns false for a constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterCtorSample>() as ClassType).getConstructor(0);
            let result: boolean = method.isGetter();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0800
         * @tc.name testMethodIsGetter008
         * @tc.desc Verify that isGetter returns true for a static getter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterStaticGetterSample>() as ClassType;
            const count = classType.getMethodsNum();
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < count; i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "%%get-value") {
                    method = m;
                    break;
                }
            }
            let result: boolean = method!.isGetter();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_0900
         * @tc.name testMethodIsGetter009
         * @tc.desc Verify that isGetter returns false for an async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterAsyncSample>() as ClassType).getMethodByName("doAsync");
            let result: boolean = method.isGetter();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1000
         * @tc.name testMethodIsGetter010
         * @tc.desc Verify that isGetter returns false for a final method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterFinalSample>() as ClassType).getMethodByName("doFinal");
            let result: boolean = method.isGetter();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1100
         * @tc.name testMethodIsGetter011
         * @tc.desc Verify that isGetter returns false for a native method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNativeSample>() as ClassType).getMethodByName("doNative");
            let result: boolean = method.isGetter();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1200
         * @tc.name testMethodIsGetter012
         * @tc.desc Verify that for a property with both getter and setter, isGetter returns true for getter and false for setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const getterMethod = (Type.from<IsGetterBothAccessorSample>() as ClassType).getMethodByName("%%get-data");
            const setterMethod = (Type.from<IsGetterBothAccessorSample>() as ClassType).getMethodByName("%%set-data");
            expect(getterMethod.isGetter()).assertTrue();
            expect(setterMethod.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1300
         * @tc.name testMethodIsGetter013
         * @tc.desc Verify that isGetter returns consistent results across multiple getter properties in the same class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterMultiPropSample>() as ClassType;
            const methodA = classType.getMethodByName("%%get-a");
            const methodB = classType.getMethodByName("%%get-b");
            const normalMethod = classType.getMethodByName("normalMethod");
            expect(methodA.isGetter()).assertTrue();
            expect(methodB.isGetter()).assertTrue();
            expect(normalMethod.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1400
         * @tc.name testMethodIsGetter014
         * @tc.desc Verify that isGetter returns true for getter methods across different classes accessed via Type.from
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const methodA = (Type.from<IsGetterDiffClassASample>() as ClassType).getMethodByName("%%get-prop");
            const methodB = (Type.from<IsGetterDiffClassBSample>() as ClassType).getMethodByName("%%get-prop");
            expect(methodA.isGetter()).assertTrue();
            expect(methodB.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1500
         * @tc.name testMethodIsGetter015
         * @tc.desc Verify that isGetter returns true for a getter method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGetterSample>() as ClassType).getMethodByName("%%get-name");
            let result: boolean = method.isGetter();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1600
         * @tc.name testMethodIsGetter016
         * @tc.desc Verify that isGetter returns true for getter methods returning different property types (string, int, boolean)
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterVariousTypesSample>() as ClassType;
            const strMethod = classType.getMethodByName("%%get-strVal");
            const intMethod = classType.getMethodByName("%%get-intVal");
            const boolMethod = classType.getMethodByName("%%get-boolVal");
            expect(strMethod.isGetter()).assertTrue();
            expect(intMethod.isGetter()).assertTrue();
            expect(boolMethod.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1700
         * @tc.name testMethodIsGetter017
         * @tc.desc Verify that isGetter returns true for an inherited getter method accessed from child class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterChildOfGetter>() as ClassType).getMethodByName("%%get-prop");
            let result: boolean = method.isGetter();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1800
         * @tc.name testMethodIsGetter018
         * @tc.desc Verify getter returning Object is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterObjectVoidSample>() as ClassType).getMethodByName("%%get-obj");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_1900
         * @tc.name testMethodIsGetter019
         * @tc.desc Verify getter returning void is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterObjectVoidSample>() as ClassType).getMethodByName("%%get-none");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2000
         * @tc.name testMethodIsGetter020
         * @tc.desc Verify static setter is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterStaticSetterSample>() as ClassType, "%%set-version", true);
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2100
         * @tc.name testMethodIsGetter021
         * @tc.desc Verify protected getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAccessSample>() as ClassType, "%%get-helper");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2200
         * @tc.name testMethodIsGetter022
         * @tc.desc Verify public getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterAccessSample>() as ClassType).getMethodByName("%%get-open");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2300
         * @tc.name testMethodIsGetter023
         * @tc.desc Verify private setter is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAccessSample>() as ClassType, "%%set-secret");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2400
         * @tc.name testMethodIsGetter024
         * @tc.desc Verify protected ordinary method is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAccessSample>() as ClassType, "doWork");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2500
         * @tc.name testMethodIsGetter025
         * @tc.desc Verify abstract getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAbstractAccessorSample>() as ClassType, "%%get-data");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2600
         * @tc.name testMethodIsGetter026
         * @tc.desc Verify concrete getter in abstract class is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterAbstractAccessorSample>() as ClassType).getMethodByName("%%get-info");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2700
         * @tc.name testMethodIsGetter027
         * @tc.desc Verify concrete setter in abstract class is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterAbstractAccessorSample>() as ClassType).getMethodByName("%%set-info");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2800
         * @tc.name testMethodIsGetter028
         * @tc.desc Verify abstract method is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterAbstractAccessorSample>() as ClassType).getMethodByName("run");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_2900
         * @tc.name testMethodIsGetter029
         * @tc.desc Verify static getter in abstract class is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAbstractAccessorSample>() as ClassType, "%%get-defaultValue", true);
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3000
         * @tc.name testMethodIsGetter030
         * @tc.desc Verify interface getter implementation is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterInterfaceImpl>() as ClassType).getMethodByName("%%get-name");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3100
         * @tc.name testMethodIsGetter031
         * @tc.desc Verify ordinary method with interface-like name is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterInterfaceMethodImpl>() as ClassType).getMethodByName("name");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3200
         * @tc.name testMethodIsGetter032
         * @tc.desc Verify child overriding parent getter remains getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterOverrideChild>() as ClassType).getMethodByName("%%get-value");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3300
         * @tc.name testMethodIsGetter033
         * @tc.desc Verify child getter foo is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterOverrideChild>() as ClassType).getMethodByName("%%get-foo");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3400
         * @tc.name testMethodIsGetter034
         * @tc.desc Verify grandparent getter inherited through multi-level chain is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGrandChild>() as ClassType).getMethodByName("%%get-token");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3500
         * @tc.name testMethodIsGetter035
         * @tc.desc Verify static getter declared on parent class is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterStaticParent>() as ClassType, "%%get-version", true);
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3600
         * @tc.name testMethodIsGetter036
         * @tc.desc Verify static ordinary method hiding static getter name is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterStaticHideChild>() as ClassType, "version", true);
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3700
         * @tc.name testMethodIsGetter037
         * @tc.desc Verify getter is not setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGetterSample>() as ClassType).getMethodByName("%%get-name");
            expect(method.isGetter()).assertTrue();
            expect(method.isSetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3800
         * @tc.name testMethodIsGetter038
         * @tc.desc Verify abstract getter is abstract and getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsGetterMethod(Type.from<IsGetterAbstractAccessorSample>() as ClassType, "%%get-data");
            expect(method.isAbstract()).assertTrue();
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_3900
         * @tc.name testMethodIsGetter039
         * @tc.desc Verify constructor is constructor and not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterCtorSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4000
         * @tc.name testMethodIsGetter040
         * @tc.desc Verify getter getName returns internal getter name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNameTypeOwnerSample>() as ClassType).getMethodByName("%%get-value");
            expect(method.getName()).assertEqual("%%get-value");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4100
         * @tc.name testMethodIsGetter041
         * @tc.desc Verify getter return type metadata is int
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNameTypeOwnerSample>() as ClassType).getMethodByName("%%get-value");
            expect(method.getType().getResultType().toString()).assertEqual("int");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4200
         * @tc.name testMethodIsGetter042
         * @tc.desc Verify getter owner type is declaring class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNameTypeOwnerSample>() as ClassType).getMethodByName("%%get-value");
            expect(method.getOwnerType().getName()).assertEqual("entry.src.main.src.test.method.MethodIsGetterTest.test.IsGetterNameTypeOwnerSample");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4300
         * @tc.name testMethodIsGetter043
         * @tc.desc Verify read-only getter without setter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterReadWriteSample>() as ClassType).getMethodByName("%%get-readOnly");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4400
         * @tc.name testMethodIsGetter044
         * @tc.desc Verify write-only setter without getter is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterReadWriteSample>() as ClassType).getMethodByName("%%set-writeOnly");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4500
         * @tc.name testMethodIsGetter045
         * @tc.desc Verify generic class getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterGenericSample<string>>() as ClassType).getMethodByName("%%get-value");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4600
         * @tc.name testMethodIsGetter046
         * @tc.desc Verify getter returning complex collection type is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComplexReturnSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4700
         * @tc.name testMethodIsGetter047
         * @tc.desc Verify getter returning this class is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComplexReturnSample>() as ClassType).getMethodByName("%%get-self");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4800
         * @tc.name testMethodIsGetter048
         * @tc.desc Verify getter returning Promise is getter and not async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComplexReturnSample>() as ClassType).getMethodByName("%%get-promise");
            expect(method.isGetter()).assertTrue();
            expect(method.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_4900
         * @tc.name testMethodIsGetter049
         * @tc.desc Verify getter with side effect is still getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsGetterSideEffectSample();
            expect(sample.counter).assertEqual(0);
            const method = (Type.from<IsGetterSideEffectSample>() as ClassType).getMethodByName("%%get-counter");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5000
         * @tc.name testMethodIsGetter050
         * @tc.desc Verify throwing getter is still getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterSideEffectSample>() as ClassType).getMethodByName("%%get-danger");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5100
         * @tc.name testMethodIsGetter051
         * @tc.desc Verify getter using super is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterSuperChild>() as ClassType).getMethodByName("%%get-parentValue");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5200
         * @tc.name testMethodIsGetter052
         * @tc.desc Verify ordinary method with get-like name is not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterKeywordNameSample>() as ClassType).getMethodByName("getValueMethod");
            expect(method.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5300
         * @tc.name testMethodIsGetter053
         * @tc.desc Verify no-getter class methods are all not getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterNoGetterSample>() as ClassType;
            expect(classType.getMethodByName("foo").isGetter()).assertFalse();
            expect(classType.getMethodByName("bar").isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5400
         * @tc.name testMethodIsGetter054
         * @tc.desc Verify invoke on getter returns same value and remains getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsGetterInvokeSample();
            const method = (Type.from<IsGetterInvokeSample>() as ClassType).getMethodByName("%%get-value");
            const result = method.invoke(sample, [] as FixedArray<never>);
            expect(result as int).assertEqual(sample.value);
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5500
         * @tc.name testMethodIsGetter055
         * @tc.desc Verify getter data is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterClassExpressionLikeSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5600
         * @tc.name testMethodIsGetter056
         * @tc.desc Verify getter info is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterNamedExpressionLikeSample>() as ClassType).getMethodByName("%%get-info");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5700
         * @tc.name testMethodIsGetter057
         * @tc.desc Verify computed property getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComputedNameSample>() as ClassType).getMethodByName("%%get-myGetterProp");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5800
         * @tc.name testMethodIsGetter058
         * @tc.desc Verify computed unicode getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComputedNameSample>() as ClassType).getMethodByName("%%get-unicodeGetter");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_5900
         * @tc.name testMethodIsGetter059
         * @tc.desc Verify computed reserved-word getter is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterComputedNameSample>() as ClassType).getMethodByName("%%get-classGetter");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6000
         * @tc.name testMethodIsGetter060
         * @tc.desc Verify static getter and setter are distinguished correctly
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterStaticGetterSample>() as ClassType;
            const getter = findIsGetterMethod(classType, "%%get-value", true);
            const setter = findIsGetterMethod(Type.from<IsGetterStaticSetterSample>() as ClassType, "%%set-version", true);
            expect(getter.isGetter()).assertTrue();
            expect(setter.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6100
         * @tc.name testMethodIsGetter061
         * @tc.desc Verify getter and setter pair with same name are distinguished
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterGetterSetterSample>() as ClassType;
            const getter = classType.getMethodByName("%%get-value");
            const setter = classType.getMethodByName("%%set-value");
            expect(getter.isGetter()).assertTrue();
            expect(setter.isGetter()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6200
         * @tc.name testMethodIsGetter062
         * @tc.desc Verify inherited getter and parent getter both remain getters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentMethod = (Type.from<IsGetterParentWithGetter>() as ClassType).getMethodByName("%%get-prop");
            const childMethod = (Type.from<IsGetterChildOfGetter>() as ClassType).getMethodByName("%%get-prop");
            expect(parentMethod.isGetter()).assertTrue();
            expect(childMethod.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6300
         * @tc.name testMethodIsGetter063
         * @tc.desc Verify getter with final modifier is getter and final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterFinalAccessorSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isGetter()).assertTrue();
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6400
         * @tc.name testMethodIsGetter064
         * @tc.desc Verify getter returned by Type.from is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterClassExpressionLikeSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6500
         * @tc.name testMethodIsGetter065
         * @tc.desc Verify getter with object return type is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsGetterObjectVoidSample>() as ClassType).getMethodByName("%%get-obj");
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_GETTER_6600
         * @tc.name testMethodIsGetter066
         * @tc.desc Verify overloaded methods are not getters
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsGetter066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsGetterOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.isGetter()).assertFalse();
            expect(twoParamMethod!.isGetter()).assertFalse();
        });
    });
}
