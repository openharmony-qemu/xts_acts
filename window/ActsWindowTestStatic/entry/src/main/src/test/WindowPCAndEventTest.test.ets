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
 * See the License for specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback } from '@ohos.base'
import common from '@ohos.app.ability.common';
import ConfigurationConstant from '@ohos.app.ability.ConfigurationConstant';

let domain: int = 0x0000;
let tag: string = 'testTag';

export default function WindowPCAndEventTest() {

  describe("WindowPCAndEventTest", (): void => {
    hilog.info(domain, tag, '%{public}s', 'WindowPCAndEventTest describe start');
    let windowStage: window.WindowStage | undefined;
    let win: window.Window | undefined;
    let context: common.UIAbilityContext | undefined;
    let isFreeWindowMode: boolean = false;

    beforeAll(() => {
      try {
        windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
        win = AppStorage.get<window.Window>('mainWindow') as window.Window;
        context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
        isFreeWindowMode = win!.isInFreeWindowMode();
      } catch (e) {
        hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
      }

      hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
      hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));
    })

    /**
     * @tc.number    SUB_WINDOW_WINDOWTOUCHABLE_FALSE_0100
     * @tc.name      testSetWindowTouchableFalse_static_0100
     * @tc.desc      test setWindowTouchable with false parameter using Promise.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowTouchableFalse_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowTouchableFalse_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          await win!.setWindowTouchable(false);
          hilog.info(domain, tag, caseName + ' setWindowTouchable with false success');

          await win!.setWindowTouchable(true);
          hilog.info(domain, tag, caseName + ' setWindowTouchable with true success');
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          expect(false).assertTrue();
        }
      })

    /**
     * @tc.number    SUB_WINDOW_WINDOWTOUCHABLE_FALSE_CALLBACK_0100
     * @tc.name      testSetWindowTouchableFalseCallback_static_0100
     * @tc.desc      test setWindowTouchable with false parameter using AsyncCallback.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowTouchableFalseCallback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowTouchableFalseCallback_static_0100';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowTouchable(false, (err: BusinessError | null) => {
            hilog.info(domain, tag, caseName + ' setWindowTouchable callback err: ' + JSON.stringify(err));
            if (err && err.code != 0) {
              hilog.error(domain, tag,
                caseName + ' setWindowTouchable failed. code: ' + err.code + ', message: ' + err.message);
              expect(false).assertTrue();
              done();
            } else {
              hilog.info(domain, tag, caseName + ' setWindowTouchable with false success');
              win!.setWindowTouchable(true, (err2: BusinessError | null) => {
                hilog.info(domain, tag, caseName + ' setWindowTouchable callback err2: ' + JSON.stringify(err2));
                if (err2 && err2.code != 0) {
                  hilog.error(domain, tag,
                    caseName + ' setWindowTouchable true failed. code: ' + err2.code + ', message: ' + err2.message);
                  expect(false).assertTrue();
                  done();
                } else {
                  hilog.info(domain, tag, caseName + ' setWindowTouchable with true success');
                  done();
                }
              });
            }
          });
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          expect(false).assertTrue();
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETWINDOWDECORVISIBLE_FALSE_0100
     * @tc.name      testSetWindowDecorVisibleFalse_static
     * @tc.desc      test setWindowDecorVisible with false parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowDecorVisibleFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowDecorVisibleFalse_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(false);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible with false success');

          await Utils.msSleep(100);

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETWINDOWDECORVISIBLE_ERRCODE_1300002
     * @tc.name      testSetWindowDecorVisibleErrCode1300002_static
     * @tc.desc      test setWindowDecorVisible with error code 1300002.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetWindowDecorVisibleErrCode1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowDecorVisibleErrCode1300002_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window =
            await windowStage!.createSubWindow('testSetWindowDecorVisibleErrCode1300002_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          expect(!!subWin).assertTrue();

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          subWin.setWindowDecorVisible(true);
          hilog.error(domain, tag, caseName + ' Succeeded in calling setWindowDecorVisible');
          expect(false).assertTrue();
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.info(domain, tag, msgStr + 'Failed to call setWindowDecorVisible. Cause:' + JSON.stringify(e));
          if (e.code === 1300002) {
            hilog.info(domain, tag, caseName + ' window state abnormal, code: ' + e.code);
            done();
          } else if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORVISIBLE_RETURN_TRUE_0100
     * @tc.name      testGetWindowDecorVisibleReturnTrue_static
     * @tc.desc      test getWindowDecorVisible return value true.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorVisibleReturnTrue_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorVisibleReturnTrue_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(true);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible to true');

          await Utils.msSleep(100);

          let isVisible: boolean = win!.getWindowDecorVisible();
          hilog.info(domain, tag, caseName + ' getWindowDecorVisible result: ' + isVisible);

          if (isFreeWindowMode) {
            expect(isVisible).assertTrue();
          }

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORVISIBLE_RETURN_FALSE_0100
     * @tc.name      testGetWindowDecorVisibleReturnFalse_static
     * @tc.desc      test getWindowDecorVisible return value false.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorVisibleReturnFalse_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorVisibleReturnFalse_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          win!.setWindowDecorVisible(false);
          hilog.info(domain, tag, caseName + ' setWindowDecorVisible to false');

          await Utils.msSleep(100);

          let isVisible: boolean = win!.getWindowDecorVisible();
          hilog.info(domain, tag, caseName + ' getWindowDecorVisible result: ' + isVisible);

          if (isFreeWindowMode) {
            expect(isVisible).assertFalse();
          }
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETSUBWINDOWMODAL_MODALITY_0100
     * @tc.name      testSetSubWindowModalModality_static
     * @tc.desc      test setSubWindowModal with modalityType parameter.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetSubWindowModalModality_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetSubWindowModalModality_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetSubWindowModalModality_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          await subWin.setSubWindowModal(false, window.ModalityType.APPLICATION_MODALITY);
          hilog.info(domain, tag, caseName + ' setSubWindowModal with APPLICATION_MODALITY success');

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else if (e.code === 401) {
            hilog.error(domain, tag, caseName + ' 不支持设置false');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETWINDOWDECORHEIGHT_RETURN_0100
     * @tc.name      testGetWindowDecorHeightReturn_static
     * @tc.desc      test getWindowDecorHeight return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetWindowDecorHeightReturn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowDecorHeightReturn_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let setHeight: int = 50;
          win!.setWindowDecorHeight(setHeight);
          hilog.info(domain, tag, caseName + ' setWindowDecorHeight with height: ' + setHeight);

          await Utils.msSleep(100);

          let getHeight: int = win!.getWindowDecorHeight();
          hilog.info(domain, tag, caseName + ' getWindowDecorHeight result: ' + getHeight);

          if (isFreeWindowMode) {
            expect(getHeight).assertEqual(setHeight);
          }

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_LIGHT_0100
     * @tc.name      testSetDecorButtonStyleLight_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_LIGHT.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleLight_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleLight_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetSetDecorButtonStyleLight_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_LIGHT');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_DARK_0100
     * @tc.name      testSetDecorButtonStyleDark_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_DARK.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleDark_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleDark_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetDecorButtonStyleDark_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_DARK;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_DARK');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_NOTSET_0100
     * @tc.name      testSetDecorButtonStyleNotSet_static
     * @tc.desc      test setDecorButtonStyle with COLOR_MODE_NOT_SET.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleNotSet_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleNotSet_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testSetDecorButtonStyleNotSet_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_NOT_SET;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success with COLOR_MODE_NOT_SET');

          await Utils.msSleep(100);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_ERRCODE_1300002
     * @tc.name      testSetDecorButtonStyleErrCode1300002_static
     * @tc.desc      test setDecorButtonStyle with error code 1300002.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleErrCode1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleErrCode1300002_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window =
            await windowStage!.createSubWindow('testSetDecorButtonStyleErrCode1300002_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let style: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(style);
          hilog.error(domain, tag, caseName + ' Succeeded in calling setDecorButtonStyle');
          expect(false).assertTrue();
          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.info(domain, tag, msgStr + 'Failed to call setDecorButtonStyle. Cause:' + JSON.stringify(e));
          if (e.code === 1300002) {
            hilog.info(domain, tag, caseName + ' window state abnormal, code: ' + e.code);
            done();
          } else if (e.code === 801) {
            hilog.error(domain, tag, ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number    SUB_WINDOW_SETDECORBUTTONSTYLE_ERRCODE_1300004
     * @tc.name      testSetDecorButtonStyleErrCode1300004_static
     * @tc.desc      test setDecorButtonStyle with error code 1300004.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testSetDecorButtonStyleErrCode1300004_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetDecorButtonStyleErrCode1300004_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        let config: window.Configuration = {
          name: "testSetDecorButtonStyleErrCode1300004_static",
          windowType: window.WindowType.TYPE_FLOAT,
          ctx: context!
        };
        let subWindowClass: window.Window | undefined;
        hilog.info(domain, tag, `${caseName} Succeeded in creating the float window.`);
        try {
          window.createWindow(config).then((data: window.Window) => {
            subWindowClass = data;
            hilog.info(domain, tag,
              caseName + 'float window succeed in calling setRelativePositionToParentWindowEnabled');
            await subWindowClass!.setUIContent('pages/index2');
            hilog.info(domain, tag, caseName + ' setUIContent success');
            await subWindowClass!.showWindow();
            hilog.info(domain, tag, caseName + ' showWindow success');
            let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
            let style: window.DecorButtonStyle = {
              colorMode: colorMode,
              buttonBackgroundSize: 28,
              spacingBetweenButtons: 12,
              closeButtonRightMargin: 20,
              buttonIconSize: 20,
              buttonBackgroundCornerRadius: 4
            };
            subWindowClass!.setDecorButtonStyle(style);
            expect(false).assertTrue();
            done();
          }).catch((err: Error): PromiseLike<void> | undefined => {
            hilog.error(domain, tag,
              `${caseName} Failed float window. Cause code: ${err.code}, message: ${err.message}`);
            if (err.code === 801) {
              expect(err.message != null).assertTrue();
              done();
            } else {
              expect(err.code).assertEqual(1300004);
              expect(err.message != null).assertTrue();
              done();
            }
          });
        } catch (e) {
          hilog.error(domain, tag, `${caseName} Failed2 float window. Cause: ${JSON.stringify(e)}`);
          await subWindowClass!.destroyWindow();
          expect(false).assertTrue();
          done()
        }
      })

    /**
     * @tc.number    SUB_WINDOW_GETDECORBUTTONSTYLE_RETURN_0100
     * @tc.name      testGetDecorButtonStyleReturn_static
     * @tc.desc      test getDecorButtonStyle return value.
     * @tc.size      MediumTest
     * @tc.type      Function
     * @tc.level     Level 3
     */
    it('testGetDecorButtonStyleReturn_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetDecorButtonStyleReturn_static';
        let msgStr: string = 'jsUnittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');

        try {
          let subWin: window.Window = await windowStage!.createSubWindow('testGetDecorButtonStyleReturn_static');
          hilog.info(domain, tag, caseName + ' create subWindow success');
          await subWin.setUIContent('pages/index2');
          hilog.info(domain, tag, caseName + ' setUIContent success');
          await subWin.showWindow();
          hilog.info(domain, tag, caseName + ' showWindow success');

          let colorMode: ConfigurationConstant.ColorMode = ConfigurationConstant.ColorMode.COLOR_MODE_LIGHT;
          let setStyle: window.DecorButtonStyle = {
            colorMode: colorMode,
            buttonBackgroundSize: 28,
            spacingBetweenButtons: 12,
            closeButtonRightMargin: 20,
            buttonIconSize: 20,
            buttonBackgroundCornerRadius: 4
          };
          subWin.setDecorButtonStyle(setStyle);
          hilog.info(domain, tag, caseName + ' setDecorButtonStyle success');

          await Utils.msSleep(100);

          let getStyle: window.DecorButtonStyle = subWin.getDecorButtonStyle();
          hilog.info(domain, tag, caseName + ' getDecorButtonStyle result: ' + JSON.stringify(getStyle));

          expect(getStyle.buttonBackgroundSize).assertEqual(setStyle.buttonBackgroundSize);
          expect(getStyle.spacingBetweenButtons).assertEqual(setStyle.spacingBetweenButtons);
          expect(getStyle.closeButtonRightMargin).assertEqual(setStyle.closeButtonRightMargin);
          expect(getStyle.buttonIconSize).assertEqual(setStyle.buttonIconSize);
          expect(getStyle.buttonBackgroundCornerRadius).assertEqual(setStyle.buttonBackgroundCornerRadius);

          await subWin.destroyWindow();
          hilog.info(domain, tag, caseName + ' destroyWindow success');

          done();
        } catch (e) {
          e = e as BusinessError;
          hilog.error(domain, tag, msgStr + 'exception = ' + JSON.stringify(e));
          hilog.error(domain, tag, caseName + ' error code: ' + e.code + ', message: ' + e.message);
          if (e.code === 801) {
            hilog.error(domain, tag, caseName + ' 当前设备类型不支持系统能力SystemCapability.Window.SessionManager');
            done();
          } else {
            expect(false).assertTrue();
            done();
          }
        }
      })


  })
}
