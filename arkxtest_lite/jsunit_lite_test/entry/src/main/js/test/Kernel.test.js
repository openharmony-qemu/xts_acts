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

export default function kernelTest() {

    describe('kernel_test', function() {
        /**
         * @tc.name      linux_kernel_run_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0065
         * @tc.desc      Verify linux kernel run test passes
         */
        it('linux_kernel_run_test', Level.LEVEL0, function() {
            expect(true).assertTrue();
        });

        /**
         * @tc.name      liteos_kernel_run_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0066
         * @tc.desc      Verify liteos kernel run test passes
         */
        it('liteos_kernel_run_test', Level.LEVEL0, function() {
            expect(true).assertTrue();
        });
    });
}
