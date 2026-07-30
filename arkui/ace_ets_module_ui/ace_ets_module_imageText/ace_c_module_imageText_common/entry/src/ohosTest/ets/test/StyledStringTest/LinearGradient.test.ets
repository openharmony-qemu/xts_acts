/**
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

import { describe, beforeEach, it, expect, Level } from '@ohos/hypium';
import nativeFunc from 'libnativefunc.so'

export default function LinearGradientTest() {
  describe('LinearGradientTest', () => {
    beforeEach(async (done: Function) => {
      console.info("LinearGradientTest beforeEach start");
      done();
    })

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_Create_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_Create_0100 START');
      expect(nativeFunc.LinearGradientTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_Create_0100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0200 START');
      expect(nativeFunc.LinearGradientTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0300 START');
      expect(nativeFunc.LinearGradientTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetAngle_0300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0400 START');
      expect(nativeFunc.LinearGradientTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0500 START');
      expect(nativeFunc.LinearGradientTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0600 START');
      expect(nativeFunc.LinearGradientTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetAngle_0600 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0700 START');
      expect(nativeFunc.LinearGradientTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0800 START');
      expect(nativeFunc.LinearGradientTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetDirection_0800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_0900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_0900 START');
      expect(nativeFunc.LinearGradientTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_0900 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1000 START');
      expect(nativeFunc.LinearGradientTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1000 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1100 START');
      expect(nativeFunc.LinearGradientTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetDirection_1100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1200 START');
      expect(nativeFunc.LinearGradientTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1300 START');
      expect(nativeFunc.LinearGradientTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetRepeating_1300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1400 START');
      expect(nativeFunc.LinearGradientTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1500 START');
      expect(nativeFunc.LinearGradientTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1600 START');
      expect(nativeFunc.LinearGradientTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetRepeating_1600 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1700 START');
      expect(nativeFunc.LinearGradientTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1800 START');
      expect(nativeFunc.LinearGradientTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1900 START');
      expect(nativeFunc.LinearGradientTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_1900 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_2000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_2000 START');
      expect(nativeFunc.LinearGradientTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_SetColorStop_2000 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2100 START');
      expect(nativeFunc.LinearGradientTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2200 START');
      expect(nativeFunc.LinearGradientTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_LinearGradientOptions_GetColorStop_2200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_Create_2300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_Create_2300 START');
      expect(nativeFunc.LinearGradientTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_Create_2300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2400 START');
      expect(nativeFunc.LinearGradientTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2500 START');
      expect(nativeFunc.LinearGradientTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetLinearGradient_2500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2700 START');
      expect(nativeFunc.LinearGradientTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2800 START');
      expect(nativeFunc.LinearGradientTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2900 START');
      expect(nativeFunc.LinearGradientTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetLinearGradient_2900 END');
    });
  });
}