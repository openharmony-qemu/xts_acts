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
import { describe, beforeAll, beforeEach, afterEach, it, expect, Level } from '../../../../hypium/index';
import { Driver, ON, Component, PointerMatrix, MouseButton } from '@ohos.UiTest';
import router from '@ohos.router';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import RectValue from '../../../ets/MainAbility/common/Rect';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';

import { Driver, ON, loadAndSetUpUiTest} from '@ohos.UiTest';
import {UtilsTest} from '../Util.test'
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext: common.UIAbilityContext;

export default function cancelDataLoadingTest() {

  describe('cancelDataLoadingTest', () => {
    beforeAll(() => {
      await UtilsTest.loadAndSetUpUiTest();
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.open.harmony.acetestcommenventapi15.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/startDataLoading/dataLoading',
      }

      try {
        const routerInstance = AppStorage.get<Router>("router", Type.from<Router>()) as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get cancelDataLoading state pages: " + JSON.stringify(pages));
        if (!("cancelDataLoading" == pages.name)) {
          console.info("get cancelDataLoading state pages.name: " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
          // let result = await router.push(options);
          await CommonFunc.sleep(2000);
          // console.info("push cancelDataLoading success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push cancelDataLoading page error: " + err);
        expect().assertFail();
      }
    });

    afterEach(async (): Promise<void> => {
      await CommonFunc.sleep(1000);
      console.info("cancelDataLoading after each called");
    });

    /**
     * @tc.number cancelDataLoading_static_0010
     * @tc.name cancelDataLoading_static_0010
     * @tc.desc api: UIContext DragController cancelDataLoading
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */
    it('cancelDataLoading_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('cancelDataLoading_static_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let button = await (driver.findComponent(ON.id('cancel')) as Promise<Component>);
      await button.click();
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('cancelResult');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('401');
      console.info('[cancelDataLoading_static_0010] END');
      done();
    });


    /**
     * @tc.number startDataLoading_0010
     * @tc.name startDataLoading_0010
     * @tc.desc api: UIContext DragController startDataLoading
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */


    it('startDataLoading_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('startDataLoading_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let image = await (driver.findComponent(ON.id('image')) as Promise<Component>);
      let list = await (driver.findComponent(ON.id('list')) as Promise<Component>);
      await image.dragTo(list);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('res');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content') != null).assertTrue();
      console.info('[startDataLoading_0010] END');
      done();
    });

    /**
     * @tc.number disableDataPrefetch_0010
     * @tc.name cancelDataLoading_static_0010
     * @tc.desc property: UIContext DragController  disableDataPrefetch
     * @tc.level: Level 2
     * @tc.type :
     * @tc.size :
     */

    it('disableDataPrefetch_static_0010', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('disableDataPrefetch_0010 START');
      let driver = Driver.create()
      await CommonFunc.sleep(1000);
      let image = await (driver.findComponent(ON.id('image')) as Promise<Component>);
      let list = await (driver.findComponent(ON.id('list')) as Promise<Component>);
      await image.dragTo(list);
      await CommonFunc.sleep(1000);
      let strJson = inspector.getInspectorByKey('dragResult1');
      let obj = JSON.parseJsonElement(strJson);
      expect(obj.getElement('$attrs').getString('content')).assertEqual('Drag Success');
      console.info('[disableDataPrefetch_0010] END');
      done();
    });
  })
}
