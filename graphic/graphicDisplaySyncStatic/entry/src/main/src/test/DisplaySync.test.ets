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

import { describe, beforeEach, it, expect, TestType, Size, Level, beforeAll} from "../../../hypium/index";
import hilog from '@ohos.hilog'
import { Driver, ON, PointerMatrix, Rect } from '@ohos.UiTest';
import common from '@ohos.app.ability.common';
import UIAbility from '@ohos.app.ability.UIAbility';
import { Utils, startAbility, stopApplication } from './Util.test';
import displaySync from "@ohos.graphics.displaySync";
import { BusinessError } from '@ohos.base';
import { ExpectedFrameRateRange } from '@ohos.arkui.component';
let domain: int = 0x0000;
let tag: string = 'DisplaySync';
let bundleName = "com.example.displaysync.static";

export default function displaySyncTest() {

    describe("displaySyncTest", (): void => {
        beforeAll(async () : Promise<void> => {
            hilog.info(domain, tag, "displaySyncTest loadup start!!!!!")
            await Utils.msSleep(2000)
            hilog.info(domain, tag, "displaySyncTest loadup over!!!!!")
        })

        /**
         * @tc.number    : testSetExpectedFrameRateRange_static_0100
         * @tc.name      : testSetExpectedFrameRateRange_static_0100
         * @tc.desc      : Test the function of SetExpectedFrameRateRange Promise
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('testSetExpectedFrameRateRange_static_0100',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testSetExpectedFrameRateRange_static===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let range: ExpectedFrameRateRange = {
                        min: 0,
                        max: 120,
                        expected: 30
                    }
                    backDisplaySync?.setExpectedFrameRateRange(range)
                    console.info(msg + 'Succeeded in setExpectedFrameRateRange.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to setExpectedFrameRateRange. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testOnFrame_static_0100
         * @tc.name      : testOnFrame_static_0100
         * @tc.desc      : Subscribe to changes per frame
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('testOnFrame_static_0100',  TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testOnFrame_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.onFrame(callback)
                    console.info(msg + 'Succeeded in on.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to on. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testOffFrame_static_0100
         * @tc.name      : testOffFrame_static_0100
         * @tc.desc      : Unsubscribe from changes per frame
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level1
         */
        it('testOffFrame_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testOffFrame_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.offFrame(callback)
                    console.info(msg + 'Succeeded in off.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to off. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testOnOffFrame_static_0100
         * @tc.name      : testOnOffFrame_static_0100
         * @tc.desc      : Unsubscribe from changes per frame after Subscribe to changes per frame
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testOnOffFrame_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testOnOffFrame_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.onFrame(callback)
                    backDisplaySync?.offFrame(callback)
                    console.info(msg + 'Succeeded in onoff.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testStart_static_0100
         * @tc.name      : testStart_static_0100
         * @tc.desc      : Start callback per frame
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testStart_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testStart_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let range : ExpectedFrameRateRange = {
                        expected: 10,
                        min:0,
                        max:120
                    };
                    backDisplaySync?.setExpectedFrameRateRange(range);
                    expect(true).assertTrue()
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.onFrame(callback)
                    // 开始每帧回调
                    backDisplaySync?.start()
                    console.info(msg + 'Succeeded in onoff.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testStop_static_0100
         * @tc.name      : testStop_static_0100
         * @tc.desc      : Stop callback per frame
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testStop_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testStop_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let range : ExpectedFrameRateRange = {
                        expected: 10,
                        min:0,
                        max:120
                    };
                    backDisplaySync?.setExpectedFrameRateRange(range)
                    expect(true).assertTrue()
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.onFrame(callback)
                    // 停止每帧回调
                    backDisplaySync?.stop()
                    console.info(msg + 'Succeeded in onoff.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testStartStop_static_0100
         * @tc.name      : testStartStop_static_0100
         * @tc.desc      : Start and Stop
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testStartStop_static_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testStartStop_static_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let range : ExpectedFrameRateRange = {
                        expected: 10,
                        min:0,
                        max:120
                    };
                    backDisplaySync?.setExpectedFrameRateRange(range)
                    expect(true).assertTrue()
                    let callback = (frameInfo: displaySync.IntervalInfo) => {
                        console.info("DisplaySync", 'TimeStamp:' + frameInfo.timestamp +
                            ' TargetTimeStamp: ' + frameInfo.targetTimestamp);
                    }
                    backDisplaySync?.onFrame(callback)
                    backDisplaySync?.start()
                    // 停止每帧回调
                    backDisplaySync?.stop()
                    console.info(msg + 'Succeeded in onoff.');
                    expect(true).assertTrue()
                    done()
                } catch (exception) {
                    console.error(msg + 'Failed to onoff. Cause:' + JSON.stringify(exception));
                    expect().assertFail()
                    done()
                }
            })

        /**
         * @tc.number    : testDisplaySyncErrorCode_0100
         * @tc.name      : testDisplaySyncErrorCode_0100
         * @tc.desc      : setExpectedFrameRateRange error code
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('testDisplaySyncErrorCode_0100', TestType.FUNCTION|Size.MEDIUMTEST|Level.LEVEL1,
            async (done: () => void): Promise<void> => {
                let msg = "====testDisplaySyncErrorCode_0100===="
                console.log(msg + ' begin')
                try {
                    let backDisplaySync: displaySync.DisplaySync = displaySync.create();
                    let range : ExpectedFrameRateRange = {
                        expected: -60,
                        min:0,
                        max:120
                    };
                    backDisplaySync?.setExpectedFrameRateRange(range)
                    console.error(msg + 'www data success in testDisplaySyncErrorCode_0100:');
                    expect().assertFail();
                    done();
                } catch (err) {
                    err = err as BusinessError;
                    console.error(msg + 'www data Failed to onoff. Cause:' + JSON.stringify(err));
                    console.error(msg + 'Failed to onoff. Cause:' + err.code);
                    expect(err.code == 401).assertTrue();
                    done();
                }
            })
    })
}
