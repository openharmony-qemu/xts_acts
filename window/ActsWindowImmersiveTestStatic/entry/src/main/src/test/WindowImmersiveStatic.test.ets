'use static'
/*
 * Copyright (c) 2025-2026 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with License.
 * You may obtain a copy of License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import common from '@ohos.app.ability.common';
import type { AsyncCallback, Callback } from '@ohos.base'
import { ColorMetrics } from '@ohos.arkui.node';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { display } from '@kit.ArkUI';
import { canIUse } from '@internal.full.global';

let domain: int = 0x0000;
let tag: string = 'WindowImmersiveStaticTest';

export default function WindowImmersiveStaticTest() {
  describe("WindowImmersiveStaticTest", (): void => {
    let windowStage: window.WindowStage | undefined;
    let win: window.Window | undefined;
    let context: common.UIAbilityContext | undefined;
    let isSupportRotate = false;
    let isFreeWindowMode = false;

    beforeAll(async() => {
      try {
        windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
        win = AppStorage.get<window.Window>('mainWindow') as window.Window;
        context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      } catch (e) {
        hilog.info(domain, tag, 'getANI fail = ' + JSON.stringify(e));
      }
      await win!.setPreferredOrientation(window.Orientation.PORTRAIT)
      await Utils.msSleep(300)
      let Orientation1 = display.getDefaultDisplaySync().orientation;
      await win!.setPreferredOrientation(window.Orientation.LANDSCAPE);
      await Utils.msSleep(300)
      let Orientation2 = display.getDefaultDisplaySync().orientation;
      if (Orientation1 != Orientation2) {
        isSupportRotate = true;
      } else {
        isSupportRotate = false;
      }
      await win!.setPreferredOrientation(window.Orientation.PORTRAIT);
      isFreeWindowMode = win!.isInFreeWindowMode();
    })

    /**
     * @tc.number      SUB_WINDOW_setWindowSystemBarProperties_001
     * @tc.name        testSetWindowSystemBarProperties_All_static_001
     * @tc.desc        setWindowSystemBarProperties all properties test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testSetWindowSystemBarProperties_All_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetWindowSystemBarProperties_All_static_001';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        try {
          let systemBarProperties: window.SystemBarProperties = {
            statusBarColor: '#ff00ff',
            navigationBarColor: '#00ff00',
            statusBarContentColor: '#ffffff',
            navigationBarContentColor: '#00ffff',
            isStatusBarLightIcon: false,
            isNavigationBarLightIcon: true,
            enableStatusBarAnimation: true,
            enableNavigationBarAnimation: true
          };
          win!.setWindowSystemBarProperties(systemBarProperties).then(() => {
            hilog.info(domain, tag, msgStr + 'Succeeded in setting system bar properties.');
            done();
          }).catch((err: Error): PromiseLike<void> | undefined => {
            err = err as BusinessError;
            if (err.code === 801) {
              hilog.info(domain, tag, msgStr + 'Capability not supported.');
              done();
            } else {
              hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            }
          });
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })

       /**git 
     * @tc.number      SUB_WINDOW_IMMERSIVE_GetWindowSystemBarProperties_0100
     * @tc.name        testGetWindowSystemBarProperties_All_001
     * @tc.desc        setWindowSystemBarProperties all properties test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testGetWindowSystemBarProperties_All_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetWindowSystemBarProperties_All_001';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        try {
          let systemBarProperties: window.SystemBarProperties = {
            statusBarColor: '#ff00ff',
            navigationBarColor: '#00ff00',
            statusBarContentColor: '#ffffff',
            navigationBarContentColor: '#00ffff',
            enableStatusBarAnimation: true,
            enableNavigationBarAnimation: true
          };
          win!.setWindowSystemBarProperties(systemBarProperties).then(() => {
            hilog.info(domain, tag, msgStr + 'Succeeded in setting system bar properties.');
            done();
            let systemBarProperty = win!.getWindowSystemBarProperties();
            hilog.info(domain, tag, msgStr + `Succeeded in getting system bar properties is:${JSON.stringify(systemBarProperty)}`);
            expect(systemBarProperty.statusBarColor == '#FFFF00FF').assertTrue();
            expect(systemBarProperty.isStatusBarLightIcon == false).assertTrue();
            expect(systemBarProperty.statusBarContentColor =='#FFFFFFFF').assertTrue();
            expect(systemBarProperty.navigationBarColor =='#FF00FF00').assertTrue();
            expect(systemBarProperty.isNavigationBarLightIcon == false).assertTrue();
            expect(systemBarProperty.navigationBarContentColor =='#FF00FFFF').assertTrue();
            expect(systemBarProperty.enableStatusBarAnimation == true).assertTrue();
            expect(systemBarProperty.enableNavigationBarAnimation == true).assertTrue();
          }).catch((err: Error): PromiseLike<void> | undefined => {
            err = err as BusinessError;
            if (err.code === 801) {
              hilog.info(domain, tag, msgStr + 'Capability not supported.');
              done();
            } else {
              hilog.error(domain, tag, msgStr + `Failed. Cause code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            }
          });
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.number      SUB_WINDOW_getStatusBarProperty_002
     * @tc.name        testGetStatusBarProperty_ErrorCode1300002_static_002
     * @tc.desc        getStatusBarProperty 1300002 test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testGetStatusBarProperty_ErrorCode1300002_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetStatusBarProperty_ErrorCode1300002_static_002';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        try {
          let subWin: window.Window = await windowStage!.createSubWindow(caseName);
          expect(!!subWin).assertTrue();
          await subWin.destroyWindow()
          let statusBarProperty: window.StatusBarProperty = subWin.getStatusBarProperty();
          hilog.info(domain, tag, msgStr + 'Succeeded unexpectedly.');
          expect(false).assertTrue();
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          if (exception.code === 1300002) {
            hilog.info(domain, tag, msgStr + 'Window state abnormal as expected.');
            done();
          } else if (exception.code === 801) {
            hilog.info(domain, tag, msgStr + 'Capability not supported.');
            done();
          } else {
            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number      SUB_WINDOW_onAvoidAreaChange_001
     * @tc.name        testOnAvoidAreaChange_static_001
     * @tc.desc        onAvoidAreaChange test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testOnAvoidAreaChange_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testOnAvoidAreaChange_static_001';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        if (isSupportRotate == true && isFreeWindowMode == false) {
          try {
            let avoidAreaChangeCallback: Callback<window.AvoidAreaOptions> = (data: window.AvoidAreaOptions): void => {
              hilog.info(domain, tag, caseName + ' onAvoidAreaChange callback invoked, type: ' + JSON.stringify(data));
              expect(data.type != null).assertTrue();
              expect(data.area != null).assertTrue();
            };
            await win!.setPreferredOrientation(window.Orientation.LANDSCAPE)
            await Utils.msSleep(1000);

            win!.onAvoidAreaChange(avoidAreaChangeCallback);
            hilog.info(domain, tag, caseName + ' onAvoidAreaChange registered');

            await win!.setPreferredOrientation(window.Orientation.PORTRAIT);
            await Utils.msSleep(1000);

            win!.offAvoidAreaChange(avoidAreaChangeCallback);
            hilog.info(domain, tag, caseName + ' offAvoidAreaChange success');


            done();
          } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(false).assertTrue();
            done();
          }
        } else {
          done();
        }
      })

    /**
     * @tc.number      SUB_WINDOW_setImmersiveModeEnabledState_002
     * @tc.name        testSetImmersiveModeEnabledState_False_static_002
     * @tc.desc        setImmersiveModeEnabledState false test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testSetImmersiveModeEnabledState_False_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testSetImmersiveModeEnabledState_False_static_002';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        try {
          let enabled: boolean = false;
          win!.setImmersiveModeEnabledState(enabled);
          hilog.info(domain, tag, msgStr + 'Succeeded in setting immersive mode enabled state: ' + enabled);
          done();
        } catch (exception) {
          exception = exception as BusinessError;
          hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
          expect(false).assertTrue();
          done();
        }
      })

    /**
     * @tc.number      SUB_WINDOW_getImmersiveModeEnabledState_001
     * @tc.name        testGetImmersiveModeEnabledState_static_001
     * @tc.desc        getImmersiveModeEnabledState default test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testGetImmersiveModeEnabledState_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetImmersiveModeEnabledState_static_001';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        if(isFreeWindowMode){
           hilog.info(domain, tag, msgStr + 'not support');
           done();
        }else{
          try {
            let enabled: boolean = false;
            win!.setImmersiveModeEnabledState(enabled);
            hilog.info(domain, tag, caseName + ' setImmersiveModeEnabledState: ' + enabled);

            await Utils.msSleep(100);

            let isEnabled: boolean = win!.getImmersiveModeEnabledState();
            hilog.info(domain, tag, msgStr + 'Succeeded in getting immersive mode enabled state: ' + isEnabled);
            expect(isEnabled).assertEqual(enabled);
            done();
          } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number      SUB_WINDOW_getImmersiveModeEnabledState_002
     * @tc.name        testGetImmersiveModeEnabledState_AfterSet_static_002
     * @tc.desc        getImmersiveModeEnabledState after set test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testGetImmersiveModeEnabledState_AfterSet_static_002', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testGetImmersiveModeEnabledState_AfterSet_static_002';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        if(isFreeWindowMode){
           hilog.info(domain, tag, msgStr + 'not support');
           done();
        }else{
          try {
            let enabled: boolean = true;
            win!.setImmersiveModeEnabledState(enabled);
            hilog.info(domain, tag, caseName + ' setImmersiveModeEnabledState: ' + enabled);

            await Utils.msSleep(100);

            let isEnabled: boolean = win!.getImmersiveModeEnabledState();
            hilog.info(domain, tag, msgStr + 'Succeeded in getting immersive mode enabled state: ' + isEnabled);
            expect(isEnabled).assertEqual(enabled);
            done();
          } catch (exception) {
            exception = exception as BusinessError;
            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number      SUB_WINDOW_isImmersiveLayout_001
     * @tc.name        testIsImmersiveLayout_static_001
     * @tc.desc        isImmersiveLayout test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testIsImmersiveLayout_static_001', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'testIsImmersiveLayout_static_001';
        let msgStr: string = 'jsunittest ' + caseName + ' ';
        hilog.info(domain, tag, msgStr + 'begin');
        try {
          let isImmersive_before: boolean = win!.isImmersiveLayout();
          hilog.info(domain, tag, msgStr + 'Succeeded in checking isImmersive_before layout: ' + isImmersive_before);
          let enabled: boolean = true;
          win!.setWindowLayoutFullScreen(enabled);
          hilog.info(domain, tag, caseName + ' setWindowLayoutFullScreen: ' + enabled);

          await Utils.msSleep(100);

          let isImmersive: boolean = win!.isImmersiveLayout();
          hilog.info(domain, tag, msgStr + 'Succeeded in checking immersive layout: ' + isImmersive);
          if(isFreeWindowMode){
             expect(isImmersive).assertEqual(isImmersive_before);
            done();
          }else{
            expect(isImmersive).assertEqual(enabled);
            done();
          }
        } catch (exception) {
          exception = exception as BusinessError;
          if (exception.code === 801) {
            hilog.info(domain, tag, msgStr + 'Capability not supported.');
            done();
          } else {
            hilog.error(domain, tag, msgStr + `Failed. Cause code: ${exception.code}, message: ${exception.message}`);
            expect(false).assertTrue();
            done();
          }
        }
      })

    /**
     * @tc.number      SUB_WINDOW_isImmersiveLayout_1300002
     * @tc.name        testIsImmersiveLayout_static_1300002
     * @tc.desc        isImmersiveLayout test.
     * @tc.size        MediumTest
     * @tc.type        Function
     * @tc.level       Level3
     */
    it('testIsImmersiveLayout_static_1300002', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
      let caseName:string = 'testIsImmersiveLayout_static_1300002';
      let msgStr:string = 'jsunittest ' + caseName + ' ';
      hilog.info(0x0000, '[ANI]',msgStr + 'begin');
      let subWindow: window.Window = await windowStage!.createSubWindow('testIsImmersiveLayout_static_1300002');
      hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
      expect(!!subWindow).assertTrue();
      await subWindow.destroyWindow();
      try {
        subWindow!.isImmersiveLayout();
        expect(false).assertTrue();
        done();
      } catch (exception) {
        exception = exception as BusinessError;
        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to isImmersiveLayout. Cause: '+exception.code+'  ' + JSON.stringify(exception));
        expect(exception.code).assertEqual(1300002)
        done()
      }
    })

     /**
     * @tc.name SUB_WINDOW_Enum_SplitRatioPreference_static_0100
     * @tc.number SUB_WINDOW_Enum_SplitRatioPreference_static_0100
     * @tc.desc SUB_WINDOW_Enum_SplitRatioPreference_static_0100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_WINDOW_Enum_SplitRatioPreference_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let caseName: string = 'SUB_WINDOW_Enum_SplitRatioPreference_static_0100 ';
        console.log(caseName + 'begin');
        try {
          expect(window.AvoidAreaType.TYPE_FLOAT_NAVIGATION).assertEqual(5);
          expect(window.SplitRatioPreference.EQUAL).assertEqual(0);
          expect(window.SplitRatioPreference.SECONDARY_DOMINANT).assertEqual(2);
          done();
        } catch (e) {
          console.error(`${caseName} Failed. Cause: ${JSON.stringify(e)}`);
          expect().assertFail();
          done()
        }
      });

    /**
     * @tc.name   SUB_WINDOW_GET_WINDOW_AVOIDAREA_TYPE_FLOAT_NAVIGATION_STATIC_0100
     * @tc.number SUB_WINDOW_GET_WINDOW_AVOIDAREA_TYPE_FLOAT_NAVIGATION_STATIC_0100
     * @tc.desc   验证主窗口调用getWindowAvoidArea(TYPE_FLOAT_NAVIGATION)返回有效的AvoidArea对象
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_GET_WINDOW_AVOIDAREA_TYPE_FLOAT_NAVIGATION_STATIC_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_GET_WINDOW_AVOIDAREA_TYPE_FLOAT_NAVIGATION_STATIC_0100';
        let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
        console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
        try {
          let windowClass: window.Window = windowStage!.getMainWindowSync();
          let avoidArea = windowClass.getWindowAvoidArea(window.AvoidAreaType.TYPE_FLOAT_NAVIGATION);
          console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
          expect(avoidArea !== null).assertTrue();
          expect(avoidArea.topRect !== null).assertTrue();
          expect(avoidArea.rightRect !== null).assertTrue();
          expect(avoidArea.bottomRect !== null).assertTrue();
          expect(avoidArea.leftRect !== null).assertTrue();
          expect(avoidArea.topRect.left).assertLargerOrEqual(0);
          expect(avoidArea.topRect.top).assertLargerOrEqual(0);
          expect(avoidArea.topRect.width).assertLargerOrEqual(0);
          expect(avoidArea.topRect.height).assertLargerOrEqual(0);
          expect(avoidArea.rightRect.left).assertLargerOrEqual(0);
          expect(avoidArea.rightRect.top).assertLargerOrEqual(0);
          expect(avoidArea.rightRect.width).assertLargerOrEqual(0);
          expect(avoidArea.rightRect.height).assertLargerOrEqual(0);
          expect(avoidArea.bottomRect.left).assertLargerOrEqual(0);
          expect(avoidArea.bottomRect.top).assertLargerOrEqual(0);
          expect(avoidArea.bottomRect.width).assertLargerOrEqual(0);
          expect(avoidArea.bottomRect.height).assertLargerOrEqual(0);
          expect(avoidArea.leftRect.left).assertLargerOrEqual(0);
          expect(avoidArea.leftRect.top).assertLargerOrEqual(0);
          expect(avoidArea.leftRect.width).assertLargerOrEqual(0);
          expect(avoidArea.leftRect.height).assertLargerOrEqual(0);
          done();
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      })

      /**
     * @tc.name SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0100
     * @tc.number SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0100
     * @tc.desc SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0100
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0100';
        let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
        console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
        try {
          let windowClass: window.Window = windowStage!.getMainWindowSync();
          windowClass.setFloatNavigationAvoidAreaEnabled(true).then(async () => {
            console.info(`${caseName} Succeeded setFloatNavigationAvoidAreaEnabled`);
            console.info(`${caseName} Succeeded in setting FloatNavigationAvoidAreaEnabled true.`);
            await Utils.msSleep(500)
            let isEnabled = windowClass.isFloatNavigationAvoidAreaEnabled();
            console.info(`${caseName} isFloatNavigationAvoidAreaEnabled: ${isEnabled}`);
            expect(isEnabled).assertEqual(true);
            let avoidArea =
              windowClass.getWindowAvoidAreaIgnoringVisibility(window.AvoidAreaType.TYPE_FLOAT_NAVIGATION);
            console.info(`${caseName} avoidArea: ${JSON.stringify(avoidArea)}`);
            expect(avoidArea.topRect !== null).assertTrue();
            expect(avoidArea.rightRect !== null).assertTrue();
            expect(avoidArea.bottomRect !== null).assertTrue();
            expect(avoidArea.leftRect !== null).assertTrue();
            expect(avoidArea.topRect.left).assertLargerOrEqual(0);
            expect(avoidArea.topRect.top).assertLargerOrEqual(0);
            expect(avoidArea.topRect.width).assertLargerOrEqual(0);
            expect(avoidArea.topRect.height).assertLargerOrEqual(0);
            expect(avoidArea.rightRect.left).assertLargerOrEqual(0);
            expect(avoidArea.rightRect.top).assertLargerOrEqual(0);
            expect(avoidArea.rightRect.width).assertLargerOrEqual(0);
            expect(avoidArea.rightRect.height).assertLargerOrEqual(0);
            expect(avoidArea.bottomRect.left).assertLargerOrEqual(0);
            expect(avoidArea.bottomRect.top).assertLargerOrEqual(0);
            expect(avoidArea.bottomRect.width).assertLargerOrEqual(0);
            expect(avoidArea.bottomRect.height).assertLargerOrEqual(0);
            expect(avoidArea.leftRect.left).assertLargerOrEqual(0);
            expect(avoidArea.leftRect.top).assertLargerOrEqual(0);
            expect(avoidArea.leftRect.width).assertLargerOrEqual(0);
            expect(avoidArea.leftRect.height).assertLargerOrEqual(0);
            done();
          }).catch((err: Error) => {
            console.info(`${caseName} Failed in setFloatNavigationAvoidAreaEnabled. Cause code: ${err.code}, message: ${err.message}`);
            if (!canIUseRes) {
              expect(err.code).assertEqual(801)
              expect(err.message !== '').assertTrue()
            } else {
              expect(true).assertFail();
            }
            done();
          });
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      })

/**
     * @tc.name SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0200
     * @tc.number SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0200
     * @tc.desc SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0200
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_GetWindowAvoidAreaIgnoringVisibility_TYPE_FLOAT_NAVIGATION_static_0200';
        let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
        console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
        try {
          let windowClass: window.Window = windowStage!.getMainWindowSync();
          windowClass.setFloatNavigationAvoidAreaEnabled(false).then(async () => {
            console.info(`${caseName} Succeeded setFloatNavigationAvoidAreaEnabled`);
            console.info(`${caseName} Succeeded in setting FloatNavigationAvoidAreaEnabled false.`);
            await Utils.msSleep(500)
            let isEnabled = windowClass.isFloatNavigationAvoidAreaEnabled();
            console.info(`${caseName} isFloatNavigationAvoidAreaEnabled: ${isEnabled}`);
            expect(isEnabled).assertEqual(false);
            done();
          }).catch((err: Error) => {
            console.info(`${caseName} Failed in setFloatNavigationAvoidAreaEnabled. Cause code: ${err.code}, message: ${err.message}`);
            if (!canIUseRes) {
              expect(err.code).assertEqual(801)
              expect(err.message !== '').assertTrue()
            } else {
              expect(true).assertFail();
            }
            done();
          });
        } catch (exception) {
          console.error(`${caseName} Error. Cause code: ${exception.code}, message: ${exception.message}`);
          expect().assertFail();
          done();
        }
      })

      /**
     * @tc.name   SUB_WINDOW_setFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.number SUB_WINDOW_setFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.desc   SUB_WINDOW_setFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_setFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_setFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100';
        let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
        console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
        let subWindowClass: window.Window = await windowStage!.createSubWindow(caseName);
        expect(2).assertEqual(window.SplitRatioPreference.SECONDARY_DOMINANT);
        await subWindowClass.destroyWindow();
        await Utils.msSleep(500)
        try {
          subWindowClass.setFloatNavigationAvoidAreaEnabled(false).then(() => {
            console.info(`${caseName} Succeeded setFloatNavigationAvoidAreaEnabled`);
            expect(true).assertFail();
            done();
          }).catch((err: Error) => {
            console.info(`${caseName} Failed in setFloatNavigationAvoidAreaEnabled. Cause code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(1300002)
            expect(err.message !== '').assertTrue()
            done();
          });
        } catch (err) {
          console.error(caseName + ' failed, err: ' + JSON.stringify(err));
          expect(true).assertFail();
          done();
        }
      })

    /**
     * @tc.name   SUB_WINDOW_isFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.number SUB_WINDOW_isFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.desc   SUB_WINDOW_isFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_WINDOW_isFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
        let caseName = 'SUB_WINDOW_isFloatNavigationAvoidAreaEnabled_ERRORCODE_static_0100';
        let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
        console.info(caseName + ' canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
        let subWindowClass: window.Window = await windowStage!.createSubWindow(caseName);
        await subWindowClass.destroyWindow();
        await Utils.msSleep(500)
        try {
          let isEnabled = subWindowClass.isFloatNavigationAvoidAreaEnabled()
          console.info(`${caseName} Succeeded isFloatNavigationAvoidAreaEnabled: ${isEnabled}`);
          expect(true).assertFail();
        } catch (err) {
          console.error(`Failed to check if the window is enabled float navigation avoid area. Cause code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(1300002)
          expect(err.message !== '').assertTrue()
          done();
        }
      })

      
  })
}
