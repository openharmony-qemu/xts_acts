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
import { beforeAll, describe, expect, it, Level, Size, TestType } from "@ohos/hypium";
import windowndkapi20 from 'libwindowndkapi20.so';
import Utils from "../common/Utils";
import { Driver, ON } from "@kit.TestKit";
import { display, floatingBall, window } from "@kit.ArkUI";
import { BusinessError, settings } from "@kit.BasicServicesKit";
import { abilityAccessCtrl, common, PermissionRequestResult, Permissions } from "@kit.AbilityKit";

const CAN_NOT_BUILD_STAGE = -1;
const OK = 0;
const WINDOW_MANAGER_ERRORCODE_NO_PERMISSION = 201;
const WINDOW_MANAGER_ERRORCODE_INVALID_PARAM = 401;
const INVAILD_WINDOW_ID = 1000;
const WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL = 1300002;
const WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL = 1300003;
const WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM = 0;
const WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT = 1;
const WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE = 2;
const WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD = 3;
const WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR = 4;
const WINDOW_MANAGER_WINDOW_TYPE_APP = 0;
const WINDOW_MANAGER_WINDOW_TYPE_MAIN = 1;
const WINDOW_MANAGER_WINDOW_TYPE_FLOAT = 8;
const WINDOW_MANAGER_WINDOW_TYPE_DIALOG = 16;

let sleep = (sleepMs: number) => new Promise<string>(resolve => setTimeout(resolve, sleepMs));

function getPermision(){
  let atManager:abilityAccessCtrl.AtManager = abilityAccessCtrl.createAtManager();
  let context : common.UIAbilityContext = AppStorage.get('context') as common.UIAbilityContext;
  let permissions: Permissions[] =
    ["ohos.permission.CUSTOM_SCREEN_CAPTURE"];
  atManager.requestPermissionsFromUser(context,permissions,(err:BusinessError,data:PermissionRequestResult)=>{
    if(err){
      console.error('capture requestPermissionsFromUser failed: ' + JSON.stringify(err));
    }else {
      console.info('capture requestPermissionsFromUser success: ' + JSON.stringify(data));
    }
  })
}

async function ClickButtonDriver(){
  console.info(`come in permissionClick`);
  let driver: Driver = Driver.create();
  console.info(`come in Driver create`);
  let buttonOne = await driver.findComponent(ON.text('允许'));
  console.info(`buttonOne is ${JSON.stringify(buttonOne)}`);
  if (buttonOne != undefined) {
    await buttonOne.click();
  }
}

export default function WindowTest() {
  describe('WindowTest', () => {
    let context: common.UIAbilityContext;
    let windowStage: window.WindowStage;
    let isPCStatus: string = '';
    let isAutoWindow: string = '';
    beforeAll(async (done: Function) => {
      context = AppStorage.get('context') as common.UIAbilityContext;
      console.log('windowTest context: ' + JSON.stringify(context));
      windowStage = AppStorage.get('windowStage') as window.WindowStage;
      //isAutoWindow == '' 非PAD设备
      //isAutoWindow == 'true' PAD设备自由多窗模式
      //isAutoWindow == 'false' PAD设备非自由多窗模式
      isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.USER_PROPERTY);
      console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
      isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
      //isPCStatus == '' 非PC设备
      //isPCStatus == '1' PC设备状态栏dock未融合
      //isPCStatus == '0' PC设备状态栏dock融合
      console.info(`beforeAll isPCStatus: `+ isPCStatus);
      await getPermision();
      await sleep(300);
      await ClickButtonDriver();
      await sleep(200);
      await Utils.pushPageNoClear("Window/Window", done);
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100
     * @tc.name    : testGetWindowAvoidAreaInvalidParam
     * @tc.desc    : Test get GetWindowAvoidAreaInvalidParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWAVOIDAREA_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100
     * @tc.name    : testIsWindowShownInvalidParam
     * @tc.desc    : Test get IsWindowShownInvalidParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testIsWindowShownInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100 start<====`);
        let Result: number = windowndkapi20.IsWindowShownInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_ISWINDOWSHOWN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100
     * @tc.name    : testSetWindowPrivacyModeNoPermission
     * @tc.desc    : Test get SetWindowPrivacyModeNoPermission's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSetWindowPrivacyModeNoPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100 start<====`);
        let Result: number = windowndkapi20.SetWindowPrivacyModeNoPermission();
        expect(WINDOW_MANAGER_ERRORCODE_NO_PERMISSION).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SETWINDOWPRIVACYMODE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100
     * @tc.name    : testGetWindowPropertiesInvalidParam
     * @tc.desc    : Test get GetWindowPropertiesInvalidParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowPropertiesInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowPropertiesInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETWINDOWPROPERTIES_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100
     * @tc.name    : testSnapshotOk
     * @tc.desc    : Test get SnapshotOk's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSnapshotOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100 start<====`);
        let Result: number = windowndkapi20.SnapshotOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200
     * @tc.name    : testSnapshotInvalidParam
     * @tc.desc    : Test get SnapshotInvalidParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testSnapshotInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200 start<====`);
        let Result: number = windowndkapi20.SnapshotInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_SNAPSHOT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100
     * @tc.name    : testGetAllWindowLayoutInfoListParameterOverride
     * @tc.desc    : Test get GetAllWindowLayoutInfoListParameterOverride's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetAllWindowLayoutInfoListParameterOverride', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100 start<====`);
        let Result: number = windowndkapi20.GetAllWindowLayoutInfoListParameterOverride();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200
     * @tc.name    : testGetAllWindowLayoutInfoListOkOrDeviceNotSupported
     * @tc.desc    : Test get GetAllWindowLayoutInfoListOkOrDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetAllWindowLayoutInfoListOkOrDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200 start<====`);
        let Result: number = windowndkapi20.GetAllWindowLayoutInfoListOkOrDeviceNotSupported();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_GETALLWINDOWLAYOUTINFOLIST_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200
     * @tc.name    : testInjectTouchEventSystemAbnormal
     * @tc.desc    : Test get InjectTouchEventSystemAbnormal's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testInjectTouchEventSystemAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200 start<====`);
        let Result: number = windowndkapi20.InjectTouchEventSystemAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OH_WINDOWMANAGER_INJECTTOUCHEVENT_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_OK_0100
     * @tc.name    : testWindowManagerErrorCodeOk
     * @tc.desc    : Test get WindowManagerErrorCodeOk's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeOk', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_OK_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeOk();
        expect(OK).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_OK_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100
     * @tc.name    : testWindowManagerErrorCodeNoPermission
     * @tc.desc    : Test get WindowManagerErrorCodeNoPermission's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeNoPermission', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeNoPermission();
        expect(WINDOW_MANAGER_ERRORCODE_NO_PERMISSION).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_NO_PERMISSION_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100
     * @tc.name    : testWindowManagerErrorCodeInvalidParam
     * @tc.desc    : Test get WindowManagerErrorCodeInvalidParam's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeInvalidParam', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeInvalidParam();
        expect(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_INVALID_PARAM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100
     * @tc.name    : testWindowManagerErrorCodeDeviceNotSupported
     * @tc.desc    : Test get WindowManagerErrorCodeDeviceNotSupported's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeDeviceNotSupported', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeDeviceNotSupported();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_DEVICE_NOT_SUPPORTED_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100
     * @tc.name    : testWindowManagerErrorCodeInvalidWindowId
     * @tc.desc    : Test get WindowManagerErrorCodeInvalidWindowId's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeInvalidWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeInvalidWindowId();
        expect(INVAILD_WINDOW_ID).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_INVAILD_WINDOW_ID_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100
     * @tc.name    : testWindowManagerErrorCodeStateAbnormal
     * @tc.desc    : Test get WindowManagerErrorCodeStateAbnormal's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeStateAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeStateAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_STATE_ABNORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100
     * @tc.name    : testWindowManagerErrorCodeSystemAbnormal
     * @tc.desc    : Test get WindowManagerErrorCodeSystemAbnormal's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testWindowManagerErrorCodeSystemAbnormal', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100 start<====`);
        let Result: number = windowndkapi20.WindowManagerErrorCodeSystemAbnormal();
        expect(WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_ERRORCODE_SYSTEM_ABNORMAL_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100
     * @tc.name    : testGetWindowAvoidAreaType0100
     * @tc.desc    : Test get GetWindowAvoidAreaType0100's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaType0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(0);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100
     * @tc.name    : testGetWindowAvoidAreaType0200
     * @tc.desc    : Test get GetWindowAvoidAreaType0200's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaType0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(1);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_CUTOUT_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100
     * @tc.name    : testGetWindowAvoidAreaType0300
     * @tc.desc    : Test get GetWindowAvoidAreaType0300's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaType0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(2);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_SYSTEM_GESTURE_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100
     * @tc.name    : testGetWindowAvoidAreaType0400
     * @tc.desc    : Test get GetWindowAvoidAreaType0400's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaType0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(3);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_KEYBOARD_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100
     * @tc.name    : testGetWindowAvoidAreaType0500
     * @tc.desc    : Test get GetWindowAvoidAreaType0500's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowAvoidAreaType0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100 start<====`);
        let Result: number = windowndkapi20.GetWindowAvoidAreaType(4);
        expect(WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_AVOID_AREA_TYPE_NAVIGATION_INDICATOR_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100
     * @tc.name    : testGetWindowType0100
     * @tc.desc    : Test get GetWindowType0100's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowType0100', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100 start<====`);
        let button = await Utils.driver.findComponent(ON.text("SubWindow-Type: APP").id("APPSubWindow"));
        await button.click();
        await Utils.sleep(100);
        let subWindow = (globalThis.subWindow as window.Window).getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(0, subWindow.id);
        await Utils.destroySubWindow();
        expect(WINDOW_MANAGER_WINDOW_TYPE_APP).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_APP_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100
     * @tc.name    : testGetWindowType0200
     * @tc.desc    : Test get GetWindowType0200's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowType0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100 start<====`);
        let mainWindow = (globalThis.windowStage as window.WindowStage).getMainWindowSync().getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(1, mainWindow.id);
        expect(WINDOW_MANAGER_WINDOW_TYPE_MAIN).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_MAIN_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100
     * @tc.name    : testGetWindowType0400
     * @tc.desc    : Test get GetWindowType0400's result.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testGetWindowType0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100 start<====`);
        let button = await Utils.driver.findComponent(ON.text("SubWindow-Type: Dialog").id("DialogSubWindow"));
        await button.click();
        await Utils.sleep(100);
        let subWindow = (globalThis.subWindow as window.Window).getWindowProperties();
        let Result: number = windowndkapi20.GetWindowType(16, subWindow.id);
        expect(WINDOW_MANAGER_WINDOW_TYPE_DIALOG).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_ARKUI_ACE_ENGINE_WINDOW_MANAGER_WINDOW_TYPE_DIALOG_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })
    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100
     * @tc.name    : testRegisterMouseEventFilterOkOrServiceError
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterMouseEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterMouseEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200
     * @tc.name    : testRegisterMouseEventFilterInvaildWindowId
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterMouseEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterMouseEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERMOUSEEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100
     * @tc.name    : testUnregisterMouseEventFilterOkOrServiceError
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterMouseEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterMouseEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200
     * @tc.name    : testUnregisterMouseEventFilterInvaildWindowId
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterMouseEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterMouseEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERMOUSEEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100
     * @tc.name    : testRegisterTouchEventFilterOkOrServiceError
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterTouchEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.RegisterTouchEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200
     * @tc.name    : testRegisterTouchEventFilterInvaildWindowId
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testRegisterTouchEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.RegisterTouchEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_REGISTERTOUCHEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100
     * @tc.name    : testUnregisterTouchEventFilterOkOrServiceError
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterTouchEventFilterOkOrServiceError', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100 start<====`);
        let Result: number = windowndkapi20.UnregisterTouchEventFilterOkOrServiceError();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0100 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })

    /**
     * @tc.number  : SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200
     * @tc.name    : testUnregisterTouchEventFilterInvaildWindowId
     * @tc.desc    : Test get native xcomopnent key event action works.
     * @tc.level   : LEVEL1
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('testUnregisterTouchEventFilterInvaildWindowId', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      try {
        console.info(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200 start<====`);
        let Result: number = windowndkapi20.UnregisterTouchEventFilterInvaildWindowId();
        expect(1).assertEqual(Result);
        done()
      } catch (err) {
        console.error(`====>SUB_WINDOW_MANAGER_OH_NATIVEWINDOWMANAGER_UNREGISTERTOUCHEVENTFILTER_0200 catch err: ` + err);
        expect(false).assertEqual(err);
        done()
      }
    })


    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200
     * @tc.name    : test_OH_WindowManager_GetAllMainWindowInfo_0200
     * @tc.desc    : OH_WindowManager_GetAllMainWindowInfo测试返回值覆盖
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetAllMainWindowInfo_0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 windowId: ${windowId}`);
          let displayId = display.getDefaultDisplaySync().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 displayId: ${displayId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetAllMainWindowInfo_0200(windowId, displayId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_WINDOWINFO_TEST_0200 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0200
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0200
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0200', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0200();
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0200 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0300
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0300
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0300', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0300(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0300 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0400
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0400
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0400', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0400(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0400 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0500
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0500
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0500', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0500();
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0500 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0600
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0600
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0600', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0600(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 Result: ${Result}`);
          expect(Result).assertEqual(WINDOW_MANAGER_ERRORCODE_INVALID_PARAM);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0600 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0700
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0700
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0700', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0700(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0700 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

    /**
     * @tc.number  : SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800
     * @tc.name    : test_OH_WindowManager_GetMainWindowSnapshot_0800
     * @tc.desc    : test_OH_WindowManager_GetMainWindowSnapshot_0800
     * @tc.level   : LEVEL0
     * @tc.size    : MediumTest
     * @tc.type    : Function
     */
    it('test_OH_WindowManager_GetMainWindowSnapshot_0800', TestType.FUNCTION |
    Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      if (isPCStatus != '') {
        try {
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 start<====`);
          let windowClass = windowStage.getMainWindowSync();
          let windowId = windowClass.getWindowProperties().id;
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 windowId: ${windowId}`);
          let Result: number = windowndkapi20.test_OH_WindowManager_GetMainWindowSnapshot_0800(windowId);
          console.info(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 Result: ${Result}`);
          expect(Result).assertEqual(OK);
          done()
        } catch (err) {
          console.error(`====>SUB_BASIC_WMS_NDK_GET_MAIN_WINDOW_SNAPSHOT_TEST_0800 catch err: ` + err);
          expect(false).assertEqual(err);
          done()
        }
      } else {
        done()
      }
    })

  })
}