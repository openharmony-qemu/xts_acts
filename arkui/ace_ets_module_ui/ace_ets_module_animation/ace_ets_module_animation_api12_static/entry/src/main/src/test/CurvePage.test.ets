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

import { afterAll, afterEach, beforeEach, describe, expect, it, Level } from '../../../hypium/index';
import router from '@ohos.router';
import {
  Component,
  DisplayRotation,
  Driver,
  MatchPattern,
  ON,
  PointerMatrix,
  ResizeDirection,
  WindowMode
} from '@ohos.UiTest';
import CommonFunc from '../../ets/MainAbility/common/Common';
import { Callback, MessageManager } from '../../ets/MainAbility/common/MessageManager';
import { Router, UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function CurvePage() {
  describe('CurvePage', () => {

    beforeEach(async (): Promise<void> => {
      console.info("CurvePage beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/CurvePage",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get setExpectedFrameRateRangeTest state pages:" + JSON.stringify(pages));
        if (!("CurvePage" == pages.name)) {
          console.info("get setExpectedFrameRateRangeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
        }
      } catch (err) {
        console.error("push setExpectedFrameRateRangeTest page error:" + err);
      }
      console.info("setExpectedFrameRateRangeTest beforeEach end");
    });


    afterEach(async (): Promise<void> => {
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.info("CurvePage after each called");
    });




/**
     * @tc.number   CurvePage_Static_0100
     * @tc.name     CurvePage_Static_0100
     * @tc.desc     CurvePage_Static_0100
     * @tc.level    Level.LEVEL0
     */
it('CurvePage_Static_0100', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CurvePage_0100 START');
      let driver = Driver.create();
      try {
        await driver.delayMs(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.log('before btn1 click')
      let btn1: Component | undefined;
      try {
        btn1 = await driver.findComponent(ON.id('easeInOutId'));
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      try {
        await driver.delayMs(3000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.log('btn1 is: ' + JSON.stringify(btn1))
      try {
        await (btn1?.click() as Promise<void>);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.info('[CurvePage_0100] btn1 click');
      try {
        await CommonFunc.sleep(5000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let cubeSize: Int = AppStorage.get<Int>('cube_size') as Int
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.log('CurvePage_0100 on cubeSize value : ' + cubeSize)
      expect(cubeSize).assertEqual(30);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0100] END');
      done();
    });



/**
     * @tc.number   CurvePage_Static_0200
     * @tc.name     CurvePage_Static_0200
     * @tc.desc     CurvePage_Static_0200
     * @tc.level    Level.LEVEL0
     */
it('CurvePage_Static_0200', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CurvePage_0200 START');
      let driver = Driver.create();
      try {
        await driver.delayMs(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let btn2: Component | undefined;
      try {
        btn2 = await driver.findComponent(ON.id('fastOutSlowIn'));
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      try {
        await (btn2?.click() as Promise<void>);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.info('[CurvePage_0200] btn2 click');
      try {
        await driver.delayMs(3000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let cubeSize1 = AppStorage.get<Int>('cube_size')
      console.log('CurvePage_0200 on cubeSize1 value : ' + cubeSize1)
      expect(cubeSize1).assertEqual(50);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0200] END');
      done();
    });



/**
     * @tc.number   CurvePage_Static_0300
     * @tc.name     CurvePage_Static_0300
     * @tc.desc     CurvePage_Static_0300
     * @tc.level    Level.LEVEL0
     */
it('CurvePage_Static_0300', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CurvePage_0300 START');
      let driver = Driver.create();
      try {
        await driver.delayMs(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let btn3: Component | undefined;
      try {
        btn3 = await driver.findComponent(ON.id('springMotionId'));
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      try {
        await (btn3?.click() as Promise<void>);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.info('[CurvePage_0300] btn3 click');
      try {
        await driver.delayMs(3000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let cubeSize2 = AppStorage.get<Int>('cube_size')
      console.log('CurvePage_0300 on cubeSize2 value : ' + cubeSize2)
      expect(cubeSize2).assertEqual(20);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0300] END');
      done();
    });



/**
     * @tc.number   CurvePage_Static_0400
     * @tc.name     CurvePage_Static_0400
     * @tc.desc     CurvePage_Static_0400
     * @tc.level    Level.LEVEL0
     */
it('CurvePage_Static_0400', Level.LEVEL0, async (done: () => void): Promise<void> => {

      console.info('CurvePage_0400 START');
      let driver = Driver.create();
      try {
        await driver.delayMs(1000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let btn4: Component | undefined;
      try {
        btn4 = await driver.findComponent(ON.id('responsiveSpringId'));
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      try {
        await (btn4?.click() as Promise<void>);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }
      console.info('[CurvePage_0400] btn4 click');
      try {
        await driver.delayMs(3000);
      } catch (err) {
        console.info('CurvePage err: ' + JSON.stringify(err));
      }

      let cubeSize3 = AppStorage.get<Int>('cube_size')
      console.log('CurvePage_0400 on cubeSize3 value : ' + cubeSize3)
      expect(cubeSize3).assertEqual(60);
      AppStorage.delete('cube_size');

      console.log('[CurvePage_0400] END');
      done();
    });

  })
}
