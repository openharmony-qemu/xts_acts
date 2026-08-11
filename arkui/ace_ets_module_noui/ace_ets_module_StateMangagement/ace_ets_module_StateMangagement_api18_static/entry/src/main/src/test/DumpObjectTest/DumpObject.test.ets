'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level, TestType, Size } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog';
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from '@ohos.deviceInfo';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
export default function DumpObject(): void {
  describe('DumpObject', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("DumpObject beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Dump/DumpObject",
      }
      try {
        const DumpObject = AppStorage.get<Router>("router") as Router
        DumpObject.clear();
        let pages:router.RouterState = DumpObject.getState();
        console.info("get DumpObject state pages: " + JSON.stringify(pages));
        if (!("DumpObject" == pages.name)) {
          console.info("get DumpObject state pages.name: " + JSON.stringify(pages.name));
          DumpObject.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DumpObject page error:" + err);
      }
      console.info("DumpObject beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("DumpObject after each called");
    });

    /**
     * @tc.number   SUB_ARKUI_API_DumpObjectTest_static_0100
     * @tc.name     SUB_ARKUI_API_DumpObjectTest_static_0100
     * @tc.desc     SUB_ARKUI_API_DumpObjectTest_static_0100
     * @tc.level    Level.LEVEL0
     */
    it('SUB_ARKUI_API_DumpObjectTest_static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[SUB_ARKUI_API_DumpObjectTest_static_0100] START');
      await CommonFunc.sleep(1000);
      let driver: Driver = await Driver.create();
      await CommonFunc.sleep(1000);
      let btn = await driver.findComponent(ON.id("DumpObjectButton_001"));
      await (btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('DumpObjectText_001');
      let obj1 = JSON.parseJsonElement(strJsonNew);
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain(
          '"decorator":"@Local","propertyName":"infox","value"' +
          ':["[object Object]","[object Object]","[object Object]","[object Object]",' +
          '"[object Object]","[object Object]","[object Object]",' +
          '"...","[object Object]","[object Object]","[object Object]"]'
        )
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain('"decorator":"@Local","propertyName":"info","value":"200"')
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain('"decorator":"@Local","propertyName":"firstName","value":"Hua"')
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain('"decorator":"@Local","propertyName":"lastName","value":"Li"')
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain('"decorator":"@Monitor","propertyName":["info"]')
      expect(obj1.getElement('$attrs').getString('content'))
        .assertContain('"decorator":"@Computed","propertyName":"fullName","value":"HuaLi"')
      console.info('[SUB_ARKUI_API_DumpObjectTest_static_0100] END');
      done();
    });
  })
}
