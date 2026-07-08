'use static';
/*
 * Copyright (C) 2025-2026 Huawei Device Co., Ltd.
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

import { describe, it, expect, TestType, Size, Level} from "@ohos/hypium-binary/src/main/indexStatic";
import hilog from '@ohos.hilog'
import { BusinessError } from '@ohos.base';
import hidebug from '@ohos.hidebug'
import fileIo from '@ohos.file.fs';

export default function HidebugStaticTest() {
    describe("HidebugStaticTest", (): void => {
        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0100
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0100
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "abcd_ADAS_1231",
                  bufferSizeKb: 1024,
                  durationMs: 1000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0100: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0100 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0100 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0100 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0200
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0200
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "abcd_ADAS_12312133331",
                  bufferSizeKb: 1024,
                  durationMs: 1000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0200: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0200 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0200 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0200 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0300
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0300
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "abcd_ADAS_123121333中",
                  bufferSizeKb: 1024,
                  durationMs: 1000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0300: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0300 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0300 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0300 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0400
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0400
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "test_trace",
                  bufferSizeKb: 0,
                  durationMs: 1000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0400: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0400 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400120 || err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0400 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0400 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0500
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0500
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "test_trace",
                  bufferSizeKb: 15360,
                  durationMs: 1000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0500: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0500 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400120 || err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0500 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0500 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0600
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0600
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "test_trace",
                  bufferSizeKb: 1024,
                  durationMs: 0,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0600: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0600 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400120 || err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0600 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0600 Test end*************');
        })

        /**
         * @tc.name   SUB_DFX_DFR_Hidebug_Interface_0700
         * @tc.number SUB_DFX_DFR_Hidebug_Interface_0700
         * @tc.desc   requestTrace
         * @tc.type   FUNCTION
         * @tc.size   MEDIUMTEST
         * @tc.level  LEVEL2
         */
        it('SUB_DFX_DFR_Hidebug_Interface_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                hidebug.requestTrace({
                  identifier: "test_trace",
                  bufferSizeKb: 1024,
                  durationMs: 15000,
                  reserved: 0,
                }).then((tracePath: string) => {
                  hilog.info(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0700: ${tracePath}`)
                  expect(tracePath.length > 0).assertTrue();
                  done();
                }).catch((err) => {
                  hilog.error(0x0000, 'hidebug', `SUB_DFX_DFR_Hidebug_Interface_0700 error1 code: ${err.code}, message: ${err.message}`)
                  expect(err.code == 11400120 || err.code == 11400302).assertTrue();
                  done();
                })
            } catch (err) {
                console.error(`SUB_DFX_DFR_Hidebug_Interface_0700 > err code: ${err.code}, err msg: ${err.message}`)
                expect(false).assertTrue();
                done();
            };
            console.log('************* SUB_DFX_DFR_Hidebug_Interface_0700 Test end*************');
        })
    })
}
