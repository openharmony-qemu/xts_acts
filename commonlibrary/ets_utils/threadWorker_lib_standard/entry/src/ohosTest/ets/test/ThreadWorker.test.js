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
     * @tc.number threadWorker_constructor_test_001
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
     * @tc.number threadWorker_constructor_test_002
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
     * @tc.number threadWorker_constructor_test_003
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
     * @tc.number threadWorker_constructor_test_004
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
