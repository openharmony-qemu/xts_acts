'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { afterAll, afterEach, beforeAll, beforeEach, describe, it, expect, TestType, Size, Level } from "../../../hypium/index";
import { BusinessError } from '@ohos.base';

class CustomData {
    id: int = 0;
    name: string = "";
}

export default function MessageEqualsBasicTest(): void {
    describe('MessageEqualsBasicTest', (): void => {
        beforeAll((): void => {
        })

        beforeEach((): void => {
        })

        afterEach((): void => {
        })

        afterAll((): void => {
        })

        /**
         * @tc.name   MessageEqualsBasicTest0100
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0100
         * @tc.desc   Test Message.equals with same handler and what value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('MessageEqualsBasicTest0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0100';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0200
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0200
         * @tc.desc   Test Message.equals with same handler, what and obj
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('MessageEqualsBasicTest0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0200';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 2;
                    const obj: string = "hello";
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0300
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0300
         * @tc.desc   Test Message.equals with different handlers returns false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('MessageEqualsBasicTest0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0300';
                console.info(`${TAG} test start`);
                const eaw1 = new EAWorker();
                const eaw2 = new EAWorker();
                eaw1.start();
                eaw2.start();

                try {
                    const handler1 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw1);

                    const handler2 = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw2);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, handler1);
                    const msg2 = new concurrency.Message(what, handler2);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw1.quit();
                        eaw2.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0400
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0400
         * @tc.desc   Test Message.equals with different what values returns false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('MessageEqualsBasicTest0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0400';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg1 = new concurrency.Message(1, handler);
                    const msg2 = new concurrency.Message(2, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0500
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0500
         * @tc.desc   Test Message.equals with different obj values returns false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('MessageEqualsBasicTest0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0500';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const msg1 = new concurrency.Message(what, "hello", handler);
                    const msg2 = new concurrency.Message(what, "world", handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0600
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0600
         * @tc.desc   Test Message.equals with same callback function
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0600';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback = (): void => {
                        console.info("callback executed");
                    };

                    const msg1 = new concurrency.Message(callback, handler);
                    const msg2 = new concurrency.Message(callback, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0700
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0700
         * @tc.desc   Test Message.equals with different callback functions returns false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0700';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback1 = (): void => {
                        console.info("callback 1");
                    };

                    const callback2 = (): void => {
                        console.info("callback 2");
                    };

                    const msg1 = new concurrency.Message(callback1, handler);
                    const msg2 = new concurrency.Message(callback2, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0800
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0800
         * @tc.desc   Test Message.equals with default constructor (no what and obj)
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0800';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg1 = new concurrency.Message(handler);
                    const msg2 = new concurrency.Message(handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest0900
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_0900
         * @tc.desc   Test Message.equals with number object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest0900';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: int = 42;
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1000
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1000
         * @tc.desc   Test Message.equals with boolean object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1000';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: boolean = true;
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1100
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1100
         * @tc.desc   Test Message.equals with custom object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('MessageEqualsBasicTest1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1100';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj = new CustomData();
                    obj.id = 100;
                    obj.name = "test";

                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1200
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1200
         * @tc.desc   Test Message.equals with array object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('MessageEqualsBasicTest1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1200';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const arr: Array<int> = [1, 2, 3, 4, 5];
                    const msg1 = new concurrency.Message(what, arr, handler);
                    const msg2 = new concurrency.Message(what, arr, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

            /**
             * @tc.name   MessageEqualsBasicTest1300
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1300
         * @tc.desc   Test Message.equals with negative what value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('MessageEqualsBasicTest1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1300';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = -1;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1400
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1400
         * @tc.desc   Test Message.equals with large what value
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('MessageEqualsBasicTest1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1400';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 999999;
                    const msg1 = new concurrency.Message(what, handler);
                    const msg2 = new concurrency.Message(what, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1500
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1500
         * @tc.desc   Test Message.equals with mixed message types returns false
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('MessageEqualsBasicTest1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1500';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const callback = (): void => {
                        console.info("callback");
                    };

                    const msg1 = new concurrency.Message(1, "hello", handler);
                    const msg2 = new concurrency.Message(callback, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertFalse();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1600
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1600
         * @tc.desc   Test Message.equals with self comparison
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1600';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const msg = new concurrency.Message(1, "test", handler);

                    const result = msg.equals(msg);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1700
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1700
         * @tc.desc   Test Message.equals with empty string object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1700';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    const obj: string = "";
                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });

        /**
         * @tc.name   MessageEqualsBasicTest1800
         * @tc.number SUB_MESSAGE_EQUALS_BASIC_TEST_1800
         * @tc.desc   Test Message.equals with long string object
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('MessageEqualsBasicTest1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (): Promise<void> => {
                const TAG: string = 'MessageEqualsBasicTest1800';
                console.info(`${TAG} test start`);
                const eaw = new EAWorker();
                eaw.start();

                try {
                    const handler = new concurrency.MessageHandler((msg: concurrency.Message): void => {
                        // do nothing
                    }, eaw);

                    const what: int = 1;
                    let obj: string = "";
                    for (let i = 0; i < 100; i++) {
                        obj += "test";
                    }

                    const msg1 = new concurrency.Message(what, obj, handler);
                    const msg2 = new concurrency.Message(what, obj, handler);

                    const result = msg1.equals(msg2);
                    expect(result).assertTrue();
                } catch (error) {
                    console.error(`${TAG} catch error: ${error.message}`);
                    const bizErr = error as BusinessError;
                    expect(typeof bizErr.code === 'number').assertTrue();
                    expect(false).assertFail();
                } finally {
                    try {
                        eaw.quit();
                    } catch (error) {
                        console.warn(`${TAG} catch quit error: ${error.message}`);
                    }
                    console.info(`${TAG} test end`);
                }
            });
    })
}
