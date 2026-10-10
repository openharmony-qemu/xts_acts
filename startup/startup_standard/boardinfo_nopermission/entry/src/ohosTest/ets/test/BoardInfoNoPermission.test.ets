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


export default function BoardInfoNoPermissionTest() {
    describe('BoardInfoNoPermissionTest', () => {

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
            console.info('afterAll: Test suite-level cleanup condition, which is executed after the test suite is executed');
        })

        console.info('start################################start');

        /**
         * @tc.name   boardinfo_noperm_test_001
         * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0100
         * @tc.desc   Access boardSn without ohos.permission.ACCESS_BOARD_INFO permission, expect error code 201.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_noperm_test_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_noperm_test_001 start');
            try {
                let boardSn = boardInfo.boardSn;
                console.info('boardinfo_noperm_test_001 the value of boardInfo.boardSn is :' + boardSn);
                expect(boardSn).assertInstanceOf('String');
                expect(boardSn).assertEqual('');
            } catch (e) {
                console.info('boardinfo_noperm_test_001 error code: ' + e.code + ', error message: ' + e.message);
                expect(Number(e.code)).assertEqual(201);
            }
            console.info('boardinfo_noperm_test_001 : end');
            done();
        })

        /**
         * @tc.name   boardinfo_noperm_test_002
         * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0200
         * @tc.desc   Access boardSn multiple times without ohos.permission.ACCESS_BOARD_INFO permission, verify error code 201 is consistent.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_noperm_test_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_noperm_test_002 start');
            for (let i = 0; i < 3; i++) {
                console.info('boardinfo_noperm_test_002 iteration: ' + i);
                try {
                    let boardSn = boardInfo.boardSn;
                    console.info('boardinfo_noperm_test_002 iteration ' + i + ' boardSn value: ' + boardSn);
                    expect(boardSn).assertInstanceOf('String');
                    expect(boardSn).assertEqual('');
                } catch (e) {
                    console.info('boardinfo_noperm_test_002 iteration ' + i + ' error code: ' + e.code + ', error message: ' + e.message);
                    expect(Number(e.code)).assertEqual(201);
                }
            }
            console.info('boardinfo_noperm_test_002 : end');
            done();
        })

        /**
         * @tc.name   boardinfo_noperm_test_003
         * @tc.number SUB_STARTUP_JS_BOARDINFO_NOPERM_0300
         * @tc.desc   Verify boardSn error message is not empty when permission denied.
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('boardinfo_noperm_test_003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
            console.info('boardinfo_noperm_test_003 start');
            try {
                let boardSn = boardInfo.boardSn;
                console.info('boardinfo_noperm_test_003 boardSn value: ' + boardSn);
                expect(boardSn).assertInstanceOf('String');
                expect(boardSn).assertEqual('');
            } catch (e) {
                console.info('boardinfo_noperm_test_003 error code: ' + e.code + ', error message: ' + e.message);
                expect(Number(e.code)).assertEqual(201);
                expect(e.message.length).assertLarger(0);
            }
            console.info('boardinfo_noperm_test_003 : end');
            done();
        })

    })
}
