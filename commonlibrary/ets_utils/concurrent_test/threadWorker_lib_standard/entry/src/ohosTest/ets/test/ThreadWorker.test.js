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
