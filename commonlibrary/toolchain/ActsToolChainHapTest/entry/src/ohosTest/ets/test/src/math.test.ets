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

import * as testNapi from "libentry.so";
import { describe, expect, it, Level } from "@ohos/hypium";

export default function math_group_test() {
  describe("ActsToolChainHapTest_src_math", () => {
    /**
     * @tc.name   acos
     * @tc.number SUB_THIRDPARTY_MUSL_ACOS_0100
     * @tc.desc   libc-test acos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acos");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acosh
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSH_0100
     * @tc.desc   libc-test acosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acosh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acosh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acoshf
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSHF_0100
     * @tc.desc   libc-test acoshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acoshf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acoshf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   acosl
     * @tc.number SUB_THIRDPARTY_MUSL_ACOSL_0100
     * @tc.desc   libc-test acosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("acosl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("acosl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asin
     * @tc.number SUB_THIRDPARTY_MUSL_ASIN_0100
     * @tc.desc   libc-test asin
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asin", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asin");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinf
     * @tc.number SUB_THIRDPARTY_MUSL_ASINF_0100
     * @tc.desc   libc-test asinf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinh
     * @tc.number SUB_THIRDPARTY_MUSL_ASINH_0100
     * @tc.desc   libc-test asinh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinhf
     * @tc.number SUB_THIRDPARTY_MUSL_ASINHF_0100
     * @tc.desc   libc-test asinhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   asinl
     * @tc.number SUB_THIRDPARTY_MUSL_ASINL_0100
     * @tc.desc   libc-test asinl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("asinl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("asinl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_0100
     * @tc.desc   libc-test atan
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_0100
     * @tc.desc   libc-test atan2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2f
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_F_0100
     * @tc.desc   libc-test atan2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2f");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atan2l
     * @tc.number SUB_THIRDPARTY_MUSL_ATAN_TWO_L_0100
     * @tc.desc   libc-test atan2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atan2l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atan2l");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanf
     * @tc.number SUB_THIRDPARTY_MUSL_ATANF_0100
     * @tc.desc   libc-test atanf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanh
     * @tc.number SUB_THIRDPARTY_MUSL_ATANH_0100
     * @tc.desc   libc-test atanh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanhf
     * @tc.number SUB_THIRDPARTY_MUSL_ATANHF_0100
     * @tc.desc   libc-test atanhf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanhf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanhf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanhl
     * @tc.number SUB_THIRDPARTY_MUSL_ATANHL_0100
     * @tc.desc   libc-test atanhl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanhl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanhl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   atanl
     * @tc.number SUB_THIRDPARTY_MUSL_ATANL_0100
     * @tc.desc   libc-test atanl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("atanl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("atanl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrt
     * @tc.number SUB_THIRDPARTY_MUSL_CBRT_0100
     * @tc.desc   libc-test cbrt
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrt", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrt");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrtf
     * @tc.number SUB_THIRDPARTY_MUSL_CBRTF_0100
     * @tc.desc   libc-test cbrtf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrtf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrtf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cbrtl
     * @tc.number SUB_THIRDPARTY_MUSL_CBRTL_0100
     * @tc.desc   libc-test cbrtl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cbrtl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cbrtl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceil
     * @tc.number SUB_THIRDPARTY_MUSL_CEIL_0100
     * @tc.desc   libc-test ceil
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceil", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceil");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceilf
     * @tc.number SUB_THIRDPARTY_MUSL_CEILF_0100
     * @tc.desc   libc-test ceilf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceilf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceilf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   ceill
     * @tc.number SUB_THIRDPARTY_MUSL_CEILL_0100
     * @tc.desc   libc-test ceill
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ceill", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ceill");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysign
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGN_0100
     * @tc.desc   libc-test copysign
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysign", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysign");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysignf
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGNF_0100
     * @tc.desc   libc-test copysignf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysignf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysignf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   copysignl
     * @tc.number SUB_THIRDPARTY_MUSL_COPYSIGNL_0100
     * @tc.desc   libc-test copysignl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("copysignl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("copysignl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cos
     * @tc.number SUB_THIRDPARTY_MUSL_COS_0100
     * @tc.desc   libc-test cos
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cos", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cos");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosf
     * @tc.number SUB_THIRDPARTY_MUSL_COSF_0100
     * @tc.desc   libc-test cosf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosh
     * @tc.number SUB_THIRDPARTY_MUSL_COSH_0100
     * @tc.desc   libc-test cosh
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosh", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosh");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   coshf
     * @tc.number SUB_THIRDPARTY_MUSL_COSHF_0100
     * @tc.desc   libc-test coshf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("coshf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("coshf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   coshl
     * @tc.number SUB_THIRDPARTY_MUSL_COSHL_0100
     * @tc.desc   libc-test coshl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("coshl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("coshl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   cosl
     * @tc.number SUB_THIRDPARTY_MUSL_COSL_0100
     * @tc.desc   libc-test cosl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("cosl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("cosl");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   drem
     * @tc.number SUB_THIRDPARTY_MUSL_DREM_0100
     * @tc.desc   libc-test drem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("drem", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("drem");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   dremf
     * @tc.number SUB_THIRDPARTY_MUSL_DREMF_0100
     * @tc.desc   libc-test dremf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("dremf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("dremf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erf
     * @tc.number SUB_THIRDPARTY_MUSL_ERF_0100
     * @tc.desc   libc-test erf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfc
     * @tc.number SUB_THIRDPARTY_MUSL_ERFC_0100
     * @tc.desc   libc-test erfc
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfc", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfc");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfcf
     * @tc.number SUB_THIRDPARTY_MUSL_ERFCF_0100
     * @tc.desc   libc-test erfcf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfcf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfcf");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erff
     * @tc.number SUB_THIRDPARTY_MUSL_ERFF_0100
     * @tc.desc   libc-test erff
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erff", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erff");
      expect(result).assertEqual(0);
      done();
    });

    /**
     * @tc.name   erfl
     * @tc.number SUB_THIRDPARTY_MUSL_ERFL_0100
     * @tc.desc   libc-test erfl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("erfl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("erfl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_0100
     * @tc.desc   libc-test exp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_0100
     * @tc.desc   libc-test exp2
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2f
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_F_0100
     * @tc.desc   libc-test exp2f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2f");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   exp2l
     * @tc.number SUB_THIRDPARTY_MUSL_EXP_TWO_L_0100
     * @tc.desc   libc-test exp2l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("exp2l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("exp2l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expf
     * @tc.number SUB_THIRDPARTY_MUSL_EXPF_0100
     * @tc.desc   libc-test expf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expl
     * @tc.number SUB_THIRDPARTY_MUSL_EXPL_0100
     * @tc.desc   libc-test expl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_0100
     * @tc.desc   libc-test expm1
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1f
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_F_0100
     * @tc.desc   libc-test expm1f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1f", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1f");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   expm1l
     * @tc.number SUB_THIRDPARTY_MUSL_EXPM_ONE_L_0100
     * @tc.desc   libc-test expm1l
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("expm1l", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("expm1l");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabs
     * @tc.number SUB_THIRDPARTY_MUSL_FABS_0100
     * @tc.desc   libc-test fabs
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabs", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabs");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabsf
     * @tc.number SUB_THIRDPARTY_MUSL_FABSF_0100
     * @tc.desc   libc-test fabsf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabsf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabsf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fabsl
     * @tc.number SUB_THIRDPARTY_MUSL_FABSL_0100
     * @tc.desc   libc-test fabsl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fabsl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fabsl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fdiml
     * @tc.number SUB_THIRDPARTY_MUSL_FDIML_0100
     * @tc.desc   libc-test fdiml
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fdiml", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fdiml");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floor
     * @tc.number SUB_THIRDPARTY_MUSL_FLOOR_0100
     * @tc.desc   libc-test floor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floor", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floor");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floorf
     * @tc.number SUB_THIRDPARTY_MUSL_FLOORF_0100
     * @tc.desc   libc-test floorf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floorf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floorf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   floorl
     * @tc.number SUB_THIRDPARTY_MUSL_FLOORL_0100
     * @tc.desc   libc-test floorl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("floorl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("floorl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmax
     * @tc.number SUB_THIRDPARTY_MUSL_FMAX_0100
     * @tc.desc   libc-test fmax
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmax", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmax");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmaxf
     * @tc.number SUB_THIRDPARTY_MUSL_FMAXF_0100
     * @tc.desc   libc-test fmaxf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmaxf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmaxf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   fmaxl
     * @tc.number SUB_THIRDPARTY_MUSL_FMAXL_0100
     * @tc.desc   libc-test fmaxl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("fmaxl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("fmaxl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexp
     * @tc.number SUB_THIRDPARTY_MUSL_FREXP_0100
     * @tc.desc   libc-test frexp
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexp", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexp");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexpf
     * @tc.number SUB_THIRDPARTY_MUSL_FREXPF_0100
     * @tc.desc   libc-test frexpf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexpf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexpf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   frexpl
     * @tc.number SUB_THIRDPARTY_MUSL_FREXPL_0100
     * @tc.desc   libc-test frexpl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("frexpl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("frexpl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypot
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOT_0100
     * @tc.desc   libc-test hypot
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypot", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypot");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypotf
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOTF_0100
     * @tc.desc   libc-test hypotf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypotf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypotf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   hypotl
     * @tc.number SUB_THIRDPARTY_MUSL_HYPOTL_0100
     * @tc.desc   libc-test hypotl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("hypotl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("hypotl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogb
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGB_0100
     * @tc.desc   libc-test ilogb
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogb", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogb");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogbf
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGBF_0100
     * @tc.desc   libc-test ilogbf
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogbf", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogbf");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   ilogbl
     * @tc.number SUB_THIRDPARTY_MUSL_ILOGBL_0100
     * @tc.desc   libc-test ilogbl
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("ilogbl", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("ilogbl");
      expect(result).assertEqual(0);
      done();
    });
    /**
     * @tc.name   isless
     * @tc.number SUB_THIRDPARTY_MUSL_ISLESS_0100
     * @tc.desc   libc-test isless
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it("isless", Level.LEVEL1, async (done: Function) => {
      const result = await testNapi.runTest("isless");
      expect(result).assertEqual(0);
      done();
    });
  });
}
