'use static';
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
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import { describe, it, expect, TestType, Size, Level, beforeAll } from '@ohos/hypium-binary/src/main/indexStatic';
import hilog from '@ohos.hilog';
import Utils from './Util.test';
import display from '@ohos.display';
import window from '@ohos.window';
import { UIContext } from '@ohos.arkui.UIContext';
import { AppStorage } from '@ohos.arkui.stateManagement';
import type { AsyncCallback, Callback } from '@ohos.base';
import common from '@ohos.app.ability.common';
import { image } from '@kit.ImageKit';
import deviceInfo from '@ohos.deviceInfo';
import settings from '@ohos.settings';
import Want from '@ohos.app.ability.Want';
import StartOptions from '@ohos.app.ability.StartOptions'
import { ImageFit } from '@ohos.arkui.component'
import { canIUse } from "@internal.full.global";
import { ColorMetrics } from "@ohos.arkui.node";
import StartOptions from '@ohos.app.ability.StartOptions';

let domain: int = 0x0000; //日志标识,0x0000作为测试框架的业务标识
let tag: string = 'testTag'; //日志标识字符串,作为tag标识当前runner类下的测试行为

async function startAbility(caseName: string, context: common.UIAbilityContext, options?: StartOptions): Promise<window.WindowStage> {
    return new Promise<window.WindowStage>((resolve, reject) => {
        let want: Want = {
            bundleName: "com.example.actswindowtest.static",
            abilityName: 'StartAbility'
        };
        if (options) {
            context.startAbility(want, options).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error): PromiseLike<void> | undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        } else {
            context.startAbility(want).then(() => {
                hilog.info(domain, tag, `${caseName} Succeeded in starting ability.`);
            }).catch((err: Error): PromiseLike<void> | undefined => {
                hilog.info(domain, tag, `${caseName} Failed in starting ability. Cause code: ${err.code}, message: ${err.message}`);
            });
        }
        Utils.msSleep(1000).awaitSync()
        hilog.info(domain, tag, `${caseName} get windowStageStart start.`);
        let windowStageStart: window.WindowStage = AppStorage.get<window.WindowStage>('windowStageStart') as window.WindowStage;
        hilog.info(domain, tag, `${caseName} Succeeded in get windowStageStart.` + windowStageStart);
        resolve(windowStageStart);
    })
}

async function terminateAbility(caseName: string) {
    hilog.info(domain, tag, `${caseName} terminateSelf start..`);
    let pageContext: common.UIAbilityContext = AppStorage.get<common.UIAbilityContext>('pageContext') as common.UIAbilityContext
    hilog.info(domain, tag, `${caseName} pageContext :${pageContext}`);
    try {
        if (pageContext !== null && pageContext !== undefined) {
            hilog.info(domain, tag, `${caseName} terminateSelf begin`);
        }
        pageContext.terminateSelf().then(() => {
            hilog.info(domain, tag, `${caseName} terminateSelf success`);
        }).catch((err: Error): PromiseLike<void> | undefined => {
            hilog.error(domain, tag, `${caseName} terminateSelf fail, err: ${JSON.stringify(err)}`);
        });
    } catch (e) {
        hilog.error(domain, tag, `${caseName} pageContext.terminateSelf fail, err: ${JSON.stringify(e)}`);
    }
    await Utils.msSleep(1000)
}

export default function WindowControlsTest(): void {

    describe("WindowControlsTest", (): void => {
        hilog.info(domain, tag, '%{public}s', 'WindowControlsTest describe start');
        let windowStage: window.WindowStage | undefined;
        let win: window.Window | undefined;
        let context: common.UIAbilityContext;
        let isSupportRotate = false;
        // let session:UIExtensionContentSession;
        //let isAutoWindow: string = '';
        //let isPCStatus: string = '';
        beforeAll(async () => {
            //context = AppStorage.get('context') as common.UIAbilityContext;
            //console.log('windowTest context: ' + JSON.stringify(context))
            try {
                windowStage = AppStorage.get<window.WindowStage>('windowStage') as window.WindowStage;
                win = AppStorage.get<window.Window>('mainWindow') as window.Window;
                context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            } catch (e) {
                hilog.info(domain, tag, '%{public}s', 'getANI fail = ' + JSON.stringify(e));
            }

            hilog.info(domain, tag, '%{public}s', 'getANI windowStage = ' + JSON.stringify(windowStage));
            hilog.info(domain, tag, '%{public}s', 'getANI win = ' + JSON.stringify(win));

            //isAutoWindow = settings.getValueSync(context, 'window_pcmode_switch_status', '',settings.domainName.DEVICE_SHARED);
            //console.info(`isAutoWindow: ${JSON.stringify(isAutoWindow)}`);
            //isPCStatus = settings.getValueSync(context, 'isStatusBarExist', '', settings.domainName.USER_PROPERTY)
            //isPCStatus === '' 非PC设备
            //isPCStatus === '1' PC设备状态栏dock未融合
            //isPCStatus === '0' PC设备状态栏dock融合
            //console.info(`beforeAll isPCStatus: `+ isPCStatus);
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setImageForRecent_static_0300
         * @tc.name        setImageForRecent_1300002_static
         * @tc.desc        setImageForRecent_1300002_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('setImageForRecent_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'setImageForRecent_1300002_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let color = new ArrayBuffer(512 * 512 * 4);
            let pixelMap: image.PixelMap;
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i += 4) {
                bufferArr[i] = 255;
                bufferArr[i + 1] = 0;
                bufferArr[i + 2] = 122;
                bufferArr[i + 3] = 255;
            }
            let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            let windowStart: window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            image.createPixelMap(color, {
                editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
            }).then((data: image.PixelMap) => {
                pixelMap = data;
                hilog.info(domain, tag, msgStr + 'Succeeded in creating pixelMap');
                try {
                    let promise = windowStart.setImageForRecent(pixelMap, ImageFit.Fill);
                    promise.then(() => {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                        expect(false).assertTrue();
                        done()
                    }).catch((err: Error): PromiseLike<void> | undefined => {
                        hilog.error(domain, tag, msgStr + `Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
                        expect(err.code).assertEqual(1300002);
                        done()
                    });
                } catch (exception) {
                    hilog.error(domain, tag, msgStr + 'Failed to set image for recent.' + exception.code + ',' + exception.message);
                    expect(false).assertTrue();
                    done()
                }
            })
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setImageForRecent_static_0400
         * @tc.name        testsetImageForRecent_static
         * @tc.desc        testsetImageForRecent_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 1
         */
        it('testsetImageForRecent_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testsetImageForRecent_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            if (deviceInfo.deviceType == '2in1') {
                let color = new ArrayBuffer(512 * 512 * 4);
                let pixelMap: image.PixelMap;
                let bufferArr = new Uint8Array(color);
                for (let i = 0; i < bufferArr.length; i += 4) {
                    bufferArr[i] = 255;
                    bufferArr[i + 1] = 0;
                    bufferArr[i + 2] = 122;
                    bufferArr[i + 3] = 255;
                }
                image.createPixelMap(color, {
                    editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
                }).then((data: image.PixelMap) => {
                    pixelMap = data;
                    hilog.info(domain, tag, msgStr + 'Succeeded in creating pixelMap');
                    try {
                        let promise = windowStage!.setImageForRecent(pixelMap, ImageFit.Fill);
                        promise.then(() => {
                            hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                            done()
                        }).catch((err: Error): PromiseLike<void> | undefined => {
                            hilog.error(domain, tag, msgStr + `Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                            done();
                        });
                    } catch (exception) {
                        hilog.error(domain, tag, msgStr + 'Failed to set image for recent.');
                        expect(false).assertTrue();
                        done()
                    }
                })
            } else {
                hilog.info(domain, tag, msgStr + 'Unsupported devices.');
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_removeImageForRecent_static_0200
         * @tc.name        removeImageForRecent_1300002_static
         * @tc.desc        removeImageForRecent_1300002_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('removeImageForRecent_1300002_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'removeImageForRecent_1300002_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            let windowStart: window.WindowStage = await startAbility(caseName, context!);
            await terminateAbility(caseName);
            try {
                let promise = windowStart.removeImageForRecent();
                promise.then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                    expect(false).assertTrue();
                    done()
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    hilog.error(domain, tag, msgStr + `Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(1300002);
                    done()
                });
            } catch (exception) {
                hilog.error(domain, tag, msgStr + 'Failed to remove image for recent.' + exception.code + ',' + exception.message);
                expect(false).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_removeImageForRecent_static_0300
         * @tc.name        testremoveImageForRecent_static
         * @tc.desc        testremoveImageForRecent_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 1
         */
        it('testremoveImageForRecent_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testremoveImageForRecent_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            if (deviceInfo.deviceType == '2in1') {
                try {
                    let promise = windowStage!.removeImageForRecent();
                    promise.then(() => {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                        done()
                    }).catch((err: Error): PromiseLike<void> | undefined => {
                        hilog.error(domain, tag, msgStr + `Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                        done();
                    });
                } catch (exception) {
                    hilog.error(domain, tag, msgStr + 'Failed to remove image for recent.');
                    expect(false).assertTrue();
                    done()
                }
            } else {
                hilog.info(domain, tag, msgStr + 'Unsupported devices.');
                done();
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setImageForRecent_static_0500
         * @tc.name        testsetImageForRecent_801_0100_static
         * @tc.desc        testsetImageForRecent_801_0100_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testsetImageForRecent_801_0100_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testsetImageForRecent_801_0100_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
            hilog.info(domain, tag, msgStr + 'canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
            let color = new ArrayBuffer(512 * 512 * 4);
            let pixelMap: image.PixelMap;
            let bufferArr = new Uint8Array(color);
            for (let i = 0; i < bufferArr.length; i += 4) {
                bufferArr[i] = 255;
                bufferArr[i + 1] = 0;
                bufferArr[i + 2] = 122;
                bufferArr[i + 3] = 255;
            }
            image.createPixelMap(color, {
                editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
            }).then((data: image.PixelMap) => {
                pixelMap = data;
                hilog.info(domain, tag, msgStr + 'Succeeded in creating pixelMap');
                try {
                    let promise = windowStage!.setImageForRecent(pixelMap, ImageFit.Fill);
                    promise.then(() => {
                        hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                        if (deviceInfo.deviceType === '2in1') {
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    }).catch((err: Error): PromiseLike<void> | undefined => {
                        hilog.error(domain, tag, msgStr + `Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
                        if (!canIUseRes) {
                            if (err.code === 801) {
                                done();
                            } else {
                                expect(false).assertTrue();
                                done();
                            }
                        } else {
                            if (deviceInfo.deviceType !== '2in1') {
                                if (err.code === 201) {
                                    done();
                                } else {
                                    expect(false).assertTrue();
                                    done();
                                }
                            } else {
                                expect(false).assertTrue();
                                done();
                            }
                        }
                    });
                } catch (exception) {
                    hilog.error(domain, tag, msgStr + 'Failed to set image for recent.');
                    expect(false).assertTrue();
                    done()
                }
            })
        })

        /**
         * @tc.number      SUB_BASIC_WMS_removeImageForRecent_static_0400
         * @tc.name        testremoveImageForRecent_801_0100_static
         * @tc.desc        testremoveImageForRecent_801_0100_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 3
         */
        it('testremoveImageForRecent_801_0100_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3, async (done: () => void): Promise<void> => {
            let caseName: string = 'testremoveImageForRecent_801_0100_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            let canIUseRes = canIUse("SystemCapability.Window.SessionManager");
            hilog.info(domain, tag, msgStr + 'canIUseRes SystemCapability.Window.SessionManager: ' + JSON.stringify(canIUseRes));
            try {
                let promise = windowStage!.removeImageForRecent();
                promise.then(() => {
                    hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                    if (deviceInfo.deviceType === '2in1') {
                        done();
                    } else {
                        expect(false).assertTrue();
                        done();
                    }
                    done()
                }).catch((err: Error): PromiseLike<void> | undefined => {
                    hilog.error(domain, tag, msgStr + `Failed to remove image for recent. Cause code: ${err.code}, message: ${err.message}`);
                    if (!canIUseRes) {
                        if (err.code === 801) {
                            done();
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    } else {
                        if (deviceInfo.deviceType !== '2in1') {
                            if (err.code === 201) {
                                done();
                            } else {
                                expect(false).assertTrue();
                                done();
                            }
                        } else {
                            expect(false).assertTrue();
                            done();
                        }
                    }
                });
            } catch (exception) {
                hilog.error(domain, tag, msgStr + 'Failed to remove image for recent.');
                expect(false).assertTrue();
                done()
            }
        })

        /**
         * @tc.number      SUB_BASIC_WMS_setImageForRecent_static_0600
         * @tc.name        testsetImageForRecent_param_static
         * @tc.desc        testsetImageForRecent_param_static
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level 1
         */
        it('testsetImageForRecent_param_static', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: () => void): Promise<void> => {
            let caseName: string = 'testsetImageForRecent_param_static';
            let msgStr: string = 'jsunittest ' + caseName + ' ';
            hilog.info(domain, tag, msgStr + 'begin');
            if (deviceInfo.deviceType == '2in1') {
                let color = new ArrayBuffer(512 * 512 * 4);
                let pixelMap: image.PixelMap;
                let bufferArr = new Uint8Array(color);
                for (let i = 0; i < bufferArr.length; i += 4) {
                    bufferArr[i] = 255;
                    bufferArr[i + 1] = 0;
                    bufferArr[i + 2] = 122;
                    bufferArr[i + 3] = 255;
                }
                image.createPixelMap(color, {
                    editable: true, pixelFormat: image.PixelMapFormat.RGBA_8888, size: { height: 512, width: 512 }
                }).then((data: image.PixelMap) => {
                    pixelMap = data;
                    hilog.info(domain, tag, msgStr + 'Succeeded in creating pixelMap');
                    try {
                        let promise = windowStage!.setImageForRecent(1, ImageFit.Fill);
                        promise.then(() => {
                            hilog.info(domain, tag, msgStr + 'Succeeded in setting image for recent');
                            done()
                        }).catch((err: Error): PromiseLike<void> | undefined => {
                            hilog.error(domain, tag, msgStr + `Failed to set image for recent. Cause code: ${err.code}, message: ${err.message}`);
                            expect(err.code).assertEqual(1300016);
                            done();
                        });
                    } catch (exception) {
                        hilog.error(domain, tag, msgStr + 'Failed to set image for recent.');
                        expect(false).assertTrue();
                        done()
                    }
                })
            } else {
                hilog.info(domain, tag, msgStr + 'Unsupported devices.');
                done();
            }
        })





        /**
     * @tc.name   testSetStartWindowBackgroundColorStatic_1300016
     * @tc.number SUB_BASIC_WMS_SETSTARTWINDOWBACKGROUNDCOLOR_1300016
     * @tc.desc   testSetStartWindowBackgroundColorStatic_1300016
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL3
     */
    it('testSetStartWindowBackgroundColorStatic_1300016', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL3,async (done: () => void): Promise<void> =>{
      let caseName: string = 'testSetStartWindowBackgroundColorStatic_1300016 ';
      console.log(caseName + 'begin');
      try {
        let moduleName = 'entry_test'.repeat(21);
        console.info(`${caseName} moduleName length: ${moduleName.length}`);
        let abilityName = 'TestAbility';
        window.setStartWindowBackgroundColor(moduleName, abilityName, ColorMetrics.numeric(0x112233)).then(async () => {
          console.info(caseName + 'Succeeded in calling setStartWindowBackgroundColor.');
          expect().assertFail();
          done();
        }).catch((err: Error): PromiseLike<void> | undefined =>  {
          console.error(caseName + 'Failed to call setStartWindowBackgroundColor. Cause: ' + err.code + 'message :' + err.message);
          expect(err.code).assertEqual(1300016)
          done();
        });
      } catch (err) {
        console.error(caseName + 'Failed. Cause:' + err.code);
        expect().assertFail();
        done();
      }
    });

    })

}