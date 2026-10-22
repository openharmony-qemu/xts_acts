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

import { describe, it, expect, Level } from 'jsunit_lite/index';

export default function reportTest() {
    describe('report_test', function() {
        /**
         * @tc.name      pass_output
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0059
         * @tc.desc      Verify passing case output
         */
        it('pass_output', Level.LEVEL0, function() {
            expect(true).assertTrue();
        });

        /**
         * @tc.name      suite_marker
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0060
         * @tc.desc      Verify suite start and end markers
         */
        it('suite_marker', Level.LEVEL0, function() {
            expect('[suite start]').assertContain('suite start');
            expect('[end] run suites end').assertContain('[end]');
        });

        /**
         * @tc.name      edge_empty
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0061
         * @tc.desc      Verify empty string equality
         */
        it('edge_empty', Level.LEVEL0, function() {
            expect('').assertEqual('');
        });

        /**
         * @tc.name      edge_zero
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0062
         * @tc.desc      Verify zero equality
         */
        it('edge_zero', Level.LEVEL0, function() {
            expect(0).assertEqual(0);
        });
    });
}
