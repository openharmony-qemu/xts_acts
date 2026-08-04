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
import { describe, beforeEach, afterEach, it, beforeAll, TestType, Size, Level } from '@ohos/hypium';
import Utils from './Utils';
import router from '@ohos.router';
import { accessibility, config } from '@kit.AccessibilityKit';
import { Driver, ON } from '@kit.TestKit';

const EVENT_ID_SET_EMIT_KEY = 112800;
const driver = Driver.create();
const CAPACITY: accessibility.Capability[] = ['retrieve', 'gesture'];
const BUNDLE_NAME = 'com.example.myaccessibilityapp/AccessibilityExtAbility';

let emitKey = '';

async function runCase(tcName: string, emitKeyValue: string, eventId: number, done: Function): Promise<void> {
  emitKey = emitKeyValue;
  let isReturn = 0;
  Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
  Utils.registerEvent(tcName, true, eventId, () => {
    isReturn = 1;
  });
  await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
  await Utils.waitForExist(() => isReturn, tcName + '_returnCheck', 1, 1000);
  done();
}

export default function webViewContEnableFullscreenVideoOverlay() {
  describe('ActsAceWebViewContEnableFullscreenVideoOverlayTest', () => {
    beforeAll(async (done: Function) => {
      let options: router.RouterOptions = {
        url: 'testability/pages/webViewContEnableFullscreenVideoOverlay',
      };
      try {
        router.clear();
        let pages = router.getState();
        console.info('get webViewContEnableFullscreenVideoOverlay state success ' + JSON.stringify(pages));
        if (!('webViewContEnableFullscreenVideoOverlay' == pages.name)) {
          console.info('get webViewContEnableFullscreenVideoOverlay state success ' + JSON.stringify(pages.name));
          let result = await router.push(options);
          console.info('push webViewContEnableFullscreenVideoOverlay page success ' + JSON.stringify(result));
        }
      } catch (err) {
        console.error('push webViewContEnableFullscreenVideoOverlay page error: ' + err);
      }
      await driver.waitForComponent(ON.id('webViewContEnableFullscreenVideoOverlay'), 10000);
      console.log('waitForComponent webViewContEnableFullscreenVideoOverlay');
      done();
    });

    beforeEach(async (done: Function) => {
      config.enableAbility(BUNDLE_NAME, CAPACITY).then(() => {
        console.info('enable success');
      }).catch((err: object) => {
        console.error('failed to enable, ' + err);
      });
      console.info('webViewContEnableFullscreenVideoOverlay beforeEach start');
      done();
    });

    afterEach(async (done: Function) => {
      await Utils.sleep(1000);
      done();
    });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay001
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0100
     * @tc.desc   默认值false时，点击HTML全屏按钮进入全屏，验证onFullScreenEnter回调
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableFullscreenVideoOverlay001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay001', 'emitEnableFullscreenVideoOverlay001', 112801, done);
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay002
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0200
     * @tc.desc   enableFullscreenVideoOverlay(true)时，视频全屏触发onFullScreenEnter并携带有效视频尺寸
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testEnableFullscreenVideoOverlay002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay002', 'emitEnableFullscreenVideoOverlay002', 112802, done);
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay004
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0400
     * @tc.desc   动态切换true后改回false，再进入全屏验证行为正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay004', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay004', 'emitEnableFullscreenVideoOverlay004', 112804, done);
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay005
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0500
     * @tc.desc   overlay开启时，通过FullScreenExitHandler退出全屏触发onFullScreenExit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay005', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay005', 'emitEnableFullscreenVideoOverlay005', 112805, done);
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay007
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0700
     * @tc.desc   enableFullscreenVideoOverlay与javaScriptAccess等属性链式配置后视频全屏正常
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay007', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay007', 'emitEnableFullscreenVideoOverlay007', 112807, done);
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay009
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0900
     * @tc.desc   overlay开启时，页面上第二个video元素进入全屏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEnableFullscreenVideoOverlay009', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        await runCase('testEnableFullscreenVideoOverlay009', 'emitEnableFullscreenVideoOverlay009', 112809, done);
      });
  });
}
