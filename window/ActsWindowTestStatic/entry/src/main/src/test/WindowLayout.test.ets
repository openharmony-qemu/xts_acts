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
                (subWin as window.Window).onWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception: BusinessError) {
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
            } catch (exception: BusinessError) {
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
            } catch (exception: BusinessError) {
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
                mainWin.onWindowStatusChange(callback);
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in enabling the listener for window status changes.');
            } catch (exception: BusinessError) {
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
            } catch (exception: BusinessError) {
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
            } catch (exception: BusinessError) {
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
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SHOWWINDOW_JS_API_0100
         * @tc.name      : testShowWindow_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : show window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
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
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_SHOWWINDOW_JS_API_0200
         * @tc.name      : testShowWindow_WindowStateAbnormal_Promise_static_0100
         * @tc.desc      : show window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testShowWindow_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testShowWindow_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testShowWindow_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let promise = win.showWindow();
            promise.then(() => {
                hilog.info(0x0000, '[ANI]', caseName +' Succeeded in showing the window.');
                expect(false).assertTrue();
                done();
            }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]', caseName +` Failed to show the window. Cause code: ${err.code}, message: ${err.message}`);
                expect(err!.code).assertEqual(1300002);
                done();
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DESTROYWINDOW_JS_API_0100
         * @tc.name      : testDestroyWindow_WindowStateAbnormal_Promise_static_0100
         * @tc.desc      : destroy window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDestroyWindow_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testDestroyWindow_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testDestroyWindow_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            (win as window.Window).destroyWindow().then(() => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in destroying the window.');
                expect(false).assertTrue();
                done();
            }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to destroy the window. Cause: ' + JSON.stringify(err));
                expect(err.code).assertEqual(1300002);
                done();
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DESTROYWINDOW_JS_API_0200
         * @tc.name      : testDestroyWindow_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : destroy window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDestroyWindow_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testDestroyWindow_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testDestroyWindow_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            win.destroyWindow((err: BusinessError<void>|null):void => {
                const errCode: number = err!.code;
                if (errCode) {
                    hilog.error(0x0000, '[ANI]',`Failed to destroy the window. Cause code: ${err!.code}, message: ${err!.message}`);
                    expect(err!.code).assertEqual(1300002);
                    done();
                    return;
                }
                hilog.info(0x0000, '[ANI]','Succeeded in destroying the window.');
                expect(false).assertTrue();
                done();
            });
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_MOVEWINDOWTO_JS_API_0100
         * @tc.name      : testMoveWindowTo_WindowStateAbnormal_Promise_static_0100
         * @tc.desc      : Move window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testMoveWindowTo_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testMoveWindowTo_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).moveWindowTo(300, 300).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in moving the window.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause: ' + JSON.stringify(err));
                    expect(err.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
                expect(exception.code).assertEqual(1300002);
                done();
            }
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_MOVEWINDOWTO_JS_API_0200
         * @tc.name      : testMoveWindowTo_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : Move window windowStateAbnormal
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testMoveWindowTo_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testMoveWindowTo_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testMoveWindowTo_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).moveWindowTo(300, 300, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in moving the window.');
                    expect(false).assertTrue();
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to move the window. Cause:' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done()
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RESIZE_JS_API_0100
         * @tc.name      : testResize_WindowStateAbnormal_Promise_static_0100
         * @tc.desc      : Change the current window size
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testResize_WindowStateAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let caseName :string = 'testResize_WindowStateAbnormal_Promise_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testResize_WindowStateAbnormal_Promise_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).resize(500, 1000).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in changing the window size.');
                    expect(false).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_RESIZE_JS_API_0200
         * @tc.name      : testResize_WindowStateAbnormal_Callback_static_0100
         * @tc.desc      : Change the current window size
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testResize_WindowStateAbnormal_Callback_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testResize_WindowStateAbnormal_Callback_static_0100';
            let msgStr :string ='jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testResize_WindowStateAbnormal_Callback_static_0100');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            try {
                (win as window.Window).resize(500, 1000, (err: BusinessError<void>|null):void => {
                    const errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002);
                        done();
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in changing the window size.');
                    expect(false).assertTrue();
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to change the window size. Cause:' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number     : testGetGlobalRectErrCode1300002_0100
         * @tc.name       : testGetGlobalRectErrCode1300002_static_0100
         * @tc.desc       : testGetGlobalRectErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testGetGlobalRectErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = "testGetGlobalRectErrCode1300002_static_0100";
            let msgStr :string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testGetGlobalRectErrCode1300002_static_0100')
                .then((data:window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    try {
                        subWin!.getGlobalRect();
                        hilog.error(0x0000, '[ANI]',msgStr + 'Succeeded in calling getGlobalRect.');
                        expect(false).assertTrue();
                        done()
                    } catch (e: BusinessError) {
                        hilog.info(0x0000, '[ANI]',msgStr + 'Failed to call getGlobalRect. Cause:' + JSON.stringify(e));
                        expect(e!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_DET_GLOBAL_RECT_0100
         * @tc.name      : testgetGlobalRect_static_0200
         * @tc.desc      : get the global rect.
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('testgetGlobalRect_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName :string = 'testgetGlobalRect_static_0200';
            try {
                let windowClass:window.Window = windowStage.getMainWindowSync();
                let rect :window.Rect = windowClass.getGlobalRect();
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in getting global rect: ${JSON.stringify(rect)}`);
                expect(rect.left != null).assertTrue();
                expect(rect.top != null).assertTrue();
                expect(rect.width).assertLarger(0);
                expect(rect.height).assertLarger(0);
                done();
            } catch (exception: BusinessError) {
                if (exception!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName} The current device type does not support to getting the global rect.`);
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName} Error. Cause code: ${exception!.code}, message: ${exception!.message}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number    : test_startMoving_ErrorCode_1300002
         * @tc.name      : test_startMoving_ErrorCode_1300002_static_0100
         * @tc.desc      : test_startMoving_ErrorCode_1300002
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it('test_startMoving_ErrorCode_1300002_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let CaseName:string = 'test_startMoving_ErrorCode_1300002_static_0100';
            let subWindow = await windowStage.createSubWindow('test_startMoving_ErrorCode_1300002_static_0100');
            await Utils.msSleep(200);
            await subWindow.destroyWindow();
            try {
                let promise = subWindow.startMoving(100,50);
                promise.then(()=>{
                    hilog.info(0x0000, '[ANI]',CaseName + ' startMoving success ');
                    expect(false).assertTrue();
                    done();
                }).catch((err:BusinessError):PromiseLike<void>|undefined=>{
                    hilog.error(0x0000, '[ANI]',CaseName + ' startMoving failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                    expect(err!.code).assertEqual(1300002);
                    done();
                })
            }catch (err:BusinessError) {
                hilog.error(0x0000, '[ANI]',CaseName + ' failed,casued: err.code '+err.code +' ,err.message: '+err.message);
                expect(false).assertTrue();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_START_MOVING_0100
         * @tc.name      : test_startMoving_mainWindow_static_0200
         * @tc.desc      : test_startMoving_mainWindow
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('test_startMoving_mainWindow_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_startMoving_mainWindow_static_0200';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                let mainWindow = windowStage.getMainWindowSync();
                let promise = mainWindow.startMoving(100, 50)
                promise.then(() => {
                    hilog.info(0x0000, '[ANI]',`${caseName} :Succeeded startMoving ` );
                    expect(true).assertTrue();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',`${caseName} :Failed to startMoving. Cause code: ${err.code}, message: ${err.message}`);
                    if(err!.code == 801){
                        done();
                    }else {
                        expect(false).assertTrue();
                        done();
                    }
                });
            } catch (err: BusinessError) {
                hilog.error(0x0000, '[ANI]',`${caseName} :Failed . Cause code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();

            }

        });
        /**
         * @tc.number     : testStartMovingPromiseErrCode1300002_0100
         * @tc.name       : testStartMovingPromiseErrCode1300002_static_0300
         * @tc.desc       : testStartMovingPromiseErrCode1300002_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testStartMovingPromiseErrCode1300002_static_0300', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = "testStartMovingPromiseErrCode1300002_static_0300";
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            let subWin: window.Window;
            windowStage.createSubWindow('testStartMovingPromiseErrCode1300002_SubWindow_Promise')
                .then((data: window.Window) => {
                    subWin = data;
                    expect(!!subWin).assertTrue();
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in creating the window. Data:' + JSON.stringify(data));
                    await (subWin! as window.Window).destroyWindow();
                    await Utils.msSleep(200);
                    try {
                        (subWin! as window.Window).startMoving().then( () => {
                            hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in calling startMoving.');
                            expect(false).assertTrue();
                        }).catch( (err: BusinessError) :PromiseLike<void>|undefined=> {
                            hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call startMoving. Cause: ' + JSON.stringify(err));
                            expect(false).assertTrue();
                        });
                        done()
                    } catch (exception: BusinessError) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the call startMoving. Cause:' + JSON.stringify(exception));
                        expect(exception!.code).assertEqual(1300002);
                        done()
                    }
                })
                .catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow failed error: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                });
            
        })
        /**
         * @tc.number     : testOnWindowHighlightChangeErrCode1300002_0100
         * @tc.name       : testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.desc       : testOnWindowHighlightChangeErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testOnWindowHighlightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnWindowHighlightChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOnWindowHighlightChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.on('windowHighlightChange', (data) => {
                    console.info(msgStr +  'on windowHighlightChange callback' + JSON.stringify(data));
                });
                hilog.info(domain, tag,msgStr + 'window.on_windowHighlightChange success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to on_windowHighlightChange. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })

        /**
         * @tc.number     : testOffWindowHighlightChangeErrCode1300002_0100
         * @tc.name       : testOffWindowHighlightChangeErrCode1300002_static_0100
         * @tc.desc       : testOffWindowHighlightChangeErrCode1300002_static_0100
         * @tc.size       : MediumTest
         * @tc.type       : Function
         * @tc.level      : Level 3
         */
        it('testOffWindowHighlightChangeErrCode1300002_static_0100', Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOffWindowHighlightChangeErrCode1300002_static_0100";
            let msgStr : string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin.');
            try {
                let tempWnd: window.Window = await windowStage.createSubWindow('testOffWindowHighlightChangeErrCode1300002_static_0100')
                hilog.info(domain, tag,msgStr + 'windowStage.createSubWindow success');
                await Utils.msSleep(300);
                expect(!!tempWnd).assertTrue();
                await tempWnd.destroyWindow();
                hilog.info(domain, tag,msgStr + 'window.destroy success');
                tempWnd.off('windowHighlightChange', (data) => {
                    console.info(msgStr +  'on windowHighlightChange callback' + JSON.stringify(data));
                });
                hilog.info(domain, tag,msgStr + 'window.on_windowHighlightChange success');
                expect(false).assertTrue();
                done()
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to call createWindow. Cause:' + JSON.stringify(exception));
                if (exception.code != 801) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to on_windowHighlightChange. Cause code:' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(1300002);
                } else {
                    hilog.error(0x0000, '[ANI]',msgStr + '当前设备类型不支持系统能力SystemCapability.Window.SessionManager' + JSON.stringify(exception));
                    expect(exception.code).assertEqual(801);
                }
                done()
            }
        })
        /**
         * @tc.number    : testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.name      : testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.desc      : testOnRectChangeOptionsMoveErrorCode1300002_static_0100
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnRectChangeOptionsMoveErrorCode1300002_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName : string = "testOnRectChangeOptionsMoveErrorCode1300002_static_0100" ;
            try {
                let subWindowClass : window.Window = await windowStage.createSubWindow("TestOnRectChangeOptionsMove");
                hilog.info(0x0000, '[ANI]', `${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.showWindow();
                await Utils.msSleep(1000);
                subWindowClass.onWindowRectChange((data : window.RectChangeOptions) => {
                    hilog.info(0x0000, '[ANI]',`${caseName}: Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    hilog.info(0x0000, '[ANI]',`${caseName}: Succeeded window reason changes. reason: ${JSON.stringify(data.reason)}`);
                    expect(data!.rect.left).assertEqual(300);
                    expect(data!.rect.top).assertEqual(300);
                    subWindowClass.offWindowRectChange();
                    subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.moveWindowTo(300, 300);
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in moving the window.`);
            } catch (error: BusinessError) {
                if (error!.code == 1300002) {
                    hilog.error(0x0000, '[ANI]',`${caseName} This window state is abnormal`);
                    done();
                } else if (error!.code == 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName} The current device type does not support to windowRectChange`);
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName}: Error: ${JSON.stringify(error)}`);
                    expect(false).assertTrue();
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0900
         * @tc.name      : testOnRectChangeOptionsResizeSubWindow_static_0100
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testOnRectChangeOptionsResizeSubWindow_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = "TestOnRectChangeOptionsResizeSubWindow_static_0100";
            try {
                let subWindowClass:window.Window = await windowStage.createSubWindow("TestOnRectChangeOptionsResizeSubWindow_static_0100");
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in creating the sub window.`);
                await subWindowClass.setUIContent('pages/index2');
                await subWindowClass.showWindow();
                await Utils.msSleep(1000);
                subWindowClass.onWindowSizeChange(data:window.Size) => {
                    hilog.info(0x0000, '[ANI]',`${caseName} Succeeded window rect changes. Data: ${JSON.stringify(data)}`);
                    expect(data.width).assertEqual(500);
                    expect(data.height).assertEqual(500);
                    subWindowClas.offWindowSizeChange();
                    subWindowClass.destroyWindow();
                    done();
                });
                await subWindowClass.resize(500, 500);
                hilog.info(0x0000, '[ANI]',`${caseName} Succeeded in changing the sub window size.`);
            } catch (error: BusinessError) {
                hilog.error(0x0000, '[ANI]',`${caseName}: Error: ${JSON.stringify(error)}`);
                expect(false).assertTrue();
                done();
            }
        })

/**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWRECTCJANGE_JS_API_0100
         * @tc.name      : testRectChangeOptions_off_static_0100
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testRectChangeOptions_off_static_0100", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let msgStr:string = "testRectChangeOptions_off_static_0100";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                let windowClass: window.Window = await windowStage.createSubWindow("testRectChangeOptions_off_static_0100");
                await windowClass.destroyWindow();
                windowClass.offWindowRectChange());
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded window rect changes');
                expect(false).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                if (error!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${msgStr} The current device type does not support to windowRectChange`);
                    done();
                } else  {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                    expect(error!.code).assertEqual(1300002);
                    done();
                }
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_WINDOWRECTCJANGE_JS_API_0200
         * @tc.name      : testRectChangeOptions_on_static_0200
         * @tc.desc      : Test the function value of testRectChangeOptions
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level3
         */
        it("testRectChangeOptions_on_static_0200", TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>{
            let msgStr:string = "testRectChangeOptions_on_static_0200";
            hilog.info(0x0000, '[ANI]',msgStr + "begin");
            try {
                let windowClass: window.Window = await windowStage.createSubWindow("testRectChangeOptions_on_static_0200");
                await windowClass.destroyWindow();
                windowClass.onWindowRectChange((data: window.RectChangeOptions) => {
                    hilog.info(0x0000, '[ANI]',`Succeeded window rect changes. Data: ` + JSON.stringify(data));
                });
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded window rect changes');
                expect(false).assertTrue();
                done();
            } catch (error: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                if (error!.code === 801) {
                    hilog.error(0x0000, '[ANI]',`${msgStr} The current device type does not support to windowRectChange`);
                    done();
                } else  {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to window rect changes.Data: ' + JSON.stringify(error));
                    expect(error!.code).assertEqual(1300002);
                    done();
                }
            }
        })


    })

}