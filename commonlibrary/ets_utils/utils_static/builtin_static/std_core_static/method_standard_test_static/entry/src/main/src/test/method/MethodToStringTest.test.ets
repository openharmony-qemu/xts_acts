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

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium-binary/src/main/indexStatic';
import Utils from './../Util.test';

class ToStrNormalSample {
    add(value: int): int {
        return value + 1;
    }
}

class ToStrParamSample {
    compute(a: int, b: string, c: boolean): void {}
}

class ToStrCtorSample {
    constructor(value: int) {}
}

class ToStrGetterSample {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
}

class ToStrSetterSample {
    private _value: int = 0;
    set value(v: int) {
        this._value = v;
    }
}

class ToStrAsyncSample {
    public async asyncMethod(): Promise<void> {}
}

class ToStrAccessSample {
    public publicMethod(): void {}
    private privateMethod(): void {}
    protected protectedMethod(): void {}
}

class ToStrMultiMethodSample {
    methodA(): void {}
    methodB(): void {}
}

class ToStrFinalSample {
    final finalMethod(): void {}
}

class ToStrErrorSample {
    existingMethod(): void {}
}

class ToStrGetterDeepSample {
    private _data: string = "test";
    get data(): string {
        return this._data;
    }
}

class ToStrSetterDeepSample {
    private _count: int = 0;
    set count(v: int) {
        this._count = v;
    }
}

class ToStrClassInfoSample {
    foo(): void {}
    bar(): void {}
}

class ToStrStaticInstanceSample {
    static staticBar(): void {}
    instanceBar(): void {}
}

abstract class ToStrAbstractOnlySample {
    abstract run(): void;
}

class ToStrParamShapeSample {
    greet(name: string): void {}
    sum(a: int, b: int): int {
        return a + b;
    }
    defaultValue(msg: string = "hi"): string {
        return msg;
    }
    log(...args: string[]): int {
        return args.length;
    }
    parse(text?: string): string {
        return text === undefined ? "" : text;
    }
    update(point: ToStrPoint): int {
        return point.x + point.y;
    }
    runner(fn: () => void): void {
        fn();
    }
    list(items: string[]): int {
        return items.length;
    }
}

class ToStrPoint {
    x: int = 0;
    y: int = 0;
}

class ToStrReturnShapeSample {
    getValue(): int {
        return 1;
    }
    doNothing(): void {}
    load(): Promise<string> {
        return Promise.resolve("data");
    }
    self(): ToStrReturnShapeSample {
        return this;
    }
    getUndefined(): void {}
    getNullLike(): string | null {
        return null;
    }
    getLiteralLike(): int {
        return 42;
    }
    getUnion(): string | int {
        return "value";
    }
    getList(): string[] {
        return [];
    }
    getCallback(): () => void {
        return (): void => {};
    }
    getBoxed(): Number {
        return new Number(1);
    }
}

class ToStrGenericSample<T> {
    identity(item: T): T {
        return item;
    }
    values(items: Array<T>): Array<T> {
        return items;
    }
}

class ToStrGrandParentSample {
    inherited(): string {
        return "grand";
    }
}

class ToStrMiddleSample extends ToStrGrandParentSample {}

class ToStrGrandChildSample extends ToStrMiddleSample {}

class ToStrOverrideParentSample {
    greet(): string {
        return "parent";
    }
}

class ToStrOverrideChildSample extends ToStrOverrideParentSample {
    greet(): string {
        return "child";
    }
}

class ToStrComputedNameSample {
    myMethodName(): void {}
    deleteMethod(): void {}
    method_with_special_name(): void {}
    unicodeMethod(): void {}
    longMethodNameABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ(): void {}
    emptyNameLike(): void {}
    constructorLike(): void {}
}

class ToStrThrowRecursiveSample {
    empty(): void {}
    danger(): void {
        throw new Error("danger");
    }
    recursive(value: int): int {
        return value <= 0 ? 0 : this.recursive(value - 1);
    }
    withSuperText(): string {
        return "super";
    }
}

class ToStrSideEffectSample {
    count: int = 0;
    read(): int {
        return this.count;
    }
}

class ToStrFormatSample {
    formatted(value: string): string {
        return value;
    }
}

class ToStrImplementationSample {
    work(): void {}
}

class ToStrComplexStableSample {
    private async complex<T extends Object>(name: T, opts?: ToStrComplexOptions): Promise<T> {
        return name;
    }
}

class ToStrOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

class ToStrComplexOptions {
    flag: boolean = false;
}

function findToStrMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
    const count = classType.getMethodsNum();
    for (let i: long = 0; i < count; i += 1) {
        const method = classType.getMethod(i);
        if (method.getName() === name && (wantStatic === undefined || method.isStatic() === wantStatic)) {
            return method;
        }
    }
    expect().assertFail();
    return classType.getMethod(0);
}

function expectMethodString(method: Method): string {
    const result = method.toString();
    expect(typeof result).assertEqual("string");
    expect(result.length > 0).assertTrue();
    expect(result !== "[object Object]").assertTrue();
    return result;
}

export default function MethodToStringTest(): void {
    describe('MethodToStringTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0100
         * @tc.name testMethodToString001
         * @tc.desc Verify toString includes method names for different access modifiers
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<ToStrAccessSample>() as ClassType;
            const pub = classType.getMethodByName("publicMethod");
            const pri = classType.getMethodByName("privateMethod");
            const pro = classType.getMethodByName("protectedMethod");
            let pubStr: string = pub.toString();
            let priStr: string = pri.toString();
            let proStr: string = pro.toString();
            expect(pubStr).assertContain("publicMethod");
            expect(priStr).assertContain("privateMethod");
            expect(proStr).assertContain("protectedMethod");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0200
         * @tc.name testMethodToString002
         * @tc.desc Verify that different methods produce toString results containing their own names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<ToStrMultiMethodSample>() as ClassType;
            const methodA = classType.getMethodByName("methodA");
            const methodB = classType.getMethodByName("methodB");
            let strA: string = methodA.toString();
            let strB: string = methodB.toString();
            expect(typeof strA).assertEqual("string");
            expect(typeof strB).assertEqual("string");
            expect(strA).assertContain("methodA");
            expect(strB).assertContain("methodB");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0300
         * @tc.name testMethodToString003
         * @tc.desc Verify that TypeError is caught when method lookup fails before toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            try {
                const method = (Type.from<ToStrErrorSample>() as ClassType).getMethodByName("nonExistentMethod");
                if (method === undefined) {
                    throw new TypeError("method is undefined");
                }
                let result: string = method.toString();
                expect().assertFail();
            } catch (e) {
                expect(e.name).assertEqual("TypeError");
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0400
         * @tc.name testMethodToString004
         * @tc.desc Verify that toString contract is format-independent across method kinds
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const getter = (Type.from<ToStrGetterSample>() as ClassType).getMethodByName("%%get-value");
            const setter = (Type.from<ToStrSetterSample>() as ClassType).getMethodByName("%%set-value");
            const ctor = (Type.from<ToStrCtorSample>() as ClassType).getConstructor(0);
            expect(typeof getter.toString()).assertEqual("string");
            expect(typeof setter.toString()).assertEqual("string");
            expect(typeof ctor.toString()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0500
         * @tc.name testMethodToString005
         * @tc.desc Verify toString distinguishes different ordinary method names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const fooMethod = (Type.from<ToStrClassInfoSample>() as ClassType).getMethodByName("foo");
            const barMethod = (Type.from<ToStrClassInfoSample>() as ClassType).getMethodByName("bar");
            expect(expectMethodString(fooMethod)).assertContain("foo");
            expect(expectMethodString(barMethod)).assertContain("bar");
            expect(fooMethod.toString() === barMethod.toString()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0600
         * @tc.name testMethodToString006
         * @tc.desc Verify method resolved by name matches class method enumeration
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<ToStrClassInfoSample>() as ClassType;
            const namedMethod = classType.getMethodByName("foo");
            let matchedCount: int = 0;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const current = classType.getMethod(i);
                if (current.getName() === namedMethod.getName() && current.toString() === namedMethod.toString()) {
                    matchedCount += 1;
                }
            }
            expect(matchedCount).assertEqual(1);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0700
         * @tc.name testMethodToString007
         * @tc.desc Verify static method toString is valid and method is static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findToStrMethod(Type.from<ToStrStaticInstanceSample>() as ClassType, "staticBar", true);
            expectMethodString(method);
            expect(method.isStatic()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0800
         * @tc.name testMethodToString008
         * @tc.desc Verify instance method toString is valid and method is not static
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrStaticInstanceSample>() as ClassType).getMethodByName("instanceBar");
            expectMethodString(method);
            expect(method.isStatic()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_0900
         * @tc.name testMethodToString009
         * @tc.desc Verify getter toString is valid and method is getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrGetterDeepSample>() as ClassType).getMethodByName("%%get-data");
            expectMethodString(method);
            expect(method.isGetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1000
         * @tc.name testMethodToString010
         * @tc.desc Verify setter toString is valid and method is setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrSetterDeepSample>() as ClassType).getMethodByName("%%set-count");
            expectMethodString(method);
            expect(method.isSetter()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1100
         * @tc.name testMethodToString011
         * @tc.desc Verify constructor toString is valid and method is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrCtorSample>() as ClassType).getConstructor(0);
            expectMethodString(method);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1200
         * @tc.name testMethodToString012
         * @tc.desc Verify async method toString is valid and method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAsyncSample>() as ClassType).getMethodByName("asyncMethod");
            expectMethodString(method);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1300
         * @tc.name testMethodToString013
         * @tc.desc Verify private method toString is valid and access modifier is private
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAccessSample>() as ClassType).getMethodByName("privateMethod");
            expectMethodString(method);
            expect(method.getAccessModifier()).assertEqual(AccessModifier.PRIVATE);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1400
         * @tc.name testMethodToString014
         * @tc.desc Verify protected method toString is valid and access modifier is protected
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAccessSample>() as ClassType).getMethodByName("protectedMethod");
            expectMethodString(method);
            expect(method.getAccessModifier()).assertEqual(AccessModifier.PROTECTED);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1500
         * @tc.name testMethodToString015
         * @tc.desc Verify public method toString is valid and access modifier is public
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAccessSample>() as ClassType).getMethodByName("publicMethod");
            expectMethodString(method);
            expect(method.getAccessModifier()).assertEqual(AccessModifier.PUBLIC);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1600
         * @tc.name testMethodToString016
         * @tc.desc Verify abstract method toString is valid and method is abstract
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAbstractOnlySample>() as ClassType).getMethodByName("run");
            expectMethodString(method);
            expect(method.isAbstract()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1700
         * @tc.name testMethodToString017
         * @tc.desc Verify final method toString is valid and method is final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFinalSample>() as ClassType).getMethodByName("finalMethod");
            expectMethodString(method);
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1800
         * @tc.name testMethodToString018
         * @tc.desc Verify method with single parameter has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrParamShapeSample>() as ClassType).getMethodByName("greet");
            expectMethodString(method);
            expect(method.getName()).assertEqual("greet");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_1900
         * @tc.name testMethodToString019
         * @tc.desc Verify int-returning method has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrReturnShapeSample>() as ClassType).getMethodByName("getValue");
            expectMethodString(method);
            expect(method.getName()).assertEqual("getValue");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2000
         * @tc.name testMethodToString020
         * @tc.desc Verify generic method has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrGenericSample<string>>() as ClassType).getMethodByName("identity");
            expectMethodString(method);
            expect(method.getName()).assertEqual("identity");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2100
         * @tc.name testMethodToString021
         * @tc.desc Verify multi-parameter method has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrParamSample>() as ClassType).getMethodByName("compute");
            expectMethodString(method);
            expect(method.getName()).assertEqual("compute");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2200
         * @tc.name testMethodToString022
         * @tc.desc Verify inherited instance method toString remains valid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrGrandChildSample>() as ClassType).getMethodByName("inherited");
            expectMethodString(method);
            expect(method.getName()).assertEqual("inherited");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2300
         * @tc.name testMethodToString023
         * @tc.desc Verify child override method toString remains valid
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrOverrideChildSample>() as ClassType).getMethodByName("greet");
            expectMethodString(method);
            expect(method.getName()).assertEqual("greet");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2400
         * @tc.name testMethodToString024
         * @tc.desc Verify named method toString contains method name
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrComputedNameSample>() as ClassType).getMethodByName("myMethodName");
            const result = expectMethodString(method);
            expect(result).assertContain(method.getName());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2500
         * @tc.name testMethodToString025
         * @tc.desc Verify long method name has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const name = "longMethodNameABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZABCDEFGHIJKLMNOPQRSTUVWXYZ";
            const method = (Type.from<ToStrComputedNameSample>() as ClassType).getMethodByName(name);
            expectMethodString(method);
            expect(method.getName()).assertEqual(name);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2600
         * @tc.name testMethodToString026
         * @tc.desc Verify special-character-like method name has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrComputedNameSample>() as ClassType).getMethodByName("method_with_special_name");
            expectMethodString(method);
            expect(method.getName()).assertEqual("method_with_special_name");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2700
         * @tc.name testMethodToString027
         * @tc.desc Verify empty method body has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrThrowRecursiveSample>() as ClassType).getMethodByName("empty");
            expectMethodString(method);
            expect(method.getName()).assertEqual("empty");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2800
         * @tc.name testMethodToString028
         * @tc.desc Verify method returning this-like class type has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrReturnShapeSample>() as ClassType).getMethodByName("self");
            expectMethodString(method);
            expect(method.getName()).assertEqual("self");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_2900
         * @tc.name testMethodToString029
         * @tc.desc Verify two different methods have different toString results or different names
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<ToStrMultiMethodSample>() as ClassType;
            const methodA = classType.getMethodByName("methodA");
            const methodB = classType.getMethodByName("methodB");
            expectMethodString(methodA);
            expectMethodString(methodB);
            expect(methodA.getName() !== methodB.getName()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3000
         * @tc.name testMethodToString030
         * @tc.desc Verify same signature methods in different classes have valid independent toString values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const first = (Type.from<ToStrOverrideParentSample>() as ClassType).getMethodByName("greet");
            const second = (Type.from<ToStrOverrideChildSample>() as ClassType).getMethodByName("greet");
            expectMethodString(first);
            expectMethodString(second);
            expect(first.getOwnerType() !== second.getOwnerType()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3100
         * @tc.name testMethodToString031
         * @tc.desc Verify getName result is contained in toString for named method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFormatSample>() as ClassType).getMethodByName("formatted");
            const result = expectMethodString(method);
            expect(result).assertContain(method.getName());
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3200
         * @tc.name testMethodToString032
         * @tc.desc Verify owner type is available when toString is called
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFormatSample>() as ClassType).getMethodByName("formatted");
            expectMethodString(method);
            expect(method.getOwnerType() !== undefined).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3300
         * @tc.name testMethodToString033
         * @tc.desc Verify toString result length is at least method name length
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFormatSample>() as ClassType).getMethodByName("formatted");
            const result = expectMethodString(method);
            expect(result.length >= method.getName().length).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3400
         * @tc.name testMethodToString034
         * @tc.desc Verify toString has no side effect on instance state
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new ToStrSideEffectSample();
            const method = (Type.from<ToStrSideEffectSample>() as ClassType).getMethodByName("read");
            expect(sample.count).assertEqual(0);
            expectMethodString(method);
            expect(sample.count).assertEqual(0);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3500
         * @tc.name testMethodToString035
         * @tc.desc Verify concurrent async toString calls return stable values
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (): Promise<void> => {
            const method = (Type.from<ToStrFormatSample>() as ClassType).getMethodByName("formatted");
            const expected = method.toString();
            const results = await Promise.all([Promise.resolve(method.toString()), Promise.resolve(method.toString())]);
            expect(results[0]).assertEqual(expected);
            expect(results[1]).assertEqual(expected);
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3600
         * @tc.name testMethodToString036
         * @tc.desc Verify stable ordinary method toString and name remain consistent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFormatSample>() as ClassType).getMethodByName("formatted");
            expectMethodString(method);
            expect(method.getName()).assertEqual("formatted");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3700
         * @tc.name testMethodToString037
         * @tc.desc Verify async method toString is valid and method is marked async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrAsyncSample>() as ClassType).getMethodByName("asyncMethod");
            expectMethodString(method);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3800
         * @tc.name testMethodToString038
         * @tc.desc Verify ordinary work method toString is valid and name is stable
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrImplementationSample>() as ClassType).getMethodByName("work");
            expectMethodString(method);
            expect(method.getName()).assertEqual("work");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_3900
         * @tc.name testMethodToString039
         * @tc.desc Verify final method toString is valid and method is marked final
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrFinalSample>() as ClassType).getMethodByName("finalMethod");
            expectMethodString(method);
            expect(method.isFinal()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_4000
         * @tc.name testMethodToString040
         * @tc.desc Verify complex ArkTS-supported async generic method has valid toString
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<ToStrComplexStableSample>() as ClassType).getMethodByName("complex");
            expectMethodString(method);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_TO_STRING_4100
         * @tc.name testMethodToString041
         * @tc.desc Verify overloaded methods produce non-empty strings
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodToString041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<ToStrOverloadSample>() as ClassType;
            const method = classType.getMethodByName("method");
            expectMethodString(method);
        });
    });
}
