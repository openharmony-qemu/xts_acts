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

export default function TextStrokeJoinStyleTest() {
  describe('TextStrokeJoinStyleTest', () => {
    beforeEach(async (done: Function) => {
      console.info("TextStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Text/TextStrokeJoinStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextStrokeJoinStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextStrokeJoinStyle" == pages.name)) {
          console.info("get TextStrokeJoinStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextStrokeJoinStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_MITER_JOIN_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0100
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_MITER_JOIN_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_MITER_JOIN_0100] START');

      let strJson: string = getInspectorByKey('text_strokeJoinStyle_MITER_JOIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_MITER_JOIN_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_MITER_JOIN_0100] strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textStrokeJoinStyle_MITER_JOIN_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_ROUND_JOIN_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_ROUND_JOIN_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_ROUND_JOIN_0100] START');

      let strJson: string = getInspectorByKey('text_strokeJoinStyle_ROUND_JOIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_ROUND_JOIN_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_ROUND_JOIN_0100] strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textStrokeJoinStyle_ROUND_JOIN_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_BEVEL_JOIN_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0300
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_BEVEL_JOIN_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_BEVEL_JOIN_0100] START');

      let strJson: string = getInspectorByKey('text_strokeJoinStyle_BEVEL_JOIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_BEVEL_JOIN_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_BEVEL_JOIN_0100] strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[textStrokeJoinStyle_BEVEL_JOIN_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0400
     * @tc.desc   Test Text strokeJoinStyle property with undefined, should restore to default MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeJoinStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeJoinStyle_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeJoinStyle_undefined_0100] undefined obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_undefined_0100] default strokeJoinStyle is: " + objCompare.$attrs.strokeJoinStyle);
      console.info("[textStrokeJoinStyle_undefined_0100] undefined strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$attrs.strokeJoinStyle).not().assertUndefined();
      expect(obj.$attrs.strokeJoinStyle).assertEqual(objCompare.$attrs.strokeJoinStyle);
      console.info('[textStrokeJoinStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_null_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0500
     * @tc.desc   Test Text strokeJoinStyle property with null, should restore to default MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_null_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeJoinStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeJoinStyle_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_null_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeJoinStyle_null_0100] null obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_null_0100] default strokeJoinStyle is: " + objCompare.$attrs.strokeJoinStyle);
      console.info("[textStrokeJoinStyle_null_0100] null strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$attrs.strokeJoinStyle).not().assertUndefined();
      expect(obj.$attrs.strokeJoinStyle).assertEqual(objCompare.$attrs.strokeJoinStyle);
      console.info('[textStrokeJoinStyle_null_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_invalid_enum_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0600
     * @tc.desc   Test Text strokeJoinStyle property with invalid enum value 99, should restore to default MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_invalid_enum_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_invalid_enum_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeJoinStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeJoinStyle_invalid_enum');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_invalid_enum_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeJoinStyle_invalid_enum_0100] invalid obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_invalid_enum_0100] default strokeJoinStyle is: " + objCompare.$attrs.strokeJoinStyle);
      console.info("[textStrokeJoinStyle_invalid_enum_0100] invalid strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$attrs.strokeJoinStyle).not().assertUndefined();
      expect(obj.$attrs.strokeJoinStyle).assertEqual(objCompare.$attrs.strokeJoinStyle);
      console.info('[textStrokeJoinStyle_invalid_enum_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_modifier_ROUND_JOIN_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_MODIFIER_0100
     * @tc.desc   Test Text strokeJoinStyle property set via AttributeModifier with ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_modifier_ROUND_JOIN_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_modifier_ROUND_JOIN_0100] START');

      let strJson: string = getInspectorByKey('text_strokeJoinStyle_modifier_ROUND_JOIN');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_modifier_ROUND_JOIN_0100] obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_modifier_ROUND_JOIN_0100] strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$type).assertEqual('Text');
      expect(obj.$attrs.strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textStrokeJoinStyle_modifier_ROUND_JOIN_0100] END');
    })

    /**
     * @tc.name   textStrokeJoinStyle_modifier_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_MODIFIER_0200
     * @tc.desc   Test Text strokeJoinStyle property set via AttributeModifier with undefined, should restore to default MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_modifier_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textStrokeJoinStyle_modifier_undefined_0100] START');

      let strJsonCompare: string = getInspectorByKey('text_strokeJoinStyle_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('text_strokeJoinStyle_modifier_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);

      console.info("[textStrokeJoinStyle_modifier_undefined_0100] default obj is: " + JSON.stringify(objCompare.$attrs));
      console.info("[textStrokeJoinStyle_modifier_undefined_0100] modifier obj is: " + JSON.stringify(obj.$attrs));
      console.info("[textStrokeJoinStyle_modifier_undefined_0100] default strokeJoinStyle is: " + objCompare.$attrs.strokeJoinStyle);
      console.info("[textStrokeJoinStyle_modifier_undefined_0100] modifier strokeJoinStyle is: " + obj.$attrs.strokeJoinStyle);

      expect(obj.$attrs.strokeJoinStyle).not().assertUndefined();
      expect(obj.$attrs.strokeJoinStyle).assertEqual(objCompare.$attrs.strokeJoinStyle);
      console.info('[textStrokeJoinStyle_modifier_undefined_0100] END');
    })

  })
}
