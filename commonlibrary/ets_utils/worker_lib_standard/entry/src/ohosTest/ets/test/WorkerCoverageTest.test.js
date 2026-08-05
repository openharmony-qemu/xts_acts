/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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

import worker from '@ohos.worker'
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from "@ohos/hypium"

export default function WorkerCoverageTest() {
    describe('WorkerCoverageTest', function () {

        afterAll(function () {
            console.info('total case over')
        })

        function promiseCase() {
            let p = new Promise(function (resolve, reject) {
                setTimeout(function () {
                    resolve(0)
                }, 100)
            }).then(undefined, (error) => {
            })
            return p
        }

        // Test EventListener callable interface - normal usage with Worker.addEventListener
        /**
         * @tc.name   worker_EventListener_test_001
         * @tc.number worker_EventListener_test_001
         * @tc.desc   Test EventListener callable interface with Worker.addEventListener.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_EventListener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async function (done) {
            let ss = new worker.Worker("entry/ets/workers/worker.js")
            let isTerminate = false
            let times = 0

            ss.onexit = function () {
                isTerminate = true
            }

            let listener = function (evt) {
                console.info("EventListener invoked, type: " + evt.type + ", timeStamp: " + evt.timeStamp)
                times++
            }

            ss.addEventListener("test_event", listener)
            ss.dispatchEvent({ type: "test_event", timeStamp: 0 })

            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }

            expect(times).assertEqual(1)
            done()
        })

        // Test EventTarget.addEventListener with empty string type parameter
        /**
         * @tc.name   worker_addEventListener_empty_string_test_001
         * @tc.number worker_addEventListener_empty_string_test_001
         * @tc.desc   Test EventTarget.addEventListener with empty string type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_addEventListener_empty_string_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false
                let eventCalled = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.addEventListener("", function (evt) {
                        eventCalled = true
                        console.info("EventListener invoked with empty string type")
                    })
                } catch (error) {
                    errorThrown = true
                    console.info("addEventListener with empty string threw error: " + error.code)
                }

                ss.dispatchEvent({ type: "", timeStamp: 0 })

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertFalse()
                expect(eventCalled).assertTrue()
                done()
            })

        // Test EventTarget.addEventListener with null type parameter
        /**
         * @tc.name   worker_addEventListener_null_test_001
         * @tc.number worker_addEventListener_null_test_001
         * @tc.desc   Test EventTarget.addEventListener with null type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_addEventListener_null_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.addEventListener(null, function (evt) {
                        console.info("EventListener invoked with null type")
                    })
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("addEventListener with null threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })

        // Test EventTarget.addEventListener with undefined type parameter
        /**
         * @tc.name   worker_addEventListener_undefined_test_001
         * @tc.number worker_addEventListener_undefined_test_001
         * @tc.desc   Test EventTarget.addEventListener with undefined type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_addEventListener_undefined_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.addEventListener(undefined, function (evt) {
                        console.info("EventListener invoked with undefined type")
                    })
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("addEventListener with undefined threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })

        // Test EventTarget.dispatchEvent with null event parameter
        /**
         * @tc.name   worker_dispatchEvent_null_test_001
         * @tc.number worker_dispatchEvent_null_test_001
         * @tc.desc   Test EventTarget.dispatchEvent with null event parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_dispatchEvent_null_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.dispatchEvent(null)
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("dispatchEvent with null threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })

        // Test EventTarget.dispatchEvent with undefined event parameter
        /**
         * @tc.name   worker_dispatchEvent_undefined_test_001
         * @tc.number worker_dispatchEvent_undefined_test_001
         * @tc.desc   Test EventTarget.dispatchEvent with undefined event parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_dispatchEvent_undefined_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.dispatchEvent(undefined)
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("dispatchEvent with undefined threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })

        // Test EventTarget.removeEventListener with empty string type parameter
        /**
         * @tc.name   worker_removeEventListener_empty_string_test_001
         * @tc.number worker_removeEventListener_empty_string_test_001
         * @tc.desc   Test EventTarget.removeEventListener with empty string type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_removeEventListener_empty_string_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.removeEventListener("")
                } catch (error) {
                    errorThrown = true
                    console.info("removeEventListener with empty string threw error: " + error.code)
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertFalse()
                done()
            })

        // Test EventTarget.removeEventListener with null type parameter
        /**
         * @tc.name   worker_removeEventListener_null_test_001
         * @tc.number worker_removeEventListener_null_test_001
         * @tc.desc   Test EventTarget.removeEventListener with null type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_removeEventListener_null_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.removeEventListener(null)
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("removeEventListener with null threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })

        // Test EventTarget.removeEventListener with undefined type parameter
        /**
         * @tc.name   worker_removeEventListener_undefined_test_001
         * @tc.number worker_removeEventListener_undefined_test_001
         * @tc.desc   Test EventTarget.removeEventListener with undefined type parameter.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('worker_removeEventListener_undefined_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async function (done) {
                let ss = new worker.Worker("entry/ets/workers/worker.js")
                let isTerminate = false
                let errorThrown = false

                ss.onexit = function () {
                    isTerminate = true
                }

                try {
                    ss.removeEventListener(undefined)
                } catch (error) {
                    errorThrown = true
                    expect(error.code).assertEqual(401)
                    console.info("removeEventListener with undefined threw 401 as expected")
                }

                ss.terminate()
                while (!isTerminate) {
                    await promiseCase()
                }

                expect(errorThrown).assertTrue()
                done()
            })
        // ==================== Section 6: Input param gaps for EventTarget methods ====================

        /**
         * @tc.name   concurrencyCoveredSupplement037
         * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0137
         * @tc.desc   Worker on() subscribe multiple callbacks and verify called in order
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('concurrencyCoveredSupplement037', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const workerInstance = new worker.Worker("../workers/worker_0001.js");
            let callOrder = [];
            let callback1 = () => {
                console.log('concurrencyCoveredSupplement037 callback1');
                callOrder.push('callback1');
            };
            let callback2 = () => {
                console.log('concurrencyCoveredSupplement037 callback2');
                callOrder.push('callback2');
            };
            let callback3 = () => {
                console.log('concurrencyCoveredSupplement037 callback3');
                callOrder.push('callback3');
            };
            workerInstance.on("message", callback1);
            workerInstance.on("message", callback2);
            workerInstance.on("message", callback3);
            workerInstance.postMessage(1)
            workerInstance.postMessage(1)
            workerInstance.postMessage(1)

            while (callOrder.length < 3) {
                await promiseCase()
                console.log('concurrencyCoveredSupplement037 callOrder:', callOrder);
            }
            let finish = false;
            workerInstance.terminate();
            workerInstance.onexit = () => {
                finish = true;
            };
            while (!finish) {
                await promiseCase()
            }
            expect(callOrder[0]).assertEqual('callback1');
            expect(callOrder[1]).assertEqual('callback2');
            expect(callOrder[2]).assertEqual('callback3');
        });

        /**
         * @tc.name   concurrencyCoveredSupplement038
         * @tc.number SUB_CONCURRENCY_RETURN_COVERED_SUPP_0138
         * @tc.desc   Worker once() subscribe multiple callbacks and verify called
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL1
         */
        it('concurrencyCoveredSupplement038', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async () => {
            const workerInstance = new worker.Worker("../workers/worker_0001.js");
            let callOrder = [];
            workerInstance.once("message", (evt) => {
                callOrder.push('callback1');
            });
            workerInstance.once("message", (evt) => {
                callOrder.push('callback2');
            });
            workerInstance.once("message", (evt) => {
                callOrder.push('callback3');
            });
            workerInstance.postMessage('msg')
            workerInstance.postMessage('msg')
            workerInstance.postMessage('msg')

            while (callOrder.length < 3) {
                await promiseCase()
            }
            let finish = false;
            workerInstance.terminate();
            workerInstance.onexit = () => {
                finish = true;
            };
            while (!finish) {
                await promiseCase()
            }
            expect(callOrder[0]).assertEqual('callback1');
            expect(callOrder[1]).assertEqual('callback2');
            expect(callOrder[2]).assertEqual('callback3');
        });
    })
}
