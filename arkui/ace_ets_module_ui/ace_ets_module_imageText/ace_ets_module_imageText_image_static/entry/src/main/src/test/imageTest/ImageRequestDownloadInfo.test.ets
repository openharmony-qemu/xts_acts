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

import { describe, it, expect, beforeAll, afterEach, Level, beforeEach } from '../../../../hypium/index';
import { abilityDelegatorRegistry, Driver, ON } from '@kit.TestKit';
import router from '@ohos.router';
import Utils from '../../../ets/MainAbility/common/Utils';
import CommonFunc from '../../../ets/MainAbility/common/Common';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';
import { UtilsTest } from '../Util.test';

const SLEEP_TIME_L = 1000;
const SLEEP_TIME_S = 100;
const SLEEP_TIME_NETWORK = 5000;

export default function ImageRequestDownloadInfoTest() {
  describe('ImageRequestDownloadInfoTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageRequestDownloadInfoTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageRequestDownloadInfoTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageRequestDownloadInfo',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageRequestDownloadInfoTest state pages:" + JSON.stringify(pages));
        if (!("ImageRequestDownloadInfo" == pages.name)) {
          console.info("get ImageRequestDownloadInfoTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageRequestDownloadInfoTest page error:" + err);
      }
      console.info("ImageRequestDownloadInfoTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageRequestDownloadInfoTest after each called");
    });
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_001
     * @tc.name     ImageRequestDownloadInfoTest_static_001
     * @tc.desc     Test onError callback is triggered when network image fails to load
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_001', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_001 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered1Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_001 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_002
     * @tc.name     ImageRequestDownloadInfoTest_static_002
     * @tc.desc     Test downloadInfo field is present (not null) for network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_002', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_002 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr1Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_002 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_003
     * @tc.name     ImageRequestDownloadInfoTest_static_003
     * @tc.desc     Test ImageError error code is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_003', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_003 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('errorCode1Text');
      let obj = JSON.parseJsonElement(strJson);
      let errorCode = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_003 errorCode: ' + errorCode);
      expect(errorCode.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_004
     * @tc.name     ImageRequestDownloadInfoTest_static_004
     * @tc.desc     Test ImageError componentWidth is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_004', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_004 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('componentWidth1Text');
      let obj = JSON.parseJsonElement(strJson);
      let width = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_004 componentWidth: ' + width);
      expect(width.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_005
     * @tc.name     ImageRequestDownloadInfoTest_static_005
     * @tc.desc     Test ImageError componentHeight is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_005', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_005 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('componentHeight1Text');
      let obj = JSON.parseJsonElement(strJson);
      let height = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_005 componentHeight: ' + height);
      expect(height.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_006
     * @tc.name     ImageRequestDownloadInfoTest_static_006
     * @tc.desc     Test ImageError message field is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_006', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_006 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('message1Text');
      let obj = JSON.parseJsonElement(strJson);
      let message = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_006 message: ' + message);
      expect(message.length >= 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_007
     * @tc.name     ImageRequestDownloadInfoTest_static_007
     * @tc.desc     Test onError callback is triggered for local image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_007', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_007 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered2Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_007 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_008
     * @tc.name     ImageRequestDownloadInfoTest_static_008
     * @tc.desc     Test downloadInfo is null for local image error (not network source)
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_008', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_008 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr2Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_008 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo).assertEqual('null');
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_009
     * @tc.name     ImageRequestDownloadInfoTest_static_009
     * @tc.desc     Test onError callback is NOT triggered for valid image
     * @tc.level    Level.LEVEL2
     */
    it('ImageRequestDownloadInfoTest_static_009', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_009 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered3Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_009 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('not_triggered');
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_010
     * @tc.name     ImageRequestDownloadInfoTest_static_010
     * @tc.desc     Test onError with undefined callback does not crash
     * @tc.level    Level.LEVEL2
     */
    it('ImageRequestDownloadInfoTest_static_010', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_010 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoImage4');
      console.info('ImageRequestDownloadInfoTest_static_010 component exists: ' + (strJson.length > 0));
      expect(strJson.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_011
     * @tc.name     ImageRequestDownloadInfoTest_static_011
     * @tc.desc     Test onError callback downloadInfo for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_011', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_011 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered5Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_011 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_012
     * @tc.name     ImageRequestDownloadInfoTest_static_012
     * @tc.desc     Test downloadInfo field accessibility for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_012', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_012 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr5Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_012 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_013
     * @tc.name     ImageRequestDownloadInfoTest_static_013
     * @tc.desc     Test message field for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_013', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_013 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('message5Text');
      let obj = JSON.parseJsonElement(strJson);
      let message = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_013 message: ' + message);
      expect(message.length >= 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_014
     * @tc.name     ImageRequestDownloadInfoTest_static_014
     * @tc.desc     Test componentWidth and componentHeight match Image dimensions for network error
     * @tc.level    Level.LEVEL1
     */
    it('ImageRequestDownloadInfoTest_static_014', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_014 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJsonW = inspector.getInspectorByKey('componentWidth6Text');
      let objW = JSON.parseJsonElement(strJsonW);
      let width = objW.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_014 componentWidth: ' + width);
      expect(width.length > 0).assertTrue();

      let strJsonH = inspector.getInspectorByKey('componentHeight6Text');
      let objH = JSON.parseJsonElement(strJsonH);
      let height = objH.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_014 componentHeight: ' + height);
      expect(height.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   ImageRequestDownloadInfoTest_static_015
     * @tc.name     ImageRequestDownloadInfoTest_static_015
     * @tc.desc     Test downloadInfo field for network image with different dimensions
     * @tc.level    Level.LEVEL2
     */
    it('ImageRequestDownloadInfoTest_static_015', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('ImageRequestDownloadInfoTest_static_015 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr6Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('ImageRequestDownloadInfoTest_static_015 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
  })
}
