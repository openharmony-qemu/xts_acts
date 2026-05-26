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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium';
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function TextAreaStrokeJoinStyleTest() {
  describe('TextAreaStrokeJoinStyleTest', () => {

    beforeEach(async (done: Function) => {
      console.info("TextAreaStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi26/TextAreaStrokeJoinStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get TextAreaStrokeJoinStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaStrokeJoinStyle" == pages.name)) {
          console.info("get TextAreaStrokeJoinStyleTest state pages.name: " + JSON.stringify(pages.name));
          let result = await router.replaceUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push TextAreaStrokeJoinStyleTest success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push TextAreaStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_miter_join');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_round_join_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_round_join_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_round_join');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_round_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textAreaStrokeJoinStyle_round_join_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_bevel_join');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_null_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_PARAM_0100
     * @tc.desc   Test TextArea strokeJoinStyle property with null value, should default to MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_null_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_null_0100] START');

      let strJsonDefault: string = getInspectorByKey('textarea_strokeJoinStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonNull: string = getInspectorByKey('textarea_strokeJoinStyle_null');
      let objNull: Record<string, ESObject> = JSON.parse(strJsonNull);

      let strokeJoinStyleNull: string = objNull.$attrs.strokeJoinStyle as string;
      let strokeJoinStyleDefault: string = objDefault.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_null_0100] strokeJoinStyleNull: ' + strokeJoinStyleNull);
      console.info('[textAreaStrokeJoinStyle_null_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleNull).not().assertUndefined();
      expect(strokeJoinStyleDefault).not().assertUndefined();
      expect(strokeJoinStyleNull).assertEqual(strokeJoinStyleDefault);
      console.info('[textAreaStrokeJoinStyle_null_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test TextArea strokeJoinStyle property with undefined value, should default to MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_undefined_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_undefined_0100] START');

      let strJsonDefault: string = getInspectorByKey('textarea_strokeJoinStyle_default');
      let objDefault: Record<string, ESObject> = JSON.parse(strJsonDefault);
      let strJsonUndefined: string = getInspectorByKey('textarea_strokeJoinStyle_undefined');
      let objUndefined: Record<string, ESObject> = JSON.parse(strJsonUndefined);

      let strokeJoinStyleUndefined: string = objUndefined.$attrs.strokeJoinStyle as string;
      let strokeJoinStyleDefault: string = objDefault.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_undefined_0100] strokeJoinStyleUndefined: ' + strokeJoinStyleUndefined);
      console.info('[textAreaStrokeJoinStyle_undefined_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleUndefined).not().assertUndefined();
      expect(strokeJoinStyleDefault).not().assertUndefined();
      expect(strokeJoinStyleUndefined).assertEqual(strokeJoinStyleDefault);
      console.info('[textAreaStrokeJoinStyle_undefined_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test TextArea strokeJoinStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_default_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_default_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_default_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_default_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_miter_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0100
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_miter_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_modifier_miter');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_round_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0200
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_round_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_modifier_round');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] END');
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_bevel_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0300
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_bevel_0100', Level.LEVEL2, async () => {
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] START');

      let strJson: string = getInspectorByKey('textarea_strokeJoinStyle_modifier_bevel');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      let strokeJoinStyle: string = obj.$attrs.strokeJoinStyle as string;
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).not().assertUndefined();
      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] END');
    })
  })
}