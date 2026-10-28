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

export default function TextStrokeJoinStyleTest() {
  describe('TextStrokeJoinStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("TextStrokeJoinStyleTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.text.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("TextStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/TextApi26/TextStrokeJoinStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get TextStrokeJoinStyleTest state pages:" + JSON.stringify(pages));
        if (!("TextStrokeJoinStyle" == pages.name)) {
          console.info("get TextStrokeJoinStyleTest state pages.name:" + JSON.stringify(pages.name));
          routerInstance.replaceUrl(options);
          console.info("push TextStrokeJoinStyleTest success ");
        }
      } catch (err) {
        console.error("push TextStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
    })

    /**
     * @tc.name   textStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0100
     * @tc.desc   Test Text strokeJoinStyle default value should be MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_default_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_default');
      console.info("[textStrokeJoinStyle_default_0100] strokeJoinStyle is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle'));
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      expect(strokeJoinStyle === 'StrokeJoinStyle.MITER_JOIN' || strokeJoinStyle === '0' || strokeJoinStyle === 'MITER_JOIN')
        .assertTrue();
      console.info('[textStrokeJoinStyle_default_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_miter_join_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_miter_join');
      console.info("[textStrokeJoinStyle_miter_join_0100] strokeJoinStyle is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle'));
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      expect(strokeJoinStyle === 'StrokeJoinStyle.MITER_JOIN' || strokeJoinStyle === '0' || strokeJoinStyle === 'MITER_JOIN')
        .assertTrue();
      console.info('[textStrokeJoinStyle_miter_join_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0300
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_round_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_round_join_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_round_join');
      console.info("[textStrokeJoinStyle_round_join_0100] strokeJoinStyle is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle'));
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      expect(strokeJoinStyle === 'StrokeJoinStyle.ROUND_JOIN' || strokeJoinStyle === '1' || strokeJoinStyle === 'ROUND_JOIN')
        .assertTrue();
      console.info('[textStrokeJoinStyle_round_join_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0400
     * @tc.desc   Test Text strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_bevel_join_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_bevel_join');
      console.info("[textStrokeJoinStyle_bevel_join_0100] strokeJoinStyle is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle'));
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      expect(strokeJoinStyle === 'StrokeJoinStyle.BEVEL_JOIN' || strokeJoinStyle === '2' || strokeJoinStyle === 'BEVEL_JOIN')
        .assertTrue();
      console.info('[textStrokeJoinStyle_bevel_join_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_PARAM_0500
     * @tc.desc   Test Text strokeJoinStyle property with undefined, should be treated as MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_undefined_0100] START');
      let strJsonCompare = inspector.getInspectorByKey('text_strokeJoinStyle_default');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_undefined');
      let defaultStyle: string = JSON.parseJsonElement(strJsonCompare).getElement('$attrs').getString('strokeJoinStyle');
      let undefinedStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info("[textStrokeJoinStyle_undefined_0100] default strokeJoinStyle is: " + defaultStyle);
      console.info("[textStrokeJoinStyle_undefined_0100] undefined strokeJoinStyle is: " + undefinedStyle);
      expect(undefinedStyle).assertEqual(defaultStyle);
      console.info('[textStrokeJoinStyle_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   textStrokeJoinStyle_modifier_0100
     * @tc.number SUB_ARKUI_TEXT_STROKEJOINSTYLE_MODIFIER_0100
     * @tc.desc   Test Text strokeJoinStyle property set via AttributeModifier with ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('textStrokeJoinStyle_modifier_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[textStrokeJoinStyle_modifier_0100] START');
      let strJson = inspector.getInspectorByKey('text_strokeJoinStyle_modifier');
      console.info("[textStrokeJoinStyle_modifier_0100] strokeJoinStyle is: "
        + JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle'));
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      expect(strokeJoinStyle === 'StrokeJoinStyle.ROUND_JOIN' || strokeJoinStyle === '1' || strokeJoinStyle === 'ROUND_JOIN')
        .assertTrue();
      console.info('[textStrokeJoinStyle_modifier_0100] END');
      done();
    })

  })
}
