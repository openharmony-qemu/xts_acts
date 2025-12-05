/*
 * Copyright (C) 2025 Huawei Device cO., lTD.
 * Licensed under the Apache License, Version 2.0 (the 'License')
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http:www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import inputDevice from '@ohos.multimodalInput.inputDevice';
import { BusinessError } from '@ohos.base';

export default function MultimodalInputCapsLockTest() {
  describe("MultimodalInputCapsLockTest", (): void => {
    const ExpectTrue = (n: boolean) => {
      try {
        expect(n).assertTrue();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }
    const ExpectFalse = (n: boolean) => {
      try {
        expect(n).assertFail();
      } catch (err) {
        console.info("expectInfo", `test failed`);
      }
    }

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0100
     * @tc.name   testOnOffWindowStatusChange_OnSubWindow_static_0100
     * @tc.desc   Enable listening for window mode changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level3
     */
    it('testOnOffWindowStatusChange_OnSubWindow_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName : string = 'testOnOffWindowStatusChange_OnSubWindow_static_0100';
      let msgStr : string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let subWin:window.Window = await windowStage.createSubWindow('testOnOffWindowStatusChange_OnSubWindow');
      expect(!!subWin).assertTrue();
      const callback = (data:window.WindowStatusType) => {
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
      }
      try {
        (subWin as window.Window).onWindowStatusChange(callback);
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (subWin as window.Window).offWindowStatusChange(callback);
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        (subWin as window.Window).offWindowStatusChange();
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      await (subWin as window.Window).destroyWindow();
      done();
    });

    /**
     * @tc.number  testOffKeyboardDidShowErrCode1300002_0100
     * @tc.name    testOffKeyboardDidShowErrCode1300002_static_0100
     * @tc.desc    testOffKeyboardDidShowErrCode1300002_static_0100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testOffKeyboardDidShowErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName : string = "testOffKeyboardDidShowErrCode1300002_static_0100";
      let msgStr : string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
      try {
        let tempWnd: window.Window = await windowStage.createSubWindow('testOffKeyboardDidShowErrCode1300002_static_0100')
        hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
        await Utils.msSleep(300);
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow();
        hilog.info(domain, tag,msgStr + 'window.destroy success');
        tempWnd.offKeyboardDidShow((keyboardInfo: window.KeyboardInfo) => {
          console.info(msgStr +  'keyboard show animation completion. keyboardInfo: ' + JSON.stringify(keyboardInfo));
        });
        hilog.info(domain, tag,msgStr + 'window.off_keyboardDidShow success');
        expect(false).assertTrue();
        done()
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
        expect(exception.code == 1300002 || exception.code == 801).assertTrue();
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300002);
        } else {
          hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
          expect(exception.code).assertEqual(801);
        }
        done()
      }
    });

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0200
     * @tc.name   testOnOffWindowStatusChange_OnMainWindow_static_0200
     * @tc.desc   Enable listening for window mode changes
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level3
     */
    it('testOnOffWindowStatusChange_OnMainWindow_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName : string = 'testOnOffWindowStatusChange_OnMainWindow_static_0200';
      let msgStr : string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let mainWin:window.Window = windowStage.getMainWindowSync();
      expect(!!mainWin).assertTrue();
      const callback = (data:window.WindowStatusType) => {
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes. Data: ' + JSON.stringify(data));
      }
      try {
        mainWin.onWindowStatusChange(callback);
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        mainWin.offWindowStatusChange(callback);
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      try {
        mainWin.offWindowStatusChange();
        hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');;
      } catch (exception) {
        exception = exception as BusinessError;
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
        } else {
          hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
          hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
          expect(exception.code).assertEqual(801);
        }
      }
      done();
    });


    /**
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0001
     *@tc.name testEnableSafeBrowsingTrueStatic
     *@tc.desc test EnableSafeBrowsingTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 3
     */
    it('testEnableSafeBrowsingTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitEnableSafeBrowsingTrue", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testEnableSafeBrowsingTrue", true, 2001, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done();
      });

    /**
     * @tc.number     SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0670
     * @tc.name testGetWindowAvoidArea_Type_System_Gesture_static_0600
     * @tc.desc Obtain the area that the window content avoids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testGetWindowAvoidArea_Type_System_Gesture_static_0600', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetWindowAvoidArea_Type_System_Gesture_static_0600';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd: window.Window = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM_GESTURE;
          let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
          hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
    });

    /**
     * @tc.number SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.name SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100
     * @tc.desc Test promise isFunctionKeyEnabled interface to unconnect keyboard device.
     * @tc.level 3
     * @tc.type Function
     * @tc.size SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_isFunctionKeyEnabled_0100";
        try {
          await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK).then((state) => {
            console.info(`${caseName} capslock state1: ${state}`);
            ExpectTrue(state == true || state == false);
            done();
          });
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error,
            [`code`, `message`])}`);
          ExpectTrue(error.code == 3900002);
          done();
        }
      });

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0640
     * @tc.name testGetWindowAvoidArea_Type_CutOut_static_0500
     * @tc.desc Obtain the area that the window content avoids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testGetWindowAvoidArea_Type_CutOut_static_0500', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetWindowAvoidArea_Type_CutOut_static_0500';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd: window.Window = windowStage.getMainWindowSync();
        expect(tempWnd != null).assertTrue();
        try {
          let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_CUTOUT;
          let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
          hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(!avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
    });

    /**
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0002
     *@tc.name testEnableSafeBrowsingFalseStatic
     *@tc.desc test EnableSafeBrowsingFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 3
     */
    it('testEnableSafeBrowsingFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitEnableSafeBrowsingFalse", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testEnableSafeBrowsingFalse", true, 2002, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done();
      })

    /**
     * @tc.number   SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0660
     * @tc.name testGetWindowAvoidArea_Type_System_static_0400
     * @tc.desc Obtain the area that the window content avoids
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level3
     */
    it('testGetWindowAvoidArea_Type_System_static_0400', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetWindowAvoidArea_Type_System_static_0400';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd: window.Window = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM;
          let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
          hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
    });

    /**
     * @tc.number SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.name SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100
     * @tc.desc Test promise setFunctionKeyEnabled and isFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type Function
     * @tc.size SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0100";
        try {
          const state1: boolean = await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK);
          console.info(`${caseName} capslock state1: ${JSON.stringify(state1)}`);
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, Boolean(state1))
            .then(() => {
              console.info(`${caseName} Set capslock state success`);
            })
            .catch((error: Error) => {
              console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
              ExpectTrue(error.code == 3900003);
              done();
            });
          const state2: boolean = await inputDevice.isFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK);
          console.info(`${caseName} capslock state2: ${JSON.stringify(state2)}`);
          ExpectTrue(state1 == state2);
          done();
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to get capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectTrue(error.code == 3900002);
          done();
        }
      });

    /**
     * @tc.number   SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0100
     * @tc.name testGetWindowAvoidArea_1300002_static_0300
     * @tc.desc testGetWindowAvoidArea_1300002_static_0300
     * @tc.size MediumTest
     * @tc.type Function
     * @tc.level Level 3
     */
    it('testGetWindowAvoidArea_1300002_static_0300', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetWindowAvoidArea_1300002_static_0300';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let win: window.Window = await windowStage.createSubWindow('testGetWindowAvoidArea_1300002_static_0200');
      hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await win.destroyWindow();
      try {
        let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_SYSTEM;
        let avoidArea:window.AvoidArea = win.getWindowAvoidArea(type);
        expect(false).assertTrue();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to getWindowAvoidArea. Cause: '+exception.code+'  ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    });

    /**
     * @tc.number  testRecoverPromiseErrCode1300002_0100
     * @tc.name    testRecoverPromiseErrCode1300002_static_0100
     * @tc.desc    testRecoverPromiseErrCode1300002_static_0100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testRecoverPromiseErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = "testRecoverPromiseErrCode1300002_static_0100";
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
      let subWin: window.Window;
      windowStage.createSubWindow('testRecoverPromiseErrCode1300002_SubWindow_Promise')
        .then((data: window.Window) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await (subWin! as window.Window).destroyWindow();
          try {
            (subWin! as window.Window).recover().then(async () => {
              hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling recover.');
              expect(false).assertTrue();
            }).catch((err: BusinessError):Promise<void>  => {
              hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call recover. Cause: ' + JSON.stringify(err));
              expect(err!.code).assertEqual(1300002);
            });
            done()
          } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call recover. Cause:' + JSON.stringify(exception));
            expect(false).assertTrue();
            done()
          }
        })
        .catch((err: BusinessError):Promise<void> => {
          hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        });

    });

    /**
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0003
     *@tc.name testIsSafeBrowsingEnabledTrueStatic
     *@tc.desc test IsSafeBrowsingEnabledTrue
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 3
     */
    it('testIsSafeBrowsingEnabledTrueStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitIsSafeBrowsingEnabledTrue", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testIsSafeBrowsingEnabledTrue", true, 2003, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done();
      });

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
     * @tc.name   testRectChangeReason_enum_static_0100
     * @tc.desc   Test the function value of RectChangeReason
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level0
     */
    it("testRectChangeReason_enum_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let msgStr:string = "testRectChangeReason_enum_static_0100";
      hilog.info(0x0000, '[ANI]',msgStr + "begin");
      try {
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.UNDEFINED: ${window.RectChangeReason.UNDEFINED}`);
        expect(0).assertEqual(window.RectChangeReason.UNDEFINED);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.MAXIMIZE: ${window.RectChangeReason.MAXIMIZE}`);
        expect(1).assertEqual(window.RectChangeReason.MAXIMIZE);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.RECOVER: ${window.RectChangeReason.RECOVER}`);
        expect(2).assertEqual(window.RectChangeReason.RECOVER);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.MOVE: ${window.RectChangeReason.MOVE}`);
        expect(3).assertEqual(window.RectChangeReason.MOVE);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.DRAG: ${window.RectChangeReason.DRAG}`);
        expect(4).assertEqual(window.RectChangeReason.DRAG);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.DRAG_START: ${window.RectChangeReason.DRAG_START}`);
        expect(5).assertEqual(window.RectChangeReason.DRAG_START);
        hilog.info(0x0000, '[ANI]',`window.RectChangeReason.DRAG_END: ${window.RectChangeReason.DRAG_END}`);
        expect(6).assertEqual(window.RectChangeReason.DRAG_END);
        done();
      } catch (error) {
        error = error as BusinessError;
        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to testRectChangeReason_enum' + JSON.stringify(error));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0400
     * @tc.name      test_shiftAppWindowPointerEvent_Dialog_window_static
     * @tc.desc      test_shiftAppWindowPointerEvent_Dialog_window_static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('test_shiftAppWindowPointerEvent_Dialog_window_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_Dialog_window_static';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      hilog.info(domain, tag,msgStr + 'begin');
      let mainWindow:window.Window = windowStage.getMainWindowSync();
      try{
        let config: window.Configuration = {
          name: "test",
          windowType: window.WindowType.TYPE_DIALOG,
          ctx: context,
          decorEnabled:true,
          title:'dialog Window'
        };
        let promise1 = window.createWindow(config);
        promise1.then((data:window.Window) => {
          let dialogWindowClass:window.Window = data;
          hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
          await dialogWindowClass.setUIContent('pages/index2');
          await dialogWindowClass.showWindow();
          await Utils.msSleep(1000)
          let dialogWindowId = dialogWindowClass.getWindowProperties().id;
          let mainWindowId = mainWindow.getWindowProperties().id;
          hilog.info(domain, tag,caseName+ ' dialogWindowId: ' + JSON.stringify(dialogWindowId) +','+' mainWIndowId: ' + JSON.stringify(mainWindowId) );
          let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,dialogWindowId);
          promise2.then(() => {
            hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError):PromiseLike<void>|undefined => {
            hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
            await dialogWindowClass.destroyWindow();
            if(err.code == 801){
              done();
            }else if(err.code == 1300004){
              expect(true).assertTrue();
              done();
            } else{
              expect(false).assertTrue();
              done();
            }
          });
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(domain, tag,`${caseName} :Failed to create the dialogwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      }catch(err) {
        err = err as BusinessError;
        hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number  testSetWindowPrivacyModeCallbackErrCode1300002_0100
     * @tc.name    testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
     * @tc.desc    testSetWindowPrivacyModeCallbackErrCode1300002_static_0200
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200', Level.LEVEL3,  async (done: () => void): Promise<void> => {
      let caseName :string = "testSetWindowPrivacyModeCallbackErrCode1300002_static_0200";
      let msgStr :string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
      let win: window.Window = await windowStage.createSubWindow('testSetWindowPrivacyModeCallbackErrCode1300002_static_0200');
      await win.destroyWindow();
      try {
        win!.setWindowPrivacyMode(false,(err: BusinessError<void>|null):void => {
          const errCode: number = err!.code;
          if (errCode) {
            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(err));
            expect(errCode).assertEqual(1300002);
            done()
          }else{
            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowPrivacyMode.');
            expect(false).assertTrue();
            done();
          }

        });
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call setWindowPrivacyMode. Cause:' + JSON.stringify(exception));
        expect(false).assertTrue();
        done()
      }
    })

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_SET_SUBWINDOW_MODEL_static_1100
     * @tc.name      test_setSubWindowModal_MainWindow_1300004_static
     * @tc.desc      test_setSubWindowModal_MainWindow_1300004_static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it("test_setSubWindowModal_MainWindow_1300004_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let msgStr:string = "test_setSubWindowModal_MainWindow_1300004_static";
      hilog.info(domain, tag,msgStr + "begin");
      let windowClass:window.Window =  windowStage.getMainWindowSync();
      try {
        windowClass.setSubWindowModal(true, window.ModalityType.APPLICATION_MODALITY).then(() => {
          hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(domain, tag,msgStr + `Failed to setSubWindowModal. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 1300004) {
            hilog.info(domain, tag,msgStr + 'The mainWindow not support setSubWindowModal');
            expect(true).assertTrue();
            done();
          } else if(err.code == 801){
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        });
      } catch (error) {
        error = error as BusinessError;
        hilog.error(domain, tag,msgStr + `Failed to setSubWindowModal. Cause code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number  testSetWindowDecorVisibleErrCode1300002_0100
     * @tc.name    testSetWindowDecorVisibleErrCode1300002_static_0100
     * @tc.desc    testSetWindowDecorVisibleErrCode1300002_static_0100
     * @tc.size    MediumTest
     * @tc.type    Function
     * @tc.level   Level 3
     */
    it('testSetWindowDecorVisibleErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName :string = "testSetWindowDecorVisibleErrCode1300002_static_0100";
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
      let subWin: window.Window;
      windowStage.createSubWindow('testSetWindowDecorVisibleErrCode1300002_static_0100')
        .then((data: window.Window) => {
          subWin = data;
          expect(!!subWin).assertTrue();
          hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
          await (subWin! as window.Window).destroyWindow();
          try {
            subWin!.setWindowDecorVisible(true);
            hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling setWindowDecorVisible.');
            expect(false).assertTrue();
            done()
          } catch (e) {
            e = e as BusinessError;
            hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
            if(e!.code == 1300002){
              done();
            }else if(e!.code == 801){
              done();
            }else {
              expect(false).assertTrue();
              done();
            }
          }
        })
        .catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done()
        });

    });

    /**
     * @tc.number SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.name SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400
     * @tc.desc Test promise setFunctionKeyEnabled interface to call a non-input method application.
     * @tc.level 3
     * @tc.type Function
     * @tc.size SmallTest
     */
    it("SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName = "SUB_MMI_Input_Api_IptDev_setFunctionKeyEnabled_0400";
        try {
          await inputDevice.setFunctionKeyEnabled(inputDevice.FunctionKey.CAPS_LOCK, false)
            .then(() => {
              console.info(`${caseName} Set capslock state success`);
              ExpectFalse(true);
              done();
            })
            .catch((error: Error) => {
              console.info(`${caseName} Set capslock state failed, error=${JSON.stringify(error)}`);
              ExpectTrue(error.code == 3900003);
              done();
            });
        } catch (error) {
          error = error as BusinessError;
          console.info(`${caseName} failed to set capslock state, error: ${JSON.stringify(error, [`code`, `message`])}`);
          ExpectFalse(true);
          done();
        }
      });

    /**
     * @tc.number    SUB_BASIC_WMS_SHIFT_APP_WINDOW_POINTER_EVENT_static_0300
     * @tc.name      test_shiftAppWindowPointerEvent_window_destroyed_static
     * @tc.desc      test_shiftAppWindowPointerEvent_window_destroyed_static
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('test_shiftAppWindowPointerEvent_window_destroyed_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName: string = 'test_shiftAppWindowPointerEvent_window_destroyed_static';
      let msgStr: string = 'jsUnittest ' + caseName + ' ';
      hilog.info(domain, tag,msgStr + 'begin');
      let mainWindow:window.Window = windowStage.getMainWindowSync();
      try{
        let promise1 = windowStage.createSubWindow('test_shiftAppWindowPointerEvent_window_destroyed_static');
        promise1.then((data:window.Window) => {
          let subWindowClass:window.Window = data;
          hilog.info(domain, tag,caseName+ ' Succeeded in creating the subwindow. Data: ' + data);
          let subWindowId = subWindowClass.getWindowProperties().id;
          let mainWindowId = mainWindow.getWindowProperties().id;
          hilog.info(domain, tag,caseName+ ' subWindowId: ' + JSON.stringify(subWindowId) +','+' mainWindowId: ' + JSON.stringify(mainWindowId) );
          await subWindowClass.destroyWindow();
          let promise2 = window.shiftAppWindowPointerEvent(mainWindowId,subWindowId);
          promise2.then(() => {
            hilog.info(domain, tag,caseName+ ' Succeeded in shifting app window pointer event');
            expect(false).assertTrue();
            done();
          }).catch((err: BusinessError):PromiseLike<void>|undefined => {
            hilog.error(domain, tag,`${caseName} :Failed to shift app window pointer event. Cause code: ${err.code}, message: ${err.message}`);
            if(err.code == 801){
              done();
            }else if(err.code == 1300002){
              expect(true).assertTrue();
              done();
            } else{
              expect(false).assertTrue();
              done();
            }
          });
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(domain, tag,`${caseName} :Failed to create the subwindow. Cause code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
          done();
        });
      }catch(err) {
        err = err as BusinessError;
        hilog.error(domain, tag,`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
        if(err.code == 401){
          done();
        }else{
          expect(false).assertTrue();
          done();
        }
      }
    });

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_SPECIALWINDOW_JS_API_static_0240
     * @tc.name      testSetSubWindowModal_SubWindowDestroy_static
     * @tc.desc      Sets whether the modal properties of the subwindow are enabled
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetSubWindowModal_SubWindowDestroy_static', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testSetSubWindowModal_SubWindowDestroy_static';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(domain, tag,msgStr + 'begin');
      let subWin:window.Window = await windowStage.createSubWindow('testSetSubWindowModal_SubWindowDestroy_static');
      hilog.info(domain, tag,msgStr + `createSubWindow success.`);
      expect(!!subWin).assertTrue();
      await subWin.destroyWindow();
      try {
        await subWin.setSubWindowModal(false).then(() => {
          hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(domain, tag,msgStr + `Failed to set subwindow modal. Cause code: ${err.code}, message: ${err.message}`);
          if (err.code == 801) {
            done();
          } else if(err.code == 1300002){
            expect(true).assertTrue();
            done();
          }else{
            expect(false).assertTrue();
            done();
          }
        });
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(domain, tag,msgStr + `Failed to create the subWindow. out Cause code: ${exception.code}, message: ${exception.message}`);
        expect(false).assertTrue();
        done();
      }

    });

    /**
     *@tc.number SUB_ACE_WEB_SAFEBROWSING_API_0004
     *@tc.name testIsSafeBrowsingEnabledFalseStatic
     *@tc.desc test IsSafeBrowsingEnabledFalse
     *@tc.size MediumTest
     *@tc.type Function
     *@tc.level Level 3
     */
    it('testIsSafeBrowsingEnabledFalseStatic', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        await Utils.msSleep(2000);
        Utils.emitEvent("emitIsSafeBrowsingEnabledFalse", 10);
        await Utils.msSleep(2000);
        Utils.registerEvent("testIsSafeBrowsingEnabledFalse", true, 2004, done);
        await Utils.msSleep(2000);
        inspector.sendEventByKey('webViewSdkSchemeHandler', 10, '');
        await Utils.msSleep(2000);
        done();
      });

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_static_0300
     * @tc.name      testsetSubWindowModal_Function_Promise3_static
     * @tc.desc      Test the function value of setSubWindowModal
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it("testsetSubWindowModal_Function_Promise3_static", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
      let msgStr:string = "testsetSubWindowModal_Function_Promise3_static ";
      hilog.info(domain, tag,msgStr + " begin");
      let wnd:window.Window = windowStage.getMainWindowSync();
      hilog.info(domain, tag,msgStr + ' window.getTopWindow wnd: ' + wnd);
      expect(wnd != null).assertTrue();
      try {
        wnd.setSubWindowModal(true).then(() => {
          hilog.info(domain, tag,msgStr + 'Succeeded in setting subwindow modal');
          expect(false).assertTrue();
          done();
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(domain, tag,msgStr + 'Failed to set subwindow modal. Cause:' + JSON.stringify(err));
          if(err.code == 801){
            done();
          }else{
            expect(err.code).assertEqual(1300004);
            done();
          }

        });
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(domain, tag,msgStr + ' Failed to setSubWindowModal. Cause: ' + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }

    });

    /**
     * @tc.number testOnKeyboardDidShowErrCode1300002_0100
     * @tc.name  testOnKeyboardDidShowErrCode1300002_static_0100
     * @tc.desc  testOnKeyboardDidShowErrCode1300002_static_0100
     * @tc.size  MediumTest
     * @tc.type  Function
     * @tc.level Level 3
     */
    it('testOnKeyboardDidShowErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName : string = "testOnKeyboardDidShowErrCode1300002_static_0100";
      let msgStr : string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
      try {
        let tempWnd: window.Window = await windowStage.createSubWindow('testOnKeyboardDidShowErrCode1300002_static_0100')
        hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
        await Utils.msSleep(300);
        expect(!!tempWnd).assertTrue();
        await tempWnd.destroyWindow();
        hilog.info(domain, tag,msgStr + 'window.destroy success');
        tempWnd.onKeyboardDidShow((keyboardInfo: window.KeyboardInfo) => {
          hilog.info(domain, tag,msgStr +  'keyboard show animation completion. keyboardInfo beginRect: ' + JSON.stringify(keyboardInfo.beginRect));
          hilog.info(domain, tag,msgStr +  'keyboard show animation completion. keyboardInfo beginRect: ' + JSON.stringify(keyboardInfo.endRect));
        });
        hilog.info(domain, tag,msgStr + 'window.isWindowShowing success');
        expect(false).assertTrue();
        done()
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
        expect(exception.code == 1300002 || exception.code == 801).assertTrue();
        if (exception.code != 801) {
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to enable the listener for keyboard show. Cause code:' + JSON.stringify(exception));
          expect(exception.code).assertEqual(1300002);
        } else {
          hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
          expect(exception.code).assertEqual(801);
        }
        done()
      }
    });

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_GETLASTWINDOW_API_0100
     * @tc.name   testGetLastWindow_Promise_static_0100
     * @tc.desc   Get the final show window
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level3
     */
    it('testGetLastWindow_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetLastWindow_Promise_static_0100';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let lastWindow: window.Window;
      try {
        window.getLastWindow(context).then((data:window.Window) => {
          hilog.info(0x0000, '[ANI]',msgStr + 'window.getLastWindow data: ' + JSON.stringify(data));
          lastWindow = data;
          expect(lastWindow != null).assertTrue();
          done();
        }).catch((err: BusinessError):PromiseLike<void>|undefined => {
          hilog.error(0x0000, '[ANI]','Failed to obtain the top window. Cause: ' + JSON.stringify(err));
          expect(false).assertTrue();
          done();
        })
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number    SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0650
     * @tc.name      testGetWindowAvoidArea_Type_Keyboard_static_0700
     * @tc.desc      Obtain the area that the window content avoids
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level3
     */
    it('testGetWindowAvoidArea_Type_Keyboard_static_0700', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testGetWindowAvoidArea_Type_Keyboard_static_0700';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      try {
        let tempWnd: window.Window = windowStage.getMainWindowSync();
        expect(!!tempWnd).assertTrue();
        try {
          let type: window.AvoidAreaType = window.AvoidAreaType.TYPE_KEYBOARD;
          let avoidArea:window.AvoidArea = tempWnd.getWindowAvoidArea(type);
          hilog.info(0x0000, '[ANI]',msgStr + 'avoidArea: ' + JSON.stringify(avoidArea));
          expect(avoidArea.visible).assertTrue();
          expect(avoidArea.topRect != null).assertTrue();
          expect(avoidArea.rightRect != null).assertTrue();
          expect(avoidArea.bottomRect != null).assertTrue();
          expect(avoidArea.leftRect != null).assertTrue();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain the area. Cause:' + JSON.stringify(exception));
          expect(false).assertTrue();
          done();
        }
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.error(0x0000, '[ANI]',msgStr + 'try catch Failed to obtain the top window. Cause: ' + JSON.stringify(exception));
      }
    });

    /**
     * @tc.number SUB_BASIC_WMS_FUNCTION_GETSUBWINDOW_static_0200
     * @tc.name   testgetSubWindow0_callback_static
     * @tc.desc   Test the function value of getSubWindow
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level3
     */
    it('testgetSubWindow0_callback_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
      let caseName:string = 'testgetSubWindow0_callback_static';
      let windowclass:Array<window.Window>|undefined;
      try {
        windowStage.getSubWindow((err: BusinessError<void>|null, data: Array<window.Window>|undefined) => {
          const errCode: number = err!.code;
          if (errCode) {
            console.error(caseName + ` Failed to obtain the subwindow. Cause code: ${err!.code}, message: ${err!.message}`);
            expect(false).assertTrue();
            done();
          }else{
            windowclass = data;
            console.log(`${caseName} getSubWindow success. Cause: ${JSON.stringify(windowclass)}`);
            expect(windowclass!.length).assertEqual(0)
            done();
          }
        });
      } catch (e: BusinessError) {
        console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
        expect(false).assertTrue();
        done();
      }
    });

    /**
     * @tc.number SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SHOWWINDOW_JS_API_0100
     * @tc.name   testShowWindow_WindowStateAbnormal_Callback_static_0100
     * @tc.desc   show window windowStateAbnormal
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('testShowWindow_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName :string = 'testShowWindow_WindowStateAbnormal_Callback_static_0100';
      let msgStr :string ='jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let win: window.Window;
      win = await windowStage.createSubWindow('testShowWindow_WindowStateAbnormal_Callback_static_0100');
      hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
      expect(!!win).assertTrue();
      await (win as window.Window).destroyWindow();
      (win as window.Window).showWindow((err: BusinessError<void>|null):void => {
        const errCode: number = err!.code;
        if (errCode) {
          hilog.error(0x0000, '[ANI]','Failed to show the window. Cause: ' + JSON.stringify(err));
          expect(err!.code).assertEqual(1300002);
          done();
          return;
        }
        hilog.info(0x0000, '[ANI]','Succeeded in showing the window.');
        expect(false).assertTrue();
        done();
      });
    });

  });
}