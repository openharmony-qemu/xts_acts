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
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  it,
  expect,
  Level,
  TestType,
  Size,
  afterAll
} from "../../../../hypium/index"
import router from '@ohos.router';
import {
  Component,
  Driver,
  Component,
  UiWindow,
  ON,
  MatchPattern,
  DisplayRotation,
  ResizeDirection,
  WindowMode,
  PointerMatrix
} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { Router } from '@ohos.arkui.UIContext';
import inspector from '@ohos.arkui.inspector'
import hilog from '@ohos.hilog'
import abilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry';
import UIAbility from '@ohos.app.ability.UIAbility';
import common from '@ohos.app.ability.common';
import deviceInfo from "@ohos.deviceInfo"
import { BusinessError } from '@ohos.base';
import { UtilsTest, startAbility, stopApplication } from '../Util.test';
import { IReusableInfo, IReusePool, AppStorage } from '@kit.ArkUI';


export default function GlobalReusePool004Test() {
  describe('GlobalReusePool004Test', () => {
    beforeAll(async () => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("GlobalReusePool004Test beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/uiutils/GlobalReusePool004",
      }
      try {
        const GlobalReusePool004Test = AppStorage.get<Router>("router") as Router
        GlobalReusePool004Test.clear();
        let pages: router.RouterState = GlobalReusePool004Test.getState();
        console.info("get GlobalReusePool004Test state pages: " + JSON.stringify(pages));
        if (!("GlobalReusePool004" == pages.name)) {
          console.info("get GlobalReusePool004Test state pages.name: " + JSON.stringify(pages.name));
          // let result = await GlobalReusePool004Test.pushUrl(options);
          GlobalReusePool004Test.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push GlobalReusePool004Test success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push GlobalReusePool004Test page error:" + err);
      }
      console.info("GlobalReusePool004Test beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("GlobalReusePool004Test after each called");
    });

    afterAll(async () => {
      AppStorage.delete('GlobalReuse004')
      console.info('GlobalReusePool004Test afterAll: all tests finished');
    });


    /**
     * @tc.name   SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100
     * @tc.number SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100
     * @tc.desc   Test getReusePool API returns valid pool when configured
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100 START');
      let driver = Driver.create();
      let globalReuse004: boolean | undefined =
        AppStorage.get<boolean | undefined>('GlobalReuse004') as boolean | undefined;
      expect(globalReuse004).assertUndefined();
      let button = await driver.findComponent(ON.id('GlobalReuse004Change'));
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      await (button?.click() as Promise<void>);
      await CommonFunc.sleep(1000);
      globalReuse004 = AppStorage.get<boolean | undefined>('GlobalReuse004') as boolean | undefined
      expect(globalReuse004).assertTrue()

      let button1 = await driver.findComponent(ON.id('GlobalReuse004_002'));
      await (button1?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      let strJsonNew = inspector.getInspectorByKey('GlobalReuse004_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('@State: 110');

      let strJsonNew1 = inspector.getInspectorByKey('ChildGlobal001_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content'))
        .assertEqual('ChildGlobal001 @Link: 110,@v1PropRef: 0,@v1State: 0,@v1ObjectLink: 100,@v1Provide: 11');

      let strJsonNew2 = inspector.getInspectorByKey('SubChildGlobalV1_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew2).getElement('$attrs').getString('content'))
        .assertEqual('SubChildGlobalV1  @Consume: 11,@Link: 110,@LocalStoragePropRef: 10,@Provide: 11,@State: 10,@PropRef: 0,@StoragePropRef: 10,@ObjectLink: 100');

      let button2 = await driver.findComponent(ON.id('ChildGlobal001_005'));
      await (button2?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJsonNew = inspector.getInspectorByKey('GlobalReuse004_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('@State: 120');

      strJsonNew1 = inspector.getInspectorByKey('ChildGlobal001_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content'))
        .assertEqual('ChildGlobal001 @Link: 120,@v1PropRef: 0,@v1State: 0,@v1ObjectLink: 100,@v1Provide: 11');

      strJsonNew2 = inspector.getInspectorByKey('SubChildGlobalV1_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew2).getElement('$attrs').getString('content'))
        .assertEqual('SubChildGlobalV1  @Consume: 11,@Link: 120,@LocalStoragePropRef: 10,@Provide: 11,@State: 10,@PropRef: 0,@StoragePropRef: 10,@ObjectLink: 100');

      let button3 = await driver.findComponent(ON.id('SubChildGlobalV1_002'));
      await (button3?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      strJsonNew = inspector.getInspectorByKey('GlobalReuse004_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('content')).assertEqual('@State: 121');

      strJsonNew1 = inspector.getInspectorByKey('ChildGlobal001_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew1).getElement('$attrs').getString('content'))
        .assertEqual('ChildGlobal001 @Link: 121,@v1PropRef: 0,@v1State: 0,@v1ObjectLink: 101,@v1Provide: 12');

      strJsonNew2 = inspector.getInspectorByKey('SubChildGlobalV1_001');
      await CommonFunc.sleep(1000);
      expect(JSON.parseJsonElement(strJsonNew2).getElement('$attrs').getString('content'))
        .assertEqual('SubChildGlobalV1  @Consume: 12,@Link: 121,@LocalStoragePropRef: 10,@Provide: 12,@State: 11,@PropRef: 1,@StoragePropRef: 10,@ObjectLink: 101');
      console.info('SUB_ARKUI_GLOBALREUSEPOOL_POOLACCEPTS_0100 END');
      done();
    });
  })
}
