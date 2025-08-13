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
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
import common from '@ohos.app.ability.common';
let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function WindowOrientationTest() {

    describe("WindowOrientationTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowOrientationTest describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        let context: common.UIAbilityContext;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //console.log('windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage',Type.from<window.WindowStage>()) as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow',Type.from<window.Window>()) as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context',Type.from<common.UIAbilityContext>()) as common.UIAbilityContext;
                // let win = windowStage.getMainWindowSync();
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus == '' 非PC设备
            //isPCStatus == '1' PC设备状态栏dock未融合
            //isPCStatus == '0' PC设备状态栏dock融合
            //console.info(`beforeAll isPCStatus: `+ isPCStatus);
        })




        /**
         * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1090
         * @tc.name			testWindowOrientation_Enum_Value_static_0100
         * @tc.desc			To test the enum value of Orientation.
         */
        it('testWindowOrientation_Enum_Value_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let msgStr:string = 'setOutsideTouchable_Test_004_static_0100';
            hilog.info(0x0000, '[ANI]',msgStr + ' begin');
            try {
                expect(0).assertEqual(window.Orientation.UNSPECIFIED);
                expect(1).assertEqual(window.Orientation.PORTRAIT);
                expect(2).assertEqual(window.Orientation.LANDSCAPE);
                expect(3).assertEqual(window.Orientation.PORTRAIT_INVERTED);
                expect(4).assertEqual(window.Orientation.LANDSCAPE_INVERTED);
                expect(5).assertEqual(window.Orientation.AUTO_ROTATION);
                expect(6).assertEqual(window.Orientation.AUTO_ROTATION_PORTRAIT);
                expect(7).assertEqual(window.Orientation.AUTO_ROTATION_LANDSCAPE);
                expect(8).assertEqual(window.Orientation.AUTO_ROTATION_RESTRICTED);
                expect(9).assertEqual(window.Orientation.AUTO_ROTATION_PORTRAIT_RESTRICTED);
                expect(10).assertEqual(window.Orientation.AUTO_ROTATION_LANDSCAPE_RESTRICTED);
                expect(11).assertEqual(window.Orientation.LOCKED);
                expect(12).assertEqual(window.Orientation.AUTO_ROTATION_UNSPECIFIED);
                expect(13).assertEqual(window.Orientation.USER_ROTATION_PORTRAIT);
                expect(14).assertEqual(window.Orientation.USER_ROTATION_LANDSCAPE);
                expect(15).assertEqual(window.Orientation.USER_ROTATION_PORTRAIT_INVERTED);
                expect(16).assertEqual(window.Orientation.USER_ROTATION_LANDSCAPE_INVERTED);
                expect(17).assertEqual(window.Orientation.FOLLOW_DESKTOP);
                done();
            } catch (err: BusinessError) {
                hilog.info(0x0000, '[ANI]',msgStr + 'test enum value of windowStageEventType error ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGETWO_JS_API_0050
         * @tc.name      : testRectChangeReason_enum_static_0100
         * @tc.desc      : Test the function value of RectChangeReason
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
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
            } catch (error: BusinessError) {
                hilog.info(0x0000, '[ANI]',msgStr + 'Failed to testRectChangeReason_enum' + JSON.stringify(error));
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2840
         * @tc.name      : testSetPreferredOrientation_WinAbnormal_Promise_static_0100
         * @tc.desc      : Set the display direction property of the window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetPreferredOrientation_WinAbnormal_Promise_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string  = 'testSetPreferredOrientation_WinAbnormal_Promise_static_0100';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetPreferredOrientation_WinAbnormal_Promise');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let orientation = window.Orientation.AUTO_ROTATION;
            try {
                (win as window.Window).setPreferredOrientation(orientation).then(() => {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting the window orientation.');
                    expect().assertFail();
                    done();
                }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set the window orientation. Cause: ' + JSON.stringify(err));
                    expect(err!.code).assertEqual(1300002);
                    done();
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002);
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_2850
         * @tc.name      : testSetPreferredOrientation_WinAbnormal_Call_static_0200
         * @tc.desc      : Set the display direction property of the window
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testSetPreferredOrientation_WinAbnormal_Call_static_0200', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string  = 'testSetPreferredOrientation_WinAbnormal_Call_static_0200';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let win: window.Window;
            win = await windowStage.createSubWindow('testSetPreferredOrientation_WinAbnormal_Call');
            hilog.info(0x0000, '[ANI]',msgStr + 'windowStage.createSubWindow success');
            expect(!!win).assertTrue();
            await (win as window.Window).destroyWindow();
            let orientation = window.Orientation.AUTO_ROTATION;
            try {
                (win as window.Window).setPreferredOrientation(orientation, (err: BusinessError<void>|null):void => {
                    let errCode: number = err!.code;
                    if (errCode) {
                        hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(err));
                        expect(err!.code).assertEqual(1300002)
                        done()
                        return;
                    }
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in setting window orientation.');
                    expect().assertFail();
                    done()
                });
            } catch (exception: BusinessError) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to set window orientation. Cause: ' + JSON.stringify(exception));
                expect(exception!.code).assertEqual(1300002)
                done()
            }
        })







    })

}