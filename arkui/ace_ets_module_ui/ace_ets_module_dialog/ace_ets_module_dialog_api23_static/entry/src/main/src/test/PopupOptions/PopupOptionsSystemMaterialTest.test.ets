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
import { describe, it, expect, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { MatchPattern } from '@kit.TestKit';
import { Driver, ON, Rect } from '@ohos.UiTest';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { uiMaterial } from '@kit.ArkUI';

export default function PopupOptionsSystemMaterial() {
  describe('PopupOptionsSystemMaterial', () => {
    beforeEach(async (): Promise<void> => {
      console.info("PopupOptionsSystemMaterial beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/PopupOptions/PopupOptionsSystemMaterial',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router;
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("PopupOptionsSystemMaterial state pages: " + JSON.stringify(pages));
        console.info("PopupOptionsSystemMaterial state pages.name: " + pages.name);
        if (pages.name !== "PopupOptionsSystemMaterial") {
          routerInstance.replaceUrl(options);
        }
        await Utils.sleep(500);
      } catch (err) {
        console.error("PopupOptionsSystemMaterial replaceUrl error: " + err);
        expect().assertFail();
      }
    })


    /**
     * @tc.name   PopupOptionsSystemMaterial_0100
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0100
     * @tc.desc   To test PopupOptions systemMaterial property with undefined parameter
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0100 START');
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
      console.info('PopupOptionsSystemMaterial_0100 Popup Undefined is visible');

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0100 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0100 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PopupOptionsSystemMaterial_0200
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0200
     * @tc.desc   To test PopupOptions systemMaterial property with hdsMaterial.Material THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0200 START');
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
      console.info('PopupOptionsSystemMaterial_0200 Popup HDS THICK is visible');

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0200 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0200 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PopupOptionsSystemMaterial_0300
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0300
     * @tc.desc   To test PopupOptions systemMaterial property with uiMaterial.Material SEMI_TRANSPARENT
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0300 START');
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
      console.info('obj' + JSON.stringify(type));
      expect(type).assertEqual('MaterialType.SEMI_TRANSPARENT');
      console.info('PopupOptionsSystemMaterial_0300 Popup SEMI_TRANSPARENT is visible');

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0300 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0300 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PopupOptionsSystemMaterial_0400
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0400
     * @tc.desc   To test PopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial THICK
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0400 START');
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
        console.info('obj' + JSON.stringify(type));
        expect(type).assertEqual('MaterialType.IMMERSIVE');
        console.info('PopupOptionsSystemMaterial_0400 Popup Immersive THICK is visible');
      }
      
      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0400 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0400 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PopupOptionsSystemMaterial_0500
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0500
     * @tc.desc   To test PopupOptions systemMaterial property with uiMaterial.ImmersiveMaterial ULTRA_THIN
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0500 START');
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
        console.info('obj' + JSON.stringify(type));
        expect(type).assertEqual('MaterialType.IMMERSIVE');
        console.info('PopupOptionsSystemMaterial_0500 Popup Immersive ULTRA_THIN is visible');
      }
      

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0500 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0500 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   PopupOptionsSystemMaterial_0600
     * @tc.number SUB_ARKUI_API_PopupOptionsSystemMaterial_0600
     * @tc.desc   To test PopupOptions systemMaterial property with uiMaterial.Material NONE
     * @tc.desc   ArkUIAPI 
	   * @tc.type   FUNCTION 
	   * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('PopupOptionsSystemMaterial_0600', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
      console.info('PopupOptionsSystemMaterial_0600 START');
      let driver = await Driver.create()
      await CommonFunc.sleep(1000);
      let button = await driver.findComponent(ON.id('none'));
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let type = JSON.parseJsonElement(JSON.stringify(inspector.getInspectorTree()))
        .getArray("$children")[1]
        .getArray("$children")[0]
        .getElement("$attrs")
        .getElement("systemMaterial")
        .getElement("material")
        .getString("type")
      console.info('obj' + JSON.stringify(type));
      expect(type).assertEqual('MaterialType.NONE');
      console.info('PopupOptionsSystemMaterial_0600 Popup NONE is visible');

      await CommonFunc.sleep(500);
      await (button!.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      console.info('PopupOptionsSystemMaterial_0600 END');
      done();
      } catch (err) {
        console.info('PopupOptionsSystemMaterial_0600 err: ' + JSON.stringify(err));
        expect().assertFail();
        done();
      }
    });

  })
}