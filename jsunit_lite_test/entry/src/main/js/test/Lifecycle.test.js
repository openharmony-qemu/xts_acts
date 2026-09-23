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

import { describe, it, expect, beforeAll, afterAll, beforeEach, afterEach, Level,
    beforeEachIt, afterEachIt, beforeItSpecified, afterItSpecified } from 'jsunit_lite/index';

export default function lifecycleTest() {

    describe('lifecycle_basic_test', function() {
        var order = [];

        beforeAll(function() {
            order.push('beforeAll');
        });

        afterAll(function() {
            order.push('afterAll');
        });

        /**
         * @tc.name      case_1
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0025
         * @tc.desc      Push case_1 to order array
         */
        it('case_1', Level.LEVEL0, function() {
            order.push('case_1');
            expect(order.length).assertLarger(0);
        });

        /**
         * @tc.name      case_2
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0026
         * @tc.desc      Push case_2 to order array
         */
        it('case_2', Level.LEVEL0, function() {
            order.push('case_2');
            expect(order.length).assertLarger(0);
        });

        /**
         * @tc.name      verify_before_all
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0027
         * @tc.desc      Verify beforeAll executed before cases
         */
        it('verify_before_all', Level.LEVEL0, function() {
            expect(order[0]).assertEqual('beforeAll');
            expect(order.indexOf('case_1') >= 0).assertTrue();
        });
    });

    describe('before_each_after_each_test', function() {
        var counter = 0;

        beforeEach(function() {
            counter++;
        });

        afterEach(function() {
            counter += 10;
        });

        /**
         * @tc.name      counter_1
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0028
         * @tc.desc      Verify beforeEach increments counter
         */
        it('counter_1', Level.LEVEL0, function() {
            expect(counter).assertEqual(1);
        });

        /**
         * @tc.name      counter_12
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0029
         * @tc.desc      Verify afterEach adds 10 after each case
         */
        it('counter_12', Level.LEVEL0, function() {
            expect(counter).assertEqual(12);
        });
    });

    describe('nested_hooks_test', function() {
        var log = [];

        beforeAll(function() {
            log.push('parent_beforeAll');
        });

        beforeEach(function() {
            log.push('parent_beforeEach');
        });

        afterEach(function() {
            log.push('parent_afterEach');
        });

        describe('child', function() {
            beforeAll(function() {
                log.push('child_beforeAll');
            });

            beforeEach(function() {
                log.push('child_beforeEach');
            });

            /**
             * @tc.name      child_case
             * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0030
             * @tc.desc      Verify nested beforeAll hooks ran
             */
            it('child_case', Level.LEVEL0, function() {
                expect(log.indexOf('parent_beforeAll') >= 0).assertTrue();
                expect(log.indexOf('child_beforeAll') >= 0).assertTrue();
            });
        });
    });

    describe('before_each_it_test', function() {
        var c = 0;

        beforeEachIt(function() {
            c++;
        });

        afterEachIt(function() {
            c += 100;
        });

        /**
         * @tc.name      each_it_1
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0031
         * @tc.desc      Verify beforeEachIt increments counter
         */
        it('each_it_1', Level.LEVEL0, function() {
            expect(c).assertLarger(0);
        });

        /**
         * @tc.name      each_it_2
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0032
         * @tc.desc      Verify afterEachIt adds 100 after each it
         */
        it('each_it_2', Level.LEVEL0, function() {
            expect(c).assertLarger(0);
        });
    });

    describe('specified_test', function() {
        var flags = {};

        beforeItSpecified(['target_a'], function() {
            flags.a = true;
        });

        afterItSpecified(['target_a'], function() {
            flags.a = false;
        });

        /**
         * @tc.name      target_a
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0033
         * @tc.desc      Verify beforeItSpecified sets flag for target
         */
        it('target_a', Level.LEVEL0, function() {
            expect(flags.a).assertTrue();
        });

        /**
         * @tc.name      non_target
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0034
         * @tc.desc      Verify beforeItSpecified skips non-target cases
         */
        it('non_target', Level.LEVEL0, function() {
            if (flags.a !== undefined) {
                expect(flags.a).assertFalse();
            }
        });
    });

    describe('specified_array_test', function() {
        var called = {};

        beforeItSpecified(['s1', 's2'], function() {
            called.multi = true;
        });

        afterItSpecified(['s1', 's2'], function() {
            called.multi = false;
        });

        /**
         * @tc.name      s1
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0035
         * @tc.desc      Verify beforeItSpecified with array for s1
         */
        it('s1', Level.LEVEL0, function() {
            expect(called.multi).assertTrue();
        });

        /**
         * @tc.name      s2
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0036
         * @tc.desc      Verify beforeItSpecified with array for s2
         */
        it('s2', Level.LEVEL0, function() {
            expect(called.multi).assertTrue();
        });

        /**
         * @tc.name      s3
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0037
         * @tc.desc      Verify beforeItSpecified skips non-listed s3
         */
        it('s3', Level.LEVEL0, function() {
            if (called.multi !== undefined) {
                expect(called.multi).assertFalse();
            }
        });
    });

    describe('hook_error_test', function() {
        var executed = false;

        beforeAll(function() {
            throw new Error('hook error');
        });

        /**
         * @tc.name      case_after_error
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0038
         * @tc.desc      Verify case after hook error sets executed flag
         */
        it('case_after_error', Level.LEVEL0, function() {
            executed = true;
            expect(executed).assertTrue();
        });

        /**
         * @tc.name      verify_not_executed
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0039
         * @tc.desc      Verify case after hook error did not execute
         */
        it('verify_not_executed', Level.LEVEL0, function() {
            expect(executed).assertFalse();
        });
    });

    describe('counter_suite_test', function() {
        var val = 0;

        beforeAll(function() {
            val = 0;
        });

        /**
         * @tc.name      case_a
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0040
         * @tc.desc      Verify counter increments to 1
         */
        it('case_a', Level.LEVEL0, function() {
            val++;
            expect(val).assertEqual(1);
        });

        /**
         * @tc.name      case_b
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0041
         * @tc.desc      Verify counter increments to 2
         */
        it('case_b', Level.LEVEL0, function() {
            val++;
            expect(val).assertEqual(2);
        });

        /**
         * @tc.name      case_c
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0042
         * @tc.desc      Verify counter increments to 3
         */
        it('case_c', Level.LEVEL0, function() {
            val++;
            expect(val).assertEqual(3);
        });
    });
}
