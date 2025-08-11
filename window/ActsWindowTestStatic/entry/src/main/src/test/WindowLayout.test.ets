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
import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';

import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
// import { MyCallback } from '../models/MyCallback';
import window from '@ohos.window'
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage , LocalStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
// import  { LocalStorage }  from '@ohos.LocalStorage';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowLayoutTest() {

    describe("WindowLayoutTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowLayoutTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //hilog.info(domain, tag,'windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
                // let win = windowStage.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //hilog.info(domain, tag,`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //hilog.info(domain, tag,`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0100
         * @tc.name      : testOnOffWindowStatusChange_OnSubWindow_static_0100
         * @tc.desc      : Enable listening for window mode changes
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
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
                (subWin as window.Window).on('windowStatusChange', callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                (subWin as window.Window).off('windowStatusChange', callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                (subWin as window.Window).off('windowStatusChange');
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            await (subWin as window.Window).destroyWindow();
            done();
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOW_STATUS_CHANGE_JS_API_0200
         * @tc.name      : testOnOffWindowStatusChange_OnMainWindow_static_0200
         * @tc.desc      : Enable listening for window mode changes
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
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
                mainWin.on('windowStatusChange', callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                mainWin.off('windowStatusChange', callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister for window status changes.');
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            try {
                mainWin.off('windowStatusChange');
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in unregister all for window status changes');;
            } catch (exception: BusinessError) {
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + `Failed to unregister callback. Cause code: ${exception.code}, message: ${exception.message}`);
                    expect().assertFail();
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager')
                    hilog.info(0x0000, '[ANI]',msgStr + JSON.stringify(exception))
                    expect(exception.code).assertEqual(801);
                }
            }
            done();
        })







    })

}