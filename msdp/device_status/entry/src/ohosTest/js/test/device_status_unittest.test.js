/*
 * Copyright (C) 2022 Huawei Device Co., Ltd.
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

import stationary from "@ohos.stationary"
import { describe, it, expect, TestType, Size, Level } from '@ohos/hypium'
let reportLatencyNs = 1000000000;

export default function DeviceStatusUnitTest() {
    describe('DeviceStatusUnitTest', function () {
        console.log("*************DeviceStatus API Test Begin*************");
        var p_done = undefined;
        const pub_callback = (data) => {
            console.log('callback data: ' + JSON.stringify(data) + ', data.value:' + data.value);
            expect(data.value >= -1).assertTrue();
            console.log(' done ');
            if (p_done != undefined) {
                p_done();
            } else {
                console.log(' p_done is undefined');
            }
        }

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0100
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0100
         * @tc.desc   Stationary callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("still", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, pub_callback);
                expect(stationary.ActivityState.ENTER == 1).assertTrue();
                expect(stationary.ActivityState.EXIT == 2).assertTrue();
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 once start");
            try {
                p_done = done;
                stationary.once("still", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0100 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("still", stationary.ActivityEvent.ENTER_EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0200
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0200
         * @tc.desc   Stationary callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0200 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0300
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0300
         * @tc.desc   Stationary callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("Type_Unknow", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                console.info(`stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 once start");
            try {
                p_done = done;
                stationary.once("Type_Unknow", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                console.info(`stationary.once fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0300 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("Type_Unknow", stationary.ActivityEvent.ENTER_EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    console.info(`stationary.once fail: ${JSON.stringify(error, ['code', 'message'])}`);
                    expect(error.code).assertEqual(401);
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0400
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0400
         * @tc.desc   Stationary callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.ENTER, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0400 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.ENTER, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0500
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0500
         * @tc.desc   Stationary callback interface test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, 1, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                console.info(`stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 once start");
            try {
                p_done = done;
                stationary.once("relativeStill", pub_callback);
            } catch (error) {
                console.error('error=' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0500 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.EXIT, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0600
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0600
         * @tc.desc   Stationary on activityType is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0600 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on(null, stationary.ActivityEvent.EXIT, reportLatencyNs, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_0600 stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0700
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0700
         * @tc.desc   Stationary on activityType is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0700 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on(undefined, stationary.ActivityEvent.EXIT, reportLatencyNs, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_0700 stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0800
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0800
         * @tc.desc   Stationary on reportLatencyNs is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0800 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, null, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_0800 stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_0900
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_0900
         * @tc.desc   Stationary on reportLatencyNs is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_0900 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.EXIT, undefined, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_0900 stationary.on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1000
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1000
         * @tc.desc   Stationary off activityType is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1000 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.off(null, stationary.ActivityEvent.EXIT, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1000 stationary.off fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1100
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1100
         * @tc.desc   Stationary off activityType is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1100 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.off(undefined, stationary.ActivityEvent.EXIT, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error Log' + error);
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1100 stationary.off fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1200
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1200
         * @tc.desc   Stationary once activityType is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1200 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.ENTER, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1200 once start");
            try {
                p_done = done;
                stationary.once(null, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error=' + error);
                console.info(`stationary.off fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1200 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.ENTER, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1300
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1300
         * @tc.desc   Stationary once activityType is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL0
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1300 on start");
            console.log(JSON.stringify(stationary));
            try {
                p_done = done;
                stationary.on("relativeStill", stationary.ActivityEvent.ENTER, reportLatencyNs, pub_callback);
            } catch (error) {
                console.error('error Log' + error);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1300 once start");
            try {
                p_done = done;
                stationary.once(undefined, pub_callback);
                expect().assertFail();
            } catch (error) {
                console.error('error=' + error);
                console.info(`stationary.off fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1300 off start");
            setTimeout(function () {
                try {
                    p_done = done;
                    stationary.off("relativeStill", stationary.ActivityEvent.ENTER, pub_callback);
                    p_done();
                } catch (error) {
                    console.error('error=' + error);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1400
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1400
         * @tc.desc   Stationary on ActivityEvent is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1400 on start");
            try {
                stationary.on("still", null, reportLatencyNs, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1400 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1400 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1500
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1500
         * @tc.desc   Stationary on ActivityEvent is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1500 on start");
            try {
                stationary.on("still", undefined, reportLatencyNs, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1500 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1500 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1600
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1600
         * @tc.desc   Stationary on ActivityEvent is invalid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1600 on start");
            try {
                stationary.on("still", 0, reportLatencyNs, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1600 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1600 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1700
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1700
         * @tc.desc   Stationary off ActivityEvent is null
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1700 start");
            try {
                stationary.off("still", null, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1700 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1700 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1800
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1800
         * @tc.desc   Stationary off ActivityEvent is undefined
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1800 start");
            try {
                stationary.off("still", undefined, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1800 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1800 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_1900
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_1900
         * @tc.desc   Stationary off ActivityEvent is invalid
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_1900 start");
            try {
                stationary.off("still", 0, pub_callback);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_1900 success");
                expect().assertFail();
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_1900 fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect(error.code).assertEqual(401);
                done();
            }
        })

        /**
         * @tc.name   SUB_MSDP_DeviceStatus_API_Stationary_2000
         * @tc.number SUB_MSDP_DeviceStatus_API_Stationary_2000
         * @tc.desc   Stationary multicallback test
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_MSDP_DeviceStatus_API_Stationary_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, function (done) {
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 on start");
            let callback1 = (data) => {
                console.log('SUB_MSDP_DeviceStatus_API_Stationary_2000 callback1 data: ' + JSON.stringify(data) + ', data.value:' + data.value);
                expect(data.value >= -1).assertTrue();
            }
            let callback2 = (data) => {
                console.log('SUB_MSDP_DeviceStatus_API_Stationary_2000 callback2 data: ' + JSON.stringify(data) + ', data.value:' + data.value);
                expect(data.value >= -1).assertTrue();
            }
            try {
                stationary.on("still", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, callback1);
                stationary.on("still", stationary.ActivityEvent.ENTER_EXIT, reportLatencyNs, callback2);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 on success");
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_2000 on fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 once start");
            try {
                stationary.once("still", callback1);
                stationary.once("still", callback2);
                console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 once success");
                done();
            } catch (error) {
                console.info(`SUB_MSDP_DeviceStatus_API_Stationary_2000 once fail: ${JSON.stringify(error, ['code', 'message'])}`);
                expect().assertFail();
                done();
            }
            console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 off start");
            setTimeout(function () {
                try {
                    stationary.off("still", stationary.ActivityEvent.ENTER_EXIT, callback1);
                    stationary.off("still", stationary.ActivityEvent.ENTER_EXIT, callback2);
                    console.log("SUB_MSDP_DeviceStatus_API_Stationary_2000 off success");
                    done();
                } catch (error) {
                    console.info(`SUB_MSDP_DeviceStatus_API_Stationary_2000 off fail: ${JSON.stringify(error, ['code', 'message'])}`);
                    expect().assertFail();
                    done();
                }
            }, 200);
        })

    })
}
