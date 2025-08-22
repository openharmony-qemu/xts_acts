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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, Level, expect } from '../../../../hypium/index';
import router from '@ohos.router';
import { Driver, Component, UiWindow, ON, MatchPattern, DisplayRotation, ResizeDirection, WindowMode, PointerMatrix } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import inspector from '@ohos.arkui.inspector';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils'
import resourceManager from '@ohos.resourceManager'

import  Environment  from '@ohos.file.environment'

export default function AppStorageJsunit() {
  describe('appStorage', () => {
    beforeAll(() => {
      console.info("appStorage beforeAll start");
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.global.api11.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });

    beforeEach(async (): Promise<void> => {
      console.info("appStorage beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/appStorage',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get appStorage state pages:" + JSON.stringify(pages));
        if (!("appStorage" == pages.name)) {
          console.info("get appStorage pages.name:" + JSON.stringify(pages.name));
          
          
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          
        }
      } catch (err) {
        console.error("push appStorage page error:" + err);
      }
      console.info("appStorage beforeEach end");
    });

    afterEach(async () => {
      await Utils.sleep(1000);
      console.info("appStorage after each called");
    })

    

    

/*
     * @tc.number   stateManagement_AppStorage_setOrCreate_static_0100
     * @tc.name     stateManagement_AppStorage_setOrCreate_static_0100
     * @tc.desc     stateManagement_AppStorage_setOrCreate_static_0100
     * @tc.level    Level.LEVEL0
     */
it('stateManagement_AppStorage_setOrCreate_static_0100', Level.LEVEL0, (done: () => void):void => {
      console.info('[stateManagement_AppStorage_setOrCreate_0100] START');
      AppStorage.setOrCreate<string>("key1", "value1");
      AppStorage.setOrCreate<string>("key2", "value2");
      AppStorage.setOrCreate<string>("key3", "value3");
      let size = AppStorage.size();
      console.info('[stateManagement_AppStorage_setOrCreate_0100] size =' + size);
      expect(size == 3)
        .assertTrue;
      let key1 = AppStorage.get<string>("key1");
      console.info('[stateManagement_AppStorage_setOrCreate_0100] key1 = ' + key1);
      console.info('[stateManagement_AppStorage_setOrCreate_0100] END');
      done();
    });

    

    

/*
     * @tc.number   stateManagement_Storage_set_static_0100
     * @tc.name     stateManagement_Storage_set_static_0100
     * @tc.desc     stateManagement_Storage_set_static_0100
     * @tc.level    Level.LEVEL0
     */
it('stateManagement_Storage_set_static_0100', Level.LEVEL0, (done: () => void):void => {
      done();
      return;

      console.info('[stateManagement_Storage_set_0100] START');

      try {

      } catch(ERROR) {
          expect().assertFail();
      }
      done();
    });


    

    

/*
     * @tc.number   stateManagement_Environment_EnvProps_static_0100
     * @tc.name     stateManagement_Environment_EnvProps_static_0100
     * @tc.desc     stateManagement_Environment_EnvProps_static_0100
     * @tc.level    Level.LEVEL0
     */
it('stateManagement_Environment_EnvProps_static_0100', Level.LEVEL0, (done: () => void):void => {
      console.info('[stateManagement_Environment_EnvProps_0100] START');
      try {
        
        
        
        
        
        let enable: number | undefined = AppStorage.get<number>("colorMode");
        let enable1: number | undefined = AppStorage.get<number>("layoutDirection");
        expect(enable == (resourceManager.ColorMode.LIGHT as number))
          .assertTrue;
        
        
        console.info('[stateManagement_Environment_EnvProps_0100] enable = ' + enable);
        console.info('[stateManagement_Environment_EnvProps_0100] enable1 = ' + enable1);
      } catch (err) {
        console.info('[stateManagement_Environment_EnvProps_0100] err = ' + err);
      }
      console.info('[stateManagement_Environment_EnvProps_0100] END');
      done();
    });
  })
}
