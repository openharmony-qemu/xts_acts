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


export default function CustomDialogMaskTest() {

  const SUITE: string = 'CustomDialogMask'
  const waitUiReadyMs: Int = 500;

  describe('CustomDialogMaskTest', () => {
    beforeEach(async (): Promise<void> => {
      let options: router.RouterOptions = {
        url: "MainAbility/pages/promptAction/CustomDialogMask",
      }
      try {


        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages: router.RouterState = routerInstance.getState();
        console.info("get CustomDialogMask state pages: " + JSON.stringify(pages));
        if (!("CustomDialogMask" == pages.name)) {
          console.info("get CustomDialogMask state pages.name: " + JSON.stringify(pages.name));
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomDialogMask success: " + JSON.stringify(result));
        }
      } catch (err) {
        console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
      }

    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0100
     *tc.name   CustomDialogController#maskColor not set
     *tc.desc   CustomDialogController#maskColor not set
     */

    
    
/**
     * @tc.number   ArkUI_CustomDialog_Mask_static_0100
     * @tc.name     ArkUI_CustomDialog_Mask_static_0100
     * @tc.desc     ArkUI_CustomDialog_Mask_static_0100
     * @tc.level    Level.LEVEL2
     */
it('ArkUI_CustomDialog_Mask_static_0100', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0100'
      console.info(`${SUITE} ${CASE} START`);

      try {
        await CommonFunc.sleep(2000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('CustomDialogMask_Button_Open_1', 10, "")
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let strObj: string = inspector.getInspectorByKey('CustomDialogMask' + '_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString("visibility"))
        .assertEqual("Visibility.Visible");
      inspector.sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_static_Mask0200
     *tc.name   CustomDialogController#maskColor set by Color
     *tc.desc   CustomDialogController#maskColor set by Color
     */

    
    
/**
     * @tc.number   ArkUI_CustomDialog_static_Mask0200
     * @tc.name     ArkUI_CustomDialog_static_Mask0200
     * @tc.desc     ArkUI_CustomDialog_static_Mask0200
     * @tc.level    Level.LEVEL2
     */
it('ArkUI_CustomDialog_static_Mask0200', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_static_Mask0200'
      console.info(`${SUITE} ${CASE} START`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('CustomDialogMask_Button_Open_2', 10, "")
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let strObj: string = inspector.getInspectorByKey('CustomDialogMask' + '_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString("visibility"))
        .assertEqual("Visibility.Visible");
      inspector.sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_static_Mask0300
     *tc.name   CustomDialogController#maskColor set by string
     *tc.desc   CustomDialogController#maskColor set by string
     */

    
    
/**
     * @tc.number   ArkUI_CustomDialog_static_Mask0300
     * @tc.name     ArkUI_CustomDialog_static_Mask0300
     * @tc.desc     ArkUI_CustomDialog_static_Mask0300
     * @tc.level    Level.LEVEL2
     */
it('ArkUI_CustomDialog_static_Mask0300', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_static_Mask0300'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('CustomDialogMask_Button_Open_3', 10, "")
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let strObj: string = inspector.getInspectorByKey('CustomDialogMask' + '_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString("visibility"))
        .assertEqual("Visibility.Visible");
      inspector.sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_static_Mask0400
     *tc.name   CustomDialogController#maskColor set by Resource
     *tc.desc   CustomDialogController#maskColor set by Resource
     */

    
    
/**
     * @tc.number   ArkUI_CustomDialog_static_Mask0400
     * @tc.name     ArkUI_CustomDialog_static_Mask0400
     * @tc.desc     ArkUI_CustomDialog_static_Mask0400
     * @tc.level    Level.LEVEL2
     */
it('ArkUI_CustomDialog_static_Mask0400', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_static_Mask0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('CustomDialogMask_Button_Open_4', 10, "")
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let strObj: string = inspector.getInspectorByKey('CustomDialogMask' + '_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString("visibility"))
        .assertEqual("Visibility.Visible");
      inspector.sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_static_Mask0500
     *tc.name   CustomDialogController#maskColor set by number
     *tc.desc   CustomDialogController#maskColor set by number
     */

    
    
/**
     * @tc.number   ArkUI_CustomDialog_static_Mask0500
     * @tc.name     ArkUI_CustomDialog_static_Mask0500
     * @tc.desc     ArkUI_CustomDialog_static_Mask0500
     * @tc.level    Level.LEVEL2
     */
it('ArkUI_CustomDialog_static_Mask0500', Level.LEVEL2, async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_static_Mask0500'
      console.info(`${SUITE} ${CASE} START`);
      let driver: Driver = Driver.create()
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      inspector.sendEventByKey('CustomDialogMask_Button_Open_5', 10, "")
      try {
        await driver.delayMs(waitUiReadyMs)
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      let strObj: string = inspector.getInspectorByKey('CustomDialogMask' + '_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString("visibility"))
        .assertEqual("Visibility.Visible");
      inspector.sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      try {
        await CommonFunc.sleep(1000);
      } catch (err) {
        console.info('CustomDialogMaskTest await err: ' + JSON.stringify(err));
      }
      done()
    });
  })
}
