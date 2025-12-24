/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import {describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import hilog from '@ohos.hilog'
import Utils from './Util.test';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为
class A {}
class A_bool {
    toString1 = (): boolean => {
        return true;
    }
}
class A_num {
    toString1 = (): number => {
        return 0;
    }
}
class A_str {
    toString1 = (): string => {
        return '';
    }
}
class A_und {
    toString1 = (): undefined => {
        return undefined;
    }
}

class A_null {
    toString1 = (): null => {
        return null;
    }
}

class A_nan {
    toString1 = (): number => {
        return NaN;
    }
}
type FuncType = (val: number, idx: int, obj: Array<number>) => boolean;
export async function sleep(time: int): Promise<int> {
    return new Promise<int>((resolve, reject) => {
        setTimeout(() => {
            resolve(0);
        }, time);
    });
}

let originalArray = [0, 1, -2, 4, -8, 16];
let array = [0, 1, -2, 4, -8, 16];
let arrayIndex = -1;
function mapFn(value: number, index: number): number {
    arrayIndex++;
    expect(value).assertEqual(array[arrayIndex]);
    expect(index).assertEqual(arrayIndex);
    array.splice((array.length - 1), 1);
    return 127;
}

export default function EsArrayTest001(){
    describe('EsArrayTest001', ():void => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(():void => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(async ():Promise<void> => {
            await sleep(10);
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(():void => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(():void => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })

        /**
         * @tc.number ES_BUILTINS_ARRAY_0001
         * @tc.name ESBuiltinsArrayTest0001
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0001';
            console.info(`${caseName}, test start`);
            let a = Array.from(array, mapFn);
            expect(a.length).assertEqual(originalArray.length / 2);
            for (let j = 0; j < originalArray.length / 2; j++) {
                expect(a[j]).assertEqual(127);
            }
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0002
         * @tc.name ESBuiltinsArrayTest0002
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0002';
            console.info(`${caseName}, test start`);
            let array: Array<number | string> = [0, 'foo', 1, Infinity];
            let result = Array.from(array);

            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual(0);
            expect(result[1]).assertEqual('foo');
            expect(result[2]).assertEqual(1);
            expect(result[3]).assertEqual(Infinity);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0003
         * @tc.name ESBuiltinsArrayTest0003
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0003';
            console.info(`${caseName}, test start`);
            let arrLikeSource = 'Test';
            let result = Array.from(arrLikeSource);

            expect(result.length).assertEqual(4);
            expect(result[0]).assertEqual('T');
            expect(result[1]).assertEqual('e');
            expect(result[2]).assertEqual('s');
            expect(result[3]).assertEqual('t');

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0004
         * @tc.name ESBuiltinsArrayTest0004
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0004';
            console.info(`${caseName}, test start`);
            let array = [Number.MAX_VALUE, Number.MIN_VALUE, Number.NaN, Number.NEGATIVE_INFINITY, Number.POSITIVE_INFINITY];
            let a = Array.from(array);

            expect(a.length).assertEqual(array.length);
            expect(a[0]).assertEqual(Number.MAX_VALUE);
            expect(a[1]).assertEqual(Number.MIN_VALUE);
            expect(Number.NaN === Number.NaN).assertFalse();
            expect(a[2] === Number.NaN).assertFalse();
            expect(a[2] === a[2]).assertFalse();
            expect(a[3]).assertEqual(Number.NEGATIVE_INFINITY);
            expect(a[4]).assertEqual(Number.POSITIVE_INFINITY);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0005
         * @tc.name ESBuiltinsArrayTest0005
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0005';
            console.info(`${caseName}, test start`);

            expect(Array.isArray(undefined)).assertEqual(false);
            expect(Array.isArray(null)).assertEqual(false);

            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0006
         * @tc.name ESBuiltinsArrayTest0006
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0006';
            console.info(`${caseName}, test start`);
            let a = new Array<String>(0);
            expect(a.length).assertEqual(0);

            let b = new Array<Double>(1);
            expect(b.length).assertEqual(1);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0007
         * @tc.name ESBuiltinsArrayTest0007
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0007';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            let threw = false;
            try {
                x.length = 2;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0008
         * @tc.name ESBuiltinsArrayTest0008
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0008';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            let threw = false;
            try {
                x.length = -1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0009
         * @tc.name ESBuiltinsArrayTest0009
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0009';
            console.info(`${caseName}, test start`);
            let x = new Array<int>(1, 2);
            x.length = 2;
            expect(x.length).assertEqual(2);
            x.length = 1;
            expect(x.length).assertEqual(1);
            x.length = 0;
            expect(x.length).assertEqual(0);
            x.length = 0;
            expect(x.length).assertEqual(0);
            let threw = false;
            try {
                x.length = 1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0010
         * @tc.name ESBuiltinsArrayTest0010
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0010';
            console.info(`${caseName}, test start`);
            let a = new Array<string>();
            expect(typeof a).assertEqual('object');
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0011
         * @tc.name ESBuiltinsArrayTest0011
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0011';
            console.info(`${caseName}, test start`);
            let x = new Array<number|undefined>(1000);
            x[2] = 4;
            x[10] = 20;
            x[500] = 100;
            expect(x[2]).assertEqual(4);
            expect(x[10]).assertEqual(20);
            expect(x[500]).assertEqual(100);
            expect(x[0]).assertEqual(undefined);
            expect(x[999]).assertEqual(undefined);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0012
         * @tc.name ESBuiltinsArrayTest0012
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0012';
            console.info(`${caseName}, test start`);
            expect(new Array<string>().length).assertEqual(0);
            expect(new Array<number>(0, 1, 0, 1).length).assertEqual(4);
            expect(new Array<undefined>(undefined, undefined).length).assertEqual(2);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0013
         * @tc.name ESBuiltinsArrayTest0013
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0013';
            console.info(`${caseName}, test start`);
            let x = new Array<number>(
                0, 1, 2, 3, 4, 5, 6, 7, 8, 9,
                10, 11, 12, 13, 14, 15, 16, 17, 18, 19,
                20, 21, 22, 23, 24, 25, 26, 27, 28, 29,
                30, 31, 32, 33, 34, 35, 36, 37, 38, 39,
                40, 41, 42, 43, 44, 45, 46, 47, 48, 49,
                50, 51, 52, 53, 54, 55, 56, 57, 58, 59,
                60, 61, 62, 63, 64, 65, 66, 67, 68, 69,
                70, 71, 72, 73, 74, 75, 76, 77, 78, 79,
                80, 81, 82, 83, 84, 85, 86, 87, 88, 89,
                90, 91, 92, 93, 94, 95, 96, 97, 98, 99
            );
            let result = true;
            for (let i = 0; i < 100; i++) {
                if (x[i] !== i) {
                    result = false;
                }
            }
            expect(result).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0014
         * @tc.name ESBuiltinsArrayTest0014
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0014';
            console.info(`${caseName}, test start`);
            let x = new Array<number>(100);
            x[0] = 1;
            expect(x.length).assertEqual(100);
            x[98] = 1;
            expect(x.length).assertEqual(100);
            x[99] = 1;
            expect(x.length).assertEqual(100);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0015
         * @tc.name ESBuiltinsArrayTest0015
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0015';
            console.info(`${caseName}, test start`);
            let x = Array<number>(101);
            x[100] = 1;
            expect(x.length).assertEqual(101);
            let threw = false;
            try {
                x[199] = 1;
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof RangeError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0016
         * @tc.name ESBuiltinsArrayTest0016
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0016';
            console.info(`${caseName}, test start`);
            let x: Array<number> = new Array<number>();
            expect(x.length).assertEqual(0);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_0017
         * @tc.name ESBuiltinsArrayTest0017
         * @tc.desc Test ES Builtins-Api in Array
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESBuiltinsArrayTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (Done: () => void): Promise<void> => {
            const caseName = 'ESBuiltinsArrayTest0017';
            console.info(`${caseName}, test start`);
            let x: Array<number> = Array.create<number>(11, 15);
            expect(x.length).assertEqual(11);
            x[1] = 1;
            expect(x.length).assertEqual(11);
            x[1] = 1;
            expect(x.length).assertEqual(11);
            x[9] = 1;
            expect(x.length).assertEqual(11);
            console.info(`${caseName}, test end`);
            Done();
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0001
         * @tc.name ESArrayPrototypeTest0001
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0001';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(3, 2, 1, 0);
            expect(a.at(0)).assertEqual(3);
            expect(a.at(2)).assertEqual(1);
            expect(a.at(1)).assertEqual(2);
            expect(a.at(3)).assertEqual(0);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0002
         * @tc.name ESArrayPrototypeTest0002
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0002';
            console.info(`${caseName}, test start`);
            let a = new Array<int>(5);
            a[0] = 0;
            a[2] = 2;
            a[3] = 2;
            expect(a.at(0)).assertEqual(0);
            expect(a.at(2)).assertEqual(2);
            expect(a.at(3)).assertEqual(2);
            let threw = false;
            try {
                a.at(1);
                expect(false).assertTrue();
            } catch (err) {
                if (err instanceof ClassCastError) threw = true;
            }
            expect(threw).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0003
         * @tc.name ESArrayPrototypeTest0003
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0003';
            console.info(`${caseName}, test start`);
            let x = new Array<Int>();
            let y = new Array<Int>(0, 1);
            let z = new Array<Int>(2, 3, 4);
            let arr = x.concat(y, z);

            expect(arr[0]).assertEqual(0);
            expect(arr[1]).assertEqual(1);
            expect(arr[2]).assertEqual(2);
            expect(arr[3]).assertEqual(3);
            expect(arr[4]).assertEqual(4);
            expect(arr.length).assertEqual(5);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0004
         * @tc.name ESArrayPrototypeTest0004
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0004';
            console.info(`${caseName}, test start`);
            let x = new Array<Int>(0, 1);
            let arr = x.concat();

            expect(arr[0]).assertEqual(0);
            expect(arr[1]).assertEqual(1);
            expect(arr.length).assertEqual(2);
            expect(arr === x).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0005
         * @tc.name ESArrayPrototypeTest0005
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0005';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>();
            a.push(0);
            expect(a.length).assertEqual(1);

            a.push(0);
            a.push(2);
            expect(a[1]).assertEqual(0);
            expect(a[2]).assertEqual(2);
            expect(a.hasOwnProperty('1')).assertEqual(true);
            expect(a.hasOwnProperty('2')).assertEqual(true);
            expect(a.hasOwnProperty('3')).assertEqual(false);

            let b = a.concat();
            expect(b.length).assertEqual(3);
            expect(b[0]).assertEqual(0);
            expect(b[1]).assertEqual(0);
            expect(b[2]).assertEqual(2);
            expect(b.hasOwnProperty('1')).assertEqual(true);
            expect(b.hasOwnProperty('2')).assertEqual(true);
            expect(b.hasOwnProperty('3')).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0006
         * @tc.name ESArrayPrototypeTest0006
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0006';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(0, 1, 1, 1, 2);
            arr.copyWithin(0, 1, 4);

            expect(arr.length).assertEqual(5);
            expect(arr[0]).assertEqual(1);
            expect(arr[4]).assertEqual(2);
            expect(arr.hasOwnProperty(1)).assertEqual(true);
            expect(arr.hasOwnProperty(2)).assertEqual(true);
            expect(arr.hasOwnProperty(3)).assertEqual(true);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0007
         * @tc.name ESArrayPrototypeTest0007
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0007';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let aresult1 = a.copyWithin(0, 1, 6);
            expect(aresult1.toString()).assertEqual("1,2,3,3");

            a = new Array<Int>(0, 1, 2, 3);
            let aresult2 = a.copyWithin(0, 1);
            expect(aresult2.toString()).assertEqual("1,2,3,3");

            let b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let bresult1 = b.copyWithin(1, 3, 6);
            expect(bresult1.toString()).assertEqual("0,3,4,5,4,5");

            b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let bresult2 = b.copyWithin(1, 3);
            expect(bresult2.toString()).assertEqual("0,3,4,5,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0008
         * @tc.name ESArrayPrototypeTest0008
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0008';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(6, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(7, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(0, 0);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0009
         * @tc.name ESArrayPrototypeTest0009
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0009';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(6, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(7, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(6, 2);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0010
         * @tc.name ESArrayPrototypeTest0010
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0010';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(0, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(0, 7);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(2, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0011
         * @tc.name ESArrayPrototypeTest0011
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0011';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result1 = a.copyWithin(1, 7);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(3, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(6, 6);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");

            a = new Array<Int>(0, 1, 2, 3, 4, 5);
            result1 = a.copyWithin(10, 10);
            expect(result1.toString()).assertEqual("0,1,2,3,4,5");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0012
         * @tc.name ESArrayPrototypeTest0012
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0012';
            console.info(`${caseName}, test start`);
            let a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            let result1 = a.copyWithin(0, 0);
            expect(result1.toString()).assertEqual("a,b,c,d,e,f");

            a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            result1 = a.copyWithin(0, 2);
            expect(result1.toString()).assertEqual("c,d,e,f,e,f");

            a = new Array<string>('a', 'b', 'c', 'd', 'e', 'f');
            result1 = a.copyWithin(3, 0);
            expect(result1.toString()).assertEqual("a,b,c,a,b,c");

            let b = new Array<Int>(0, 1, 2, 3, 4, 5);
            let result2 = b.copyWithin(1, 4);
            expect(result2.toString()).assertEqual("0,4,5,3,4,5");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0013
         * @tc.name ESArrayPrototypeTest0013
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0013';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let result1 = a.copyWithin(0, 0, 0);
            expect(result1.toString()).assertEqual("0,1,2,3");

            a = new Array<Int>(0, 1, 2, 3);
            result1 = a.copyWithin(0, 0, 2);
            expect(result1.toString()).assertEqual("0,1,2,3");

            a = new Array<Int>(0, 1, 2, 3);
            result1 = a.copyWithin(0, 1, 2);
            expect(result1.toString()).assertEqual("1,1,2,3");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0014
         * @tc.name ESArrayPrototypeTest0014
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0014';
            console.info(`${caseName}, test start`);
            let a = new Array<Int>(0, 1, 2, 3);
            let result1 = a.copyWithin(0, 1, undefined);
            expect(result1.toString()).assertEqual("1,2,3,3");

            let b = new Array<Int>(0, 1, 2, 3);
            let result2 = b.copyWithin(0, 1);
            expect(result2.toString()).assertEqual("1,2,3,3");

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0015
         * @tc.name ESArrayPrototypeTest0015
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0015';
            console.info(`${caseName}, test start`);
            let array = new Array<string>();
            let iterator = array.entries();

            array.push('a');

            let result = iterator.next();
            expect(result.done).assertEqual(false);
            expect(array[0]).assertEqual("a");

            result = iterator.next();
            expect(result.done).assertEqual(true);
            expect(result.value).assertEqual(undefined);

            array.push('b');

            result = iterator.next();
            expect(result.done).assertEqual(true);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0016
         * @tc.name ESArrayPrototypeTest0016
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0016';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[4] = 6;
                return val < 6 ? true : false;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0017
         * @tc.name ESArrayPrototypeTest0017
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0017';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val > 10;
            let a = new Array<Int>(11, 9);
            expect(a.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0018
         * @tc.name ESArrayPrototypeTest0018
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0018';
            console.info(`${caseName}, test start`);
            let calledForThree = false;
            let arr = new Array<Int>(1, 2, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[2] = 3;
                if (val == 3) calledForThree = true;
                return true;
            };

            let res = arr.every(callbackfn);
            expect(calledForThree).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0019
         * @tc.name ESArrayPrototypeTest0019
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0019';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0020
         * @tc.name ESArrayPrototypeTest0020
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0020';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 6);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr.length = 3;
                return val < 4;
            };

            expect(arr.every(callbackfn)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0021
         * @tc.name ESArrayPrototypeTest0021
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0021';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(3);
            arr[0] = 0;
            arr[1] = 1;
            arr[2] = 2;
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                arr[2] = 3;
                return val < 3;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0022
         * @tc.name ESArrayPrototypeTest0022
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0022';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            let res = arr.every(callbackfn);
            expect(res).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0023
         * @tc.name ESArrayPrototypeTest0023
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0023';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val !== 3;
            let res = arr.every(callbackfn);
            expect(res).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0024
         * @tc.name ESArrayPrototypeTest0024
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0024';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let arr = new Array<Int>(10);
            arr[1] = 1;
            let callbackfn = (val: int | undefined, idx: int, obj: Array<Int>): boolean => {
                if(val) {
                    callCnt++;
                }
                return true;
            };
            arr.every(callbackfn);
            expect(callCnt).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0025
         * @tc.name ESArrayPrototypeTest0025
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0025';
            console.info(`${caseName}, test start`);
            let called = 0;
            let a = new Array<Int>();
            a.push(11);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                return val === 11;
            };
            expect(a.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(1);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0026
         * @tc.name ESArrayPrototypeTest0026
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0026';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return idx <= 5;
            };
            expect(arr.every(callbackfn)).assertEqual(false);
            expect(callCnt).assertEqual(7);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0028
         * @tc.name ESArrayPrototypeTest0028
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0028';
            console.info(`${caseName}, test start`);
            let arr = new Array<Int>(0, 1, 2, 3, 4, 5);
            let lastIdx = 0;
            let called = 0;
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                if (lastIdx !== idx) {
                    return false;
                } else {
                    lastIdx++;
                    return true;
                }
            };

            expect(arr.every(callbackfn)).assertEqual(true);
            expect(arr.length).assertEqual(called);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0029
         * @tc.name ESArrayPrototypeTest0029
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0029';
            console.info(`${caseName}, test start`);
            let called = 0;

            let callbackfn = (): boolean => {
                called++;
                return true;
            };

            let a = new Array<Int>(11, 12);

            expect(a.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0030
         * @tc.name ESArrayPrototypeTest0030
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0030';
            console.info(`${caseName}, test start`);
            let called = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                return val > 10;
            };

            let arr = new Array<Int>(11, 12);
            expect(arr.every(callbackfn)).assertEqual(true);
            expect(called).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0031
         * @tc.name ESArrayPrototypeTest0031
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0031';
            console.info(`${caseName}, test start`);
            let accessed = false;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                accessed = true;
                return accessed;
            };

            let a = new Array<Int>();
            a.push(11);

            expect(a.every(callbackfn)).assertEqual(true);
            expect(accessed).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0032
         * @tc.name ESArrayPrototypeTest0032
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0032';
            console.info(`${caseName}, test start`);
            let foo = new Array<Int>(1, 2, 3);

            let cb = (val: Int): boolean => {
                if (val > 2)
                    return false;
                else
                    return true;
            };

            let i = foo.every(cb);
            expect(i).assertEqual(false);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0033
         * @tc.name ESArrayPrototypeTest0033
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0033';
            console.info(`${caseName}, test start`);
            let callCnt = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return true;
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);

            expect(arr.every(callbackfn)).assertEqual(true);
            expect(callCnt).assertEqual(10);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0034
         * @tc.name ESArrayPrototypeTest0034
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0034';
            console.info(`${caseName}, test start`);
            let callCnt = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                callCnt++;
                return true;
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4, 5, 6, 7, 8, 9);
            expect(arr.every(callbackfn)).assertEqual(true);
            expect(callCnt).assertEqual(10);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0035
         * @tc.name ESArrayPrototypeTest0035
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0035';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 1, 2);
            expect(rt1.toString()).assertEqual("0,8,0");

            let a2 = new Array<Int>(0, 0, 0, 0, 0);
            let rt2 = a2.fill(8, -3, 4);
            expect(rt2.toString()).assertEqual("0,0,8,8,0");

            let a3 = new Array<Int>(0, 0, 0, 0, 0);
            let rt3 = a3.fill(8, -2, -1);
            expect(rt3.toString()).assertEqual("0,0,0,8,0");

            let a4 = new Array<Int>(0, 0, 0, 0, 0);
            let rt4 = a4.fill(8, -1, -3);
            expect(rt4.toString()).assertEqual("0,0,0,0,0");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0036
         * @tc.name ESArrayPrototypeTest0036
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0036';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 0, 1);
            expect(rt1.toString()).assertEqual("8,0,0");

            let a2 = new Array<Int>(0, 0, 0);
            let rt2 = a2.fill(8, 0, -1);
            expect(rt2.toString()).assertEqual("8,8,0");

            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8, 0, 5);
            expect(rt3.toString()).assertEqual("8,8,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0037
         * @tc.name ESArrayPrototypeTest0037
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0037';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>(0, 0, 0);
            let rt1 = a1.fill(8, 1);
            expect(rt1.toString()).assertEqual("0,8,8");

            let a2 = new Array<Int>(0, 0, 0);
            let rt2 = a2.fill(8, 4);
            expect(rt2.toString()).assertEqual("0,0,0");

            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8, -1);
            expect(rt3.toString()).assertEqual("0,0,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0038
         * @tc.name ESArrayPrototypeTest0038
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0038';
            console.info(`${caseName}, test start`);
            let a1 = new Array<Int>();
            let rt1 = a1.fill(8);
            expect(rt1.toString()).assertEqual("");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0039
         * @tc.name ESArrayPrototypeTest0039
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0039';
            console.info(`${caseName}, test start`);
            let a3 = new Array<Int>(0, 0, 0);
            let rt3 = a3.fill(8);
            expect(rt3.toString()).assertEqual("8,8,8");
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0044
         * @tc.name ESArrayPrototypeTest0044
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0044';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: Int, idx: int, obj: Array<Int>) => {
                srcArr[2] = 3;
                srcArr[4] = 6;
                return true;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0045
         * @tc.name ESArrayPrototypeTest0045
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0045';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let callbackfn = (val: int, idx: int, obj: Array<Int>) => {
                srcArr[2] = -1;
                srcArr[4] = -1;
                return val > 0;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(3);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[2]).assertEqual(4);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0046
         * @tc.name ESArrayPrototypeTest0046
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0046';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(1, 2, 3, 4, 6);
            let callbackfn = (val: int, idx: int, obj: Array<Int>) => {
                srcArr.length = 2;
                return true;
            };
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(2);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0047
         * @tc.name ESArrayPrototypeTest0047
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0047';
            console.info(`${caseName}, test start`);
            let srcArr = new Array<Int>(10);
            srcArr[1] = 1;
            srcArr[2] = 2;

            let callbackfn = (val: int | undefined, idx: int, obj: Array<Int>) => {
                if(val) {
                    srcArr[1] = 3;
                    return true;
                }
            };
            let resArr = srcArr.filter(callbackfn);
            expect(resArr.length).assertEqual(2);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[1]).assertEqual(2);
            expect(srcArr[1]).assertEqual(3);
            expect(srcArr[2]).assertEqual(2);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0049
         * @tc.name ESArrayPrototypeTest0049
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0049';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                return (idx === 0) && (val === 12);
            };

            let a = new Array<Int>();
            a.push(12);

            let newArr = a.filter(callbackfn);

            expect(newArr.length).assertEqual(1);
            expect(newArr[0]).assertEqual(12);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0050
         * @tc.name ESArrayPrototypeTest0050
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0050';
            console.info(`${caseName}, test start`);
            let lastToIdx = 0;
            let called = 0;

            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => {
                called++;
                if (lastToIdx !== idx) {
                    return false;
                } else {
                    lastToIdx++;
                    return true;
                }
            };

            let arr = new Array<Int>(0, 1, 2, 3, 4);
            let newArr = arr.filter(callbackfn);

            expect(newArr.length).assertEqual(5);
            expect(called).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0051
         * @tc.name ESArrayPrototypeTest0051
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0051';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => true;

            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            srcArr.filter(callbackfn);

            expect(srcArr[0]).assertEqual(1);
            expect(srcArr[1]).assertEqual(2);
            expect(srcArr[2]).assertEqual(3);
            expect(srcArr[3]).assertEqual(4);
            expect(srcArr[4]).assertEqual(5);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0053
         * @tc.name ESArrayPrototypeTest0053
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0053';
            console.info(`${caseName}, test start`);
            let callbackfn = (val: int, idx: int, obj: Array<Int>): boolean => val % 2 !== 0;

            let srcArr = new Array<Int>(1, 2, 3, 4, 5);
            let resArr = srcArr.filter(callbackfn);

            expect(resArr.length).assertEqual(3);
            expect(resArr[0]).assertEqual(1);
            expect(resArr[1]).assertEqual(3);
            expect(resArr[2]).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0054
         * @tc.name ESArrayPrototypeTest0054
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0054';
            console.info(`${caseName}, test start`);
            let called = false;

            let predicate = () => {
                called = true;
                return true;
            };

            let arr: Array<number> = new Array<number>();
            let result = arr.find(predicate);

            expect(called).assertEqual(false);
            expect(result).assertEqual(undefined);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0055
         * @tc.name ESArrayPrototypeTest0055
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0055', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0055';
            console.info(`${caseName}, test start`);
            let arr: Array<string> = new Array<string>('Shoes', 'Car', 'Bike');
            let results: Array<string> = new Array<string>();

            arr.findIndex((kValue: string, index: int, arr: Array<string>) => {
                if (results.length === 0) {
                    arr.splice(1, 1);
                }
                results.push(kValue);
                return true;
            });

            expect(results.length).assertEqual(1);
            expect(results[0]).assertEqual('Shoes');

            results = new Array<string>();
            arr = new Array<string>('Skateboard', 'Barefoot');
            arr.findIndex((kValue: string, index: int) => {
                if (results.length === 0) {
                    arr.push('Motorcycle');
                    arr[1] = 'Magic Carpet';
                }

                results.push(kValue);
                return true;
            });

            expect(results.length).assertEqual(1);
            expect(results[0]).assertEqual('Skateboard');

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0056
         * @tc.name ESArrayPrototypeTest0056
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0056';
            let called = false;
            let predicate = () => {
                called = true;
                return true;
            };

            let array = new Array<boolean>();
            let result = array.findIndex(predicate);

            expect(called).assertEqual(false);
            expect(result).assertEqual(-1);

            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0057
         * @tc.name ESArrayPrototypeTest0057
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0057';
            console.info(`${caseName}, test start`);
            let callCnt = 0;
            let callbackfn = (val: int, idx: int, arr: Array<Int>): void => {
                callCnt++;
            };
            let arr = new Array<Int>(1, 2, 3, 4, 5);
            arr.forEach(callbackfn);
            expect(callCnt).assertEqual(5);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0058
         * @tc.name ESArrayPrototypeTest0058
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0058';
            console.info(`${caseName}, test start`);
            let sample: Array<number> = new Array<number>(7, 7, 7, 7);
            expect(sample.includes(7, 4)).assertEqual(false);
            expect(sample.includes(7, 5)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0059
         * @tc.name ESArrayPrototypeTest0059
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0059';
            console.info(`${caseName}, test start`);
            let sample: Array<number> = new Array<number>(42, 43);
            expect(sample.includes(42, -0)).assertTrue()
            expect(sample.includes(43, -0)).assertTrue()
            expect(sample.includes(44, -0)).assertFalse()
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0060
         * @tc.name ESArrayPrototypeTest0060
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0060';
            console.info(`${caseName}, test start`);
            let calls = 0;
            let sample = new Array<number>();
            expect(sample.includes(0)).assertFalse()
            expect(calls).assertEqual(0)
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0061
         * @tc.name ESArrayPrototypeTest0061
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0061';
            console.info(`${caseName}, test start`);
            let sample = new Array<number>(42, 0, 1, NaN);
            expect(sample.includes(42.0)).assertTrue()
            expect(sample.includes(-0)).assertTrue()
            expect(sample.includes(NaN)).assertTrue()
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0062
         * @tc.name ESArrayPrototypeTest0062
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0062';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("a", 0)).assertEqual(true);
            expect(sample.includes("a", 1)).assertEqual(false);
            expect(sample.includes("a", 2)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0063
         * @tc.name ESArrayPrototypeTest0063
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0063', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0063';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("b", 0)).assertEqual(true);
            expect(sample.includes("b", 1)).assertEqual(true);
            expect(sample.includes("b", 2)).assertEqual(false);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0064
         * @tc.name ESArrayPrototypeTest0064
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0064', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0064';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("c", 0)).assertEqual(true);
            expect(sample.includes("c", 1)).assertEqual(true);
            expect(sample.includes("c", 2)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0065
         * @tc.name ESArrayPrototypeTest0065
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0065', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0065';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("a", -1)).assertEqual(false);
            expect(sample.includes("a", -2)).assertEqual(false);
            expect(sample.includes("a", -3)).assertEqual(true);
            expect(sample.includes("a", -4)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

        /**
         * @tc.number ES_BUILTINS_ARRAY_PROTOTYPE_0066
         * @tc.name ESArrayPrototypeTest0066
         * @tc.desc Test ES Builtins-Api in Array.Prototype
         * @tc.size MediumTest
         * @tc.type Function
         * @tc.level Level 1
         */
        it('ESArrayPrototypeTest0066', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, ():void => {
            const caseName = 'ESArrayPrototypeTest0066';
            console.info(`${caseName}, test start`);
            let sample = new Array<string>("a", "b", "c");
            expect(sample.includes("b", -1)).assertEqual(false);
            expect(sample.includes("b", -2)).assertEqual(true);
            expect(sample.includes("b", -3)).assertEqual(true);
            expect(sample.includes("b", -4)).assertEqual(true);
            console.info(`${caseName}, test end`);
        });

    })
}