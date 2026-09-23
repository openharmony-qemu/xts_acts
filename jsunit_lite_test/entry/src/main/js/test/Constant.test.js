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

import { describe, it, expect, TestType, Size, Level, DEFAULT } from 'jsunit_lite/index';

export default function constantTest() {

    describe('constant_test', function() {
        /**
         * @tc.name      test_type_size_level_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0064
         * @tc.desc      Verify TestType, Size, Level and DEFAULT constants
         */
        it('test_type_size_level_test', Level.LEVEL0, function() {
            expect(TestType.FUNCTION).assertEqual(1);
            expect(TestType.PERFORMANCE).assertEqual(2);
            expect(Size.SMALLTEST).assertEqual(1 << 16);
            expect(Size.MEDIUMTEST).assertEqual(1 << 17);
            expect(Level.LEVEL0).assertEqual(1 << 24);
            expect(Level.LEVEL1).assertEqual(1 << 25);
            expect(DEFAULT).assertEqual(0);
        });
    });
}
