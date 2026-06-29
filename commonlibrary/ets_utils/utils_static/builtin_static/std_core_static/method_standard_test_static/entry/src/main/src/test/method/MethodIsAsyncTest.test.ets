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

class IsAsyncSyncSample {
    add(value: int): int {
        return value + 1;
    }
}

class IsAsyncAsyncSample {
    async fetchData(): Promise<string> {
        return "data";
    }
}

class IsAsyncPromiseSample {
    getData(): Promise<number> {
        return new Promise<number>((resolve) => { resolve(42); });
    }
}

class IsAsyncChildSample {
    constructor() {}
}

class IsAsyncGetterSample {
    private _value: int = 0;
    get value(): int {
        return this._value;
    }
}

class IsAsyncSetterSample {
    private _value: int = 0;
    set value(v: int) {
        this._value = v;
    }
}

class IsAsyncMultiMethodSample {
    syncMethod(): void {}
    async asyncMethod(): Promise<void> {}
}

class IsAsyncParent {
    async parentMethod(): Promise<string> {
        return "parent";
    }
}

class IsAsyncChild extends IsAsyncParent {
    childMethod(): int {
        return 1;
    }
}

class IsAsyncParentSync {
    parentSync(): int {
        return 10;
    }
}

class IsAsyncChildSync extends IsAsyncParentSync {}

class IsAsyncOverrideParent {
    async doWork(): Promise<string> {
        return "parent work";
    }
}

class IsAsyncOverrideChild extends IsAsyncOverrideParent {
    async doWork(): Promise<string> {
        return "child work";
    }
}

class IsAsyncStaticAsyncSample {
    static async staticAsyncMethod(): Promise<string> {
        return "static async";
    }
}

class IsAsyncStaticSyncSample {
    static staticSyncMethod(): int {
        return 42;
    }
}

class IsAsyncCombinedStaticSample {
    static async staticAsyncCombined(): Promise<string> {
        return "combined";
    }
    static staticSyncCombined(): int {
        return 1;
    }
}

class IsAsyncGetNameSample {
    async fetchItem(): Promise<string> {
        return "item";
    }
    processItem(): int {
        return 0;
    }
}

class IsAsyncErrorSample {
    async faultyMethod(): Promise<string> {
        throw new Error("simulated error");
    }
    normalMethod(): int {
        return 1;
    }
}

class IsAsyncPrivateProtectedSample {
    private async privateAsyncMethod(): Promise<string> {
        return "private";
    }
    protected async protectedAsyncMethod(): Promise<string> {
        return "protected";
    }
    public async publicAsyncMethod(): Promise<string> {
        return "public";
    }
}

class IsAsyncPublicDefaultSample {
    async publicDefaultMethod(): Promise<string> {
        return "default";
    }
}

class IsAsyncReturnTypesSample {
    async returnNumber(): Promise<number> {
        return 1;
    }
    async returnBoolean(): Promise<boolean> {
        return false;
    }
    async returnUser(): Promise<IsAsyncUserSample> {
        return new IsAsyncUserSample();
    }
}

class IsAsyncUserSample {
    id: int = 1;
}

class IsAsyncGenericSample<T> {
    async getValue(value: T): Promise<T> {
        return value;
    }
}

class IsAsyncParamSample {
    async defaultParam(value: string = "Hi"): Promise<string> {
        return value;
    }
    async restParam(...values: string[]): Promise<int> {
        return values.length;
    }
    async optionalParam(value?: string): Promise<string> {
        if (value === undefined) {
            return "none";
        }
        return value;
    }
}

class IsAsyncThisSample {
    count: int = 0;
    async chain(): Promise<IsAsyncThisSample> {
        return this;
    }
}

class IsAsyncStateSample {
    count: int = 0;
    async increment(): Promise<void> {
        this.count += 1;
    }
}

class IsAsyncAwaitSample {
    async wait(): Promise<string> {
        await Promise.resolve();
        return "ok";
    }
}

class IsAsyncPromiseAllSample {
    async all(): Promise<void> {
        await Promise.all<void>([]);
    }
}

class IsAsyncInterfaceAsyncImpl {
    async run(): Promise<string> {
        return "impl";
    }
}

class IsAsyncStaticPrivateSample {
    private static async privateStaticAsync(): Promise<int> {
        return 7;
    }
    protected static async protectedStaticAsync(): Promise<int> {
        return 8;
    }
    public static async publicStaticAsync(): Promise<int> {
        return 9;
    }
}

class IsAsyncStaticParent {
    static async staticParentAsync(): Promise<string> {
        return "parentStatic";
    }
}

class IsAsyncStaticChild extends IsAsyncStaticParent {
}

class IsAsyncAsyncThrowSample {
    async faulty(): Promise<string> {
        throw new Error("async fail");
    }
}

class IsAsyncNormalReturnPromiseSample {
    getPromise(): Promise<int> {
        return Promise.resolve(1);
    }
}

class IsAsyncOverloadSample {
    method(value: int): void {}
    method(value: int, text: string): void {}
}

function findIsAsyncMethod(classType: ClassType, name: string, wantStatic?: boolean): Method {
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

export default function MethodIsAsyncTest(): void {
    describe('MethodIsAsyncTest', () => {
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
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0100
         * @tc.name testMethodIsAsync001
         * @tc.desc Verify that isAsync can be called without parameters and returns false for sync method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncSyncSample>() as ClassType).getMethodByName("add");
            let result: boolean = method.isAsync();
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0200
         * @tc.name testMethodIsAsync002
         * @tc.desc Verify that isAsync returns true for an async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncAsyncSample>() as ClassType).getMethodByName("fetchData");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0300
         * @tc.name testMethodIsAsync003
         * @tc.desc Verify that isAsync returns false for a method returning Promise without async keyword
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncPromiseSample>() as ClassType).getMethodByName("getData");
            let result: boolean = method.isAsync();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0400
         * @tc.name testMethodIsAsync004
         * @tc.desc Verify that isAsync returns false for a constructor
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const ctor = (Type.from<IsAsyncChildSample>() as ClassType).getConstructor(0);
            expect(ctor.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0500
         * @tc.name testMethodIsAsync005
         * @tc.desc Verify that isAsync returns boolean for a getter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncGetterSample>() as ClassType).getMethodByName("%%get-value");
            let result: boolean = method.isAsync();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0600
         * @tc.name testMethodIsAsync006
         * @tc.desc Verify that isAsync returns boolean for a setter
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncSetterSample>() as ClassType).getMethodByName("%%set-value");
            let result: boolean = method.isAsync();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0700
         * @tc.name testMethodIsAsync007
         * @tc.desc Verify that isAsync return value is strictly boolean for both sync and async methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const syncMethod = (Type.from<IsAsyncMultiMethodSample>() as ClassType).getMethodByName("syncMethod");
            const asyncMethod = (Type.from<IsAsyncMultiMethodSample>() as ClassType).getMethodByName("asyncMethod");
            let syncResult: boolean = syncMethod.isAsync();
            let asyncResult: boolean = asyncMethod.isAsync();
            expect(syncResult).assertFalse();
            expect(asyncResult).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0800
         * @tc.name testMethodIsAsync008
         * @tc.desc Verify that multiple calls to isAsync return consistent results for sync and async methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const syncMethod = (Type.from<IsAsyncSyncSample>() as ClassType).getMethodByName("add");
            const asyncMethod = (Type.from<IsAsyncAsyncSample>() as ClassType).getMethodByName("fetchData");
            let syncResult1: boolean = syncMethod.isAsync();
            let syncResult2: boolean = syncMethod.isAsync();
            let asyncResult1: boolean = asyncMethod.isAsync();
            let asyncResult2: boolean = asyncMethod.isAsync();
            expect(syncResult1).assertFalse();
            expect(syncResult2).assertFalse();
            expect(asyncResult1).assertTrue();
            expect(asyncResult2).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_0900
         * @tc.name testMethodIsAsync009
         * @tc.desc Verify that isAsync returns true for inherited async method from parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentMethod = (Type.from<IsAsyncChild>() as ClassType).getMethodByName("parentMethod");
            expect(parentMethod.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1000
         * @tc.name testMethodIsAsync010
         * @tc.desc Verify that isAsync returns false for inherited sync method from parent
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const parentSync = (Type.from<IsAsyncChildSync>() as ClassType).getMethodByName("parentSync");
            expect(parentSync.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1100
         * @tc.name testMethodIsAsync011
         * @tc.desc Verify that isAsync returns true for child overriding parent async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = (Type.from<IsAsyncOverrideChild>() as ClassType).getMethodByName("doWork");
            let result: boolean = method.isAsync();
            expect(typeof result).assertEqual("boolean");
            expect(result).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1200
         * @tc.name testMethodIsAsync012
         * @tc.desc Verify that isAsync returns true for a static async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncStaticAsyncSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticAsyncMethod" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            expect(method!.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1300
         * @tc.name testMethodIsAsync013
         * @tc.desc Verify that isAsync returns false for a static sync method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncStaticSyncSample>() as ClassType;
            let method: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.getName() === "staticSyncMethod" && m.isStatic()) {
                    method = m;
                    break;
                }
            }
            expect(method!.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1400
         * @tc.name testMethodIsAsync014
         * @tc.desc Verify that isAsync combined with isStatic returns correct values for static methods
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncCombinedStaticSample>() as ClassType;
            let asyncMethod: Method | undefined = undefined;
            let syncMethod: Method | undefined = undefined;
            for (let i: long = 0; i < classType.getMethodsNum(); i += 1) {
                const m = classType.getMethod(i);
                if (m.isStatic()) {
                    if (m.getName() === "staticAsyncCombined") {
                        asyncMethod = m;
                    } else if (m.getName() === "staticSyncCombined") {
                        syncMethod = m;
                    }
                }
            }
            expect(asyncMethod!.isAsync()).assertTrue();
            expect(syncMethod!.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1500
         * @tc.name testMethodIsAsync015
         * @tc.desc Verify that isAsync combined with getName returns correct method metadata
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncGetNameSample>() as ClassType;
            const asyncMethod = classType.getMethodByName("fetchItem");
            const syncMethod = classType.getMethodByName("processItem");
            expect(asyncMethod.isAsync()).assertTrue();
            expect(asyncMethod.getName()).assertEqual("fetchItem");
            expect(syncMethod.isAsync()).assertFalse();
            expect(syncMethod.getName()).assertEqual("processItem");
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1600
         * @tc.name testMethodIsAsync016
         * @tc.desc Verify that isAsync returns true for a faulty async method during simulated error flow
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncErrorSample>() as ClassType;
            const method = classType.getMethodByName("faultyMethod");
            let catchCalled: boolean = false;
            try {
                let result: boolean = method.isAsync();
                expect(result).assertTrue();
                throw new Error("simulated error");
            } catch (e) {
                catchCalled = e.name === 'Error' && e.message === 'simulated error'
                expect(catchCalled).assertTrue();
            }
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1700
         * @tc.name testMethodIsAsync017
         * @tc.desc Verify isAsync returns true for private async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncPrivateProtectedSample>() as ClassType, "privateAsyncMethod");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1800
         * @tc.name testMethodIsAsync018
         * @tc.desc Verify isAsync returns true for protected async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncPrivateProtectedSample>() as ClassType, "protectedAsyncMethod");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_1900
         * @tc.name testMethodIsAsync019
         * @tc.desc Verify isAsync returns true for public async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncPrivateProtectedSample>() as ClassType, "publicAsyncMethod");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2000
         * @tc.name testMethodIsAsync020
         * @tc.desc Verify isAsync returns true for default-access async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncPublicDefaultSample>() as ClassType, "publicDefaultMethod");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2100
         * @tc.name testMethodIsAsync021
         * @tc.desc Verify async method returning number is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncReturnTypesSample>() as ClassType, "returnNumber");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2200
         * @tc.name testMethodIsAsync022
         * @tc.desc Verify async method returning boolean is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncReturnTypesSample>() as ClassType, "returnBoolean");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2300
         * @tc.name testMethodIsAsync023
         * @tc.desc Verify async method returning user class is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncReturnTypesSample>() as ClassType, "returnUser");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2400
         * @tc.name testMethodIsAsync024
         * @tc.desc Verify async generic method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncGenericSample<string>>() as ClassType, "getValue");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2500
         * @tc.name testMethodIsAsync025
         * @tc.desc Verify async method with default parameter is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncParamSample>() as ClassType, "defaultParam");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2600
         * @tc.name testMethodIsAsync026
         * @tc.desc Verify async method with rest parameters is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncParamSample>() as ClassType, "restParam");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2700
         * @tc.name testMethodIsAsync027
         * @tc.desc Verify async method with optional parameter is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncParamSample>() as ClassType, "optionalParam");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2800
         * @tc.name testMethodIsAsync028
         * @tc.desc Verify async method returning this is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncThisSample>() as ClassType, "chain");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_2900
         * @tc.name testMethodIsAsync029
         * @tc.desc Verify async method modifying state is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncStateSample>() as ClassType, "increment");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3000
         * @tc.name testMethodIsAsync030
         * @tc.desc Verify async method with await is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncAwaitSample>() as ClassType, "wait");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3100
         * @tc.name testMethodIsAsync031
         * @tc.desc Verify async method with Promise.all is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncPromiseAllSample>() as ClassType, "all");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3200
         * @tc.name testMethodIsAsync032
         * @tc.desc Verify async interface implementation method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncInterfaceAsyncImpl>() as ClassType, "run");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3300
         * @tc.name testMethodIsAsync033
         * @tc.desc Verify private static async method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncStaticPrivateSample>() as ClassType, "privateStaticAsync", true);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3400
         * @tc.name testMethodIsAsync034
         * @tc.desc Verify protected static async method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncStaticPrivateSample>() as ClassType, "protectedStaticAsync", true);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3500
         * @tc.name testMethodIsAsync035
         * @tc.desc Verify public static async method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncStaticPrivateSample>() as ClassType, "publicStaticAsync", true);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3600
         * @tc.name testMethodIsAsync036
         * @tc.desc Verify inherited static async method is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncStaticChild>() as ClassType, "staticParentAsync", true);
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3700
         * @tc.name testMethodIsAsync037
         * @tc.desc Verify synchronous Promise-returning method is not async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncNormalReturnPromiseSample>() as ClassType, "getPromise");
            expect(method.isAsync()).assertFalse();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3800
         * @tc.name testMethodIsAsync038
         * @tc.desc Verify async method that throws is async
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncAsyncThrowSample>() as ClassType, "faulty");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_3900
         * @tc.name testMethodIsAsync039
         * @tc.desc Verify async method result is stable across repeated calls
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncAsyncSample>() as ClassType, "fetchData");
            expect(method.isAsync()).assertTrue();
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_4000
         * @tc.name testMethodIsAsync040
         * @tc.desc Verify getName and isAsync together on async method
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const method = findIsAsyncMethod(Type.from<IsAsyncGetNameSample>() as ClassType, "fetchItem");
            expect(method.getName()).assertEqual("fetchItem");
            expect(method.isAsync()).assertTrue();
        });

        /**
         * @tc.number SUB_COMMONLIBRARY_UTIL_METHOD_IS_ASYNC_4100
         * @tc.name testMethodIsAsync041
         * @tc.desc Verify overloaded methods are not async by default
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 2
         */
        it('testMethodIsAsync041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, (): void => {
            const classType = Type.from<IsAsyncOverloadSample>() as ClassType;
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
            expect(oneParamMethod!.isAsync()).assertFalse();
            expect(twoParamMethod!.isAsync()).assertFalse();
        });
    });
}
