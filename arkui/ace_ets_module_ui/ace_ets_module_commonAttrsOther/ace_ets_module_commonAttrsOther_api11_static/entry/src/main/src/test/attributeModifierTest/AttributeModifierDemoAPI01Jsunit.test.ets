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

export default function AttributeModifierDemoAPI01Jsunit(): void {
  describe('AttributeModifierDemoAPI01Jsunit', () => {
    beforeEach(async (): Promise<void> => {
      console.info("AttributeModifierDemoAPI01Jsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/attributeModifier/AttributeModifierDemoAPI01',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get AttributeModifierDemoAPI01Jsunit state pages:" + JSON.stringify(pages));
        if (!("AttributeModifierDemoAPI01" == pages.name)) {
          console.info("get AttributeModifierDemoAPI01Jsunit pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push AttributeModifierDemoAPI01Jsunit page error:" + err);
      }
      console.info("AttributeModifierDemoAPI01Jsunit beforeEach end");
    });

    
    /**
     * @tc.number   AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.name     AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.desc     AttributeModifierDemoAPI01Jsunit_static_0100
     * @tc.level    Level.LEVEL0
     */
it('AttributeModifierDemoAPI01Jsunit_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
        console.info('AttributeModifierDemoAPI01Jsunit_static_0100 START');

        let driver = Driver.create();
        await CommonFunc.sleep(1000);
        let btn1 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01EnabledButton'));
        await CommonFunc.sleep(1000);
        await (btn1?.click() as Promise<void>);
        console.log('test start btn1 click after')
        await CommonFunc.sleep(1000);

        await CommonFunc.sleep(1000);
        let btn2 = await driver.findComponent(ON.id('AttributeModifierDemoAPI01isDark'));
        await CommonFunc.sleep(1000);
        await (btn2?.click() as Promise<void>);
        console.log('test start btn2 click after')
        await CommonFunc.sleep(4000);

        let strcontent = inspector.getInspectorByKey('AttributeModifierDemoAPI01Button');
        await CommonFunc.sleep(2000);
        let obj = JSON.parseJsonElement(strcontent);
        console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj is: ' + obj.getElement('$attrs'));
        console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj.backgroundColor is: ' +
        obj.getElement('$attrs').getString('backgroundColor'));
        console.info('AttributeModifierDemoAPI01Jsunit_static_0100 component obj.width is: ' +
        obj.getElement('$attrs').getString('width'));
        expect(obj.getElement('$attrs').getString('width')).assertEqual('300.00px');
        console.info('AttributeModifierDemoAPI01Jsunit_static_0100 END')
      } catch (err) {
        console.info('AttributeModifierDemoAPI01Jsunit err: ' + JSON.stringify(err));
        expect().assertFail();
      }
      done();
    });

  })
}