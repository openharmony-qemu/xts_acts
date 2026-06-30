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

export default function RadialGradientTest() {
  describe('RadialGradientTest', () => {
    beforeEach(async (done: Function) => {
      console.info("RadialGradientTest beforeEach start");
      done();
    })

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_Create_0100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_Create_0100 START');
      expect(nativeFunc.RadialGradientTest_001()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_Create_0100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0200 START');
      expect(nativeFunc.RadialGradientTest_002()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0300 START');
      expect(nativeFunc.RadialGradientTest_003()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterX_0300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0400 START');
      expect(nativeFunc.RadialGradientTest_004()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0500 START');
      expect(nativeFunc.RadialGradientTest_005()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0600 START');
      expect(nativeFunc.RadialGradientTest_006()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterX_0600 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0700 START');
      expect(nativeFunc.RadialGradientTest_007()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0800 START');
      expect(nativeFunc.RadialGradientTest_008()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetCenterY_0800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_0900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_0900 START');
      expect(nativeFunc.RadialGradientTest_009()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_0900 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1000 START');
      expect(nativeFunc.RadialGradientTest_010()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1000 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1100 START');
      expect(nativeFunc.RadialGradientTest_011()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetCenterY_1100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1200 START');
      expect(nativeFunc.RadialGradientTest_012()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1300 START');
      expect(nativeFunc.RadialGradientTest_013()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRadius_1300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1400 START');
      expect(nativeFunc.RadialGradientTest_014()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1500 START');
      expect(nativeFunc.RadialGradientTest_015()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1600 START');
      expect(nativeFunc.RadialGradientTest_016()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRadius_1600 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1700 START');
      expect(nativeFunc.RadialGradientTest_017()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1800 START');
      expect(nativeFunc.RadialGradientTest_018()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetRepeating_1800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_1900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_1900 START');
      expect(nativeFunc.RadialGradientTest_019()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_1900 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2000', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2000 START');
      expect(nativeFunc.RadialGradientTest_020()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2000 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2100 START');
      expect(nativeFunc.RadialGradientTest_021()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetRepeating_2100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2200 START');
      expect(nativeFunc.RadialGradientTest_022()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2300 START');
      expect(nativeFunc.RadialGradientTest_023()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2300 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2400', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2400 START');
      expect(nativeFunc.RadialGradientTest_024()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2400 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2500', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2500 START');
      expect(nativeFunc.RadialGradientTest_025()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_SetColorStop_2500 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2600', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2600 START');
      expect(nativeFunc.RadialGradientTest_026()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2600 END');
    });

    it('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2700', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2700 START');
      expect(nativeFunc.RadialGradientTest_027()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_RadialGradientOptions_GetColorStop_2700 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2800', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2800 START');
      expect(nativeFunc.RadialGradientTest_028()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2800 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2900', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2900 START');
      expect(nativeFunc.RadialGradientTest_029()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_SetRadialGradient_2900 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3100', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3100 START');
      expect(nativeFunc.RadialGradientTest_031()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3100 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3200', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3200 START');
      expect(nativeFunc.RadialGradientTest_032()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3200 END');
    });

    it('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3300', Level.LEVEL1, async () => {
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3300 START');
      expect(nativeFunc.RadialGradientTest_033()).assertEqual(0)
      console.info('SUB_ARKUI_OH_ArkUI_ParagraphStyle_GetRadialGradient_3300 END');
    });
  });
}