'use static';
/*
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

import { describe,beforeAll, beforeEach, afterEach, it, expect, Level } from "../../../../hypium/index"
import router from '@ohos.router';
import { Component, Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { DatePickerDialogOptions }  from "@ohos.arkui.component";

import Utils  from "../../../ets/MainAbility/common/Utils";
let domain: int = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;
function sleep(time: int):Promise<int> {
  return new Promise<int>((resolve, reject) => {
    setTimeout(() => {
      resolve(0);
    }, time * 1000);
  })
}

export default function ActsDatePickerTest() {
  describe('ActsDatePickerTest', () => {

    beforeAll(() => {
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.picker.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("flex beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/DatePicker/DatePicker',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get DatePicker state pages:" + JSON.stringify(pages));
        if (!("DatePicker" == pages.name)) {
          console.info("get DatePicker pages.name:" + JSON.stringify(pages.name));


          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push DatePicker page error: " + err);
      }
    });

    /*
     * @tc.number   Stage_DatePicker_Test_static_0010
     * @tc.name     Stage_DatePicker_Test_static_0010
     * @tc.desc     Stage_DatePicker_Test_static_0010
     * @tc.level    Level.LEVEL1
     */
    it('Stage_DatePicker_Test_static_0010', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('Stage_DatePicker_Test_static_0010 START');
      try{
        let strJson = inspector.getInspectorByKey('Stage_DatePicker_Test_static_0010');
        console.info('Stage_DatePicker_Test_static_0010 START  :'+ JSON.stringify(strJson));
        let obj = JSON.parseJsonElement(strJson);
        console.info("Stage_DatePicker_Test_static_0010 obj is: " + JSON.stringify(obj));
        let onDateChange = obj.getElement('$attrs').getElement('onDateChange')
        expect(typeof onDateChange).assertEqual("undefined")
        let DatePickerDialog: DatePickerDialogOptions = {
          onDateAccept: (value: Date) => {
            console.info("DatePickerDialog:onAccept()" + value.toString())
          },
          onDateChange: (value: Date) => {
            console.info("DatePickerDialog:onChange()" + value.toString())
          }}
        console.info("Stage_DatePicker_Test_static_0010 InsertValue is: " + JSON.stringify(DatePickerDialog))
        expect(typeof DatePickerDialog.onDateAccept).assertEqual("function")
        expect(typeof DatePickerDialog.onDateChange).assertEqual("function")
        console.info('Stage_DatePicker_Test_static_0010 END ');
      } catch(err) {
        expect().assertFail()
        console.info('Stage_DatePicker_Test_static_0010 ERR  '+ JSON.stringify(err));
      }
      done();
    });

  })
}