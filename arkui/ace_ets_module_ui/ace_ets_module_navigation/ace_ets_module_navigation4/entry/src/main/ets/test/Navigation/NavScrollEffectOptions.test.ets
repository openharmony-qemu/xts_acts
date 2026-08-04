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
import router from '@ohos.router';
import CommonFunc from '../../MainAbility/common/Common';

export default function NavScrollEffectOptions() {
  describe('NavScrollEffectOptions', () => {
    beforeEach(async (done: Function) => {
      console.info('NavScrollEffectOptions beforeEach start');
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Navigation/NavScrollEffectOptions',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get NavScrollEffectOptions state pages:' + JSON.stringify(pages));
        if (!('NavScrollEffectOptions' == pages.name)) {
          console.info('get NavScrollEffectOptions pages.name:' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info('push NavScrollEffectOptions page result:' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push NavScrollEffectOptions page error:' + err);
      }
      console.info('NavScrollEffectOptions beforeEach end');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0100
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0100
     * @tc.desc   Test Navigation scrollEffectOptions property with default value (not set)
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0100] START');
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_default');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0100] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0100] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('Title');
      expect(obj.$attrs.scrollEffectOptions).assertUndefined();
      console.info('[navigationScrollEffectOptions_0100] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0200
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0200
     * @tc.desc   Test Navigation scrollEffectOptions property with scrollEffectType COMMON_BLUR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0200] START');
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_common_blur');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0200] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0200] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('COMMON_BLUR');
      expect(ScrollEffectType.COMMON_BLUR).assertEqual(0);
      console.info('[navigationScrollEffectOptions_0200] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0300
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0300
     * @tc.desc   Test Navigation scrollEffectOptions property with scrollEffectType GRADUAL_BLUR
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0300] START');
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_gradual_blur');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0300] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0300] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('GRADUAL_BLUR');
      expect(ScrollEffectType.GRADUAL_BLUR).assertEqual(1);
      console.info('[navigationScrollEffectOptions_0300] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0400
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0400
     * @tc.desc   Test Navigation scrollEffectOptions scrollEffectType property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0400', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0400] START');
      let strJsonCompare: string = getInspectorByKey('navigation_scrollEffectOptions_common_blur');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_scrollEffectType_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0400] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0400] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('Type null');
      console.info('[navigationScrollEffectOptions_0400] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0500
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0500
     * @tc.desc   Test Navigation scrollEffectOptions scrollEffectType property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0500', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0500] START');
      let strJsonCompare: string = getInspectorByKey('navigation_scrollEffectOptions_common_blur');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_scrollEffectType_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0500] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0500] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('Type undefined');
      console.info('[navigationScrollEffectOptions_0500] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0600
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0600
     * @tc.desc   Test Navigation scrollEffectOptions property with null should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0600', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0600] START');
      let strJsonCompare: string = getInspectorByKey('navigation_scrollEffectOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_null');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0600] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0600] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('null');
      console.info('[navigationScrollEffectOptions_0600] END');
      done();
    });

    /**
     * @tc.name   navigationScrollEffectOptions_0700
     * @tc.number SUB_ARKUI_NAVIGATION_SCROLLEFFECTOPTIONS_PARAM_0700
     * @tc.desc   Test Navigation scrollEffectOptions property with undefined should use default value
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('navigationScrollEffectOptions_0700', Level.LEVEL0, async (done: Function) => {
      console.info('[navigationScrollEffectOptions_0700] START');
      let strJsonCompare: string = getInspectorByKey('navigation_scrollEffectOptions_default');
      let objCompare: Record<string, ESObject> = JSON.parse(strJsonCompare);
      let strJson: string = getInspectorByKey('navigation_scrollEffectOptions_undefined');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[navigationScrollEffectOptions_0700] title: " + JSON.stringify(obj.$attrs.title));
      console.info("[navigationScrollEffectOptions_0700] scrollEffectOptions: " +
        JSON.stringify(obj.$attrs.scrollEffectOptions));
      expect(obj.$attrs.title).assertEqual('undefined');
      console.info('[navigationScrollEffectOptions_0700] END');
      done();
    });
  });
}