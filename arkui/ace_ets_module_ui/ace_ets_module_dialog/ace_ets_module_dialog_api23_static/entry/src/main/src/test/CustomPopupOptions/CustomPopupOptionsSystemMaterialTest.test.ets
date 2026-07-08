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

import router from '@ohos.router';
import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '@ohos/hypium-binary/src/main/indexStatic';
import { abilityDelegatorRegistry, Driver, ON, MatchPattern } from '@kit.TestKit';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';
import { UtilsTest } from '../Util.test';

export default function CustomPopupOptionsSystemMaterial() {
  describe('CustomPopupOptionsSystemMaterial', () => {
    beforeAll(async (): Promise<void> => {
      console.info("CustomPopupOptionsSystemMaterial beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.dialog.api23.static", "EntryAbility");
    });
    beforeEach(async (): Promise<void> => {
      console.info("CustomPopupOptionsSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CustomPopupOptions/CustomPopupOptionsSystemMaterial',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("CustomPopupOptionsSystemMaterial state pages: " + JSON.stringify(pages));
        console.info("CustomPopupOptionsSystemMaterial state pages.name: " + pages.name);
        if (pages.name !== "CustomPopupOptionsSystemMaterial") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("CustomPopupOptionsSystemMaterial replaceUrl error: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0100
     * @tc.desc   To test CustomPopupOptions systemMaterial property with undefined parameter
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0100 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('undefined'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let systemBarEffect = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getString("systemBarEffect")
      expect(systemBarEffect).assertEqual('false');
      console.info('CustomPopupOptionsSystemMaterial_0100 Popup Undefined is visible');

      await CommonFunc.sleep(500);

      let closeButton = await driver.findComponent(ON.text('Close'));
 	    await (closeButton!.click() as Promise<void>);
      
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0100 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0200
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0200
     * @tc.desc   To test CustomPopupOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0200 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('hds_thick'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let systemBarEffect = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getString("systemBarEffect")
      expect(systemBarEffect).assertEqual('false');
      console.info('CustomPopupOptionsSystemMaterial_0200 Popup HDS THICK is visible');

      await CommonFunc.sleep(500);
      let closeButton = await driver.findComponent(ON.text('Close'));
 	    await (closeButton!.click() as Promise<void>);
      
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0200 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0300
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0300
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0300 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('semi_transparent'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      let type = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement("material")
        .getString("type")
      expect(type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      console.info('CustomPopupOptionsSystemMaterial_0300 Popup SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0300 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0400
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0400
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0400 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_thick'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") as number == 0) {
        let type = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement("material")
        .getString("type")
        expect(type).assertEqual('MaterialType.IMMERSIVE');
        console.info('CustomPopupOptionsSystemMaterial_0400 Popup Immersive THICK is visible');
      }
      
      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0400 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0500
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0500
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0500 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('immersive_ultra_thin'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") as number == 0) {
        let type = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement("material")
        .getString("type")
        expect(type).assertEqual('MaterialType.IMMERSIVE');
        console.info('CustomPopupOptionsSystemMaterial_0500 Popup Immersive ULTRA_THIN is visible');
      }
      

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0500 END');
      done();
    });

    /**
     * @tc.name   CustomPopupOptionsSystemMaterial_0600
     * @tc.number SUB_ARKUI_API_CustomPopupOptionsSystemMaterial_0600
     * @tc.desc   To test CustomPopupOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('CustomPopupOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('CustomPopupOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('materialTypeNone'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      if (AppStorage.get<number>("winLeft") as number == 0) {
       let type = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement("material")
        .getString("type")
        expect(type).assertEqual('MaterialType.NONE');
        console.info('CustomPopupOptionsSystemMaterial_0600 Popup NONE is visible');
      }
      
      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('CustomPopupOptionsSystemMaterial_0600 END');
      done();
    });

  })
}