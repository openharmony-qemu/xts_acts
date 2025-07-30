
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
 */import { describe, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import Utils from './Util.test';
import display from '@ohos.display';
import { BusinessError } from '@ohos.base';
import window from '@ohos.window'
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback} from '@ohos.base'
let domain: number = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

export default function DisplayTest() {

    describe("DisplayTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'describe start');
        let windowStage: window.WindowStage;
        let win: window.Window;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(() => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //console.log('windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage',Type.from<window.WindowStage>()) as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow',Type.from<window.Window>()) as window.Window;
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
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0440
         * @tc.name      : tesGetAllDisplays_Callback_static_0100
         * @tc.desc      : Gets all current display objects
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('tesGetAllDisplays_Callback_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName:string = 'tesGetAllDisplays_Callback_static_0100';
            let msgStr:string  = 'jsunittest ' + caseName + ' ';
            let diaplays:Array<display.Display> | undefined;
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            display.getAllDisplays((err: BusinessError<void> | null, data: Array<display.Display> | undefined): void => {
                if (err && err.code) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'Failed to obtain all the display objects. Code: ' + JSON.stringify(err));
                    try {
                        expect().assertFail();
                    } catch (error: Error) {
                        hilog.info(0x0000, '[ANI]',`display.getAllDisplays catch error: ${JSON.stringify(error)}`);
                    }
                    done();
                    return;
                }
                diaplays = data;
                hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in obtaining all the display objects. Data: ' + JSON.stringify(data));
                expect(data![0].refreshRate != null).assertTrue();
                expect(data![0].width != null).assertTrue();
                expect(data![0].height != null).assertTrue();
                expect(data![0].rotation != null).assertTrue();
                expect(data![0].densityDPI != null).assertTrue();
                expect(data![0].name != null).assertTrue();
                expect(data![0].alive).assertTrue();
                expect(data![0].state != null).assertTrue();
                expect(data![0].densityPixels != null).assertTrue();
                expect(data![0].scaledDensity != null).assertTrue();
                // expect(data![0].xDPI != null).assertTrue();
                // expect(data![0].yDPI != null).assertTrue();
                // expect((data![0].screenShape == 0) || (data![0].screenShape == 1)).assertTrue();
                done();

            });
        });

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4230
         * @tc.name      : testDisplayOffFoldStatusChange_RepeatOff_static_0100
         * @tc.desc      : Enable the monitoring of the folding status change of the folding device
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffFoldStatusChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> =>  {
            let caseName:string = 'testDisplayOffFoldStatusChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<display.FoldStatus> = (data: display.FoldStatus) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.on('foldStatusChange', callback);
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("foldStatusChange");
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("foldStatusChange");
                done();
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4240
         * @tc.name      : testDisplayOffFoldStatusChange_UnregisteredOff_static_0100
         * @tc.desc      : Enable the monitoring of the folding status change of the folding device
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffFoldStatusChange_UnregisteredOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffFoldStatusChange_UnregisteredOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            try {
                display.off("foldStatusChange");
                done();
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4250
         * @tc.name      : testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100
         * @tc.desc      : Turn off monitoring for screen display mode changes on folding devices
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffFoldDisplayModeChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<display.FoldDisplayMode> = (data: display.FoldDisplayMode) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.on('foldDisplayModeChange', callback);
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("foldDisplayModeChange");
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("foldDisplayModeChange");
                done();
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1160
         * @tc.name      : testGetCurrentFoldCreaseRegion_Test_static_0100
         * @tc.desc      : TTo test the function of getCurrentFoldCreaseRegion
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('testGetCurrentFoldCreaseRegion_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'testGetCurrentFoldCreaseRegion_Test_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                let region:display.FoldCreaseRegion = display.getCurrentFoldCreaseRegion();
                hilog.info(0x0000, '[ANI]',tag + "region : " + JSON.stringify(region))
                if (region != null) {
                    expect(region.displayId != null).assertTrue()
                    expect(region.creaseRects != null).assertTrue()
                    done()
                } else {
                    expect(true).assertTrue();
                    done();
                }
            } catch (err) {
                hilog.error(0x0000, '[ANI]',tag + 'getCurrentFoldCreaseRegion failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number : SUB_BASIC_WMS_GET_CUTOUT_INFO_0100
         * @tc.name   : test_GetCutoutInfo_static_0100
         * @tc.desc   : test_GetCutoutInfo
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 1
         */
        it('test_GetCutoutInfo_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName:string = 'test_GetCutoutInfo_static_0100';
            hilog.info(0x0000, '[ANI]',`jsunittets ${caseName} begin`);
            try {
                let displayClass: display.Display | null = null;
                displayClass = display.getDefaultDisplaySync();
                let info:display.CutoutInfo = await displayClass.getCutoutInfo();
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.boundingRects: ${info.boundingRects}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.left: ${info.waterfallDisplayAreaRects.left}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.top: ${info.waterfallDisplayAreaRects.top}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.right: ${info.waterfallDisplayAreaRects.right}`);
                hilog.info(0x0000, '[ANI]',`${caseName} CutoutInfo.waterfallDisplayAreaRects.bottom: ${info.waterfallDisplayAreaRects.bottom}`);
                expect(true).assertTrue();
                done();
            } catch (error) {
                hilog.error(0x0000, '[ANI]',`jsunittets ${caseName} fail to get display available info :` + error);
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0490
         * @tc.name      : testGetCutoutInfo_Callbcak_static_0100
         * @tc.desc      : Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('testGetCutoutInfo_Callbcak_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetCutoutInfo_Callbcak_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin' );
            let dpClass: display.Display = display.getDefaultDisplaySync();
            expect(!!dpClass).assertTrue();
            dpClass.getCutoutInfo((err:BusinessError<void> | null, data:display.CutoutInfo| undefined) : void => {
                if (err && err.code) {
                    hilog.error(0x0000, '[ANI]',msgStr + 'failed in getting cutoutInfo. cause: ' + JSON.stringify(err));
                    expect(false).assertTrue();
                    done()
                } else {
                    hilog.info(0x0000, '[ANI]',msgStr + 'Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
                    expect(true).assertTrue();
                    done();
                }
            })
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_0500
         * @tc.name      : testGetCutoutInfo_Promise_static_0100
         * @tc.desc      : Obtain information about unavailable screen areas such as the hole screen, fringe screen, and waterfall screen
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testGetCutoutInfo_Promise_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'testGetCutoutInfo_Promise_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin ' );
            let dpClass = display.getDefaultDisplaySync();
            expect(!!dpClass).assertTrue();
            dpClass.getCutoutInfo().then((data: display.CutoutInfo) => {
                hilog.info(0x0000, '[ANI]','Succeeded in getting cutoutInfo. Data: ' + JSON.stringify(data));
                done();
            }).catch((error: Error) =>{
                hilog.error(0x0000, '[ANI]',msgStr + 'failed in getting cutoutInfo. cause: ' + JSON.stringify(error));
                expect(false).assertTrue();
                done()
            });
        })
        // /**
        //  * @tc.number		SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0230
        //  * @tc.name			testGetCutoutInfo_Function_Promise
        //  * @tc.desc			To test the function of getCutoutInfo
        //  */
        // it('testGetCutoutInfo_Function_Promise', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
        //     hilog.info(0x0000, '[ANI]','getCutoutInfo begin');
        //     display.getDefaultDisplay().then((data: display.Display) => {
        //         hilog.info(0x0000, '[ANI]','displayTest getCutoutInfo getDefaultDisplay id :' + JSON.stringify(dsp));
        //         expect(dsp != null).assertTrue();
        //         dsp.getCutoutInfo((err:BusinessError<void> | null, data:display.CutoutInfo| undefined) : void => {
        //             hilog.info(0x0000, '[ANI]','Succeeded in getting cutoutInfo. data: ' + JSON.stringify(data));
        //             if (err.code) {
        //                 hilog.error(0x0000, '[ANI]','Failed to get cutoutInfo. Cause: ' + JSON.stringify(err));
        //                 expect().assertFail();
        //                 done();
        //             } else {
        //                 hilog.error(0x0000, '[ANI]','success to get cutoutInfo. Cause: ' + JSON.stringify(err));
        //                 expect(data != null).assertTrue();
        //                 done();
        //             }
        //         })
        //     }, (err) => {
        //         hilog.info(0x0000, '[ANI]','displayTest getgetCutoutInfo getDefaultDisplay failed, err :' + JSON.stringify(err));
        //         expect().assertFail();
        //         done();
        //     })
        // })

        /**
         * @tc.number    : SUB_BASIC_WMS_FOLDSTATUS_0100
         * @tc.name      : test_FoldStatus_enum_static_0100
         * @tc.desc      : test_FoldStatus_enum
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('test_FoldStatus_enum_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let caseName: string = 'test_FoldStatus_enum_static_0100';
            let msgStr: string = 'jsUnittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            expect(display.FoldStatus.FOLD_STATUS_UNKNOWN).assertEqual(0);
            expect(display.FoldStatus.FOLD_STATUS_EXPANDED).assertEqual(1);
            expect(display.FoldStatus. FOLD_STATUS_FOLDED).assertEqual(2);
            expect(display.FoldStatus.FOLD_STATUS_HALF_FOLDED).assertEqual(3);
            // expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_EXPANDED).assertEqual(11);
            // expect(display.FoldStatus.FOLD_STATUS_EXPANDED_WITH_SECOND_HALF_FOLDED).assertEqual(21);
            // expect(display.FoldStatus. FOLD_STATUS_FOLDED_WITH_SECOND_EXPANDED).assertEqual(12);
            // expect(display.FoldStatus.FOLD_STATUS_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(22);
            // expect(display.FoldStatus. FOLD_STATUS_HALF_FOLDED_WITH_SECOND_EXPANDED).assertEqual(13);
            // expect(display.FoldStatus.FOLD_STATUS_HALF_FOLDED_WITH_SECOND_HALF_FOLDED).assertEqual(23);
            done();

        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1150
         * @tc.name      : testGetFoldDisplayMode_Test_static_0100
         * @tc.desc      : To test the function of getFoldDisplayMode
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testGetFoldDisplayMode_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'testGetFoldDisplayMode_Test_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                display.getFoldDisplayMode();
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_UNKNOWN).assertEqual(0);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_FULL).assertEqual(1);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_MAIN).assertEqual(2);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_SUB).assertEqual(3);
                expect(display.FoldDisplayMode.FOLD_DISPLAY_MODE_COORDINATION).assertEqual(4);
                done();
            } catch (err:Error) {
                hilog.error(0x0000, '[ANI]',tag + 'getFoldDisplayMode failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_0240
         * @tc.name      : testGetDisplayByIdSync_SyncFunction_static_0100
         * @tc.desc      : To test the sync function of obtaining the target display by id
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 1
         */
        it('testGetDisplayByIdSync_SyncFunction_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            hilog.info(0x0000, '[ANI]','testGetDisplayByIdSync_SyncFunction_static_0100 begin');
            try {
                let displayId:number = display.getDefaultDisplaySync().id;
                let dsp:display.Display = display.getDisplayByIdSync(displayId);
                hilog.info(0x0000, '[ANI]','displayTest getDisplayByIdSyncTest1: ' + JSON.stringify(dsp));
                expect(dsp.id != null).assertTrue();
                expect(dsp.refreshRate != null).assertTrue();
                expect(dsp.width != null).assertTrue();
                expect(dsp.height != null).assertTrue();
                expect(dsp.rotation != null).assertTrue();
                expect(dsp.densityDPI != null).assertTrue();
                expect(dsp.name != null).assertTrue();
                expect(dsp.alive).assertTrue();
                expect(dsp.state != null).assertTrue();
                expect(dsp.densityPixels != null).assertTrue();
                expect(dsp.scaledDensity !=null).assertTrue();
                expect(dsp.xDPI != null).assertTrue();
                // expect(dsp.yDPI != null).assertTrue();
                done();
            } catch (err:Error) {
                hilog.error(0x0000, '[ANI]','getDisplayByIdSyncTest1 error ' + JSON.stringify(err));
                expect().assertFail();
                done();
            }
        })
        /**
         * @tc.number : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_5170
         * @tc.name   : testGetAllDisplayPhysicalResolution_static_0100
         * @tc.desc   : get all display physical resolution
         * @tc.size   : MediumTest
         * @tc.type   : Function
         * @tc.level  : Level 3
         */
        it('testGetAllDisplayPhysicalResolution_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'TestGetAllDisplayPhysicalResolution_static_0100';
            display.getAllDisplayPhysicalResolution().then((resolutionObjects:Array<display.DisplayPhysicalResolution>):PromiseLike<void>=> {
                hilog.info(0x0000, '[ANI]',`${caseName} Obtaining physical resolution length: ${resolutionObjects.length}`);
                for (let i = 0; i < resolutionObjects.length; i++) {
                    let resolutionObject:display.DisplayPhysicalResolution = resolutionObjects[i];
                    hilog.info(0x0000, '[ANI]',`${caseName}: ${i} foldDisplayMode: ${resolutionObject.foldDisplayMode}, physicalWidth: ${resolutionObject.physicalWidth}, physicalHeight: ${resolutionObject.physicalHeight}`)
                    expect(resolutionObject !== null).assertTrue();
                    expect(resolutionObject.physicalWidth).assertLarger(0);
                    expect(resolutionObject.physicalHeight).assertLarger(0);
                    done();
                }
            }).catch((err: BusinessError):PromiseLike<void>|undefined => {
                if (err.code == 801) {
                    hilog.error(0x0000, '[ANI]',`${caseName}: The current device type does not support to setWindowSystemBarEnable`);
                    expect(true).assertTrue();
                    done();
                } else {
                    hilog.error(0x0000, '[ANI]',`${caseName}: Failed to obtain physical resolution. Code: ${err.code}, message: ${err.message}`);
                    expect().assertFail();
                    done();
                }
            });
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4170
         * @tc.name      : testDisplayOffAdd_RepeatOff_static_0100
         * @tc.desc      : Turn off the monitor that shows device changes
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffAdd_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffAdd_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<number> = (data: number) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.on("add", callback);
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();

            }
            try {
                display.off("add");
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("add");
                done();
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4210
         * @tc.name      : testDisplayOffChange_RepeatOff_static_0100
         * @tc.desc      : Turn off the monitor that shows device changes
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffChange_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName = 'testDisplayOffChange_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<number> = (data: number) => {
                console.info(msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.on("change", callback);
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("change");
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("change");
                done();

            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });
        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STAGE_JS_API_4190
         * @tc.name      : testDisplayOffRemove_RepeatOff_static_0100
         * @tc.desc      : Turn off the monitor that shows device changes
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level 3
         */
        it('testDisplayOffRemove_RepeatOff_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName:string = 'testDisplayOffRemove_RepeatOff_static_0100';
            let msgStr:string = 'jsunittest ' + caseName + ' ';
            hilog.info(0x0000, '[ANI]',msgStr + 'begin');
            let callback: Callback<number> = (data: number) => {
                hilog.info(0x0000, '[ANI]',msgStr + 'Listening enabled. Data: ' + JSON.stringify(data));
            };
            try {
                display.on("remove", callback);
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to register callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("remove");
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
            try {
                display.off("remove");
                done();
            } catch (exception:Error) {
                hilog.error(0x0000, '[ANI]',msgStr + 'Failed to unregister callback. Code: ' + JSON.stringify(exception));
                expect().assertFail();
                done();
            }
        });

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1130
         * @tc.name      : testIsFoldable_Test_static_0100
         * @tc.desc      : To test the function of isFoldable
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testIsFoldable_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> =>{

            let tag:string = 'isFoldable_Test_001_static_0100 '
            try {
                display.isFoldable();
                expect(true).assertTrue();
                done();
            } catch (err:Error) {
                hilog.info(0x0000, '[ANI]',tag + 'get isFoldable failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })

        /**
         * @tc.number    : SUB_BASIC_WMS_SPCIAL_XTS_STANDARD_JS_API_1140
         * @tc.name      : testGetFoldStatus_Test_static_0100
         * @tc.desc      : To test the function of getFoldStatus
         * @tc.type      : Function
         * @tc.level     : Level 0
         */
        it('testGetFoldStatus_Test_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {

            let tag:string = 'getFoldStatus_Test_001_static_0100 '

            hilog.info(0x0000, '[ANI]',tag + ' begin');
            try {
                let foldStatus:number =  display.getFoldStatus();
                expect(foldStatus).assertLargerOrEqual(0);
                done();
            } catch (err) {
                hilog.error(0x0000, '[ANI]',tag + 'getFoldStatus failed, err : ' + JSON.stringify(err))
                expect().assertFail();
                done();
            }
        })






    })

}