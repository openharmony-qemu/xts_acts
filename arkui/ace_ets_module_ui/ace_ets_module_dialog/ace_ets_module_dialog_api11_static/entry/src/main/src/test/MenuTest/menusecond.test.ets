'use static';
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
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
import window from '@ohos.window';
import emitter from '@ohos.events.emitter';
import {
  describe,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  TestType,
  Size
} from "../../../../hypium/index"
import {
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
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import Utils from '../../../ets/MainAbility/common/Utils';


function sleep(time: int) {
  return new Promise<string>((resolve, reject) => {
    setTimeout(() => {
      resolve("ok")
    }, time)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function menuSecondTest() {
  describe('ActsMenuSecondTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/Menu/menusecond",
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get menusecond state pages: " + JSON.stringify(pages));
        if (!("menusecond" == pages.name)) {
          console.info("get menusecond state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance .pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push menusecond success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push menusecond page error " + JSON.stringify(err));
      }
      try {
        await sleep(2000)
      } catch (err) {
        console.info('menusecondTest await err: ' + JSON.stringify(err));
      }

    });


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_Enabled_static_0100
     * @tc.name     ArkUX_Stage_Menu_Enabled_static_0100
     * @tc.desc     ArkUX_Stage_Menu_Enabled_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_Enabled_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey("Menu"))
        // console.info('ArkUX_Stage_Menu_Enabled_static_0100 bindMenuEnabled :' +
        // JSON.stringify(obj.getElement('$attrs').getString('bindMenuEnabled')));
      } catch(error) {
        expect().assertFail();
      }
      done()
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_Preview_static_0100
     * @tc.name     ArkUX_Stage_Menu_Preview_static_0100
     * @tc.desc     ArkUX_Stage_Menu_Preview_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_Preview_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey("floatingMenuImage"))
        // console.info('ArkUX_Stage_Menu_Preview_static_0100 preview :' +
        // JSON.stringify(obj.getElement('$attrs').getString('preview')));
      } catch(error) {
        expect().assertFail();
      }
      done()
    })


    
    
/**
     * @tc.number   ArkUX_Stage_Menu_Preview_static_0200
     * @tc.name     ArkUX_Stage_Menu_Preview_static_0200
     * @tc.desc     ArkUX_Stage_Menu_Preview_static_0200
     * @tc.level    Level.LEVEL2
     */
it('ArkUX_Stage_Menu_Preview_static_0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      try {
        let obj = JSON.parseJsonElement(inspector.getInspectorByKey("floatingMenuBuilder"))
        // console.info('ArkUX_Stage_Menu_Preview_static_0200 preview :' +
        // JSON.stringify(obj.getElement('$attrs').getString('preview')));
      } catch(error) {
        expect().assertFail();
      }
      done()
    })
  })
}
