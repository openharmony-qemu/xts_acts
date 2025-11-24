/**
 * Copyright (c) 2022 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import {UtilsTest, startAbility, stopApplication} from "../Util.test"
let domain: Int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function SelectJsunit01() {
  describe('SelectJsunit01', () => {
    beforeAll(() => {
      console.info("SelectJsunit01 beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("async (done: ()=>void ) => {", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });
    beforeEach(async (): Promise<void> => {
      console.info("SelectJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/select/SelectPage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get SelectJsunit state pages: " + JSON.stringify(pages));
        if (!("SelectJsunit01" == pages.name)) {
          console.info("get SelectJsunit01 state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push SelectJsunit01 page error: " + err);
        expect().assertFail();
      }
    });


   
   
   
   /*
     * @tc.number   SelectJsunit01_static_0100
     * @tc.name     SelectJsunit01_static_0100
     * @tc.desc     SelectJsunit01_static_0100
     * @tc.level    Level.LEVEL0
     */
it('SelectJsunit01_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      // Illegal modification of properties of component select
      console.info('[SelectJsunit_0400] START');
      const message:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
      message.notify({name:'optionValue',value:'-20'})
      await CommonFunc.sleep(2000);
  const message1:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
      message1.notify({name:'icon',value:'10'})
      await CommonFunc.sleep(2000);
  const message2:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message2.notify({name:'selected',value:'test'})
      await CommonFunc.sleep(2000);
  const message3:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message3.notify({name:'selectValue',value:'10'})
      await CommonFunc.sleep(2000);
  const message4:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message4.notify({name:'selectFont',value:'###'})
      await CommonFunc.sleep(2000);
  const message5:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message5.notify({name:'fontColor',value:'123'})
      await CommonFunc.sleep(2000);
  const message6:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message6.notify({name:'selectedOptionBgColor',value:'0'})
      await CommonFunc.sleep(2000);
  const message7:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message7.notify({name:'selectedOptionFont',value:'%666'})
      await CommonFunc.sleep(2000);
  const message8:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message8.notify({name:'selectedOptionFontColor',value:'hello'})
      await CommonFunc.sleep(2000);
  const message9:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message9.notify({name:'optionBgColor',value:'-10'})
      await CommonFunc.sleep(2000);
  const message10:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message10.notify({name:'optionFont',value:'aaa'})
      await CommonFunc.sleep(2000);
  const message11:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message11.notify({name:'optionFontColor',value:'123'})
      await CommonFunc.sleep(2000);
  const message12:MessageManager<string> = AppStorage.get<MessageManager<string>>("messageManager")!
     message12.notify({name:'indexValue',value:'bbb'})
      await CommonFunc.sleep(2000);

      // Get the propoties value of the select component
      let strJson = inspector.getInspectorByKey('select');
      let obj = JSON.parseJsonElement(strJson);
      console.info("[SelectJsunit_0400] component obj is: " + JSON.stringify(obj));

      await CommonFunc.sleep(1000);
      let strJson1 = inspector.getInspectorByKey('indexValue');
      let obj1 = JSON.parseJsonElement(strJson1);
      console.info("[SelectJsunit_0400] component obj1 is: " + JSON.stringify(obj1));
       expect(obj.getElement('$attrs').getString('selected')).assertEqual('0');
       expect(obj.getElement('$attrs').getString('value')).assertEqual('SelecteButton');
       expect(obj.getElement('$attrs').getString('font')).assertEqual('{"size":"16.00fp","weight":"FontWeight.Medium","family":"","style":"FontStyle.Normal"}');
       expect(obj.getElement('$attrs').getString('fontColor')).assertEqual('#FF00007B');
       expect(obj.getElement('$attrs').getString('selectedOptionBgColor')).assertEqual('#FF808080');
       expect(obj.getElement('$attrs').getString('selectedOptionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
       expect(obj.getElement('$attrs').getString('selectedOptionFontColor')).assertEqual('#FFFF0000');
       expect(obj.getElement('$attrs').getString('optionBgColor')).assertEqual('#FF808080');
       expect(obj.getElement('$attrs').getString('optionFont')).assertEqual('{"size":"16.00fp","weight":"400","family":"","style":"FontStyle.Normal"}');
       expect(obj.getElement('$attrs').getString('optionFontColor')).assertEqual('#FFFF0000');
       expect(obj.getElement('$attrs').getString('content')).assertEqual('indexValue:0');

      console.info('[SelectJsunit_0400] END');
      done();
    });
  })
}