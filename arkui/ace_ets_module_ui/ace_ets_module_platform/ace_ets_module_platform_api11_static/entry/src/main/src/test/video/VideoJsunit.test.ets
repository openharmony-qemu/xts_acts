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

import {
  describe,
  beforeAll,
  expect,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level
} from '../../../../hypium/index';
import router from '@ohos.router';
import { UtilsTest } from '../Util.test';
import Utils from '../../../ets/MainAbility/common/Utils';
import { Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { Driver, ON,Component } from '@ohos.UiTest';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { MessageManager, Callback } from '../../../ets/MainAbility/common/MessageManager';

function sleep(time: int) {
  return new Promise<int>((resolve,reject) => {
    setTimeout(() => {
      resolve(0)
    }, time * 1000)
  }).then(() => {
    console.info(`sleep ${time} over...`)
  })
}

export default function videoJsunit() {


  describe('VideoAppInfoTest', () => {
    beforeAll(() => {
      
      await UtilsTest.msSleep(4000)
      await UtilsTest.startAbility("com.arkui.ace.platform.static", "EntryAbility")
      await UtilsTest.msSleep(4000)
    });
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/video/Video',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        await sleep(1);
        let pages = routerInstance.getState();
        console.info("get Video state success " + JSON.stringify(pages));
        if (!("Video" == pages.name)) {
          console.info("get Video state success " + JSON.stringify(pages.name));
          routerInstance.pushUrl(options)
        }
      } catch (err) {
        console.error("push Video page error " + JSON.stringify(err));
      }
      await sleep(2)
    });

    afterEach(async (): Promise<void> => {
      console.info("Video after each called");
      await sleep(1)
    });

    /**
     * @tc.number SUB_ACE_BASIC_ETS_API_0630
     * @tc.name videoAppInfoStaticTest001
     * @tc.desc aceEtsTest
     */
    it('videoAppInfoStaticTest001', Level.LEVEL1, async () => {
      try {
        console.info('videoAppInfoTest001 START');
          await sleep(1)
          let strJson = inspector.getInspectorByKey('video');
          let obj = JSON.parseJsonElement(strJson);
          console.info("cd video component obj is: " + JSON.stringify(obj));
          console.log("cd video type" + JSON.stringify(obj.getElement('$type')));
          console.log("cd video autoPlay" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$type').getString('autoPlay')));
          console.log("cd video muted" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$type').getString('muted')));
          console.log("cd video controls" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$type').getString('controls')));
          console.log("cd video loop" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$type').getString('loop')));
          console.log("cd video objectFit" + JSON.stringify(JSON.parseJsonElement(strJson).getElement('$type').getString('objectFit')));
          console.info('videoAppInfoTest001 END');
      } catch (error) {
        expect().assertFail();
      }
    });
  })
}
