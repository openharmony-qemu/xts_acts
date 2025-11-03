/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it,  Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UtilsTest } from '../Util.test';
import inspector from '@ohos.arkui.inspector';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

interface optionsObj {
  uri: string
}

export default function ChipOnClose() {
  describe('ArcButtonClick', () => {
    beforeAll(async () => {
      console.info("beforeAll case");
      await UtilsTest.startAbility("com.example.myapplication.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      console.info("search_caret beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/ArcButton/ArcButtonClick',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ArcButtonClick state pages: " + JSON.stringify(pages));
        if (!("ArcButtonClick" == pages.name)) {
          console.info("get ArcButtonClick state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push ArcButtonClick page error: " + err);
        expect().assertFail();
      }
    });
    afterEach(async () => {
      console.info("afterEach case");
    });

    afterAll(async () => {
      console.info("afterAll case");
    });

    
    /*
     * @tc.number   ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.name     ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.desc     ArkUX_Stage_ArcButton_ComponentTest_0100
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_ArcButton_ComponentTest_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0100 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('arcbutton01');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("styleMode")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderWidth")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderStyle")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("backgroundColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("align")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0100] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("alignSelf")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement("$attrs").getString("borderWidth")).assertEqual('5.00vp');
      expect(obj.getElement("$attrs").getString("borderStyle")).assertEqual('BorderStyle.Dashed');
      expect(obj.getElement("$attrs").getString("borderColor")).assertEqual('#FFFFC0CB');
      expect(obj.getElement("$attrs").getString("backgroundColor")).assertEqual('#FF0000FF');
      expect(obj.getElement("$attrs").getString("align")).assertEqual('Alignment.Center');
      expect(obj.getElement("$attrs").getString("alignSelf")).assertEqual('ItemAlign.Baseline');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0100] END');
      done();
    });

    
    /*
     * @tc.number   ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.name     ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.desc     ArkUX_Stage_ArcButton_ComponentTest_0200
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_ArcButton_ComponentTest_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0200 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('arcbutton02');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderWidth")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderStyle")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("backgroundColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("align")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0200] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("alignSelf")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement("$attrs").getString("borderWidth")).assertEqual('0.00vp');
      expect(obj.getElement("$attrs").getString("borderStyle")).assertEqual('BorderStyle.Solid');
      expect(obj.getElement("$attrs").getString("borderColor")).assertEqual('#FF000000');
      expect(obj.getElement("$attrs").getString("backgroundColor")).assertEqual('#00000000');
      expect(obj.getElement("$attrs").getString("align")).assertEqual('Alignment.TopStart');
      expect(obj.getElement("$attrs").getString("alignSelf")).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0200] END');
      done();
    });

    
    /*
     * @tc.number   ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.name     ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.desc     ArkUX_Stage_ArcButton_ComponentTest_0300
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_ArcButton_ComponentTest_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('ArkUX_Stage_ArcButton_ComponentTest_0300 START');
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('arcbutton03');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderWidth")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderStyle")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("borderColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("backgroundColor")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("align")));
      console.info("[ArkUX_Stage_ArcButton_ComponentTest_0300] attrs: " + JSON.stringify(obj.getElement("$attrs").getString("alignSelf")));
      await CommonFunc.sleep(1000);
      expect(obj.getElement("$attrs").getString("borderWidth")).assertEqual('0.00px');
      expect(obj.getElement("$attrs").getString("borderStyle")).assertEqual('BorderStyle.Solid');
      expect(obj.getElement("$attrs").getString("borderColor")).assertEqual('#FFFFFFFF');
      expect(obj.getElement("$attrs").getString("backgroundColor")).assertEqual('#FFFFFFFF');
      expect(obj.getElement("$attrs").getString("align")).assertEqual('Alignment.Center');
      expect(obj.getElement("$attrs").getString("alignSelf")).assertEqual('ItemAlign.Auto');
      console.info('[ArkUX_Stage_ArcButton_ComponentTest_0300] END');
      done();
    });

    
    /*
     * @tc.number   ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.name     ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.desc     ArkUX_Stage_ArcButton_ComponentTest_0400
     * @tc.level    Level.LEVEL0
     */
it('ArkUX_Stage_ArcButton_ComponentTest_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try {
    console.info('ArkUX_Stage_ArcButton_ComponentTest_0400 START');
    await CommonFunc.sleep(1000);
    let driver = Driver.create()
    let button = await driver.findComponent(ON.text('arcbutton4'))
    await (button?.click() as Promise<void>)
    await CommonFunc.sleep(2000);
    await driver.assertComponentExist(ON.text('白色风车'))
    console.info('[ArkUX_Stage_ArcButton_ComponentTest_0400] END');
  } catch(error) {
    expect().assertFail();
  }
      done();
    });
  })
}
