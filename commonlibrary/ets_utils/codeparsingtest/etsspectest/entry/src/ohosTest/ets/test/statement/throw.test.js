/*
 * Copyright (c) 2025 SwanLink (Jiangsu) Technology Development Co., LTD.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';

let TAG = '';

export default function ActsThrowTest() {
    describe('ActsThrowTest', () => {
        // Defines a test suite. Two parameters are supported: test suite name and test suite function.
        beforeAll(() => {
            // Presets an action, which is performed only once before all test cases of the test suite start.
            // This API supports only one parameter: preset action function.
        })
        beforeEach(() => {
            // Presets an action, which is performed before each unit test case starts.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: preset action function.
        })
        afterEach(() => {
            // Presets a clear action, which is performed after each unit test case ends.
            // The number of execution times is the same as the number of test cases defined by **it**.
            // This API supports only one parameter: clear action function.
        })
        afterAll(() => {
            // Presets a clear action, which is performed after all test cases of the test suite end.
            // This API supports only one parameter: clear action function.
        })
        /**
         * @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0100
         * @tc.name: testThrow001
         * @tc.desc: Exception handling statement test
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testThrow001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow001';
            let str = "";

            function fn() {
                try {
                    throw 'error message';
                } catch (e) {
                    str = str + e;
                }
            }

            fn();
            expect(str).assertEqual("error message");
        });
        /**
         * @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0200
         * @tc.name: testThrow002
         * @tc.desc: Exception handling statement test
         * @tc.size: MediumTest
         * @tc.type: Function
         * @tc.level: Level 1
         */
        it('testThrow002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow002';
            let num = 0;

            function fn() {
                try {
                    throw 404;
                } catch (e) {
                    num = num + e; // 预期输出：404
                }
            }

            fn();
            expect(num).assertEqual(404);
        });
        /**

         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0300
         @tc.name: testThrow003
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow003';
            let boo = true;

            function fn() {
                try {
                    throw false;
                } catch (e) {
                    boo = false;
                }
            }

            fn();
            expect(boo).assertEqual(false);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0400
         @tc.name: testThrow004
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow004';
            let str = "";

            function fn() {
                try {
                    throw { code: 500, msg: 'server error' };
                } catch (e) {
                    str = str + e.msg; // 预期输出：server error
                }
            }

            fn();
            expect(str).assertEqual("server error");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0500
         @tc.name: testThrow005
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow005';
            let str = "";

            function fn() {
                try {
                    throw new Error('custom error');
                } catch (e) {
                    str = str + `${e.name}: ${e.message}`; // 预期输出：Error: custom error
                }
            }

            fn();
            expect(str).assertEqual("Error: custom error");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0600
         @tc.name: testThrow006
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow006';
            let str = "";

            function fn() {
                try {
                    throw new TypeError('invalid type');
                } catch (e) {
                    str = str + e.name; // 预期输出：TypeError
                }
            }

            fn();
            expect(str).assertEqual("TypeError");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0700
         @tc.name: testThrow007
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow007';
            let log = '';

            function fn() {
                try {
                    log += 'try';
                } catch (e) {
                    log += 'catch';
                }
            }

            fn();
            expect(log).assertEqual("try");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0800
         @tc.name: testThrow008
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow008';
            let log2 = '';

            function fn() {
                try {
                    log2 += 'try';
                    throw 'stop';
                    log2 += 'after'; // 不会执行
                } catch (e) {
                    log2 += 'catch';
                }
            }

            fn();
            expect(log2).assertEqual("trycatch");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_0900
         @tc.name: testThrow009
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow009';
            let str = "";

            function fn() {
                try {
                    throw 'err';
                } catch (e) {
                    str = str + e; // 预期输出：err
                }
                try {
                    console.log(e);
                } catch (ee) { // 预期输出：ReferenceError
                    str = str + ee.name;
                }
            }

            fn();
            expect(str).assertEqual("errReferenceError");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1000
         @tc.name: testThrow010
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow010';
            let str = "";

            function fn() {
                try {
                    throw new Error('log test');
                } catch (e) {
                    str = str + e; // 预期：错误样式输出Error: log test
                }
            }

            fn();
            expect(str).assertEqual("Error: log test");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1100
         @tc.name: testThrow011
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow011', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow011';
            let steps = '';

            function fn() {
                try {
                    steps += '1';
                } catch (e) {
                    steps += '2';
                } finally {
                    steps += '3';
                }
            }

            fn();
            expect(steps).assertEqual("13");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1200
         @tc.name: testThrow012
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow012', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow012';
            let steps2 = '';

            function fn() {
                try {
                    steps2 += 'a';
                    throw 'err';
                } catch (e) {
                    steps2 += 'b';
                } finally {
                    steps2 += 'c';
                }
            }

            fn();
            expect(steps2).assertEqual("abc");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1300
         @tc.name: testThrow013
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow013', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow013';
            let steps3 = '';
            try {

                function fn() {
                    try {
                        steps3 += 'x';
                        throw 'unhandled';
                    } finally {
                        steps3 += 'y';
                    }
                }

                fn();
                expect(steps3).assertEqual("xy");
            } catch (e) {
                expect(e).assertEqual("unhandled");
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1400
         @tc.name: testThrow014
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow014', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow014';

            function test1() {
                try {
                    return 1;
                } finally {
                    return 2;
                }
            } // 预期输出：2

            test1();
            expect(test1()).assertEqual(2);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1500
         @tc.name: testThrow015
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow015', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow015';

            function test2() {
                try {
                    throw 'err';
                    return 1;
                } catch (e) {
                    return 3;
                } finally {
                    return 4;
                }
            } // 预期输出：4

            test2();
            expect(test2()).assertEqual(4);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1600
         @tc.name: testThrow016
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow016';

            function test3() {
                let x = 1;
                try {
                    return x;
                } finally {
                    x = 2;
                }
            } // 预期输出：1（return值已确定，x修改不影响）

            test3();
            expect(test3()).assertEqual(1);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1700
         @tc.name: testThrow017
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow017', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow017';
            let str = "";

            function fn() {
                try {
                    try {
                        throw 'a';
                    } finally {
                        throw 'b';
                    }
                } catch (e) {
                    str = str + e; // 预期输出：b
                }
            }

            fn();
            expect(str).assertEqual("b");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1800
         @tc.name: testThrow018
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow018', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow018';
            let str = "";

            function fn() {
                try {
                    try {
                        throw 'c';
                    } catch (e) {
                        str = str + e; // 预期输出：c
                        throw 'd';
                    } finally {
                        throw 'e';
                    }
                } catch (e) {
                    str = str + e; // 预期输出：e
                }
            }

            fn();
            expect(str).assertEqual("ce");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_1900
         @tc.name: testThrow019
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow019', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow019';
            let outer = '';

            function fn() {
                try {
                    try {
                        throw 'inner';
                    } catch (e) {
                        outer += 'handled';
                    }
                } catch (e) {
                    outer += 'outer';
                } // 预期输出：handled
            }

            fn();
            expect(outer).assertEqual("handled");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2000
         @tc.name: testThrow020
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow020', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow020';
            let outer2 = '';

            function fn() {
                try {
                    try {
                        throw 'escape';
                    } finally {
                        outer2 += 'finally';
                    }
                } catch (e) {
                    outer2 += 'caught';
                } // 预期输出：finallycaught
            }

            fn();
            expect(outer2).assertEqual("finallycaught");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2100
         @tc.name: testThrow021
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow021', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow021';
            let depth = '';

            function fn() {
                try {
                    try {
                        try {
                            throw 'deep';
                        } finally {
                            depth += '1';
                        }
                    } finally {
                        depth += '2';
                    }
                } catch (e) {
                    depth += '3';
                } // 预期输出：123
            }

            fn();
            expect(depth).assertEqual("123");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2200
         @tc.name: testThrow022
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow022', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow022';
            let str = "";

            function fn() {
                try {
                    throw new Error('test');
                } catch (e) {
                    str = str + e.name; // 预期输出：Error
                }
            }

            fn();
            expect(str).assertEqual("Error");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2300
         @tc.name: testThrow023
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow023', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow023';
            let str = "";

            function fn() {
                try {
                    throw new TypeError('type');
                } catch (e) {
                    str = str + e.name; // 预期输出：TypeError
                }
            }

            fn();
            expect(str).assertEqual("TypeError");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2400
         @tc.name: testThrow024
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow024', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow024';
            let str = "";

            function fn() {
                try {
                    throw new RangeError('range');
                } catch (e) {
                    str = str + e.name; // 预期输出：RangeError
                }
            }

            fn();
            expect(str).assertEqual("RangeError");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2500
         @tc.name: testThrow025
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow025', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow025';
            let str = "";

            function fn() {
                try {
                    throw new SyntaxError('invalid syntax');
                } catch (e) {
                    str = str + e.message; // 预期输出：invalid syntax
                }
            }

            fn();
            expect(str).assertEqual("invalid syntax");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2600
         @tc.name: testThrow026
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow026', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow026';
            let str = "";

            function fn() {
                class CustomError extends Error {
                    constructor(msg) {
                        super(msg);
                        this.name = 'CustomError';
                    }
                }

                try {
                    throw new CustomError('my error');
                } catch (e) {
                    str = str + `${e.name}: ${e.message}`; // 预期输出：CustomError: my error
                }
            }

            fn();
            expect(str).assertEqual("CustomError: my error");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2700
         @tc.name: testThrow027
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow027', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow027';
            let str = "";

            function fn() {
                try {
                    throw new TypeError();
                } catch (e) {
                    if (e instanceof TypeError) {
                        str = str + 'type error'; // 预期输出
                    } else {
                        str = str + 'other';
                    }
                }
            }

            fn();
            expect(str).assertEqual("type error");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2800
         @tc.name: testThrow028
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow028', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow028';
            let str = "";

            function fn() {
                try {
                    throw new RangeError();
                } catch (e) {
                    switch (e.name) {
                        case 'RangeError':
                            str = str + 'range';
                            break; // 预期输出
                        default:
                            str = str + 'other';
                    }
                }
            }

            fn();
            expect(str).assertEqual("range");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_2900
         @tc.name: testThrow029
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow029', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow029';
            let str = "";

            function fn() {
                try {
                    try {
                        throw 'rethrow';
                    } catch (e) {
                        str = str + 'inner: ' + e; // 预期输出：inner: rethrow
                        throw e; // 重新抛出
                    }
                } catch (e) {
                    str = str + 'outer: ' + e; // 预期输出：outer: rethrow
                }
            }

            fn();
            expect(str).assertEqual("inner: rethrowouter: rethrow");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3000
         @tc.name: testThrow030
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow030', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow030';
            let str = "";

            function fn() {
                try {
                    try {
                        throw 'original';
                    } catch (e) {
                        throw new Error(`wrapped: ${e}`);
                    }
                } catch (e) {
                    str = str + e.message; // 预期输出：wrapped: original
                }
            }

            fn();
            expect(str).assertEqual("wrapped: original");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3100
         @tc.name: testThrow031
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow031', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow031';
            let str = "";

            function fn() {
                try {
                    setTimeout(() => {
                        throw 'async'; // 此异常无法被外层try捕获（异步）
                    }, 0);
                } catch (e) {
                    str = str + 'caught'; // 不会执行
                }
                // 预期：控制台抛出未捕获异常"async"
            }

            fn();
            expect(str).assertEqual("");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3200
         @tc.name: testThrow032
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow032', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow032';
            let str = "";

            function f1() {
                f2();
            }

            function f2() {
                f3();
            }

            function f3() {
                throw 'chain';
            }

            try {
                f1();
            } catch (e) {
                str = str + e; // 预期输出：chain
            }
            expect(str).assertEqual("chain");
        });
        /**

         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3300
         @tc.name: testThrow033
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow033', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow033';
            let str = "";

            function fn() {
                let file = {
                    closed: false, close() {
                        this.closed = true;
                    }
                };
                try {
                    // 模拟操作文件
                    throw 'error during read';
                } catch (e) {
                    str = str + e; // 预期输出：error during read
                } finally {
                    file.close();
                }
                str = str + file.closed; // 预期输出：true
            }

            fn();
            expect(str).assertEqual("error during readtrue");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3400
         @tc.name: testThrow034
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow034', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow034';
            let str = "";

            function fn() {
                try {
                } catch (e) {
                    str = str + 'error';
                }
                str = str + 'done'; // 预期输出：done
            }

            fn();
            expect(str).assertEqual("done");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3500
         @tc.name: testThrow035
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow035', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow035';
            let str = "";

            function fn() {
                try {
                    throw 'silent';
                } catch (e) {
                } // 空catch
                str = str + 'continue'; // 预期输出：continue
            }

            fn();
            expect(str).assertEqual("continue");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3600
         @tc.name: testThrow036
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow036', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow036';
            let res = '';

            function fn() {
                try {
                    res += 'try';
                } finally {
                    res += 'finally';
                } // 预期输出：tryfinally
            }

            fn();
            expect(res).assertEqual("tryfinally");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3700
         @tc.name: testThrow037
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow037';
            let res2 = '';
            try {

                function fn() {
                    try {
                        res2 += 'try';
                        throw 'no catch';
                    } finally {
                        res2 += 'finally'; // 预期输出：tryfinally（之后抛出异常）
                    }
                }

                fn();
                expect(res2).assertEqual("tryfinally");
            } catch (e) {
                expect(e).assertEqual("no catch");
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3800
         @tc.name: testThrow038
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow038';
            let str = "";

            function fn() {
                try {
                    throw new Error('stack test');
                } catch (e) {
                    str = str + e.stack.includes('stack test');
                }
            }

            fn();
            expect(str).assertEqual("false");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_3900
         @tc.name: testThrow039
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow039', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow039';
            let str = "";

            function validate(n) {
                if (n < 0) {
                    throw new Error('negative');
                }
                return n;
            }

            function fn() {
                try {
                    str = str + validate(5); // 预期输出：5
                    validate(-3);
                } catch (e) {
                    str = str + e.message; // 预期输出：negative
                }
            }

            fn();
            expect(str).assertEqual("5negative");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4000
         @tc.name: testThrow040
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow040', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow040';
            let str = "";

            function fn() {
                try {
                    throw {
                        toString() {
                            return 'custom string';
                        }
                    };
                } catch (e) {
                    str = str + String(e); // 预期输出：custom string
                }
            }

            fn();
            expect(str).assertEqual("custom string");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4100
         @tc.name: testThrow041
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow041', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow041';
            let str = "";

            function fn() {
                try {
                    switch (2) {
                        case 1:
                            break;
                        case 2:
                            throw 'switch err';
                    }
                } catch (e) {
                    str = str + e; // 预期输出：switch err
                }
            }

            fn();
            expect(str).assertEqual("switch err");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4200
         @tc.name: testThrow042
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow042', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow042';
            let str = "";

            function fn() {
                try {
                    if (true) {
                        throw 'if err';
                    }
                } catch (e) {
                    str = str + e; // 预期输出：if err
                }
            }

            fn();
            expect(str).assertEqual("if err");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4300
         @tc.name: testThrow043
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow043', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow043';
            let str = "";
            let count = 0;

            function fn() {
                try {
                    for (let i = 0; i < 5; i++) {
                        count++;
                        if (i === 2) {
                            throw 'break loop';
                        }
                    }
                } catch (e) {
                    str = str + e; // 预期输出：break loop
                } // 预期输出：3（i=0,1,2时执行）
            }

            fn();
            expect(str).assertEqual("break loop");
            expect(count).assertEqual(3);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4400
         @tc.name: testThrow044
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow044', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow044';
            let str = "";
            let total = 0;

            function fn() {
                for (let i = 0; i < 3; i++) {
                    try {
                        if (i === 1) {
                            throw 'skip';
                        }
                        total += i;
                    } catch (e) {
                        str = str + e; // 预期输出：skip
                    }
                } // 预期输出：0 + 2 = 2
            }

            fn();
            expect(str).assertEqual("skip");
            expect(total).assertEqual(2);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4500
         @tc.name: testThrow045
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow045', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow045';
            let str = "";

            function fn() {
            }

            fn();
            expect(str).assertEqual("");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4600
         @tc.name: testThrow046
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow046', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow046';
            let str = "";

            function fn() {
                try {
                    try {
                        throw new TypeError();
                    } catch (e) {
                        if (e instanceof RangeError) {
                            console.log('range');
                        } else {
                            throw e; // 重新抛出TypeError
                        }
                    }
                } catch (e) {
                    str = str + e.name; // 预期输出：TypeError
                }
            }

            fn();
            expect(str).assertEqual("TypeError");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4700
         @tc.name: testThrow047
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow047', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow047';
            let str = "";

            function fn() {
                try {
                    if (true) {
                        throw 'if err';
                    }
                } catch (e) {
                    str = str + e; // 预期输出：if err
                }
            }

            fn();
            expect(str).assertEqual("if err");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4800
         @tc.name: testThrow048
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow048', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow048';
            let str = "";

            function fn() {
                try {
                    throw new Error('custom');
                } catch (e) {
                    str = str + e.name + e.message; // 预期输出：Error // 预期输出：custom
                }
            }

            fn();
            expect(str).assertEqual("Errorcustom");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_4900
         @tc.name: testThrow049
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow049', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow049';
            let str = "";

            function fn() {
                try {
                    throw null;
                } catch (e) {
                    str = str + e;
                }
            }

            fn();
            expect(String(str) === "null").assertEqual(true);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5000
         @tc.name: testThrow050
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow050', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow050';
            let str = "";

            function fn() {
                try {
                    throw undefined;
                } catch (e) {
                    str = str + e; // 预期输出：true
                }
            }

            fn();
            expect(String(str) === "undefined").assertEqual(true);
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5100
         @tc.name: testThrow051
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow051', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow051';
            let str = "";

            function test() {
                try {
                    return 'return';
                } finally {
                    str = str + 'finally'; // 预期先输出
                }
            } // 预期后输出：return

            test();
            expect(str).assertEqual("finally");
            expect(test()).assertEqual("return");
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5200
         @tc.name: testThrow052
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow052', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow052';
            let str = "";

            function fn() {
                try {
                    throw 'test';
                } catch (e) {
                    let catchVar = 'inside';
                    str = str + catchVar; // 预期输出：inside
                }
                try {
                    console.log(catchVar);
                } catch (ee) {
                    str = str + ee.name; // 预期输出：ReferenceError
                }
            }

            fn();
            expect(str).assertEqual("insideReferenceError");
        });

        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5300
         @tc.name: testThrow053
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow053', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow053';
            try {
                const prop = 'val';
                const objKey = { [prop]: 'value' };
                let comp;
                switch ('val') {
                    case prop:
                        comp = 'match';
                        break; // prop的值为'val'，匹配
                    default:
                        comp = 'no';
                } // 预期输出：match
                expect(comp).assertEqual('match');
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect().assertFail();
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5400
         @tc.name: testThrow054
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow054', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow054';
            let str = "";
            try {

                function exists() {
                }

                if (exists) {
                    str = 'func exists';
                } else {
                    str = 'no';
                } // 预期输出：func exists
                expect(str).assertEqual('func exists');
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect().assertFail();
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5600
         @tc.name: testThrow056
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow056', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow056';
            let str = "";
            try {
                const obj2 = {};
                if (obj2.missing) {
                    str = 'has';
                } else {
                    str = 'no';
                } // 预期输出：no
                expect(str).assertEqual('no');
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect().assertFail();
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5700
         @tc.name: testThrow057
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow057', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow057';
            let str = "";
            try {
                if ('1' === 1) {
                    str = 'equal';
                } else {
                    str = 'no';
                } // 预期输出：no（严格相等不转换类型）
                expect(str).assertEqual('no');
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect().assertFail();
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5800
         @tc.name: testThrow058
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow058', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow058';
            let str = "";
            try {
                if ('1' == 1) {
                    str = 'equal';
                } else {
                    str = 'no';
                } // 预期输出：equal（宽松相等）
                expect(str).assertEqual('equal');
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect().assertFail();
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_5900
         @tc.name: testThrow059
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow059', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow059';
            try {
                if (false) {
                    let bar = 2;
                }
                console.log(bar);
                expect().assertFail();
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect(e.name).assertEqual('ReferenceError');
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_6000
         @tc.name: testThrow060
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow060', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow060';
            {
                let z = 3;
            }
            try {
                console.log(z) // 预期输出：ReferenceError
                expect().assertFail();
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect(e.name).assertEqual('ReferenceError');
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_6100
         @tc.name: testThrow061
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow061', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow061';
            try {
                {
                    const c = 1;
                    c = 2;
                }
                expect().assertFail();
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect(e.name).assertEqual('TypeError');
            }
        });
        /**
         @tc.number: SSUB_COMMONLIBRARY_BUILTIN_THROW_6200
         @tc.name: testThrow062
         @tc.desc: Exception handling statement test
         @tc.size: MediumTest
         @tc.type: Function
         @tc.level: Level 1
         */
        it('testThrow062', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, () => {
            TAG = 'testThrow062';
            'use strict';
            {

                function strictFn() {
                }
            }
            try {
                strictFn();
                expect().assertFail();
            } catch (e) {
                console.error(TAG, ` failed, message is ${e.message}`);
                expect(e.name).assertEqual('ReferenceError');
            }
        });
    })
}