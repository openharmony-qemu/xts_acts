/**
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from "@ohos/hypium"
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../MainAbility/common/Common'

export default function TipsOptionsSystemMaterial() {
  describe('TipsOptionsSystemMaterial', () => {

    beforeEach(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/popupSystemMaterial/TipsOptionsSystemMaterial',
      }
      try {
        router.clear();
        let pages = router.getState();
        console.info('get TipsOptionsSystemMaterial state success ' + JSON.stringify(pages));
        if (!('TipsOptionsSystemMaterial' == pages.name)) {
          console.info('get TipsOptionsSystemMaterial state success ' + JSON.stringify(pages.name));
          let result = await router.pushUrl(options)
          await CommonFunc.sleep(2000);
          console.info('push TipsOptionsSystemMaterial page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push TipsOptionsSystemMaterial page error ' + JSON.stringify(err));
      }
      done()
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0100
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0100
     * @tc.desc   To test TipsOptions systemMaterial property with undefined parameter
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0100', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('undefined'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0100 Button with undefined systemMaterial exists');

      let obj: ESObject = JSON.parse(JSON.stringify(getInspectorTree()));
      console.info('TipsOptionsSystemMaterial_0100 getInspectorTree: ' + JSON.stringify(obj));
      expect(obj).not().assertUndefined();

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0200
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0200
     * @tc.desc   To test TipsOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0200', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('hds_thick'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0200 Button with hdsMaterial THICK systemMaterial exists');

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0300
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0300
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0300', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('semi_transparent'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0300 Button with SEMI_TRANSPARENT systemMaterial exists');

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0400
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0400
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0400', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('immersive_thick'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0400 Button with Immersive THICK systemMaterial exists');

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0500
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0500
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0500', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0500 Button with Immersive ULTRA_THIN systemMaterial exists');

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   TipsOptionsSystemMaterial_0600
     * @tc.number SUB_ACE_TipsOptionsSystemMaterial_0600
     * @tc.desc   To test TipsOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('TipsOptionsSystemMaterial_0600', Level.LEVEL0, async (done: Function) => {
      console.info('TipsOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);

      let button = await driver.findComponent(ON.id('none'));
      expect(button).not().assertUndefined();
      console.info('TipsOptionsSystemMaterial_0600 Button with NONE systemMaterial exists');

      await CommonFunc.sleep(500);
      console.info('TipsOptionsSystemMaterial_0600 END');
      done();
    });
  })
}