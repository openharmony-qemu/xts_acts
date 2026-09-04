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
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { describe, beforeEach, afterEach, afterAll, it, expect, Level } from '../../../../hypium/index';
import router from '@ohos.router';
import { Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function CheckBoxShape() {
  describe('CheckBoxShape', () => {

    beforeEach(async () => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/CheckboxGroup/CheckBoxShape',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CheckBoxShape state success " + JSON.stringify(pages));
        if (!("CheckBoxShape" == pages.name)) {
          console.info("get CheckBoxShape state success " + JSON.stringify(pages.name));
          // let result = await routerInstance.push(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CheckBoxShape page success " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CheckBoxShape page error: " + err);
      }
    });

    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("CheckBoxShape after each called");
    });

    /**
     * @tc.number   CheckBoxShapeTest_static_0100
     * @tc.name     CheckBoxShapeTest_static_0100
     * @tc.desc     CheckBoxShapeTest_static_0100
     * @tc.level    Level.LEVEL1
     */
    it('CheckBoxShapeTest_static_0100', Level.LEVEL1, async (done: () => void): Promise<void> =>    {
      console.info('CheckBoxShapeText_static_0100 START');
      let strJson = inspector.getInspectorByKey('CheckBoxShapeXTS');
      console.info("CheckBoxShapeText_static_0100 component strJson:" + strJson);
      let obj = JSON.parseJsonElement(strJson);
      console.info("CheckBoxShapeText_static_0100 component obj is: " + JSON.stringifyJsonElement(obj));
      console.info("[CheckBoxShapeText_static_0100] title: " + obj.getElement('$attrs').getString('checkboxShape'));
      expect(obj.getElement('$attrs').getString('checkboxShape')).assertEqual("1");//CheckBoxShape.ROUNDED_SQUARE
      console.info('CheckBoxShapeText_static_0100 END');
      done();
    });
  })
}
