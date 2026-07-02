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
        emitKey = 'emitEnableFullscreenVideoOverlay001';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay001', true, 112801, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
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
        emitKey = 'emitEnableFullscreenVideoOverlay002';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay002', true, 112802, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay003
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0300
     * @tc.desc   显式设置enableFullscreenVideoOverlay(false)后，视频可正常进入全屏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay003', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitEnableFullscreenVideoOverlay003';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay003', true, 112803, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
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
        emitKey = 'emitEnableFullscreenVideoOverlay004';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay004', true, 112804, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
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
        emitKey = 'emitEnableFullscreenVideoOverlay005';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay005', true, 112805, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay006
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0600
     * @tc.desc   overlay关闭时，通过JS exitFullScreen退出全屏触发onFullScreenExit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay006', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitEnableFullscreenVideoOverlay006';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay006', true, 112806, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
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
        emitKey = 'emitEnableFullscreenVideoOverlay007';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay007', true, 112807, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay008
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_0800
     * @tc.desc   overlay开启时，点击HTML页面全屏按钮触发视频全屏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('testEnableFullscreenVideoOverlay008', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: Function) => {
        emitKey = 'emitEnableFullscreenVideoOverlay008';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay008', true, 112808, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
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
        emitKey = 'emitEnableFullscreenVideoOverlay009';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay009', true, 112809, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
      });

    /**
     * @tc.name   testEnableFullscreenVideoOverlay010
     * @tc.number SUB_WEB_ENABLEFULLSCREENVIDEOOVERLAY_1000
     * @tc.desc   overlay开启状态下刷新页面后视频仍可进入全屏
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('testEnableFullscreenVideoOverlay010', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
      async (done: Function) => {
        emitKey = 'emitEnableFullscreenVideoOverlay010';
        Utils.emitEvent(emitKey, EVENT_ID_SET_EMIT_KEY);
        Utils.registerEvent('testEnableFullscreenVideoOverlay010', true, 112810, done);
        await Utils.waitAndClickComponent(driver, 'webViewContEnableFullscreenVideoOverlay');
      });
  });
}
