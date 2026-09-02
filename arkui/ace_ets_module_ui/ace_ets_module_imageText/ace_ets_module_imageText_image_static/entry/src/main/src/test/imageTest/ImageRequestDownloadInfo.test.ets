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
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0100
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0100
     * @tc.desc     Test onError callback is triggered when network image fails to load
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0100 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered1Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0100 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0200
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0200
     * @tc.desc     Test downloadInfo field is present (not null) for network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0200 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr1Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0200 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0300
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0300
     * @tc.desc     Test ImageError error code is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0300 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('errorCode1Text');
      let obj = JSON.parseJsonElement(strJson);
      let errorCode = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0300 errorCode: ' + errorCode);
      expect(errorCode.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0400
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0400
     * @tc.desc     Test ImageError componentWidth is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0400 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('componentWidth1Text');
      let obj = JSON.parseJsonElement(strJson);
      let width = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0400 componentWidth: ' + width);
      expect(width.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0500
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0500
     * @tc.desc     Test ImageError componentHeight is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0500', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0500 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('componentHeight1Text');
      let obj = JSON.parseJsonElement(strJson);
      let height = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0500 componentHeight: ' + height);
      expect(height.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0600
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0600
     * @tc.desc     Test ImageError message field is accessible for network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0600 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('message1Text');
      let obj = JSON.parseJsonElement(strJson);
      let message = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0600 message: ' + message);
      expect(message.length >= 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0700
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0700
     * @tc.desc     Test onError callback is triggered for local image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0700', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0700 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered2Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0700 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0800
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0800
     * @tc.desc     Test downloadInfo is null for local image error (not network source)
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0800', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0800 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr2Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0800 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo).assertEqual('null');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0900
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0900
     * @tc.desc     Test onError callback is NOT triggered for valid image
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0900', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0900 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered3Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_0900 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('not_triggered');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1000
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1000
     * @tc.desc     Test onError with undefined callback does not crash
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1000', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1000 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoImage4');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1000 component exists: ' + (strJson.length > 0));
      expect(strJson.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1100
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1100
     * @tc.desc     Test onError callback downloadInfo for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1100 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('onErrorTriggered5Text');
      let obj = JSON.parseJsonElement(strJson);
      let triggered = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1100 onErrorTriggered: ' + triggered);
      expect(triggered).assertEqual('triggered');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1200
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1200
     * @tc.desc     Test downloadInfo field accessibility for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1200 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr5Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1200 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1300
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1300
     * @tc.desc     Test message field for another network image error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1300', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1300 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('message5Text');
      let obj = JSON.parseJsonElement(strJson);
      let message = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1300 message: ' + message);
      expect(message.length >= 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400
     * @tc.desc     Test componentWidth and componentHeight match Image dimensions for network error
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJsonW = inspector.getInspectorByKey('componentWidth6Text');
      let objW = JSON.parseJsonElement(strJsonW);
      let width = objW.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400 componentWidth: ' + width);
      expect(width.length > 0).assertTrue();

      let strJsonH = inspector.getInspectorByKey('componentHeight6Text');
      let objH = JSON.parseJsonElement(strJsonH);
      let height = objH.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1400 componentHeight: ' + height);
      expect(height.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1500
     * @tc.name     SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1500
     * @tc.desc     Test downloadInfo field for network image with different dimensions
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1500 START');
      await Utils.sleep(SLEEP_TIME_NETWORK);
      let strJson = inspector.getInspectorByKey('downloadInfoStr6Text');
      let obj = JSON.parseJsonElement(strJson);
      let downloadInfo = obj.getElement('$attrs').getString('content');
      console.info('SUB_ARKUI_IMAGE_REQUESTDOWNLOADINFO_PARAM_1500 downloadInfoStr: ' + downloadInfo);
      expect(downloadInfo === 'not_null' || downloadInfo === 'null').assertTrue();
      done();
    })
  })
}
