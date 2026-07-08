'use static';
/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll,  it, Level, expect } from "../../../../hypium/index"
import router from '@ohos.router';
import {  Component, Driver, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix} from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector'
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import {UtilsTest,startAbility} from '../Util.test';
import { AppStorageV2 } from '@kit.ArkUI';
import {Message1,Message2} from "../../../../main/ets/MainAbility/pages/AppStorageV2/AppStorageV2Api"

export default function AppStorageV2Api(): void {
  describe('AppStorageV2ApiTest', () => {
    beforeAll(async (): Promise<void> => {

      await UtilsTest.startAbility("com.arkui.ace.StateMangagement.api18.static", "EntryAbility")

    })
    beforeEach(async (): Promise<void> => {
      console.info("AppStorageV2ApiTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/AppStorageV2/AppStorageV2Api",
      }
      try {
        const AppStorageV2Api = AppStorage.get<Router>("router") as Router
        AppStorageV2Api.clear();
        let pages:router.RouterState = AppStorageV2Api.getState();
        console.info("get AppStorageV2Api state pages: " + JSON.stringify(pages));
        if (!("AppStorageV2Api" == pages.name)) {
          console.info("get AppStorageV2Api state pages.name: " + JSON.stringify(pages.name));
          // let result = await AppStorageV2Api.pushUrl(options);
          AppStorageV2Api.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push AppStorageV2Api success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push AppStorageV2Api page error:" + err);
      }
      console.info("AppStorageV2Api beforeEach end");
    });
    afterEach(async () => {
      await CommonFunc.sleep(1000);
      console.info("AppStorageV2Api after each called");
    });


    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_connect_0100
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_connect_0100
     * @tc.desc   Test AppStorageV2 connect function with @Trace decorated property, verify UI sync when property changes
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_connect_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0100 start');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Btn = await driver.findComponent(ON.id('AppStorageV2_connect1'));
      await CommonFunc.sleep(1000);
      await (Btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_connect1');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('Index userID: 2');

      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0100 end');

      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_connect_0200
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_connect_0200
     * @tc.desc   Test AppStorageV2 connect function, verify non-@Trace decorated property access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_connect_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0200 start');
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_connect2');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('Index userName: Jack');

      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0200 end');

      done();
    });


    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_keys_0100
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_keys_0100
     * @tc.desc   Test AppStorageV2 keys function to get all stored keys
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_keys_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_keys_0100 start');
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_keys');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('AppStorageV2.keys(): Message2,Message1');
      console.info('SUB_ARKUI_API_AppStorageV2Api_keys_0100 end');
      done();
    });


    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_remove_0100
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_remove_0100
     * @tc.desc   Test AppStorageV2 remove function to delete stored data by keyOrType
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_remove_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_remove_0100 start');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Btn = await driver.findComponent(ON.id('AppStorageV2_remove'));
      await CommonFunc.sleep(1000);
      await (Btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_remove');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('remove keyOrType: 2');
      console.info('SUB_ARKUI_API_AppStorageV2Api_remove_0100 end');

      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_connect_0300
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_connect_0300
     * @tc.desc   Test AppStorageV2 connect function to re-connect after remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_connect_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0300 start');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Btn = await driver.findComponent(ON.id('AppStorageV2_connect3'));
      await CommonFunc.sleep(1000);
      await (Btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_connect3');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('remove connect userID: 5');
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0300 end');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_connect_0400
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_connect_0400
     * @tc.desc   Test AppStorageV2 connect function, verify non-@Trace decorated property access
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_connect_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0400 start');
      await CommonFunc.sleep(1000);
      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_connect_underfined');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('connect underfined: undefined');

      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0400 end');

      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_connect_0500
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_connect_0500
     * @tc.desc   Test AppStorageV2 connect function to re-connect after remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_connect_0500', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0500 start');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Btn = await driver.findComponent(ON.id('AppStorageV2_connect4'));
      await CommonFunc.sleep(1000);
      await (Btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);


      let strJsonNew = inspector.getInspectorByKey('AppStorageV2_connect4');
      expect(JSON.parseJsonElement(strJsonNew).getElement('$attrs').getString('label')).assertEqual('connect defaultCreator false:4');

      console.info('SUB_ARKUI_API_AppStorageV2Api_connect_0500 end');
      done();
    });

    /**
     * @tc.name   SUB_ARKUI_API_AppStorageV2Api_remove_0200
     * @tc.number SUB_ARKUI_API_AppStorageV2Api_remove_0200
     * @tc.desc   Test AppStorageV2 connect function to re-connect after remove
     * @tc.type   FUNCTION
     * @tc.size   SMALLTEST
     * @tc.level  LEVEL0
     */
    it('SUB_ARKUI_API_AppStorageV2Api_remove_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_API_AppStorageV2Api_remove_0200 start');
      let driver = Driver.create();
      await CommonFunc.sleep(1000);

      let Btn = await driver.findComponent(ON.id('AppStorageV2_remove2'));
      await CommonFunc.sleep(1000);
      await (Btn?.click() as Promise<void>);
      await CommonFunc.sleep(1000);

      // 删除创建的值
      AppStorageV2.remove(Class.from<Message1>())
      AppStorageV2.remove(Class.from<Message2>())

      // 验证array为空的情况
      let keys: Array<string> = AppStorageV2.keys();
      expect(keys.length).assertEqual(0);

      console.info('SUB_ARKUI_API_AppStorageV2Api_remove_0200 end');

      done();
    });
  });
}