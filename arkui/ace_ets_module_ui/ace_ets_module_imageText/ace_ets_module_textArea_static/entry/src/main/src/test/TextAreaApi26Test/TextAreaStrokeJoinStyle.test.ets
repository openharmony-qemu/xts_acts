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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import router from '@ohos.router';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME: int = 1000;

export default function TextAreaStrokeJoinStyleTest() {
  describe('TextAreaStrokeJoinStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextAreaStrokeJoinStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.textArea.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextAreaStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextAreaApi26/TextAreaStrokeJoinStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("TextAreaStrokeJoinStyleTest state pages: " + JSON.stringify(pages));
        if (!("TextAreaStrokeJoinStyle" == pages.name)) {
          console.info("TextAreaStrokeJoinStyleTest push page");
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push TextAreaStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_miter_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_miter_join_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_round_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_round_join_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_round_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_round_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textAreaStrokeJoinStyle_round_join_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test TextArea strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_bevel_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[textAreaStrokeJoinStyle_bevel_join_0100] END');
      done();
    })


    /**
     * @tc.name   textAreaStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test TextArea strokeJoinStyle property with undefined value, should default to MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_undefined_0100] START');

      let strJsonDefault: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_default');
      let strJsonUndefined: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_undefined');

      let strokeJoinStyleUndefined: string = JSON.parseJsonElement(strJsonUndefined).getElement('$attrs').getString('strokeJoinStyle');
      let strokeJoinStyleDefault: string = JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_undefined_0100] strokeJoinStyleUndefined: ' + strokeJoinStyleUndefined);
      console.info('[textAreaStrokeJoinStyle_undefined_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleUndefined).assertEqual(strokeJoinStyleDefault);
      console.info('[textAreaStrokeJoinStyle_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test TextArea strokeJoinStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_default_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_default');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_default_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_default_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_miter_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0100
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_miter_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_modifier_miter');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_miter_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_round_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0200
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_round_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_modifier_round');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_round_0100] END');
      done();
    })

    /**
     * @tc.name   textAreaStrokeJoinStyle_modifier_bevel_0100
     * @tc.number SUB_ARKUI_TEXTAREA_STROKEJOINSTYLE_MODIFIER_0300
     * @tc.desc   Test TextArea strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textAreaStrokeJoinStyle_modifier_bevel_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] START');

      let strJson: string = inspector.getInspectorByKey('textarea_strokeJoinStyle_modifier_bevel');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[textAreaStrokeJoinStyle_modifier_bevel_0100] END');
      done();
    })
  })
}