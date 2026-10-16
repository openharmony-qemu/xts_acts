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

import { describe, it, expect, TestType, Size, Level, DEFAULT, PrintTag } from 'jsunit_lite/index';

export default function assertTest() {

    describe('assert_basic_test', function() {
        /**
         * @tc.name      assert_equal_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0001
         * @tc.desc      Verify assertEqual works for number, string, and boolean
         */
        it('assert_equal_test', Level.LEVEL0, function() {
            expect(1).assertEqual(1);
            expect('hello').assertEqual('hello');
            expect(true).assertEqual(true);
        });

        /**
         * @tc.name      assert_true_false_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0002
         * @tc.desc      Verify assertTrue and assertFalse work
         */
        it('assert_true_false_test', Level.LEVEL0, function() {
            expect(true).assertTrue();
            expect(false).assertFalse();
            expect(0).assertFalse();
        });

        /**
         * @tc.name      assert_null_undefined_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0003
         * @tc.desc      Verify assertNull and assertUndefined work
         */
        it('assert_null_undefined_test', Level.LEVEL0, function() {
            expect(null).assertNull();
            expect(undefined).assertUndefined();
        });

        /**
         * @tc.name      assert_contain_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0004
         * @tc.desc      Verify assertContain checks substring
         */
        it('assert_contain_test', Level.LEVEL0, function() {
            expect('hello world').assertContain('world');
        });
    });

    describe('assert_comparison_test', function() {
        /**
         * @tc.name      assert_larger_less_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0005
         * @tc.desc      Verify assertLarger and assertLess work
         */
        it('assert_larger_less_test', Level.LEVEL0, function() {
            expect(2).assertLarger(1);
            expect(1).assertLess(2);
        });

        /**
         * @tc.name      assert_larger_or_equal_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0006
         * @tc.desc      Verify assertLargerOrEqual works
         */
        it('assert_larger_or_equal_test', Level.LEVEL0, function() {
            expect(2).assertLargerOrEqual(1);
            expect(1).assertLargerOrEqual(1);
        });

        /**
         * @tc.name      assert_less_or_equal_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0007
         * @tc.desc      Verify assertLessOrEqual works
         */
        it('assert_less_or_equal_test', Level.LEVEL0, function() {
            expect(1).assertLessOrEqual(2);
            expect(1).assertLessOrEqual(1);
        });

        /**
         * @tc.name      assert_close_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0008
         * @tc.desc      Verify assertClose works within threshold
         */
        it('assert_close_test', Level.LEVEL0, function() {
            expect(1.0).assertClose(1.01, 0.02);
        });
    });

    describe('assert_special_test', function() {
        /**
         * @tc.name      assert_instance_of_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0009
         * @tc.desc      Verify assertInstanceOf checks type
         */
        it('assert_instance_of_test', Level.LEVEL0, function() {
            expect([]).assertInstanceOf('Array');
        });

        /**
         * @tc.name      assert_nan_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0010
         * @tc.desc      Verify assertNaN detects NaN
         */
        it('assert_nan_test', Level.LEVEL0, function() {
            expect(NaN).assertNaN();
        });

        /**
         * @tc.name      assert_neg_unlimited_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0011
         * @tc.desc      Verify assertNegUnlimited detects -Infinity
         */
        it('assert_neg_unlimited_test', Level.LEVEL0, function() {
            expect(-Infinity).assertNegUnlimited();
        });

        /**
         * @tc.name      assert_pos_unlimited_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0012
         * @tc.desc      Verify assertPosUnlimited detects Infinity
         */
        it('assert_pos_unlimited_test', Level.LEVEL0, function() {
            expect(Infinity).assertPosUnlimited();
        });
    });

    describe('assert_throw_test', function() {
        /**
         * @tc.name      assert_throw_error_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0013
         * @tc.desc      Verify assertThrowError catches thrown error
         */
        it('assert_throw_error_test', Level.LEVEL0, function() {
            expect(function() {
                throw new Error('test error');
            }).assertThrowError('test error');
        });
    });

    describe('modifier_test', function() {
        /**
         * @tc.name      not_assert_equal_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0014
         * @tc.desc      Verify not().assertEqual negates equality
         */
        it('not_assert_equal_test', Level.LEVEL0, function() {
            expect(1).not().assertEqual(2);
        });

        /**
         * @tc.name      not_assert_true_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0015
         * @tc.desc      Verify not().assertTrue negates truthiness
         */
        it('not_assert_true_test', Level.LEVEL0, function() {
            expect(false).not().assertTrue();
        });

        /**
         * @tc.name      not_assert_contain_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0016
         * @tc.desc      Verify not().assertContain negates containment
         */
        it('not_assert_contain_test', Level.LEVEL0, function() {
            expect('hello').not().assertContain('world');
        });
    });

    describe('constant_export_test', function() {
        /**
         * @tc.name      test_type_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0017
         * @tc.desc      Verify TestType constants
         */
        it('test_type_test', Level.LEVEL0, function() {
            expect(TestType.FUNCTION).assertEqual(1);
            expect(TestType.SECURITY).assertEqual(16);
        });

        /**
         * @tc.name      size_level_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0018
         * @tc.desc      Verify Size, Level and DEFAULT constants
         */
        it('size_level_test', Level.LEVEL0, function() {
            expect(Size.SMALLTEST).assertEqual(65536);
            expect(Level.LEVEL0).assertEqual(16777216);
            expect(DEFAULT).assertEqual(0);
        });

        /**
         * @tc.name      print_tag_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0019
         * @tc.desc      Verify PrintTag constant value
         */
        it('print_tag_test', Level.LEVEL0, function() {
            expect(PrintTag.OHOS_REPORT_STATUS).assertEqual('OHOS_REPORT_STATUS');
        });
    });

    describe('multi_expect_test', function() {
        /**
         * @tc.name      mixed_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0020
         * @tc.desc      Verify multiple different assertions in one case
         */
        it('mixed_test', Level.LEVEL0, function() {
            expect(10).assertLarger(5);
            expect('hello').assertContain('ell');
            expect(null).assertNull();
            expect(NaN).assertNaN();
            expect(Infinity).assertPosUnlimited();
        });

        /**
         * @tc.name      not_test
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0021
         * @tc.desc      Verify not() modifier with assertEqual
         */
        it('not_test', Level.LEVEL0, function() {
            expect(1).not().assertEqual(2);
            expect('a').not().assertEqual('b');
        });
    });

    describe('it_with_filter_test', function() {
        /**
         * @tc.name      filter_function
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0022
         * @tc.desc      Verify TestType.FUNCTION filter
         */
        it('filter_function', Level.LEVEL0, function() {
            expect(TestType.FUNCTION).assertEqual(1);
        });

        /**
         * @tc.name      filter_small
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0023
         * @tc.desc      Verify Size.SMALLTEST filter
         */
        it('filter_small', Level.LEVEL0, function() {
            expect(Size.SMALLTEST).assertEqual(65536);
        });

        /**
         * @tc.name      filter_level0
         * @tc.number    SUB_TESTFWK_ARKXTEST_JSUNIT_LITE_0024
         * @tc.desc      Verify Level.LEVEL0 filter
         */
        it('filter_level0', Level.LEVEL0, function() {
            expect(Level.LEVEL0).assertEqual(16777216);
        });
    });
}
