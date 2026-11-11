/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic'
import boardInfo from '@ohos.boardInfo'


export default function BoardInfoStageTest() {
    describe('BoardInfoStageTest', () => {

        beforeAll(() => {
            console.info('beforeAll: Prerequisites at the test suite level, which are executed before the test suite is executed.');
        })

        beforeEach(() => {
            console.info('beforeEach: Prerequisites at the test case level, which are executed before each test case is executed.');
        })

        afterEach(() => {
            console.info('afterEach: Test case-level clearance conditions, which are executed after each test case is executed.');
        })

        afterAll(() => {
            console.info('afterAll: Test suite-level cleanup condition, which are executed after the test suite is executed');
        })

        console.info('start################################start');

        /**
         * @tc.name   boardinfo_test_stage_0100
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0100
         * @tc.desc   Get the cpuId.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0100 start');
            let cpuId: string = boardInfo.cpuId;
            if (cpuId != '' && cpuId != null && cpuId != undefined) {
                console.info('the value of boardInfo.cpuId is :' + cpuId);
                expect(cpuId).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value cpuId is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0100 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0200
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0200
         * @tc.desc   Get the cpuArch.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0200 start');
            let cpuArch: string = boardInfo.cpuArch;
            if (cpuArch != '' && cpuArch != null && cpuArch != undefined) {
                console.info('the value of boardInfo.cpuArch is :' + cpuArch);
                expect(cpuArch).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value cpuArch is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0200 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0300
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0300
         * @tc.desc   Get the cpuVendor.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0300 start');
            let cpuVendor: string = boardInfo.cpuVendor;
            if (cpuVendor != '' && cpuVendor != null && cpuVendor != undefined) {
                console.info('the value of boardInfo.cpuVendor is :' + cpuVendor);
                expect(cpuVendor).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value cpuVendor is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0300 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0400
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0400
         * @tc.desc   Get the boardSn.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0400 start');
            try {
                let boardSn: string = boardInfo.boardSn;
                console.info('the value of boardInfo.boardSn is :' + boardSn);
                expect(boardSn).assertInstanceOf('String');
            } catch (e) {
                console.info('boardInfo.boardSn error, code: ' + e.code);
                expect(e.code).assertEqual(201);
            }
            console.info('boardinfo_test_stage_0400 : end');
            done();
        })

        /**
         * @tc.name   boardinfo_test_stage_0500
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0500
         * @tc.desc   Get the boardVendor.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0500 start');
            let boardVendor: string = boardInfo.boardVendor;
            if (boardVendor != '' && boardVendor != null && boardVendor != undefined) {
                console.info('the value of boardInfo.boardVendor is :' + boardVendor);
                expect(boardVendor).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value boardVendor is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0500 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0600
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0600
         * @tc.desc   Get the boardName.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0600 start');
            let boardName: string = boardInfo.boardName;
            if (boardName != '' && boardName != null && boardName != undefined) {
                console.info('the value of boardInfo.boardName is :' + boardName);
                expect(boardName).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value boardName is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0600 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0700
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0700
         * @tc.desc   Get the biosVendor.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0700 start');
            let biosVendor: string = boardInfo.biosVendor;
            if (biosVendor != '' && biosVendor != null && biosVendor != undefined) {
                console.info('the value of boardInfo.biosVendor is :' + biosVendor);
                expect(biosVendor).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value biosVendor is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0700 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0800
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0800
         * @tc.desc   Get the biosVersion.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0800 start');
            let biosVersion: string = boardInfo.biosVersion;
            if (biosVersion != '' && biosVersion != null && biosVersion != undefined) {
                console.info('the value of boardInfo.biosVersion is :' + biosVersion);
                expect(biosVersion).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value biosVersion is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0800 : end');
        })

        /**
         * @tc.name   boardinfo_test_stage_0900
         * @tc.number SUB_STARTUP_JS_BOARDINFO_0900
         * @tc.desc   Get the biosDate.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_test_stage_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_test_stage_0900 start');
            let biosDate: string = boardInfo.biosDate;
            if (biosDate != '' && biosDate != null && biosDate != undefined) {
                console.info('the value of boardInfo.biosDate is :' + biosDate);
                expect(biosDate).assertInstanceOf('String');
                done();
            } else {
                console.info('the return value biosDate is null or incorrect.');
                expect().assertFail();
                done();
            }
            console.info('boardinfo_test_stage_0900 : end');
        })
    })
}
