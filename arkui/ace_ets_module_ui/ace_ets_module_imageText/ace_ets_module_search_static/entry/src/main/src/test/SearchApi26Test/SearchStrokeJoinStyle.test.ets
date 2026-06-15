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

import { describe, it, expect, beforeAll, beforeEach, afterEach, afterAll, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';

const SLEEP_TIME = 1000;

export default function SearchStrokeJoinStyleTest() {
  describe('SearchStrokeJoinStyleTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info('SearchStrokeJoinStyleTest beforeAll start');
      await UtilsTest.startAbility('com.arkui.ace.search.static', 'EntryAbility');
    });
    beforeEach(async (): Promise<void> => {
      console.info("SearchStrokeJoinStyleTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/SearchApi26/SearchStrokeJoinStyle',
      }
      try {
        const routerInstance = AppStorage.get<Router>('router') as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info('SearchStrokeJoinStyleTest state pages: ' + JSON.stringify(pages));
        if (pages.name !== 'SearchStrokeJoinStyle') {
          routerInstance.replaceUrl(options);
          await CommonFunc.sleep(SLEEP_TIME);
        }
      } catch (err) {
        console.error("push SearchStrokeJoinStyleTest page error: " + err);
        expect().assertFail();
      }
    });
    

    /**
     * @tc.name   searchStrokeJoinStyle_miter_join_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_ENUM_0100
     * @tc.desc   Test Search strokeJoinStyle property with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_miter_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_miter_join_0100] START');

      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_miter_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_miter_join_0100] strokeJoinStyle: ' + strokeJoinStyle);
      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[searchStrokeJoinStyle_miter_join_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_round_join_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_ENUM_0200
     * @tc.desc   Test Search strokeJoinStyle property with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_round_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_round_join_0100] START');
      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_round_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_round_join_0100] strokeJoinStyle: ' + strokeJoinStyle);
      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[searchStrokeJoinStyle_round_join_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_bevel_join_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_ENUM_0300
     * @tc.desc   Test Search strokeJoinStyle property with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_bevel_join_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_bevel_join_0100] START');
      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_bevel_join');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_bevel_join_0100] strokeJoinStyle: ' + strokeJoinStyle);
      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[searchStrokeJoinStyle_bevel_join_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_undefined_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_PARAM_0200
     * @tc.desc   Test Search strokeJoinStyle property with undefined value, should default to MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_undefined_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_undefined_0100] START');

      let strJsonDefault: string = inspector.getInspectorByKey('search_strokeJoinStyle_default');
      let strJsonUndefined: string = inspector.getInspectorByKey('search_strokeJoinStyle_undefined');

      let strokeJoinStyleUndefined: string = JSON.parseJsonElement(strJsonUndefined).getElement('$attrs').getString('strokeJoinStyle');
      let strokeJoinStyleDefault: string = JSON.parseJsonElement(strJsonDefault).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_undefined_0100] strokeJoinStyleUndefined: ' + strokeJoinStyleUndefined);
      console.info('[searchStrokeJoinStyle_undefined_0100] strokeJoinStyleDefault: ' + strokeJoinStyleDefault);

      expect(strokeJoinStyleUndefined).assertEqual(strokeJoinStyleDefault);
      console.info('[searchStrokeJoinStyle_undefined_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_default_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_DEFAULT_0100
     * @tc.desc   Test Search strokeJoinStyle default value without setting the property
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_default_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_default_0100] START');

      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_default');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_default_0100] strokeJoinStyle: ' + strokeJoinStyle);
      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[searchStrokeJoinStyle_default_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_modifier_miter_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_MODIFIER_0100
     * @tc.desc   Test Search strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.MITER_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_modifier_miter_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_modifier_miter_0100] START');

      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_modifier_miter');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_modifier_miter_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('MITER_JOIN');
      console.info('[searchStrokeJoinStyle_modifier_miter_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_modifier_round_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_MODIFIER_0200
     * @tc.desc   Test Search strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.ROUND_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_modifier_round_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_modifier_round_0100] START');

      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_modifier_round');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_modifier_round_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('ROUND_JOIN');
      console.info('[searchStrokeJoinStyle_modifier_round_0100] END');
      done();
    })

    /**
     * @tc.name   searchStrokeJoinStyle_modifier_bevel_0100
     * @tc.number SUB_ARKUI_SEARCH_STROKEJOINSTYLE_MODIFIER_0300
     * @tc.desc   Test Search strokeJoinStyle property set via AttributeModifier with StrokeJoinStyle.BEVEL_JOIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL2
     */
    it('searchStrokeJoinStyle_modifier_bevel_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('[searchStrokeJoinStyle_modifier_bevel_0100] START');

      let strJson: string = inspector.getInspectorByKey('search_strokeJoinStyle_modifier_bevel');
      let strokeJoinStyle: string = JSON.parseJsonElement(strJson).getElement('$attrs').getString('strokeJoinStyle');
      console.info('[searchStrokeJoinStyle_modifier_bevel_0100] strokeJoinStyle: ' + strokeJoinStyle);

      expect(strokeJoinStyle).assertEqual('BEVEL_JOIN');
      console.info('[searchStrokeJoinStyle_modifier_bevel_0100] END');
      done();
    })
  })
}