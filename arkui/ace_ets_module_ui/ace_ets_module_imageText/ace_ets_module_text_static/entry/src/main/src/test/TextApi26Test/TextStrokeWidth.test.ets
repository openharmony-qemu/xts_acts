'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-static/src/main/indexStatic';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

export default function TextStrokeWidthTest() {
  describe('TextStrokeWidthTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextStrokeWidthTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextStrokeWidthTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextStrokeWidth',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStrokeWidthTest state pages:" + JSON.stringify(pages));
        if (!("TextStrokeWidth" == pages.name)) {
          console.info("get TextStrokeWidthTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextStrokeWidthTest success ");
        }
      } catch (err) {
        console.error("push TextStrokeWidthTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textStrokeWidth_default_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0100
     * @tc.desc   Test Text strokeWidth default value should be 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_default_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_default');
      console.info("[textStrokeWidth_default_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('0');
      console.info('[textStrokeWidth_default_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_vp_positive_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0200
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.vp(5) positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_vp_positive_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_vp_positive_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_vp_positive');
      console.info("[textStrokeWidth_vp_positive_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('5');
      expect(strokeWidth).assertContain('vp');
      console.info('[textStrokeWidth_vp_positive_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_px_positive_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0300
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.px(10) positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_px_positive_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_px_positive_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_px_positive');
      console.info("[textStrokeWidth_px_positive_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('10');
      expect(strokeWidth).assertContain('px');
      console.info('[textStrokeWidth_px_positive_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_fp_positive_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0400
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.fp(3) positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_fp_positive_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_fp_positive_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_fp_positive');
      console.info("[textStrokeWidth_fp_positive_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('3');
      expect(strokeWidth).assertContain('fp');
      console.info('[textStrokeWidth_fp_positive_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_lpx_positive_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0500
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.lpx(5) positive value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_lpx_positive_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_lpx_positive_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_lpx_positive');
      console.info("[textStrokeWidth_lpx_positive_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('5');
      expect(strokeWidth).assertContain('lpx');
      console.info('[textStrokeWidth_lpx_positive_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_zero_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0600
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.vp(0) zero boundary value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_zero_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_zero_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_zero');
      console.info("[textStrokeWidth_zero_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('0');
      console.info('[textStrokeWidth_zero_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_negative_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0700
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.vp(-3) negative value, shows solid text
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_negative_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_negative_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_negative');
      console.info("[textStrokeWidth_negative_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('-3');
      console.info('[textStrokeWidth_negative_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_percent_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0800
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.percent(0.5), should take default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_percent_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_percent_0100] START');
      let strJsonCompare = inspector.getInspectorByKey('text_strokeWidth_default');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_percent');
      let defaultWidth: string = JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('strokeWidth');
      let percentWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      console.info("[textStrokeWidth_percent_0100] default strokeWidth is: " + defaultWidth);
      console.info("[textStrokeWidth_percent_0100] percent strokeWidth is: " + percentWidth);
      expect(percentWidth).assertEqual(defaultWidth);
      console.info('[textStrokeWidth_percent_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_0900
     * @tc.desc   Test Text strokeWidth property with undefined, should take default value 0
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_undefined_0100] START');
      let strJsonCompare = inspector.getInspectorByKey('text_strokeWidth_default');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_undefined');
      let defaultWidth: string = JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('strokeWidth');
      let undefinedWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      console.info("[textStrokeWidth_undefined_0100] default strokeWidth is: " + defaultWidth);
      console.info("[textStrokeWidth_undefined_0100] undefined strokeWidth is: " + undefinedWidth);
      expect(undefinedWidth).assertEqual(defaultWidth);
      console.info('[textStrokeWidth_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_large_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_PARAM_1100
     * @tc.desc   Test Text strokeWidth property with LengthMetrics.vp(999) large boundary value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_large_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_large_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_large');
      console.info("[textStrokeWidth_large_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('999');
      expect(strokeWidth).assertContain('vp');
      console.info('[textStrokeWidth_large_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeWidth_modifier_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEWIDTH_MODIFIER_0100
     * @tc.desc   Test Text strokeWidth property set via AttributeModifier with LengthMetrics.vp(5)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeWidth_modifier_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeWidth_modifier_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeWidth_modifier');
      console.info("[textStrokeWidth_modifier_0100] strokeWidth is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth'));
      let strokeWidth: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeWidth');
      expect(strokeWidth).assertContain('5');
      expect(strokeWidth).assertContain('vp');
      console.info('[textStrokeWidth_modifier_0100] END');
      done();
    })

  })
}
