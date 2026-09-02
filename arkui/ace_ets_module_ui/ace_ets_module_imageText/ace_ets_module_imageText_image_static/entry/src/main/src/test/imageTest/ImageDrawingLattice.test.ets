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

export default function ImageDrawingLatticeTest() {
  describe('ImageDrawingLatticeTest', () => {
    beforeAll(async (): Promise<void> => {
      console.info("ImageDrawingLatticeTest beforeAll start");
      await UtilsTest.startAbility("com.arkui.ace.imageText.image.static", "EntryAbility")
    });
    beforeEach(async (): Promise<void> => {
      console.info("ImageDrawingLatticeTest beforeEach start");
      let options: router.RouterOptions = {
        url: 'MainAbility/pages/image/ImageDrawingLattice',
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get ImageDrawingLatticeTest state pages:" + JSON.stringify(pages));
        if (!("ImageDrawingLattice" == pages.name)) {
          console.info("get ImageDrawingLatticeTest pages.name:" + JSON.stringify(pages.name));
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(SLEEP_TIME_L);
        }
      } catch (err) {
        console.error("push ImageDrawingLatticeTest page error:" + err);
      }
      console.info("ImageDrawingLatticeTest beforeEach end");
    });
    afterEach(async () => {
      await Utils.sleep(SLEEP_TIME_L);
      console.info("ImageDrawingLatticeTest after each called");
    });
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0100
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0100
     * @tc.desc     Test resizable with valid DrawingLattice (normal xDivs, yDivs, fXCount, fYCount)
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0100', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0100 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage1');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0100 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0200
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0200
     * @tc.desc     Test resizable with different DrawingLattice parameters (different xDivs/yDivs)
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0200', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0200 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage2');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0200 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0300
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0300
     * @tc.desc     Test resizable with undefined (no stretch)
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0300 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage3');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0300 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue).assertEqual('');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0400
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0400
     * @tc.desc     Test resizable with DrawingLattice via AttributeModifier
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0400', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0400 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage4');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0400 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0500
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0500
     * @tc.desc     Test resizable with undefined via AttributeModifier
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0500 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage5');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0500 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue).assertEqual('');
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0600
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0600
     * @tc.desc     Test resizable with both slice and DrawingLattice set
     * @tc.level    Level.LEVEL1
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0600', Level.LEVEL1, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0600 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage6');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0600 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0700
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0700
     * @tc.desc     Test resizable with DrawingLattice using minimal values (single division)
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0700', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0700 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage7');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0700 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue.length > 0).assertTrue();
      done();
    })
    /**
     * @tc.number   SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0800
     * @tc.name     SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0800
     * @tc.desc     Test Image without resizable property (default, no stretch)
     * @tc.level    Level.LEVEL2
     */
    it('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0800', Level.LEVEL2, async (done: () => void): Promise<void> => {
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0800 START');
      await Utils.sleep(SLEEP_TIME_S);
      let strJson = inspector.getInspectorByKey('drawingLatticeImage8');
      let obj = JSON.parseJsonElement(strJson);
      console.info('SUB_ARKUI_IMAGE_DRAWINGLATTICE_PARAM_0800 resizable is: ' + obj.getElement('$attrs').getString('resizable'));
      expect(strJson.length > 0).assertTrue();
      let resizableValue = obj.getElement('$attrs').getString('resizable');
      expect(resizableValue).assertEqual('');
      done();
    })
  })
}
