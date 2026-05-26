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
import uiMaterial from '@ohos.arkui.uiMaterial';

export default function systemMaterialBarStyle() {
  describe('systemMaterialBarStyle', () => {
    beforeEach(async (done: Function) => {
      console.info("systemMaterialBarStyle beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Tabs/systemMaterialBarStyle',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info("get systemMaterialBarStyle state pages:" + JSON.stringify(pages));
        if (!("systemMaterialBarStyle" == pages.name)) {
          console.info("get systemMaterialBarStyle pages.name:" + JSON.stringify(pages.name));
          let result = await router.pushUrl(options);
          await CommonFunc.sleep(2000);
          console.info("push systemMaterialBarStyle page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push systemMaterialBarStyle page error:" + err);
      }
      console.info("systemMaterialBarStyle beforeEach end");
      done();
    });

    /**
     * @tc.name   systemMaterialBarStyle_0100
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_SYSTEMMATERIAL_0100
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_0100', Level.LEVEL0, async (done: Function) => {
      console.info('[systemMaterialBarStyle_0100] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_systemMaterial_ultra_thin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[systemMaterialBarStyle_0100] type: " + JSON.stringify(obj.$type));
      console.info("[systemMaterialBarStyle_0100] barPosition: " + obj.$attrs.barPosition);
      console.info('[systemMaterialBarStyle_0100] systemMaterial: '+ obj.$attrs.barFloatingStyle.systemMaterial);
      console.info('[systemMaterialBarStyle_0100] ULTRA_THIN = ' + uiMaterial.ImmersiveStyle.ULTRA_THIN);

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.End");
      expect(obj.$attrs.barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.ULTRA_THIN).assertEqual(0);
      console.info('[systemMaterialBarStyle_0100] END');
      done();
    })

    /**
     * @tc.name   systemMaterialBarStyle_0200
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_SYSTEMMATERIAL_0200
     * @tc.desc   Test Tabs barFloatingStyle with systemMaterial THIN
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_0200', Level.LEVEL0, async (done: Function) => {
      console.info('[systemMaterialBarStyle_0200] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_systemMaterial_thin');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[systemMaterialBarStyle_0200] type: " + JSON.stringify(obj.$type));
      console.info("[systemMaterialBarStyle_0200] barPosition: " + obj.$attrs.barPosition);
      console.info('[systemMaterialBarStyle_0200] systemMaterial: '+ obj.$attrs.barFloatingStyle.systemMaterial);
      console.info('[systemMaterialBarStyle_0200] THIN = ' + uiMaterial.ImmersiveStyle.THIN);

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.End");
      expect(obj.$attrs.barFloatingStyle).not().assertEqual(undefined);
      expect(uiMaterial.ImmersiveStyle.THIN).assertEqual(1);
      console.info('[systemMaterialBarStyle_0200] END');
      done();
    })

    /**
     * @tc.name   systemMaterialBarStyle_0300
     * @tc.number SUB_ARKUI_TABS_BARFLOATINGSTYLE_SYSTEMMATERIAL_0300
     * @tc.desc   Test Tabs barFloatingStyle with both adaptToHandedness and systemMaterial.
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('systemMaterialBarStyle_0300', Level.LEVEL0, async (done: Function) => {
      console.info('[systemMaterialBarStyle_0300] START');
      await CommonFunc.sleep(500);

      let strJson: string = getInspectorByKey('tabs_adapt_systemMaterial_true');
      let obj: Record<string, ESObject> = JSON.parse(strJson);
      console.info("[systemMaterialBarStyle_0300] type: " + JSON.stringify(obj.$type));
      console.info("[systemMaterialBarStyle_0300] attrs: " + JSON.stringify(obj.$attrs));
      console.info("[systemMaterialBarStyle_0300] barPosition: " + obj.$attrs.barPosition);
      console.info('[systemMaterialBarStyle_0300] systemMaterial: '+ obj.$attrs.barFloatingStyle.systemMaterial);

      expect(JSON.parse(strJson).$type).assertEqual('Tabs');
      expect(JSON.parse(strJson).$attrs.barPosition).assertEqual("BarPosition.End");
      expect(obj.$attrs.barFloatingStyle).not().assertEqual(undefined);
      expect(obj.$attrs.barFloatingStyle.adaptToHandedness).assertEqual(true);
      console.info('[systemMaterialBarStyle_0300] END');
      done();
    })
  })
}
