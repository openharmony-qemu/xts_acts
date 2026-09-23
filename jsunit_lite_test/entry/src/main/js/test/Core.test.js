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

import { describe, it, expect, xdescribe, xit, Level } from 'jsunit_lite/index';

export default function coreTest() {

    describe('core_describe_test', function() {
        /**
         * @tc.name      describe_creates_suite
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0048
         * @tc.desc      Verify nested describe suite does not auto-run
         */
        it('describe_creates_suite', Level.LEVEL0, function() {
            var ran = false;

            describe('temp_suite', function() {
                /**
                 * @tc.name      temp_case
                 * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0049
                 * @tc.desc      Verify inner temp case sets ran flag
                 */
                it('temp_case', Level.LEVEL0, function() {
                    ran = true;
                    expect(ran).assertTrue();
                });
            });
            expect(ran).assertFalse();
        });
    });

    describe('core_xdescribe_test', function() {
        /**
         * @tc.name      xdescribe_not_executed
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0050
         * @tc.desc      Verify xdescribe body does not execute
         */
        it('xdescribe_not_executed', Level.LEVEL0, function() {
            var ran = false;

            xdescribe('skip_suite', function() {
                /**
                 * @tc.name      skip_case
                 * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0051
                 * @tc.desc      Verify xdescribe inner case does not run
                 */
                it('skip_case', Level.LEVEL0, function() {
                    ran = true;
                    expect(ran).assertTrue();
                });
            }, 'reason');
            expect(ran).assertFalse();
        });
    });

    describe('core_xit_test', function() {
        /**
         * @tc.name      xit_not_executed
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0052
         * @tc.desc      Verify xit does not execute
         */
        it('xit_not_executed', Level.LEVEL0, function() {
            var ran = false;

            describe('xit_container', function() {
                xit('skip_spec', Level.LEVEL0, function() {
                    ran = true;
                }, 'reason');
            });
            expect(ran).assertFalse();
        });
    });

    describe('core_nested_test', function() {
        /**
         * @tc.name      nested_3_levels
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0053
         * @tc.desc      Verify 3-level nested describe executes body
         */
        it('nested_3_levels', Level.LEVEL0, function() {
            var d = 0;

            describe('nested_level_1', function() {
                d = 1;

                describe('nested_level_2', function() {
                    d = 2;

                    describe('nested_level_3', function() {
                        d = 3;

                        /**
                         * @tc.name      deep
                         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0054
                         * @tc.desc      Verify deep nested case sees value 3
                         */
                        it('deep', Level.LEVEL0, function() {
                            expect(d).assertEqual(3);
                        });
                    });
                });
            });
            expect(d).assertEqual(3);
        });
    });

    describe('core_expect_chain', function() {
        /**
         * @tc.name      expect_object
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0055
         * @tc.desc      Verify expect returns an object
         */
        it('expect_object', Level.LEVEL0, function() {
            expect(typeof expect(1)).assertEqual('object');
        });

        /**
         * @tc.name      equal_chain
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0056
         * @tc.desc      Verify assertEqual chain returns object
         */
        it('equal_chain', Level.LEVEL0, function() {
            expect(typeof expect(1).assertEqual(1)).assertEqual('object');
        });

        /**
         * @tc.name      not_chain
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0057
         * @tc.desc      Verify not() chain returns object
         */
        it('not_chain', Level.LEVEL0, function() {
            expect(typeof expect(1).not()).assertEqual('object');
        });
    });
}
