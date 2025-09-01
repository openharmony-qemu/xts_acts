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
import { describe, beforeEach, afterEach, it, expect, Level, beforeAll } from '../../../../hypium';
import router from '@ohos.router'
import { Driver, Component, ON } from '@ohos.UiTest'
import { BusinessError } from '@ohos.base'
import CommonFunc from '../../../ets/MainAbility/common/Common';
import {UtilsTest,startAbility} from '../Util.test';
import { UIContext, Router } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import inspector from '@ohos.arkui.inspector';

export default function CustomDialogMaskTest() {

  const SUITE: string = 'CustomDialogMask'
  const waitUiReadyMs: number = 500;

  describe('CustomDialogMaskTest', () => {

    // beforeEach(async (done: Function) => {
    //   let options: router.RouterOptions = {
    //     url: "MainAbility/pages/promptAction/CustomDialogMask",
    //   }
    //   try {
    //     router.clear();
    //     let pages: router.RouterState = router.getState();
    //     if (pages == null || !("CustomDialogMask" == pages.name)) {
    //       await router.pushUrl(options).then(() => {
    //         console.info(`${SUITE} router.pushUrl success`);
    //       }).catch((err: BusinessError) => {
    //         console.error(`${SUITE} router.pushUrl failed, code is ${err.code}, message is ${err.message}`);
    //       })
    //     }
    //   } catch (err) {
    //     console.error(`${SUITE} beforeEach error:` + JSON.stringify(err));
    //   }
    //   done()
    // });

    beforeAll(() => {
      console.info("CustomDialogMaskTest beforeEach start");
      await UtilsTest.msSleep(4000)
      await startAbility("com.arkui.ace.dialog.static", "EntryAbility")
      await UtilsTest.msSleep(4000)

    });

    beforeEach(async (): Promise<void> => {
      console.info("CustomDialogMaskTest beforeEach start");
      let options: router.RouterOptions = {
        url: "MainAbility/pages/promptAction/CustomDialogMask",
      }
      try {
        const routerInstance = AppStorage.get<Router>("router") as Router
        routerInstance.clear();
        let pages = routerInstance.getState();
        console.info("get CustomDialogMaskTest state pages:" + JSON.stringify(pages));
        if (!("CustomDialogMask" == pages.name)) {
          console.info("get CustomDialogMaskTest pages.name:" + JSON.stringify(pages.name));
          // await router 有已知问题，先注释,使用 routerInstance.pushUrl(options);
          // let result = await routerInstance.pushUrl(options);
          routerInstance.pushUrl(options);
          await CommonFunc.sleep(2000);
          // console.info("push CustomDialogMaskTest page result:" + JSON.stringify(result));
        }
      } catch (err) {
        console.error("push CustomDialogMaskTest page error:" + err);
      }
      console.info("CustomDialogMaskTest beforeEach end");
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0100
     *tc.name   CustomDialogController#maskColor not set
     *tc.desc   CustomDialogController#maskColor not set
     */
    it('ArkUI_CustomDialog_Mask_static_0100', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0100'
      console.info(`${SUITE} ${CASE} START`);

      await CommonFunc.sleep(2000);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // sendEventByKey('CustomDialogMask_Button_Open_1', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = inspector.getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      // sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0200
     *tc.name   CustomDialogController#maskColor set by Color
     *tc.desc   CustomDialogController#maskColor set by Color
     */
    it('ArkUI_CustomDialog_Mask_static_0200', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0200'
      console.info(`${SUITE} ${CASE} START`);
      await CommonFunc.sleep(1000);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // sendEventByKey('CustomDialogMask_Button_Open_2', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = inspector.getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      // sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0300
     *tc.name   CustomDialogController#maskColor set by string
     *tc.desc   CustomDialogController#maskColor set by string
     */
    it('ArkUI_CustomDialog_Mask_static_0300', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0300'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // sendEventByKey('CustomDialogMask_Button_Open_3', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = inspector.getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      // sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0400
     *tc.name   CustomDialogController#maskColor set by Resource
     *tc.desc   CustomDialogController#maskColor set by Resource
     */
    it('ArkUI_CustomDialog_Mask_static_0400', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0400'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // sendEventByKey('CustomDialogMask_Button_Open_4', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = inspector.getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      // sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });

    /*
     *tc.number ArkUI_CustomDialog_Mask_static_0500
     *tc.name   CustomDialogController#maskColor set by number
     *tc.desc   CustomDialogController#maskColor set by number
     */
    it('ArkUI_CustomDialog_Mask_static_0500', Level.LEVEL2,async (done: () => void): Promise<void> => {
      let CASE: string = 'ArkUI_CustomDialog_Mask_static_0500'
      console.info(`${SUITE} ${CASE} START`);
      let driver = Driver.create()
      await driver.delayMs(waitUiReadyMs)
      // sendEventByKey('CustomDialogMask_Button_Open_5', 10, "")
      await driver.delayMs(waitUiReadyMs)
      let strObj = inspector.getInspectorByKey('CustomDialogMask_Button_Close_1');
      expect(JSON.parseJsonElement(strObj).getElement('$attrs').getString('visibility')).assertEqual("Visibility.Visible");
      // sendEventByKey('CustomDialogMask_Button_Close_1', 10, "")
      console.info(`${SUITE} ${CASE} END`);
      await CommonFunc.sleep(1000);
      done()
    });
  })
}
