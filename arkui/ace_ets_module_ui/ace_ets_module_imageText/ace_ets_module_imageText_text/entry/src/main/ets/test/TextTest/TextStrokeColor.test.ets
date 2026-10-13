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

export default function TextStrokeColorTest() {
  describe('TextStrokeColorTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStrokeColorTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStrokeColor',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStrokeColorTest state pages: " + JSON.stringify(pages));
        if (!("TextStrokeColor" == pages.name)) {
          console.info("get TextStrokeColorTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStrokeColorTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStrokeColorTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textStrokeColor_string_red_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0100
     * @tc.desc   Test Text strokeColor property with string type value '#FF0000'
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_string_red_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_string_red_0100] START');

      let strJson: string = getInspectorByKey('text_strokeColor_string_red');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_string_red_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_string_red_0100] strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$type).assertEqual('Text');
      let strokeColor: string = obj.$attrs.strokeColor as string;
      let isRedColor = strokeColor === '#FFFF0000' ||
                       strokeColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[textStrokeColor_string_red_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_color_enum_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0200
     * @tc.desc   Test Text strokeColor property with Color enum value Color.Red
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_color_enum_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_color_enum_0100] START');

      let strJson: string = getInspectorByKey('text_strokeColor_color_enum');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_color_enum_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_color_enum_0100] strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$type).assertEqual('Text');
      let strokeColor: string = obj.$attrs.strokeColor as string;
      let isRedColor = strokeColor === '#FFFF0000' ||
                       strokeColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[textStrokeColor_color_enum_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_number_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0300
     * @tc.desc   Test Text strokeColor property with number type value 0xFF0000
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_number_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_number_0100] START');

      let strJson: string = getInspectorByKey('text_strokeColor_number');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_number_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_number_0100] strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$type).assertEqual('Text');
      let strokeColor: string = obj.$attrs.strokeColor as string;
      let isRedColor = strokeColor === '#FFFF0000' ||
                       strokeColor.toLowerCase() === '#ffff0000';
      expect(isRedColor).assertTrue();
      console.info('[textStrokeColor_number_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_null_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0400
     * @tc.desc   Test Text strokeColor property with null, should restore to default (font color)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_null_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeColor_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeColor_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_null_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textStrokeColor_null_0100] null strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$attrs.strokeColor).not().assertUndefined();
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textStrokeColor_null_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0500
     * @tc.desc   Test Text strokeColor property with undefined, should restore to default (font color)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeColor_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeColor_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_undefined_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textStrokeColor_undefined_0100] undefined strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$attrs.strokeColor).not().assertUndefined();
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textStrokeColor_undefined_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_empty_string_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0600
     * @tc.desc   Test Text strokeColor property with empty string, should restore to default (font color)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_empty_string_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_empty_string_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeColor_empty_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_empty_string_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeColor_empty_string_0100] empty obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_empty_string_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textStrokeColor_empty_string_0100] empty strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$attrs.strokeColor).not().assertUndefined();
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textStrokeColor_empty_string_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_invalid_string_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_PARAM_0700
     * @tc.desc   Test Text strokeColor property with invalid string, should restore to default (font color)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_invalid_string_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_invalid_string_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeColor_invalid_string');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_invalid_string_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeColor_invalid_string_0100] invalid obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_invalid_string_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textStrokeColor_invalid_string_0100] invalid strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$attrs.strokeColor).not().assertUndefined();
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textStrokeColor_invalid_string_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_modifier_blue_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_MODIFIER_0100
     * @tc.desc   Test Text strokeColor property set via AttributeModifier with Color.Blue
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_modifier_blue_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_modifier_blue_0100] START');

      let strJson: string = getInspectorByKey('text_strokeColor_modifier_blue');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_modifier_blue_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_modifier_blue_0100] strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$type).assertEqual('Text');
      let strokeColor: string = obj.$attrs.strokeColor as string;
      let isBlueColor = strokeColor === '#FF0000FF' ||
                        strokeColor.toLowerCase() === '#ff0000ff';
      expect(isBlueColor).assertTrue();
      console.info('[textStrokeColor_modifier_blue_0100] END');
    })

    /**
     * @tc.name   textStrokeColor_modifier_null_0100
     * @tc.number SUB_ARKUI_TEXT_STROKECOLOR_MODIFIER_0200
     * @tc.desc   Test Text strokeColor property set via AttributeModifier with null, should restore to default (font color)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeColor_modifier_null_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeColor_modifier_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeColor_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeColor_modifier_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeColor_modifier_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeColor_modifier_null_0100] modifier obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeColor_modifier_null_0100] default strokeColor is: " + objCompare.$attrs.strokeColor);
      console.info("[textStrokeColor_modifier_null_0100] modifier strokeColor is: " + obj.$attrs.strokeColor);

      expect(obj.$attrs.strokeColor).not().assertUndefined();
      expect(obj.$attrs.strokeColor).assertEqual(objCompare.$attrs.strokeColor);
      console.info('[textStrokeColor_modifier_null_0100] END');
    })

  })
}
