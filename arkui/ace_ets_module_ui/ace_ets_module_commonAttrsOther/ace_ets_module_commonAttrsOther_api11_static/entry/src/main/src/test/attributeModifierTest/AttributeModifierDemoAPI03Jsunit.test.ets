'use static';
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
import { beforeEach, describe, expect, it, Level } from '../../../../hypium/index'
import router from '@ohos.router';
import { Driver, ON } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement'

export default function AttributeModifierDemoAPI03Jsunit(): void {
  describe('AttributeModifierDemoAPI03Jsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("AttributeModifierDemoAPI03Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI03',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttributeModifierDemoAPI03Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI03" == pages.name)) {
          console.info("get AttributeModifierDemoAPI03Jsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI03Jsunit page error:" + err);
      }
      console.info("AttributeModifierDemoAPI03Jsunit beforeEach end");
    });


    
/**
     * @tc.number   AttributeModifierDemoAPI03Jsunit_static_0100
     * @tc.name     AttributeModifierDemoAPI03Jsunit_static_0100
     * @tc.desc     AttributeModifierDemoAPI03Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AttributeModifierDemoAPI03Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
        console.info('AttributeModifierDemoAPI03Jsunit_0100 START');

        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('AttributeModifierDemoAPI03isDark'));
        await (btn1?.click() as Promise<void>);

        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('AttributeModifierDemoAPI03Selected'));
        await (btn2?.click() as Promise<void>);
        await CommonFunc.sleep(1000);

        let strcontent = inspector.getInspectorByKey('AttributeModifierDemoAPI03Checkbox');
        await CommonFunc.sleep(1000);
        let obj = JSON.parseJsonElement(strcontent);
        await CommonFunc.sleep(1000);
        console.info('AttributeModifierDemoAPI03Jsunit_0100 component obj is: ' + obj.getElement('$attrs'));
        console.info('AttributeModifierDemoAPI03Jsunit_0100 component obj.selectedColor is: ' +
        obj.getElement('$attrs').getString('selectedColor'));
        expect(obj.getElement('$attrs').getString('selectedColor')).assertEqual("#FF209B08");
        console.info('AttributeModifierDemoAPI03Jsunit_0100 END')
      } catch (err) {
        console.info('AttributeModifierDemoAPI03Jsunit err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

  })
}