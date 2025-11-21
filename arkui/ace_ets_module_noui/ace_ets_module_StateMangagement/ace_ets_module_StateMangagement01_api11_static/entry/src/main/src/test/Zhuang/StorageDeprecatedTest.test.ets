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
import router from '@ohos.router';
import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,Level
} from '../../../../hypium/index';
import {
  Component,
  Driver,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {MessageManager,Callback} from '../../../ets/MainAbility/common/MessageManager';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility } from '../Util.test';
let domain: number = 0x0000;
let tag: string = 'testTag';
let testAbilityContext:common.UIAbilityContext;

export default function StorageDeprecatedTest() {
  describe('StorageDeprecatedTest', () => {
    beforeAll(() => {
      console.info("StorageDeprecatedTest beforeEach start");

      await UtilsTest.msSleep(4000);
      await UtilsTest.startAbility("com.arkui.ace.StateMangagement01.api11.static", "EntryAbility");
      await UtilsTest.msSleep(4000);
    });

    beforeEach(async (): Promise<void> => {
      console.info("StorageDeprecatedTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Zhuang/StorageDeprecated",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get StorageDeprecatedTest state pages:" + JSON.stringify(pages));
        if (!("StorageDeprecatedTest" == pages.name)) {
          console.info("get StorageDeprecatedTest pages.name:" + JSON.stringify(pages.name));
          //let result = routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push StorageDeprecatedTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push StorageDeprecatedTest page error:" + err);
      }
      console.info("StorageDeprecatedTest beforeEach end");
    });

       afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("StorageDeprecatedTest after each called");
    });

    
    /*
     * @tc.number   StorageDeprecatedTest_static_001
     * @tc.name     StorageDeprecatedTest_static_001
     * @tc.desc     StorageDeprecatedTest_static_001
     * @tc.level    Level.LEVEL0
     */
it('StorageDeprecatedTest_static_001', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageDeprecatedTest_static_001] START');
      await CommonFunc.sleep(2000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvDeprecatedGet'));
      console.info("[StorageDeprecatedTest] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HelloArkUI');
      await CommonFunc.sleep(1000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let btn: Component|null = await driver.findComponent(ON.id("btnDelASKey"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>) ;
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvDeprecatedDel'));
      console.info("[StorageDeprecatedTest] component obj1 content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('true');
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvDeprecatedDel1'));
      console.info("[StorageDeprecatedTest] component obj2 content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('false');
      console.info('[StorageDeprecatedTest_static_001] END');
      done();
    });

    
    /*
     * @tc.number   StorageDeprecatedTest_static_002
     * @tc.name     StorageDeprecatedTest_static_002
     * @tc.desc     StorageDeprecatedTest_static_002
     * @tc.level    Level.LEVEL0
     */
it('StorageDeprecatedTest_static_002', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('[StorageDeprecatedTest_static_002] START');
      await CommonFunc.sleep(2000);
      let driver: Driver = Driver.create();
      await CommonFunc.sleep(1000);
      let textZh = await driver.findComponent(ON.text('你好Environment'))
      let textEn = await driver.findComponent(ON.text('HelloEnvironment'))
      expect((textZh || textEn) != null).assertTrue()
      await CommonFunc.sleep(1000);
      let obj = JSON.parseJsonElement(inspector.getInspectorByKey('tvADPersistPropsA'));
      console.info("[StorageDeprecatedTest] component obj content is: " + JSON.stringify(obj.getElement('$attrs').getString('content')));
      expect(obj.getElement('$attrs').getString('content')).assertEqual('HelloPersistPropsA');
      await CommonFunc.sleep(1000);
      let obj2 = JSON.parseJsonElement(inspector.getInspectorByKey('tvADPersistPropsAb'));
      console.info("[StorageDeprecatedTest] component obj2 content is: " + JSON.stringify(obj2.getElement('$attrs').getString('content')));
      expect(obj2.getElement('$attrs').getString('content')).assertEqual('HelloPersistPropsAb');
      await CommonFunc.sleep(1000);
      let obj1 = JSON.parseJsonElement(inspector.getInspectorByKey('tvADPersistentStorageA'));
      console.info("[StorageDeprecatedTest] component obj1 content is: " + JSON.stringify(obj1.getElement('$attrs').getString('content')));
      expect(obj1.getElement('$attrs').getString('content')).assertEqual('HelloPersistPropA');
      await CommonFunc.sleep(1000);
      let btn: Component|null = await driver.findComponent(ON.id("btnDelPSKey"));
      await CommonFunc.sleep(1000);
      await (btn?.click() as Promise<void>) ;
      console.info('[StorageDeprecatedTest_static_002] END');
      done();
    });
  })
}
