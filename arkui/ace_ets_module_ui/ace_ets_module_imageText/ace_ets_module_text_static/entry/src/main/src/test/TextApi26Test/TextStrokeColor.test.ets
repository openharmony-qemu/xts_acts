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

export default function TextStrokeColorTest() {
  describe('TextStrokeColorTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextStrokeColorTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextStrokeColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextStrokeColor',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStrokeColorTest state pages:" + JSON.stringify(pages));
        if (!("TextStrokeColor" == pages.name)) {
          console.info("get TextStrokeColorTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextStrokeColorTest success ");
        }
      } catch (err) {
        console.error("push TextStrokeColorTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textStrokeColor_string_hex_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0100
     * @tc.desc   Test Text strokeColor property with string hex color '#FF0000'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_string_hex_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_string_hex_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_string_hex');
      console.info("[textStrokeColor_string_hex_0100] strokeColor is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor'));
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      let isRed: boolean = strokeColor === '#FFFF0000' || strokeColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
      console.info('[textStrokeColor_string_hex_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_number_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0200
     * @tc.desc   Test Text strokeColor property with number color 0xFF0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_number_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_number_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_number');
      console.info("[textStrokeColor_number_0100] strokeColor is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor'));
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      let isRed: boolean = strokeColor === '#FFFF0000' || strokeColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
      console.info('[textStrokeColor_number_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_color_enum_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0300
     * @tc.desc   Test Text strokeColor property with Color.Red enum value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_color_enum_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_color_enum_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_color_enum');
      console.info("[textStrokeColor_color_enum_0100] strokeColor is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor'));
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      let isRed: boolean = strokeColor === '#FFFF0000' || strokeColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
      console.info('[textStrokeColor_color_enum_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_rgb_string_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0400
     * @tc.desc   Test Text strokeColor property with rgb string 'rgb(39,135,217)'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_rgb_string_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_rgb_string_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_rgb_string');
      console.info("[textStrokeColor_rgb_string_0100] strokeColor is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor'));
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      expect(strokeColor.length > 0).assertTrue();
      console.info('[textStrokeColor_rgb_string_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0500
     * @tc.desc   Test Text strokeColor property with undefined, should take font color
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_undefined_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_undefined');
      let fontColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      console.info("[textStrokeColor_undefined_0100] fontColor is: " + fontColor);
      console.info("[textStrokeColor_undefined_0100] strokeColor is: " + strokeColor);
      expect(strokeColor).assertEqual(fontColor);
      console.info('[textStrokeColor_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_empty_string_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0700
     * @tc.desc   Test Text strokeColor property with empty string, should take font color (abnormal value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_empty_string_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_empty_string_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_empty_string');
      let fontColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      console.info("[textStrokeColor_empty_string_0100] fontColor is: " + fontColor);
      console.info("[textStrokeColor_empty_string_0100] strokeColor is: " + strokeColor);
      expect(strokeColor).assertEqual(fontColor);
      console.info('[textStrokeColor_empty_string_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_invalid_string_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0800
     * @tc.desc   Test Text strokeColor property with invalid string 'invalidColor', should take font color (abnormal value)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_invalid_string_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_invalid_string_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_invalid_string');
      let fontColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('fontColor');
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      console.info("[textStrokeColor_invalid_string_0100] fontColor is: " + fontColor);
      console.info("[textStrokeColor_invalid_string_0100] strokeColor is: " + strokeColor);
      expect(strokeColor).assertEqual(fontColor);
      console.info('[textStrokeColor_invalid_string_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeColor_modifier_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_MODIFIER_0100
     * @tc.desc   Test Text strokeColor property set via AttributeModifier with '#FF0000'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_modifier_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeColor_modifier_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeColor_modifier');
      console.info("[textStrokeColor_modifier_0100] strokeColor is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor'));
      let strokeColor: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeColor');
      let isRed: boolean = strokeColor === '#FFFF0000' || strokeColor.toLowerCase() === '#ffff0000';
      expect(isRed).assertTrue();
      console.info('[textStrokeColor_modifier_0100] END');
      done();
    })

  })
}
