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

import { afterEach, beforeEach, describe, expect, it, Level } from '../../../../hypium/index';
import router from '@ohos.router';

import inspector from '@ohos.arkui.inspector'
import CommonFunc from '../../../ets/MainAbility/utils/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { UtilsTest } from '../Util.test';
export default function gridContainerJsunit() {
  describe('gridContainerTest', () => {
    beforeEach(async (): Promise<void> => {
      console.info("gridContainerJsunit beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/Grid/GridContainer',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get GridContainer state success " + "");
        if (!("GridContainer" == pages.name)) {
          console.info("get GridContainer state success " + "");
          routerInstance.pushUrl(options);
        }
      } catch (err) {
        console.error("push GridContainer page error " + JSON.stringify(err));
      }
      try {
      await UtilsTest.msSleep(1000)
      } catch (err) {
      console.info('gridContainerTestTest await err: ' + JSON.stringify(err));
      }
    });

    afterEach(async () => {
      try {
      await UtilsTest.msSleep(1000)
      } catch (err) {
      console.info('gridContainerTestTest await err: ' + JSON.stringify(err));
      }
      console.info("GridContainer after each called");
    });

/**
     * @tc.number   testGridContainer010_static_01
     * @tc.name     testGridContainer010_static_01
     * @tc.desc     testGridContainer010_static_01
     * @tc.level    Level.LEVEL0
     */
it('testGridContainer010_static_01', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer010_static_01 START');
      let strJson = inspector.getInspectorByKey('GridContainer' + '_gridContainer');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
     expect(obj.getString('$type')).assertEqual('GridCol');
      console.info('testGridContainer010_static_01 END');
      done();
    });

/**
     * @tc.number   testGridContainer020_static_02
     * @tc.name     testGridContainer020_static_02
     * @tc.desc     testGridContainer020_static_02
     * @tc.level    Level.LEVEL0
     */
it('testGridContainer020_static_02', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer020_static_02 START');
      let strJson = inspector.getInspectorByKey('gridContainer1');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
  expect(obj.getString('$type')).assertEqual('GridCol');
      console.info('testGridContainer020_static_02 END');
      done();
    });

/**
     * @tc.number   testGridContainer030_static_03
     * @tc.name     testGridContainer030_static_03
     * @tc.desc     testGridContainer030_static_03
     * @tc.level    Level.LEVEL0
     */
it('testGridContainer030_static_03', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer030_static_03 START');
      let strJson = inspector.getInspectorByKey('gridContainer2');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
  expect(obj.getString('$type')).assertEqual('GridCol');
      console.info('testGridContainer030_static_03 END');
      done();
    });

/**
     * @tc.number   testGridContainer040_static_04
     * @tc.name     testGridContainer040_static_04
     * @tc.desc     testGridContainer040_static_04
     * @tc.level    Level.LEVEL0
     */
it('testGridContainer040_static_04', Level.LEVEL0, async (done: () => void): Promise<void> => {
      console.info('testGridContainer040_static_04 START');
      let strJson = inspector.getInspectorByKey('gridContainer3');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
  expect(obj.getString('$type')).assertEqual('GridCol');
      console.info('testGridContainer040_static_04  END');
      done();
    });

/**
     * @tc.number   testGridContainer050_static_05
     * @tc.name     testGridContainer050_static_05
     * @tc.desc     testGridContainer050_static_05
     * @tc.level    Level.LEVEL0
     */
it('testGridContainer050_static_05', Level.LEVEL0, async (done: () => void): Promise<void> => {
  try{
    console.info('testGridContainer050_static_05 START');
      let strJson = inspector.getInspectorByKey('gridContainer4');
     let obj = JSON.parseJsonElement(strJson);
     console.info("component obj is: " + JSON.stringify(obj));
    expect(obj.getString('$type')).assertEqual('GridCol');
      console.info('testGridContainer050_static_05  END');
      done();
  }
  catch(err) {
    expect().assertFail();
  }
    });
  })
}
