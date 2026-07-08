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

class IsCtorNormalSample {
    constructor() {}

    normalMethod(): void {}
}

class IsCtorParamCtorSample {
    private value: int = 0;
    constructor(value: int) {
        this.value = value;
    }
}

class IsCtorNoParamCtorSample {
    constructor() {}
}

class IsCtorGenericSample<T> {
    constructor() {}
}

class IsCtorDerivedBase {
    constructor() {}
}

class IsCtorDerivedSub extends IsCtorDerivedBase {
    constructor() {
        super();
    }
}

class IsCtorTernaryIfSample {
    constructor() {}
    regularMethod(): void {}
}

abstract class IsCtorAbstractSample {
    constructor() {}
}

class IsCtorManyParamsSample {
    private p1: int;
    private p2: int;
    private p3: int;
    private p4: int;
    private p5: int;
    private p6: int;
    private p7: int;
    private p8: int;
    constructor(p1: int, p2: int, p3: int, p4: int, p5: int, p6: int, p7: int, p8: int) {
        this.p1 = p1;
        this.p2 = p2;
        this.p3 = p3;
        this.p4 = p4;
        this.p5 = p5;
        this.p6 = p6;
        this.p7 = p7;
        this.p8 = p8;
    }
}

class IsCtorOptParamSample {
    private a: int;
    constructor(a: int, b?: string) {
        this.a = a;
    }
}

class IsCtorGrandparent {
    constructor() {}
}

class IsCtorParent extends IsCtorGrandparent {
    constructor() {
        super();
    }
}

class IsCtorChild extends IsCtorParent {
    constructor() {
        super();
    }
}

class IsCtorMixedSample {
    constructor() {}
    instanceMethod(): void {}
    static staticMethod(): void {}
}

class IsCtorMethodOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

class IsCtorDefaultSample {
    value: int = 1;
}

class IsCtorReturnSample {
    getValue(): string {
        return "value";
    }
}

class IsCtorAccessorSample {
    private value: string = "";

    get data(): string {
        return this.value;
    }

    set data(value: string) {
        this.value = value;
    }
}

class IsCtorAsyncSample {
    async fetch(): Promise<string> {
        return "ok";
    }
}

class IsCtorPrivateSample {
    private constructor() {}
}

class IsCtorProtectedSample {
    protected constructor() {}
}

class IsCtorPublicSample {
    public constructor() {}
}

class IsCtorPrivateMethodSample {
    private work(): void {}
}

class IsCtorProtectedMethodSample {
    protected helper(): void {}
}

abstract class IsCtorAbstractMethodSample {
    constructor() {}

    abstract foo(): void;

    bar(): void {}

    static init(): void {}
}

class IsCtorInheritedMethodParent {
    constructor() {}

    greet(): string {
        return "parent";
    }

    static parentStatic(): string {
        return "static";
    }
}

class IsCtorInheritedMethodChild extends IsCtorInheritedMethodParent {
}

class IsCtorOverrideChild extends IsCtorInheritedMethodParent {
    override greet(): string {
        return "child";
    }
}

class IsCtorDefaultChild extends IsCtorInheritedMethodParent {
}

class IsCtorGreatGrandparent {
    constructor() {}
}

class IsCtorGrandChildParent extends IsCtorGreatGrandparent {
    constructor() {
        super();
    }
}

class IsCtorGrandChild extends IsCtorGrandChildParent {
    constructor() {
        super();
    }
}

class IsCtorStaticFieldSample {
    static staticValue: int = 1;
    instanceValue: int = 2;
}

class IsCtorOverloadSample {
    test(value: int): int {
        return value;
    }

    test(value: string): string {
        return value;
    }
}

class IsCtorPublicParamSample {
    public value: int;

    constructor(value: int) {
        this.value = value;
    }
}

class IsCtorReadonlyParamSample {
    readonly name: string;

    constructor(name: string) {
        this.name = name;
    }
}

class IsCtorThisUsageSample {
    value: int = 0;

    constructor() {
        this.value = 42;
    }
}

interface IsCtorRunnable {
    run(): string;
}

class IsCtorInterfaceImplSample implements IsCtorRunnable {
    constructor() {}

    run(): string {
        return "run";
    }
}

namespace IsCtorNamespaceSample {
    export class NamespacedCtor {
        constructor() {}
    }
}

class IsCtorOwnerTypeSample {
    constructor() {}

    sameOwner(): void {}
}

class IsCtorChainMethodSample {
    chain(): IsCtorChainMethodSample {
        return this;
    }
}

class IsCtorObjectMethodSample {
    toString(): string {
        return "object";
    }

    valueOf(): Object {
        return this;
    }
}

class IsCtorComprehensiveSample {
    private value: string = "";

    constructor() {}

    async fetch(): Promise<string> {
        return "ok";
    }

    static create(): void {}

    get data(): string {
        return this.value;
    }

    set data(value: string) {
        this.value = value;
    }
}

function findIsCtorMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

function hasIsCtorMethod(classType: ClassType, name: string): boolean {
    for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
        if (classType.getMethod(i).getName() === name) {
            return true;
        }
    }
    return false;
}

export default function MethodIsConstructorTest(): void {
    describe('MethodIsConstructorTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0100
         * @tc.name testMethodIsConstructor001
         * @tc.desc Verify that isConstructor can be called without parameters and returns true for constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            const result = method.isConstructor();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0200
         * @tc.name testMethodIsConstructor002
         * @tc.desc Verify that typeof isConstructor return value is "boolean"
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            const result = method.isConstructor();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0300
         * @tc.name testMethodIsConstructor003
         * @tc.desc Verify that multiple calls to isConstructor return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            const result1 = method.isConstructor();
            const result2 = method.isConstructor();
            const result3 = method.isConstructor();
            expect(result1).assertEqual(result2);
            expect(result2).assertEqual(result3);
            expect(result1).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0400
         * @tc.name testMethodIsConstructor004
         * @tc.desc Verify that isConstructor does not throw Error and returns boolean
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            const result = method.isConstructor();
            expect(typeof result).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0500
         * @tc.name testMethodIsConstructor005
         * @tc.desc Verify that isConstructor returns true for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            let result: boolean = method.isConstructor();
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0600
         * @tc.name testMethodIsConstructor006
         * @tc.desc Verify that isConstructor returns false for a normal method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getMethodByName("normalMethod");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0700
         * @tc.name testMethodIsConstructor007
         * @tc.desc Verify that isConstructor return value is correctly used in if condition and ternary expression
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctorMethod = (Type.from<IsCtorTernaryIfSample>() as ClassType).getConstructor(0);
            const regMethod = (Type.from<IsCtorTernaryIfSample>() as ClassType).getMethodByName("regularMethod");
            let branchResult: string = "";
            if (ctorMethod.isConstructor()) {
                branchResult = "constructor";
            } else {
                branchResult = "notConstructor";
            }
            expect(branchResult).assertEqual("constructor");
            const ternaryResult: string = regMethod.isConstructor() ? "constructor" : "method";
            expect(ternaryResult).assertEqual("method");
            expect(ctorMethod.isConstructor() && !regMethod.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0800
         * @tc.name testMethodIsConstructor008
         * @tc.desc Verify that repeated alternating calls to isConstructor on constructor and non-constructor methods return consistent results
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorMixedSample>() as ClassType;
            const ctorMethod = classType.getConstructor(0);
            const instanceMethod = classType.getMethodByName("instanceMethod");
            expect(ctorMethod.isConstructor()).assertTrue();
            expect(instanceMethod.isConstructor()).assertFalse();
            expect(ctorMethod.isConstructor()).assertTrue();
            expect(instanceMethod.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_0900
         * @tc.name testMethodIsConstructor009
         * @tc.desc Verify that isConstructor interacts correctly with isStatic and getName on constructor and static method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorMixedSample>() as ClassType;
            const ctorMethod = classType.getConstructor(0);
            let staticMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticMethod" && m.isStatic()) {
                    staticMethod = m;
                    break;
                }
            }
            expect(ctorMethod.isConstructor()).assertTrue();
            expect(ctorMethod.isStatic()).assertFalse();
            expect(staticMethod!.isConstructor()).assertFalse();
            expect(staticMethod!.isStatic()).assertTrue();
            expect(typeof ctorMethod.getName()).assertEqual("string");
            expect(typeof staticMethod!.getName()).assertEqual("string");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1000
         * @tc.name testMethodIsConstructor010
         * @tc.desc Verify that isConstructor consistently returns boolean across constructor, instance, and static methods of the same class
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorMixedSample>() as ClassType;
            const ctor = classType.getConstructor(0);
            const inst = classType.getMethodByName("instanceMethod");
            let stat: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticMethod" && m.isStatic()) {
                    stat = m;
                    break;
                }
            }
            const ctorResult: boolean = ctor.isConstructor();
            const instResult: boolean = inst.isConstructor();
            const statResult: boolean = stat!.isConstructor();
            expect(ctorResult).assertTrue();
            expect(instResult).assertFalse();
            expect(statResult).assertFalse();
            expect(typeof ctorResult).assertEqual("boolean");
            expect(typeof instResult).assertEqual("boolean");
            expect(typeof statResult).assertEqual("boolean");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1100
         * @tc.name testMethodIsConstructor011
         * @tc.desc Verify constructor with parameters is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorParamCtorSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1200
         * @tc.name testMethodIsConstructor012
         * @tc.desc Verify default constructor generated for class without explicit constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorDefaultSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1300
         * @tc.name testMethodIsConstructor013
         * @tc.desc Verify instance method with return value is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorReturnSample>() as ClassType).getMethodByName("getValue");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1400
         * @tc.name testMethodIsConstructor014
         * @tc.desc Verify static method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorMixedSample>() as ClassType, "staticMethod", true);
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1500
         * @tc.name testMethodIsConstructor015
         * @tc.desc Verify getter method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorAccessorSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1600
         * @tc.name testMethodIsConstructor016
         * @tc.desc Verify setter method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorAccessorSample>() as ClassType).getMethodByName("%%set-data");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1700
         * @tc.name testMethodIsConstructor017
         * @tc.desc Verify async method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorAsyncSample>() as ClassType).getMethodByName("fetch");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1800
         * @tc.name testMethodIsConstructor018
         * @tc.desc Verify private constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorPrivateSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_1900
         * @tc.name testMethodIsConstructor019
         * @tc.desc Verify protected constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorProtectedSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2000
         * @tc.name testMethodIsConstructor020
         * @tc.desc Verify public constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorPublicSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2100
         * @tc.name testMethodIsConstructor021
         * @tc.desc Verify private instance method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorPrivateMethodSample>() as ClassType, "work");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2200
         * @tc.name testMethodIsConstructor022
         * @tc.desc Verify protected instance method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorProtectedMethodSample>() as ClassType, "helper");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2300
         * @tc.name testMethodIsConstructor023
         * @tc.desc Verify abstract class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorAbstractSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2400
         * @tc.name testMethodIsConstructor024
         * @tc.desc Verify abstract method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorAbstractMethodSample>() as ClassType, "foo");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2500
         * @tc.name testMethodIsConstructor025
         * @tc.desc Verify concrete method in abstract class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorAbstractMethodSample>() as ClassType, "bar");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2600
         * @tc.name testMethodIsConstructor026
         * @tc.desc Verify static method in abstract class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorAbstractMethodSample>() as ClassType, "init", true);
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2700
         * @tc.name testMethodIsConstructor027
         * @tc.desc Verify child class explicit constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorDerivedSub>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2800
         * @tc.name testMethodIsConstructor028
         * @tc.desc Verify parent class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorDerivedBase>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_2900
         * @tc.name testMethodIsConstructor029
         * @tc.desc Verify child class default constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorDefaultChild>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3000
         * @tc.name testMethodIsConstructor030
         * @tc.desc Verify inherited parent instance method on child type is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorInheritedMethodChild>() as ClassType, "greet");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3100
         * @tc.name testMethodIsConstructor031
         * @tc.desc Verify overridden child instance method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorOverrideChild>() as ClassType, "greet");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3200
         * @tc.name testMethodIsConstructor032
         * @tc.desc Verify inherited static method on child type is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorInheritedMethodChild>() as ClassType, "parentStatic", true);
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3300
         * @tc.name testMethodIsConstructor033
         * @tc.desc Verify grandchild class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorGrandChild>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3400
         * @tc.name testMethodIsConstructor034
         * @tc.desc Verify grandparent class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorGreatGrandparent>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3500
         * @tc.name testMethodIsConstructor035
         * @tc.desc Verify overloaded ordinary method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorOverloadSample>() as ClassType, "test");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3600
         * @tc.name testMethodIsConstructor036
         * @tc.desc Verify static field does not appear as constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const hasMethod = hasIsCtorMethod(Type.from<IsCtorStaticFieldSample>() as ClassType, "staticValue");
            expect(hasMethod).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3700
         * @tc.name testMethodIsConstructor037
         * @tc.desc Verify constructor assigning public field is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorPublicParamSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3800
         * @tc.name testMethodIsConstructor038
         * @tc.desc Verify constructor assigning readonly field is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorReadonlyParamSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_3900
         * @tc.name testMethodIsConstructor039
         * @tc.desc Verify constructor getName is constructor name and remains constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            expect(method.getName()).assertEqual("constructor");
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4000
         * @tc.name testMethodIsConstructor040
         * @tc.desc Verify constructor owner type matches ordinary method owner type
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorOwnerTypeSample>() as ClassType;
            const ctor = classType.getConstructor(0);
            const method = classType.getMethodByName("sameOwner");
            expect(ctor.getOwnerType().getName()).assertEqual(method.getOwnerType().getName());
            expect(ctor.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4100
         * @tc.name testMethodIsConstructor041
         * @tc.desc Verify constructor type can be queried and constructor flag remains true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            expect(method.getType() !== undefined).assertTrue();
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4200
         * @tc.name testMethodIsConstructor042
         * @tc.desc Verify abstract class constructor is not abstract method but is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorAbstractSample>() as ClassType).getConstructor(0);
            expect(method.isAbstract()).assertFalse();
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4300
         * @tc.name testMethodIsConstructor043
         * @tc.desc Verify class implementing interface constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorInterfaceImplSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4400
         * @tc.name testMethodIsConstructor044
         * @tc.desc Verify interface implementation method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorInterfaceImplSample>() as ClassType).getMethodByName("run");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4500
         * @tc.name testMethodIsConstructor045
         * @tc.desc Verify namespace class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNamespaceSample.NamespacedCtor>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4600
         * @tc.name testMethodIsConstructor046
         * @tc.desc Verify subclass constructor with super call is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorChild>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4700
         * @tc.name testMethodIsConstructor047
         * @tc.desc Verify constructor using this assignment is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorThisUsageSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4800
         * @tc.name testMethodIsConstructor048
         * @tc.desc Verify method returning this is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorChainMethodSample>() as ClassType).getMethodByName("chain");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_4900
         * @tc.name testMethodIsConstructor049
         * @tc.desc Verify toString override method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorObjectMethodSample>() as ClassType).getMethodByName("toString");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5000
         * @tc.name testMethodIsConstructor050
         * @tc.desc Verify valueOf override method is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorObjectMethodSample>() as ClassType).getMethodByName("valueOf");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5100
         * @tc.name testMethodIsConstructor051
         * @tc.desc Verify comprehensive class constructor is the only constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorComprehensiveSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5200
         * @tc.name testMethodIsConstructor052
         * @tc.desc Verify async method in comprehensive class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorComprehensiveSample>() as ClassType).getMethodByName("fetch");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5300
         * @tc.name testMethodIsConstructor053
         * @tc.desc Verify static method in comprehensive class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorComprehensiveSample>() as ClassType, "create", true);
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5400
         * @tc.name testMethodIsConstructor054
         * @tc.desc Verify getter in comprehensive class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorComprehensiveSample>() as ClassType).getMethodByName("%%get-data");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5500
         * @tc.name testMethodIsConstructor055
         * @tc.desc Verify setter in comprehensive class is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorComprehensiveSample>() as ClassType).getMethodByName("%%set-data");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5600
         * @tc.name testMethodIsConstructor056
         * @tc.desc Verify constructor with many parameters is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorManyParamsSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5700
         * @tc.name testMethodIsConstructor057
         * @tc.desc Verify constructor with optional parameter is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorOptParamSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5800
         * @tc.name testMethodIsConstructor058
         * @tc.desc Verify generic class constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorGenericSample<string>>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_5900
         * @tc.name testMethodIsConstructor059
         * @tc.desc Verify older grandparent constructor is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorGrandparent>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6000
         * @tc.name testMethodIsConstructor060
         * @tc.desc Verify parent constructor in multi-level inheritance is constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorParent>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6100
         * @tc.name testMethodIsConstructor061
         * @tc.desc Verify ordinary method repeated calls remain not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getMethodByName("normalMethod");
            expect(method.isConstructor()).assertFalse();
            expect(method.isConstructor()).assertFalse();
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6200
         * @tc.name testMethodIsConstructor062
         * @tc.desc Verify repeated isConstructor calls on constructor remain true
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            for (let i: int = 0; i < 20; i += 1) {
                expect(method.isConstructor()).assertTrue();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6300
         * @tc.name testMethodIsConstructor063
         * @tc.desc Verify instance field does not appear as constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const hasMethod = hasIsCtorMethod(Type.from<IsCtorStaticFieldSample>() as ClassType, "instanceValue");
            expect(hasMethod).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6400
         * @tc.name testMethodIsConstructor064
         * @tc.desc Verify multiple constructor Method objects remain constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const first = (Type.from<IsCtorNormalSample>() as ClassType).getConstructor(0);
            const second = (Type.from<IsCtorParamCtorSample>() as ClassType).getConstructor(0);
            const third = (Type.from<IsCtorThisUsageSample>() as ClassType).getConstructor(0);
            expect(first.isConstructor()).assertTrue();
            expect(second.isConstructor()).assertTrue();
            expect(third.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6500
         * @tc.name testMethodIsConstructor065
         * @tc.desc Verify method named similarly to factory create is not constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsCtorMethod(Type.from<IsCtorComprehensiveSample>() as ClassType, "create", true);
            expect(method.getName()).assertEqual("create");
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6600
         * @tc.name testMethodIsConstructor066
         * @tc.desc Verify constructor lookup after instance creation still returns constructor method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const sample = new IsCtorThisUsageSample();
            expect(sample.value).assertEqual(42);
            const method = (Type.from<IsCtorThisUsageSample>() as ClassType).getConstructor(0);
            expect(method.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6700
         * @tc.name testMethodIsConstructor067
         * @tc.desc Verify constructor and ordinary method from same class have different constructor flags
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor067', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorOwnerTypeSample>() as ClassType;
            const ctor = classType.getConstructor(0);
            const method = classType.getMethodByName("sameOwner");
            expect(ctor.isConstructor()).assertTrue();
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6800
         * @tc.name testMethodIsConstructor068
         * @tc.desc Verify constructor flag is independent of method access through ClassType
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor068', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorMixedSample>() as ClassType;
            const ctor = classType.getConstructor(0);
            const method = classType.getMethodByName("instanceMethod");
            expect(ctor.isConstructor()).assertTrue();
            expect(method.isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_6900
         * @tc.name testMethodIsConstructor069
         * @tc.desc Verify parent default constructor and child explicit constructor are constructors
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor069', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentCtor = (Type.from<IsCtorInheritedMethodParent>() as ClassType).getConstructor(0);
            const childCtor = (Type.from<IsCtorOverrideChild>() as ClassType).getConstructor(0);
            expect(parentCtor.isConstructor()).assertTrue();
            expect(childCtor.isConstructor()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_7000
         * @tc.name testMethodIsConstructor070
         * @tc.desc Verify only constructor returns true in class containing constructor async static getter and setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorComprehensiveSample>() as ClassType;
            expect(classType.getConstructor(0).isConstructor()).assertTrue();
            expect(classType.getMethodByName("fetch").isConstructor()).assertFalse();
            expect(findIsCtorMethod(classType, "create", true).isConstructor()).assertFalse();
            expect(classType.getMethodByName("%%get-data").isConstructor()).assertFalse();
            expect(classType.getMethodByName("%%set-data").isConstructor()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_CONSTRUCTOR_7100
         * @tc.name testMethodIsConstructor071
         * @tc.desc Verify overloaded methods are not constructors
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsConstructor071', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsCtorMethodOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.isConstructor()).assertFalse();
            expect(twoParamMethod!.isConstructor()).assertFalse();
        });
    });
}
