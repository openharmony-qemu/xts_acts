/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import app from '@system.app'
import worker from "@ohos.worker"
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level} from '@ohos/hypium'
export default function threadWorkerTest() {
describe('threadWorkerTest', function () {

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

    // check worker constructor is ok
    /**
     * @tc.name   threadWorker_constructor_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0102
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name   threadWorker_constructor_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0103
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {name:"1st worker", shared: false})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name   threadWorker_constructor_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0104
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
                                         {type:"classic", name:"2st worker", shared: false})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name   threadWorker_constructor_test_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0105
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
                                         {type:"classic", name:"3st worker", shared: true})
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        expect(ss != null).assertTrue()

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name   threadWorker_constructor_test_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0106
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {type:"other", name:"worker"})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type must be classic," +
                " unsupport others now.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0107
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js",
                                             {type:1, name:"new worker", shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type of type's value " +
                "must be string.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_007
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0108
     * @tc.desc   worker constructor to Creates a worker instance when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js", {type:"classic", name:1, shared: true})
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the type of name must be " +
                "string.").assertTrue()
            done()
        }
    })

     /**
      * @tc.name   threadWorker_constructor_test_008
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0109
      * @tc.desc   worker constructor to Creates a worker instance when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_constructor_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            let ss = new worker.ThreadWorker()
        } catch (error) {
            expect(error.name == "BusinessError").assertTrue()
            expect(error.message == "Parameter error. The input parameters are invalid, the number of parameters " +
                "must be more than 1.").assertTrue()
            done()
        }
    })

    /**
     * @tc.name   threadWorker_constructor_test_009
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0110
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("/entry_test/ets/workers/newworker.js");
        let isTerminate = false
        ss.onexit = function () {
            isTerminate = true
        }
        expect(ss != null).assertTrue()
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    /**
     * @tc.name   threadWorker_constructor_test_010
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0111
     * @tc.desc   worker constructor to Creates a worker instance.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_constructor_test_010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("@bundle:com.example.threadWorkertest/entry_test/ets/workers/newworker.js");
        let isTerminate = false
        ss.onexit = function () {
            isTerminate = true
        }
        expect(ss != null).assertTrue()
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check postMessage is ok
    // main post "hello world", will receive "hello world worker"
    /**
     * @tc.name   threadWorker_postMessage_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0112
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_002.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("hello world worker")
        done()
    })

    // check postMessage is ok
    // main post 12 , will receive 12 * 2 + 1
    /**
     * @tc.name   threadWorker_postMessage_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0113
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_003.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            flag = true
        }

        ss.postMessage(12)
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual(25)
        done()
    })

    // check postMessage is ok
    /**
     * @tc.name   threadWorker_postMessage_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0114
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_004.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data.message
            flag = true
        }

        ss.postMessage({"message":"hello world"})
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("hello world worker")
        done()
    })

    // check worker name is ok
    /**
     * @tc.name   threadWorker_postMessage_test_004
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0115
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_005.js", {name: "zhangsan"})

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            res = e.data
            console.info("worker:: type " + e.type)
            console.info("worker:: timeStamp " + e.timeStamp)
            flag = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("zhangsan")
        done()
    })

    // check worker transfer buffer is ok
    /**
     * @tc.name   threadWorker_postMessage_test_005
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0116
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_006.js")
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        const buffer = new ArrayBuffer(8)
        expect(buffer.byteLength).assertEqual(8)
        ss.postMessage(buffer, [buffer])
        let length = undefined
        let exception = undefined
        try {
            length = buffer.byteLength
        } catch (e) {
            exception = e.message
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        console.log("worker:: length is " + length)
        console.log("worker:: exception is " + exception)

        if (typeof exception == "undefined") {
            expect(length).assertEqual(0)
        } else {
            expect(exception).assertEqual("IsDetachedBuffer")
        }
        done()
    })

    // check worker handle error is ok
    /**
     * @tc.name   threadWorker_postMessage_test_006
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0117
     * @tc.desc   Sends a message to the worker thread.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        const ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js")

        let res = undefined
        let flag = false
        let isTerminate = false

        ss.onerror = function (e) {
            res = e.message
            console.info("worker:: filename " + e.filename)
            console.info("worker:: lineno " + e.lineno)
            console.info("worker:: colno " + e.colno)
            console.info("worker:: error " + e.error)
            flag = true
        }
        ss.onexit = function () {
            isTerminate = true
        }

        ss.postMessage("hello world")
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual("Error: 123")
        done()
    })

    // check worker handle error is ok
     /**
      * @tc.name   threadWorker_postMessage_test_007
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0118
      * @tc.desc   Sends a message to the worker thread when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_postMessage_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
        let isTerminate = false;
        ss.onexit = function () {
            isTerminate = true;
        }
        try {
            ss.postMessage();
        } catch (error) {
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
            expect(error.name).assertEqual("BusinessError");
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, Worker " +
                "messageObject must be not null with postMessage");
        }
        done();
    })

    // check worker handle error is ok
    /**
     * @tc.name   threadWorker_postMessage_test_008
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0119
     * @tc.desc   Sends a message to the worker thread when throw error.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_postMessage_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_007.js");
        let isTerminate = false;
        ss.onexit = function () {
            isTerminate = true;
        }
        try {
            ss.postMessage("123", "123");
        } catch (error) {
            ss.terminate();
            while (!isTerminate) {
                await promiseCase();
            }
            expect(error.name).assertEqual("BusinessError");
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of the " +
                "transfer list must be an array.");
        }
        done();
    })

    // check worker terminate is ok
    /**
     * @tc.name   threadWorker_terminate_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0120
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_terminate_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }

        ss.terminate()
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    /**
     * @tc.name   threadWorker_terminate_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0121
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_terminate_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }

        // Repeated execution terminate
        ss.terminate()
        ss.terminate()

        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check worker terminate is ok
    /**
     * @tc.name   threadWorker_terminate_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0122
     * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_terminate_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
            res++
        }
        ss.onmessage = function (e) {
            res++
        }

        ss.terminate()
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(1)

        try {
            ss.postMessage("hello world")
            await promiseCase()
        } catch (error) {
            let msg = "The Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual(msg)
            done()
        }
    })

        // check worker terminate is ok
        /**
         * @tc.name   threadWorker_terminate_test_004
         * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0123
         * @tc.desc   Terminates the worker thread to stop the worker from receiving messages.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('threadWorker_terminate_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
            let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_002.js")
            let res = 0
            let flag = false

            ss.onexit = function () {
                flag = true
                res++
            }
            for (let i = 0; i < 10; i++) {
                ss.terminate();
            }
            while (!flag) {
                await promiseCase()
            }
            expect(res).assertEqual(1)
            done()
        })

    // check worker on function is ok
    /**
     * @tc.name   threadWorker_on_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0124
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_on_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name   threadWorker_on_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0125
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_on_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times--
        })
        ss.on("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(0)
        done()
    })

    // check worker on function is ok
    /**
     * @tc.name   threadWorker_on_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0126
     * @tc.desc   Adds an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_on_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        console.log("times " + times)
        expect(times).assertEqual(10)
        done()
    })

    // check worker on function is ok
     /**
      * @tc.name   threadWorker_on_test_004
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0127
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_on_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on(1, ()=>{})
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker on function is ok
     /**
      * @tc.name   threadWorker_on_test_005
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0128
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_on_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on("zhangSan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker on function is ok
     /**
      * @tc.name   threadWorker_on_test_006
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0129
      * @tc.desc   Adds an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_on_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        try {
            ss.on()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

       /**
        * @tc.name   threadWorker_on_test_007
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0130
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('threadWorker_on_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        let times = 0

        try {
            ss.on("zhangsan", ()=>{
                times++
            })
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.on("lisi", ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker once function is ok
    /**
     * @tc.name   threadWorker_once_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0131
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_once_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times++
        })
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    // check worker once function is ok
    /**
     * @tc.name   threadWorker_once_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0132
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_once_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(1)
        done()
    })

    /**
     * @tc.name   threadWorker_once_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0133
     * @tc.desc   Adds an event listener to the worker and removes the event listener automically
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_once_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.once("zhangsan", ()=>{
            times--
        })

        ss.once("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(0)
        done()
    })

       /**
        * @tc.name   threadWorker_once_test_004
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0134
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('threadWorker_once_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.once(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

       /**
        * @tc.name   threadWorker_once_test_005
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0135
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('threadWorker_once_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

       /**
        * @tc.name   threadWorker_once_test_006
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0136
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('threadWorker_once_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false

        try {
            ss.once()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

       /**
        * @tc.name   threadWorker_once_test_007
        * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0137
        * @tc.desc   Adds an event listener to the worker and removes the event listener automically
        * @tc.type   FUNCTION
        * @tc.size   MEDIUMTEST
        * @tc.level  LEVEL0
        */
       it('threadWorker_once_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let isTerminate = false
        let times = 0

        try {
            ss.once("zhangsan", ()=>{
                times++
            })
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.once("lisi", ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")

            done()
        }
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name   threadWorker_addEventListener_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0138
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_addEventListener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(2)
        done()
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name   threadWorker_addEventListener_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0139
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_addEventListener_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })
        ss.addEventListener("lisi", ()=>{
            times++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(2)
        done()
    })

    // check worker addEventListener function is ok
    /**
     * @tc.name   threadWorker_addEventListener_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0140
     * @tc.desc   Add an event listener to the Worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_addEventListener_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            times++
        })

        for (let i=0;i<10;i++)
        {
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(times).assertEqual(10)
        done()
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_004
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0141
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_addEventListener_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener(1, ()=>{
                times++
            })
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener first param must be string.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_005
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0142
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_addEventListener_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", "error")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "listener the second param must be callable.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_006
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0143
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_addEventListener_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "listener parameters is not less than 2.")
            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_007
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0144
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_addEventListener_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", ()=>{
                times++
            })

            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }

            ss.addEventListener("lisi", ()=>{
                times++
            })

        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker addEventListener function is ok
     /**
      * @tc.name   threadWorker_addEventListener_test_008
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0145
      * @tc.desc   Add an event listener to the Worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_addEventListener_test_008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let times = 0
        let isTerminate = false

        try {
            ss.addEventListener("zhangsan", ()=>{
                times++
            })

            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

            ss.onexit = function () {
                isTerminate = true
            }
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker has been terminated")
            done()
        }
    })

    // check worker off function is ok
    /**
     * @tc.name   threadWorker_off_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0146
     * @tc.desc   Removes an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_off_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(1)

        ss.off("zhangsan")

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(1)
        done()
    })

    // check worker off function is ok
    /**
     * @tc.name   threadWorker_off_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0147
     * @tc.desc   Removes an event listener to the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_off_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        for (let i=0;i<3;i++)
        {
            ss.off("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(2)
        done()
    })

    // check worker off function is ok
     /**
      * @tc.name   threadWorker_off_test_003
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0148
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_off_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.off("zhangsan")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker off function is ok
     /**
      * @tc.name   threadWorker_off_test_004
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0149
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_off_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.off()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "parameters is not less than 1.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker off function is ok
     /**
      * @tc.name   threadWorker_off_test_005
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0150
      * @tc.desc   Removes an event listener to the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_off_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.on("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.off(1)
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "removelistener the first param must be string.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeEventListener function is ok
    /**
     * @tc.name   threadWorker_removeListener_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0151
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_removeListener_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(1)

        ss.removeEventListener("zhangsan")

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(1)
        done()
    })

    // check worker removeEventListener function is ok
    /**
     * @tc.name   threadWorker_removeListener_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0152
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_removeListener_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        for (let i=0;i<3;i++)
        {
            ss.removeEventListener("zhangsan")
        }

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(zhangSanTimes).assertEqual(2)
        done()
    })

    // check worker removeAllListener function is ok
    /**
     * @tc.name   threadWorker_removeListener_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0153
     * @tc.desc   Removes an event defined for the worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_removeListener_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })

        let liSiTimes = 0
        ss.addEventListener("lisi", ()=>{
            liSiTimes++
        })

        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        expect(liSiTimes).assertEqual(2)

        ss.removeAllListener()
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        ss.dispatchEvent({type: "zhangsan", timeStamp: 0})
        expect(zhangSanTimes).assertEqual(2)

        ss.dispatchEvent({type: "lisi", timeStamp: 0})
        ss.dispatchEvent({type: "lisi", timeStamp: 0})

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(liSiTimes).assertEqual(2)
        done()
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_004
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0154
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_removeListener_test_004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.removeAllListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_005
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0155
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_removeListener_test_005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        try {
            ss.removeEventListener("zhangsan")
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("The Worker instance is not running, maybe worker is terminated")
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_006
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0156
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_removeListener_test_006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.removeEventListener()
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the number of " +
                "parameters is not less than 1.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check worker removeAllListener function is ok
     /**
      * @tc.name   threadWorker_removeListener_test_007
      * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0157
      * @tc.desc   Removes an event defined for the worker when throw error.
      * @tc.type   FUNCTION
      * @tc.size   MEDIUMTEST
      * @tc.level  LEVEL0
      */
     it('threadWorker_removeListener_test_007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker.js")

        let zhangSanTimes = 0
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.addEventListener("zhangsan", ()=>{
            zhangSanTimes++
        })
        try {
            ss.removeEventListener(1)
        } catch (error) {
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertEqual("Parameter error. The input parameters are invalid, the type of " +
                "removelistener the first param must be string.")
            ss.terminate()
            while (!isTerminate) {
                await promiseCase()
            }
            done()
        }
    })

    // check parentPort.close is ok
    /**
     * @tc.name   threadWorker_parentPortClose_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0158
     * @tc.desc   Close the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_parentPortClose_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function (e) {
            res++
            flag = true
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }

        expect(res).assertEqual(1)
        done()
    })

    // check parentPort.close is ok
    /**
     * @tc.name   threadWorker_parentPortClose_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0159
     * @tc.desc   Close the worker thread to stop the worker from receiving messages.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_parentPortClose_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
        }

        ss.onmessage = function (e) {
            res++
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }

        try {
            ss.postMessage("hello")
        } catch (error) {
            expect(res).assertEqual(0)
            expect(error.name).assertEqual("BusinessError")
            let msg = "The Worker instance is not running, maybe worker is terminated when PostMessage"
            expect(error.message).assertEqual(msg)

            done()
        }
    })

    // check onmessageerror is ok
    /**
     * @tc.name   threadWorker_onmessageerror_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0160
     * @tc.desc   The onmessage attribute of the worker specifies the event handler when the worker receives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_onmessageerror_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
        let res = 0
        let flag = false

        ss.onexit = function () {
            flag = true
        }

        ss.onmessageerror = function (e) {
            res++
        }

        ss.postMessage("abc")
        while (!flag) {
            await promiseCase()
        }
        expect(res).assertEqual(0)
        done()
    })

    // check onmessageerror is ok
    /**
     * @tc.name   threadWorker_onmessageerror_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0161
     * @tc.desc   The onmessage attribute of the worker specifies the event handler when the worker receives
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_onmessageerror_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        try {
            var ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_008.js")
            var res = 0
            var flag = false
            ss.onexit = function() {
                flag = true
                res++
            }
            ss.onmessageerror = function (e) {
                flag = true
                res++
            }
            var message = Symbol(42)
            ss.postMessage(message)
        } catch (error) {
            while (!flag) {
                await promiseCase()
            }
            expect(error.name).assertEqual("BusinessError")
            expect(error.message).assertContain("An exception occurred during serialization, failed to serialize message.")
            flag = false
            ss.terminate()
            while (!flag) {
                await promiseCase()
            }
            expect(res).assertEqual(2)
            done()
        }
    })

    // check new second worker is ok
    /**
     * @tc.name   threadWorker_new_second_worker_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0162
     * @tc.desc   Create a second worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_new_second_worker_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_009.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }

        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            console.log("worker:: foo wait")
            await promiseCase()
        }

        console.log("worker:: " + res)
        expect(res).assertTrue()

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check new third worker is ok
    /**
     * @tc.name   threadWorker_new_second_worker_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0163
     * @tc.desc   Create a third worker.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_new_second_worker_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_012.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertTrue()

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage number is ok
    /**
     * @tc.name   threadWorker_second_worker_postMessage_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0164
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_second_worker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_010.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertEqual(25)

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage string is ok
    /**
     * @tc.name   threadWorker_second_worker_postMessage_test_002
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0165
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_second_worker_postMessage_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_013.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: "hello world"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res).assertEqual("hello world worker")

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check second worker postMessage array is ok
    /**
     * @tc.name   threadWorker_second_worker_postMessage_test_003
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0166
     * @tc.desc   Check if the postMessage function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_second_worker_postMessage_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_014.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function () {
            isTerminate = true
        }
        ss.onmessage = function (e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: [1, 2]})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }
        expect(res[0]).assertEqual(2)
        expect(res[1]).assertEqual(2)

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }
        done()
    })

    // check third worker postMessage is ok
    /**
     * @tc.name   threadWorker_third_worker_postMessage_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0167
     * @tc.desc   Check if the postMessage function of the third worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_third_worker_postMessage_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_015.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function() {
            isTerminate = true
        }
        ss.onmessage = function(e) {
            flag = true
            res = e.data
        }
        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 10})
        while (!flag) {
            await promiseCase()
        }
        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual(16)

        done()
    })

    // check second worker terminate is ok
    /**
     * @tc.name   threadWorker_second_worker_terminate_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0168
     * @tc.desc   Check if the terminate function of the second worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_second_worker_terminate_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_011.js")
        let flag = false
        let res = undefined
        let isTerminate = false

        ss.onexit = function() {
            isTerminate = true
        }

        ss.onmessage = function(e) {
            flag = true
            res = e.data
        }

        ss.onerror = function(ee) {
            console.log("worker:: " + ee.message)
        }

        ss.postMessage({type: "new", value: 12})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        flag = false
        ss.postMessage({type: "terminate"})
        while (!flag) {
            ss.postMessage({type: "wait"})
            await promiseCase()
        }

        ss.terminate()
        while (!isTerminate) {
            await promiseCase()
        }

        expect(res).assertEqual("terminate")
        done()
    })

    function CreateArray(type,b) {
        switch(type) {
            case 0 :
                return new Int8Array(b);
            case 1 :
                return new Int16Array(b);
            case 2 :
                return new Int32Array(b);
            case 3 :
                return new Uint8Array(b);
            case 4 :
                return new Uint16Array(b);
            case 5 :
                return new Uint32Array(b);
            case 6 :
                return new Float32Array(b);
            case 7 :
                return new Float64Array(b);
            case 8 :
                return new BigInt64Array(b);
            case 9 :
                return new BigUint64Array(b);
            default :
                return;
        }
    }

    // Check the transmission types supported by Worker is ok.
    /**
     * @tc.name   threadWorker_support_types_test_001
     * @tc.number SUB_COMMONLIBRARY_ETSUTILS_THREADWORKER_0169
     * @tc.desc   Check the transmission types supported by Worker is ok.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('threadWorker_support_types_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async function (done) {
        let ss = new worker.ThreadWorker("entry_test/ets/workers/newworker_016.js");
        let array = []
        for (let i = 0; i < 10; i++) {
            array[i] = CreateArray(i, 65);
        }

        let res = 0;
        let flag = 0;
        let isTerminate = false;
        ss.onmessage = function(d) {
            res += d.data;
            flag += 1;
        }
        ss.onexit = function() {
            isTerminate = true;
        }

        for (let i = 0; i < 10; i++) {
            ss.postMessage(array[i]);
        }

        while (flag != 10) {
            await promiseCase();
        }

        ss.terminate();
        while (!isTerminate) {
            await promiseCase();
