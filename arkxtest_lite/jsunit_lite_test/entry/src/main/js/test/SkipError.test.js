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

import { describe, it, expect, SkipError, xdescribe, xit, Level } from 'jsunit_lite/index';

export default function skipErrorTest() {
    describe('skip_error_test', function() {
        /**
         * @tc.name      skip_error_creation
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0043
         * @tc.desc      Verify SkipError creation with message and name
         */
        it('skip_error_creation', Level.LEVEL0, function() {
            var err = new SkipError('test skip');
            expect(err.message).assertEqual('test skip');
            expect(err.name).assertEqual('SkipError');
        });

        /**
         * @tc.name      skip_error_instanceof
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0044
         * @tc.desc      Verify SkipError is instance of SkipError and Error
         */
        it('skip_error_instanceof', Level.LEVEL0, function() {
            var err = new SkipError('test');
            expect(err instanceof SkipError).assertTrue();
            expect(err instanceof Error).assertTrue();
        });
    });

    xdescribe('xdescribe_skip_all', function() {
        /**
         * @tc.name      should_not_run_1
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0045
         * @tc.desc      Verify xdescribe skips case 1
         */
        it('should_not_run_1', Level.LEVEL0, function() {
            expect(true).assertEqual(false);
        });

        /**
         * @tc.name      should_not_run_2
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0046
         * @tc.desc      Verify xdescribe skips case 2
         */
        it('should_not_run_2', Level.LEVEL0, function() {
            expect(true).assertEqual(false);
        });
    }, 'batch skip');

    describe('xit_in_normal', function() {
        var executed = false;

        xit('skipped_spec', Level.LEVEL0, function() {
            executed = true;
        }, 'not ready');

        /**
         * @tc.name      verify_not_executed
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0047
         * @tc.desc      Verify xit skipped spec did not execute
         */
        it('verify_not_executed', Level.LEVEL0, function() {
            expect(executed).assertFalse();
        });
    });
}
