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

import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';
import { describe, beforeEach, it, expect, Level } from '@ohos/hypium-dynamic';

export default function TextStrokeWidthTest() {
  describe('TextStrokeWidthTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStrokeWidthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStrokeWidth',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStrokeWidthTest state pages: " + JSON.stringify(pages));
        if (!("TextStrokeWidth" == pages.name)) {
          console.info("get TextStrokeWidthTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStrokeWidthTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStrokeWidthTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textStrokeWidth_px_positive_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0100
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.px(3.0) positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_px_positive_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_px_positive_0100] START');

      let strJson: string = getInspectorByKey('text_strokeWidth_px_positive');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_px_positive_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_px_positive_0100] strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$type).assertEqual('Text');
      let strokeWidth: string = obj.$attrs.strokeWidth as string;
      expect(strokeWidth).assertEqual('3.00px');
      console.info('[textStrokeWidth_px_positive_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_px_negative_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0200
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.px(-3.0) negative value (solid text)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_px_negative_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_px_negative_0100] START');

      let strJson: string = getInspectorByKey('text_strokeWidth_px_negative');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_px_negative_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_px_negative_0100] strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$type).assertEqual('Text');
      let strokeWidth: string = obj.$attrs.strokeWidth as string;
      expect(strokeWidth).assertEqual('-3.00px');
      console.info('[textStrokeWidth_px_negative_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_vp_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0300
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.vp(3.0) value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_vp_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_vp_0100] START');

      let strJson: string = getInspectorByKey('text_strokeWidth_vp');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_vp_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_vp_0100] strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$type).assertEqual('Text');
      let strokeWidth: string = obj.$attrs.strokeWidth as string;
      expect(strokeWidth).assertEqual('3.00vp');
      console.info('[textStrokeWidth_vp_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_null_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0400
     * @tc.desc   Test Text strokeWidth property with null, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_null_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeWidth_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeWidth_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_null_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textStrokeWidth_null_0100] null strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$attrs.strokeWidth).not().assertUndefined();
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textStrokeWidth_null_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0500
     * @tc.desc   Test Text strokeWidth property with undefined, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeWidth_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeWidth_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_undefined_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textStrokeWidth_undefined_0100] undefined strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$attrs.strokeWidth).not().assertUndefined();
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textStrokeWidth_undefined_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_px_zero_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0600
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.px(0) zero value, no stroke effect
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_px_zero_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_px_zero_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeWidth_px_zero');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_px_zero_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeWidth_px_zero_0100] zero obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_px_zero_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textStrokeWidth_px_zero_0100] zero strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.strokeWidth).not().assertUndefined();
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textStrokeWidth_px_zero_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_percent_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0700
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.percent(50), should not take effect, use default
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_percent_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_percent_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeWidth_percent');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_percent_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeWidth_percent_0100] percent obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_percent_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textStrokeWidth_percent_0100] percent strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$attrs.strokeWidth).not().assertUndefined();
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textStrokeWidth_percent_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_modifier_px_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_MODIFIER_0100
     * @tc.desc   Test Text strokeWidth property set via AttributeModifier with LengthMetrics.px(5.0)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_modifier_px_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_modifier_px_0100] START');

      let strJson: string = getInspectorByKey('text_strokeWidth_modifier_px');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_modifier_px_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_modifier_px_0100] strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$type).assertEqual('Text');
      let strokeWidth: string = obj.$attrs.strokeWidth as string;
      expect(strokeWidth).assertEqual('5.00px');
      console.info('[textStrokeWidth_modifier_px_0100] END');
    })

    /**
     * @tc.name   textStrokeWidth_modifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_MODIFIER_0200
     * @tc.desc   Test Text strokeWidth property set via AttributeModifier with undefined, should restore to default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_modifier_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeWidth_modifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeWidth_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeWidth_modifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeWidth_modifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeWidth_modifier_undefined_0100] modifier obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeWidth_modifier_undefined_0100] default strokeWidth is: " + objCompare.$attrs.strokeWidth);
      console.info("[textStrokeWidth_modifier_undefined_0100] modifier strokeWidth is: " + obj.$attrs.strokeWidth);

      expect(obj.$attrs.strokeWidth).not().assertUndefined();
      expect(obj.$attrs.strokeWidth).assertEqual(objCompare.$attrs.strokeWidth);
      console.info('[textStrokeWidth_modifier_undefined_0100] END');
    })

  })
}
