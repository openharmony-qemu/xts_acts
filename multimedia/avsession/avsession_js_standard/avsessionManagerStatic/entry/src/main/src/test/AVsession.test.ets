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
import avSession from '@ohos.multimedia.avsession';
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import image from '@ohos.multimedia.image';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import wantAgent from '@ohos.app.ability.wantAgent';
import { WantAgentInfo } from 'wantAgent.wantAgentInfo';
import common from '@ohos.app.ability.common';
import Utils from './Util.test';
import { KeyEvent, Key, Action } from '@ohos.multimodalInput.keyEvent';
import { BusinessError } from '@ohos.base';
import type { KeyCode } from '@ohos.multimodalInput.keyCode';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVSessionTest', () => {
        let TAG: string = "[AVSessionTest]";
        let tag: string = 'ApplicationA';
        let session: avSession.AVSession | null;
        let controller: avSession.AVSessionController;
        let keyItem: Key = { code:KeyCode.KEYCODE_FN, pressedTime: 123456789, deviceId: 0 };
        let event: KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:Action.UP, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};

        let deviceInfo: avSession.DeviceInfo = {
            castCategory: 0 as avSession.AVCastCategory,
            deviceId: "deviceId",
            deviceName: "deviceName",
            deviceType: avSession.DeviceType.DEVICE_TYPE_LOCAL
        }

        let getPixelMap = async () => {
            let color = new ArrayBuffer(96);
            let bufferArr = new Uint8Array(color);
            bufferArr.fill(3, 0, 95);
            let opts: image.InitializationOptions = {
                editable: true,
                pixelFormat: 3 as image.PixelMapFormat,
                size: {
                    height: 4, width: 6
                },
                alphaType: 3 as image.AlphaType
            };
            return image.createPixelMap(color, opts);
        }

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info('TestLog: Start Testing avSession Interfaces');
        })

        beforeEach(async () => {
            console.info(`TestLog: ghg, beforeEach in`);
            console.info(`TestLog: ghg, createAVSession begin`);
            try {
                session = await avSession.createAVSession(context, tag, 'audio');
                console.info(`TestLog: ghg, avSession create success`);
                console.info(`${session!.sessionType}`);
            } catch (err: BusinessError) {
                console.info(`TestLog: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                await session!.activate();
                console.info(`TestLog: Session activate`);
            } catch (err: BusinessError) {
                console.info(`TestLog: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
                console.info(`TestLog: controller getController`);
            } catch (err: BusinessError) {
                console.info(`TestLog: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`TestLog: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`TestLog: afterEach in`);
            if (session != null) {
                try {
                    await session!.destroy()
                    console.info(`TestLog: Session destroy success`);
                } catch (err: BusinessError) {
                    console.info(`TestLog: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Session is already destroy`);
            }
            if (controller != null) {
                try {
                    await controller.destroy()
                    console.info(`TestLog: Controller destroy success`);
                } catch (err: BusinessError) {
                    console.info(`TestLog: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`TestLog: Controller is already destroy`);
            }
            console.info(`TestLog: afterEach out`);
        })

        afterAll(() => {
            console.info('TestLog: End Testing avSession Interfaces');
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_STATIC_0100
         * @tc.desc        read property sessionId of AVSession & Controler
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_READ_SESSION_ID_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            if (session!.sessionId.length === 64 && controller.sessionId.length === 64) {
                console.info('TestLog: Read AVSession & Controler sessionId successfully');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: Read sessionId failed');
                expect(false).assertTrue();
            }
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0100
         * @tc.desc        Testing call setAVMetadata(promise) set assetId
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            let metadata0: avSession.AVMetadata = {
                assetId: '121278',
            };
            try {
                console.info('TestLog: Set start');
                await session!.setAVMetadata(metadata0)
                console.info('TestLog: Set assetId successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata()
                if (data.assetId === '121278') {
                    console.info('TestLog: Get assetId Successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    console.info(`TestLog: assetId is: ${data.assetId}`);
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0200
         * @tc.desc        Testing call setAVMetadata(promise) set artist
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0200', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata1: avSession.AVMetadata = {
                assetId: '121278',
                artist: 'Eminem',
            };
            try {
                await session!.setAVMetadata(metadata1)
                console.info('TestLog: Set artist successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata()
                if (data.artist === metadata1.artist) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get artist failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get artist error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0300
         * @tc.desc        Testing call setAVMetadata(promise) set author
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata2: avSession.AVMetadata = {
                assetId: '121278',
                author: 'ST',
            };
            try {
                await session!.setAVMetadata(metadata2)
                console.info('TestLog: Set author successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata()
                if (data.author === metadata2.author) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get author failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get author error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0400
         * @tc.desc        Testing call setAVMetadata(promise) set album
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata3: avSession.AVMetadata = {
                assetId: '121278',
                album: 'Slim shady',
            };
            try {
                await session!.setAVMetadata(metadata3);
                console.info('TestLog: Set album successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.album === metadata3.album) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get album failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get album error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0500
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0500
         * @tc.desc        Testing call setAVMetadata(promise) set writer
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata4: avSession.AVMetadata = {
                assetId: '121278',
                writer: 'ST',
            };
            try {
                await session!.setAVMetadata(metadata4);
                console.info('TestLog: Set writer successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.writer === metadata4.writer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get writer failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get writer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0600
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0600
         * @tc.desc        Testing call setAVMetadata(promise) set composer
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata5: avSession.AVMetadata = {
                assetId: '121278',
                composer: 'ST',
            };
            try {
                await session!.setAVMetadata(metadata5);
                console.info('TestLog: Set composer successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.composer === metadata5.composer) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get composer failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get composer error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0700
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0700
         * @tc.desc        Testing call setAVMetadata(promise) set duration
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata6: avSession.AVMetadata = {
                assetId: '121278',
                duration: 2222,
            };
            try {
                await session!.setAVMetadata(metadata6);
                console.info('TestLog: Set duration successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.duration === metadata6.duration) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get duration failed');
                    console.info(`TestLog: Get duration is: ${data.duration}`);
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0800
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0800
         * @tc.desc        Testing call setAVMetadata(promise) set mediaImage(url)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata7: avSession.AVMetadata = {
                assetId: '121278',
                mediaImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500',
            };
            try {
                await session!.setAVMetadata(metadata7);
                console.info('TestLog: Set mediaImage successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.mediaImage === metadata7.mediaImage) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get mediaImage failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get mediaImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0900
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0900
         * @tc.desc        Testing call setAVMetadata(promise) set mediaImage(pixelMap)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let pixelMap = await getPixelMap();
            let readBuffer0 = new ArrayBuffer(96);
            await pixelMap.readPixelsToBuffer(readBuffer0);
            let bufferArr0 = new Uint8Array(readBuffer0);
            let metadata8: avSession.AVMetadata = {
                assetId: '121278',
                mediaImage: pixelMap,
            };
            try {
                await session!.setAVMetadata(metadata8);
                console.info('TestLog: Set pixelMap successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixMap: image.PixelMap;
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.assetId === '121278') {
                    pixMap = data.mediaImage as image.PixelMap;
                } else {
                    console.info('TestLog: Get pixelMap failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get pixelMap error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let pixelSize = pixMap.getPixelBytesNumber();
            console.info(`TestLog: pixelSize is: ${pixelSize}`);
            let readBuffer = new ArrayBuffer(pixelSize);
            await pixMap.readPixelsToBuffer(readBuffer);
            let bufferArr2 = new Uint8Array(readBuffer);
            for (let i = 0; i < bufferArr2.length; i++) {
                if (bufferArr0[i] !== bufferArr2[i]) {
                    expect(false).assertTrue();
                } else {
                    expect(true).assertTrue();
                }
            }
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1100
         * @tc.desc        Testing call setAVMetadata(promise) set subtitle
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata10: avSession.AVMetadata = {
                assetId: '121278',
                subtitle: '8 Mile',
            };
            try {
                await session!.setAVMetadata(metadata10);
                console.info('TestLog: Set subtitle successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.subtitle === metadata10.subtitle) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get subtitle failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get subtitle error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1200
         * @tc.desc        Testing call setAVMetadata(promise) set description
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata11: avSession.AVMetadata = {
                assetId: '121278',
                description: 'Rap',
            };
            try {
                await session!.setAVMetadata(metadata11);
                console.info('TestLog: Set description successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.description === metadata11.description) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get description failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get description error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1300
         * @tc.desc        Testing call setAVMetadata(promise) set lyric
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata12: avSession.AVMetadata = {
                assetId: '121278',
                lyric: 'https://lyric.tingmall.com/lyric/58/970/589710004-LRC-LRC.lrc?t=1649918948000',
            };
            try {
                await session!.setAVMetadata(metadata12);
                console.info('TestLog: Set lyric successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.lyric === metadata12.lyric) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get lyric failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get lyric error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1400
         * @tc.desc        Testing call setAVMetadata(promise) set previousAssetId & nextAssetId
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata13: avSession.AVMetadata = {
                assetId: '121278',
                previousAssetId: '121277',
                nextAssetId: '121279',
            };
            try {
                await session!.setAVMetadata(metadata13);
                console.info('TestLog: Set assetId successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.previousAssetId === metadata13.previousAssetId &&
                    data.nextAssetId === metadata13.nextAssetId) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get assetId failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1500
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1500
         * @tc.desc        Testing call setAVMetadata(promise) set filter(TYPE_CAST_PLUS_STREAM)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_STREAM
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set filter successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1600
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1600
         * @tc.desc        Testing call setAVMetadata(promise) set filter(TYPE_LOCAL)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_LOCAL
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set filter successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1700
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1700
         * @tc.desc        Testing call setAVMetadata(promise) set filter(TYPE_CAST_PLUS_MIRROR)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_CAST_PLUS_MIRROR
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set filter successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.filter === metadata.filter) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1800
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1800
         * @tc.desc        Testing call setAVMetadata(promise) set skipIntervals
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                skipIntervals: avSession.SkipIntervals.SECONDS_10
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set skipIntervals successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set skipIntervals error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data.skipIntervals === metadata.skipIntervals) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get skipIntervals failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get skipIntervals error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2000
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2000
         * @tc.desc        Testing call setAVMetadata(promise) set avQueueName、avQueueId、avQueueImage(string)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                avQueueName: '121278',
                avQueueId: '121278',
                avQueueImage: 'https://img2.baidu.com/it/u=3583435814,2833583486&fm=253&fmt=auto&app=138&f=JPEG?w=526&h=500'
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set avQueueName、avQueueId、avQueueImage successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set avQueueName、avQueueId、avQueueImage error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.avQueueName).assertEqual(metadata.avQueueName);
                    expect(data.avQueueId).assertEqual(metadata.avQueueId);
                    expect(data.avQueueImage).assertEqual(metadata.avQueueImage);
                } else {
                    console.info('TestLog: getAVMetadata failed.');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2100
         * @tc.desc        Testing call setAVMetadata(promise) set displayTags
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                displayTags: avSession.DisplayTag.TAG_AUDIO_VIVID
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set displayTags successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set displayTags error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            let data: avSession.AVMetadata;
            try {
                data = await controller.getAVMetadata();
                if (data) {
                    expect(data.assetId).assertEqual(metadata.assetId);
                    expect(data.displayTags).assertEqual(metadata.displayTags);
                } else {
                    console.info('TestLog: getAVMetadata failed.');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: getAVMetadata error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0100
         * @tc.desc        Testing call setAVPlaybackState(promise) set state & activeItemId
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
            async (done: () => void): Promise<void> => {
            let PlaybackState1: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PLAY,
                activeItemId: 0,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState1);
                console.info('TestLog: Set State successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_PLAY) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0200
         * @tc.desc        Testing call setAVPlaybackState(promise) set speed
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState2: avSession.AVPlaybackState = {
                speed: 2.6,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState2);
                console.info('TestLog: Set speed successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.speed === 2.6) {
                    console.info('TestLog: Get speed successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get speed failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get speed error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0300
         * @tc.desc        Testing call setAVPlaybackState(promise) set position
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState3: avSession.AVPlaybackState = {
                position: {
                    elapsedTime: 10, updateTime: (new Date()).getTime() as long
                } as avSession.PlaybackPosition,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState3);
                console.info('TestLog: Set position successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.position?.elapsedTime === 10) {
                    console.info('TestLog: Get position successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get position failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get position error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0400
         * @tc.desc        Testing call setAVPlaybackState(promise) set bufferedTime
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState4: avSession.AVPlaybackState = {
                bufferedTime: 1000,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState4);
                console.info('TestLog: Set bufferedTime successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.bufferedTime === 1000) {
                    console.info('TestLog: Get bufferedTime successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get bufferedTime failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get bufferedTime error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0500
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0500
         * @tc.desc        Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SEQUENCE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState5: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_SEQUENCE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState5);
                console.info('TestLog: Set loopMode successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.loopMode === avSession.LoopMode.LOOP_MODE_SEQUENCE) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0600
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0600
         * @tc.desc        Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SINGLE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState6: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState6);
                console.info('TestLog: Set loopMode successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.loopMode === avSession.LoopMode.LOOP_MODE_SINGLE) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0700
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0700
         * @tc.desc        Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_LIST)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState7: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_LIST,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState7);
                console.info('TestLog: Set loopMode successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.loopMode === avSession.LoopMode.LOOP_MODE_LIST) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0800
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0800
         * @tc.desc        Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_SHUFFLE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState8: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_SHUFFLE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState8);
                console.info('TestLog: Set loopMode successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.loopMode === avSession.LoopMode.LOOP_MODE_SHUFFLE) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0900
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0900
         * @tc.desc        Testing call setAVPlaybackState(promise) set isFavorite
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState9: avSession.AVPlaybackState = {
                isFavorite: true,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState9);
                console.info('TestLog: Set isFavorite successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.isFavorite === true) {
                    console.info('TestLog: Get isFavorite successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get isFavorite failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get isFavorite error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1000
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1000
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_INITIAL)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState12: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_INITIAL,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState12);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_INITIAL) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1100
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_PREPARE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState13: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PREPARE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState13);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_PREPARE) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1200
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_PAUSE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState14: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_PAUSE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState14);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_PAUSE) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1300
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_FAST_FORWARD)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState15: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_FAST_FORWARD,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState15);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_FAST_FORWARD) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1400
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_REWIND)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState16: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_REWIND,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState16);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_REWIND) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1500
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1500
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_STOP)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState17: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_STOP,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState17);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_STOP) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1600
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1600
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_IDLE)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState18: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_IDLE,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState18);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_IDLE) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1700
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1700
         * @tc.desc        Testing call setAVPlaybackState(promise) set state(PLAYBACK_STATE_BUFFERING)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let playbackState: avSession.AVPlaybackState = {
                state: avSession.PlaybackState.PLAYBACK_STATE_BUFFERING,
            };
            try {
                await session!.setAVPlaybackState(playbackState);
                console.info('TestLog: Set playbackState successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set playbackState error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.state === avSession.PlaybackState.PLAYBACK_STATE_BUFFERING) {
                    console.info('TestLog: Get State successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get State failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get State error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1800
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1800
         * @tc.desc        Testing call setAVPlaybackState(promise) set loopMode(LOOP_MODE_CUSTOM)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState5: avSession.AVPlaybackState = {
                loopMode: avSession.LoopMode.LOOP_MODE_CUSTOM,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState5);
                console.info('TestLog: Set loopMode successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.loopMode === avSession.LoopMode.LOOP_MODE_CUSTOM) {
                    console.info('TestLog: Get loopMode successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get loopMode failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get loopMode error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1900
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1900
         * @tc.desc        Testing call setAVPlaybackState(promise) set maxVolume
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                maxVolume: 6,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState);
                console.info('TestLog: Set maxVolume successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.maxVolume === PlaybackState.maxVolume) {
                    console.info('TestLog: Get maxVolume successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get maxVolume failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get maxVolume error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2000
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2000
         * @tc.desc        Testing call setAVPlaybackState(promise) set muted
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                muted: false,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState);
                console.info('TestLog: Set muted successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set muted error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.muted === PlaybackState.muted) {
                    console.info('TestLog: Get muted successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get muted failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get muted error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2100
         * @tc.desc        Testing call setAVPlaybackState(promise) set videoWidth & videoHeight
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                videoWidth: 1920,
                videoHeight: 1080,
            };
            try {
                await session!.setAVPlaybackState(PlaybackState);
                console.info('TestLog: Set videoWidth & videoHeight successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.videoWidth === PlaybackState.videoWidth &&
                    data.videoHeight === PlaybackState.videoHeight) {
                    console.info('TestLog: Get videoWidth & videoHeight successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get videoWidth & videoHeight failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get videoWidth & videoHeight error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2200
         * @tc.desc        Testing call setAVPlaybackState(promise) set duration
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let PlaybackState: avSession.AVPlaybackState = {
                duration: 100
            };
            try {
                await session!.setAVPlaybackState(PlaybackState)
                console.info('TestLog: Set duration successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVPlaybackState;
            try {
                data = await controller.getAVPlaybackState();
                if (data.duration === PlaybackState.duration) {
                    console.info('TestLog: Get duration successfully');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get duration failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: Get duration error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_STATIC_0100
         * @tc.desc        Testing set session active - promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            try {
                await session!.activate()
                console.info('TestLog: Set session active successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: boolean;
            try {
                data = await controller.isActive()
                if (data) {
                    console.info('TestLog: session is active');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: session is directive');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_STATIC_0100
         * @tc.desc        Testing set session deactivate - promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level1
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
            async (done: () => void): Promise<void> => {
            try {
                await session!.activate()
                console.info('TestLog: Set session active');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            try {
                await session!.deactivate()
                console.info('TestLog: Deactivate session');
            } catch (err: BusinessError) {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: boolean;
            try {
                data = await controller.isActive()
                if (data) {
                    console.info('TestLog: session deactivate failed');
                    expect(false).assertTrue();
                } else {
                    console.info('TestLog: session deactivate successfully');
                    expect(true).assertTrue();
                }
            } catch (err: BusinessError) {
                console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_STATIC_0100
         * @tc.desc        Testing set session active - callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.activate((err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`TestLog: Set active error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Set session active successfully');
                    }
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: SUB_MULTIMEDIA_AVSESSION_SESSIONACTIVATE_CALLBACK_STATIC_0100`);
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            await Utils.msSleep(500);
            controller.isActive((err: BusinessError | null, isActive: Boolean|undefined) => {
                if (err?.code) {
                    console.info(`TestLog: AVSessionTest error: code: ${err?.code}, message: ${err?.message}`);
                    expect(false).assertTrue();
                } else {
                    if (isActive) {
                        console.info('TestLog: session is active');
                        expect(true).assertTrue();
                    } else {
                        console.info('TestLog: session is directive');
                        expect(false).assertTrue();
                    }
                }
            })
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_STATIC_0100
         * @tc.desc        Testing set session deactivate - callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SESSIONDEACTIVATE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await session!.activate()
                console.info('TestLog: Set session active');
            } catch (err: BusinessError) {
                console.info(`TestLog: Set active error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            try {
                session!.deactivate((err: BusinessError | null) => {
                    if (err?.code) {
                        console.info(`TestLog: Deactivate session error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: Deactivate session');
                    }
                })
            } catch (err: BusinessError) {
                console.info(`TestLog: Deactivate session error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);

            controller.isActive((err, isActive) => {
                if (err) {
                    console.info(`TestLog: AVSessionTest error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                } else {
                    if (isActive) {
                        console.info('TestLog: session deactivate failed');
                        expect(false).assertTrue();
                    } else {
                        console.info('TestLog: session deactivate successfully');
                        expect(true).assertTrue();
                    }
                }
            })
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_0100
         * @tc.desc        bind callbacks on play events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('play', () => {
                console.info('TestLog: Play command callback registration successful');
                expect(true).assertTrue();
            });
            try {
                await controller.sendControlCommand({
                    command: 'play'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONPAUSE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONPAUSE_STATIC_0100
         * @tc.desc        bind callbacks on pause events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPAUSE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('pause', () => {
                console.info('TestLog: Pause command callback registration successful');
                expect(true).assertTrue();
            });
            try {
                await controller.sendControlCommand({
                    command: 'pause'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONSTOP_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONSTOP_STATIC_0100
         * @tc.desc        bind callbacks on stop events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSTOP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('stop', () => {
                console.info('TestLog: Stop command callback registration successful');
                expect(true).assertTrue();
            });
            try {
                await controller.sendControlCommand({
                    command: 'stop'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_0100
         * @tc.desc        bind callbacks on playNext events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('playNext', () => {
                console.info('TestLog: PlayNext command callback registration successful');
                expect(true).assertTrue();
            });
            try {
                await controller.sendControlCommand({
                    command: 'playNext'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_0100
         * @tc.desc        bind callbacks on playPrevious events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('playPrevious', () => {
                console.info('TestLog: PlayPrevious command callback registration successful');
                expect(true).assertTrue();
            });

            try {
                await controller.sendControlCommand({
                    command: 'playPrevious'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0100
         * @tc.desc        bind callbacks on fastForward events(no args)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('fastForward', () => {
                console.info('TestLog: FastForward command callback registration successful');
                expect(true).assertTrue();
            });

            try {
                await controller.sendControlCommand({
                    command: 'fastForward'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0200
         * @tc.desc        bind callbacks on fastForward events(10s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('fastForward', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_10) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_10
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0300
         * @tc.desc        bind callbacks on fastForward events(15s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('fastForward', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_15) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_15
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0400
         * @tc.desc        bind callbacks on fastForward events(30s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('fastForward', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_30) {
                    console.info('TestLog: FastForward command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'fastForward', parameter: avSession.SkipIntervals.SECONDS_30
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0100
         * @tc.desc        bind callbacks on rewind events(no args)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('rewind', () => {
                console.info('TestLog: Rewind command callback registration successful');
                expect(true).assertTrue();
            });

            try {
                await controller.sendControlCommand({
                    command: 'rewind'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0200
         * @tc.desc        bind callbacks on rewind events(10s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('rewind', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_10) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_10
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0300
         * @tc.desc        bind callbacks on rewind events(15s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('rewind', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_15) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_15
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0400
         * @tc.desc        bind callbacks on rewind events(30s)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('rewind', (time?: long) => {
                if (time! == avSession.SkipIntervals.SECONDS_30) {
                    console.info('TestLog: Rewind command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'rewind', parameter: avSession.SkipIntervals.SECONDS_30
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONSEEK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONSEEK_STATIC_0100
         * @tc.desc        bind callbacks on seek events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSEEK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('seek', (callback) => {
                if (callback === 10) {
                    console.info('TestLog: Seek command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Seek command callback registration failed');
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'seek', parameter: 10
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_STATIC_0100
         * @tc.desc        bind callbacks on setSpeed events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETSPEED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            session!.on('setSpeed', (callback) => {
                if (callback === 2.6) {
                    console.info('TestLog: SetSpeed command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: SetSpeed command callback registration error');
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'setSpeed', parameter: 2.6
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_0100
         * @tc.desc        bind callbacks on setLoopMode events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONSETLOOPMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('setLoopMode', (callback) => {
                if (callback === 1) {
                    console.info('TestLog: Set LoopMode command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set LoopMode command callback registration error');
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'setLoopMode', parameter:
                    avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_STATIC_0100
         * @tc.desc        bind callbacks on toggleFavorite events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ONTOGGLEFAVORITE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('toggleFavorite', (callback) => {
                if (callback === 'false') {
                    console.info('TestLog: Set toggleFavorite command callback registration successful');
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Set toggleFavorite command callback registration error');
                    expect(false).assertTrue();
                }
            });

            try {
                await controller.sendControlCommand({
                    command: 'toggleFavorite', parameter: 'false'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0100
         * @tc.desc        unbind all callbacks on play events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Play command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Play command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('play', callback1);

            session!.on('play', callback2);

            session!.off('play');

            try {
                await controller.sendControlCommand({
                    command: 'play'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0200
         * @tc.desc        Unbind the specified callback on play events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Play command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Play command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('play', callback1);

            session!.on('play', callback2);

            session!.off('play', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'play'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0100
         * @tc.desc        unbind all callbacks on pause events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Pause command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('pause', callback1);

            session!.on('pause', callback2);

            session!.off('pause');

            try {
                await controller.sendControlCommand({
                    command: 'pause'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0200
         * @tc.desc        Unbind the specified callback on pause events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPAUSE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Pause command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Pause command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('pause', callback1);

            session!.on('pause', callback2);

            session!.off('pause', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'pause'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0100
         * @tc.desc        unbind all callbacks on stop events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Stop command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('stop', callback1);

            session!.on('stop', callback2);

            session!.off('stop');

            try {
                await controller.sendControlCommand({
                    command: 'stop'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0200
         * @tc.desc        Unbind the specified callback on stop events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSTOP_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Stop command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Stop command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('stop', callback1)

            session!.on('stop', callback2)

            session!.off('stop', callback1)
            try {
                await controller.sendControlCommand({
                    command: 'stop'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0100
         * @tc.desc        unbind all callbacks on playNext events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: PlayNext command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('playNext', callback1);

            session!.on('playNext', callback2);

            session!.off('playNext');
            try {
                await controller.sendControlCommand({
                    command: 'playNext'
                })
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            };
            await Utils.msSleep(500);
            done();
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0200
         * @tc.desc        Unbind the specified callback on playNext events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: PlayNext command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: PlayNext command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('playNext', callback1);
            session!.on('playNext', callback2);
            session!.off('playNext', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'playNext'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0100
         * @tc.desc        unbind all callbacks on playPrevious events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('playPrevious', callback1);
            session!.on('playPrevious', callback2);
            session!.off('playPrevious');

            try {
                await controller.sendControlCommand({
                    command: 'playPrevious'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0200
         * @tc.desc        Unbind the specified callback on playPrevious events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: PlayPrevious command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: PlayPrevious command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('playPrevious', callback1);
            session!.on('playPrevious', callback2);
            session!.off('playPrevious', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'playPrevious'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0100
         * @tc.desc        unbind all callbacks on fastForward events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: FastForward command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('fastForward', callback1);
            session!.on('fastForward', callback2);
            session!.off('fastForward');

            try {
                await controller.sendControlCommand({
                    command: 'fastForward'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0200
         * @tc.desc        Unbind the specified callback on fastForward events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: FastForward command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: FastForward command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('fastForward', callback1);
            session!.on('fastForward', callback2);
            session!.off('fastForward', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'fastForward'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0100
         * @tc.desc        unbind all callbacks on rewind events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Rewind command registration2 success');
                expect(false).assertTrue();
            }

            session!.on('rewind', callback1);
            session!.on('rewind', callback2);
            session!.off('rewind');

            try {
                await controller.sendControlCommand({
                    command: 'rewind'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0200
         * @tc.desc        Unbind the specified callback on rewind events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = () => {
                console.info('TestLog: Rewind command registration1 success');
                expect(false).assertTrue();
            }

            let callback2 = () => {
                console.info('TestLog: Rewind command registration2 success');
                expect(true).assertTrue();
            }

            session!.on('rewind', callback1);
            session!.on('rewind', callback2);
            session!.off('rewind', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'rewind'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0100
         * @tc.desc        unbind all callbacks on seek events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = (data: long) => {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: long) => {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(false).assertTrue();
                }
            }

            session!.on('seek', callback1);
            session!.on('seek', callback2);
            session!.off('seek');

            try {
                await controller.sendControlCommand({
                    command: 'seek', parameter: 10
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0200
         * @tc.desc        Unbind the specified callback on seek events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSEEK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let callback1 = (data: long) => {
                if (data === 5) {
                    console.info('TestLog: offSeek callback1 registration');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: long) => {
                if (data === 10) {
                    console.info('TestLog: offSeek callback2 registration');
                    expect(true).assertTrue();
                }
            }

            session!.on('seek', callback1);
            session!.on('seek', callback2);
            session!.off('seek', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'seek', parameter: 10
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0100
         * @tc.desc        unbind all callbacks on setSpeed events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: number) => {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: number) => {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(false).assertTrue();
                }
            }

            session!.on('setSpeed', callback1);
            session!.on('setSpeed', callback2);
            session!.off('setSpeed');

            try {
                await controller.sendControlCommand({
                    command: 'setSpeed', parameter: 2.0
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0200
         * @tc.desc        Unbind the specified callback on setSpeed events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETSPEED_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: number) => {
                if (data === 1.0) {
                    console.info('TestLog: SetSpend command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: number) => {
                if (data === 2.0) {
                    console.info('TestLog: SetSpend command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session!.on('setSpeed', callback1);
            session!.on('setSpeed', callback2);
            session!.off('setSpeed', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'setSpeed', parameter: 2.0
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0100
         * @tc.desc        unbind all callbacks on setLoopMode events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: avSession.LoopMode) => {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: avSession.LoopMode) => {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(false).assertTrue();
                }
            }

            session!.on('setLoopMode', callback1);
            session!.on('setLoopMode', callback2);
            session!.off('setLoopMode');

            try {
                await controller.sendControlCommand({
                    command: 'setLoopMode',
                    parameter: avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0200
         * @tc.desc        Unbind the specified callback on setLoopMode events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFSETLOOPMODE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: avSession.LoopMode) => {
                if (data === 2) {
                    console.info('TestLog: SetLoopMode command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: avSession.LoopMode) => {
                if (data === 1) {
                    console.info('TestLog: SetLoopMode command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session!.on('setLoopMode', callback1);
            session!.on('setLoopMode', callback2);
            session!.off('setLoopMode', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'setLoopMode',
                    parameter: avSession.LoopMode.LOOP_MODE_SINGLE
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0100
         * @tc.desc        unbind all callbacks on toggleFavorite events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: string) => {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: string) => {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue();
                }
            }

            session!.on('toggleFavorite', callback1);
            session!.on('toggleFavorite', callback2);
            session!.off('toggleFavorite');

            try {
                await controller.sendControlCommand({
                    command: 'toggleFavorite', parameter: 'false'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(true).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0200
         * @tc.desc        Unbind the specified callback on toggleFavorite events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFTOGGLEFAVORITE_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: string) => {
                if (data === 'true') {
                    console.info('TestLog: ToggleFavorite command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: string) => {
                if (data === 'false') {
                    console.info('TestLog: ToggleFavorite command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session!.on('toggleFavorite', callback1);
            session!.on('toggleFavorite', callback2);
            session!.off('toggleFavorite', callback1);

            try {
                await controller.sendControlCommand({
                    command: 'toggleFavorite', parameter: 'false'
                });
                console.info('TestLog: Controller send command successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send command error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0100
         * @tc.desc        unbind all callbacks on handleKeyEvent events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let flag = true;
            let callback1 = (data: KeyEvent) => {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    flag = false;
                }
            }

            let callback2 = (data: KeyEvent) => {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    flag = false;
                }
            }

            session!.on('handleKeyEvent', callback1);
            session!.on('handleKeyEvent', callback2);
            session!.off('handleKeyEvent');

            try {
                await controller.sendAVKeyEvent(event);
                console.info('TestLog: Controller send AVKeyEvent successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);

            if (flag) {
                console.info('TestLog: HandleKeyEvent command callback unRegistration successful');
                expect(true).assertTrue();
            } else {
                console.info('TestLog: HandleKeyEvent command callback unRegistration failed');
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0200
         * @tc.desc        Unbind the specified callback on handleKeyEvent events
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFFHANDLEKEYEVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let callback1 = (data: KeyEvent) => {
                if (data.action === 1) {
                    console.info('TestLog: HandleKeyEvent command registration1 success');
                    expect(false).assertTrue();
                }
            }

            let callback2 = (data: KeyEvent) => {
                if (data.action === 2) {
                    console.info('TestLog: HandleKeyEvent command registration2 success');
                    expect(true).assertTrue();
                }
            }

            session!.on('handleKeyEvent', callback1);
            session!.on('handleKeyEvent', callback2);
            session!.off('handleKeyEvent', callback1);

            try {
                await controller.sendAVKeyEvent(event);
                console.info('TestLog: Controller send AVKeyEvent successfully');
            } catch (err: BusinessError) {
                console.info(`TestLog: Controller send AVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            await Utils.msSleep(500);
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0100
         * @tc.desc        Testing call getOutputDevice(callback)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                session!.getOutputDevice((err: BusinessError | null, value: avSession.OutputDeviceInfo | undefined) => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value) {
                        console.info('Get device information successfully');
                        let deviceInfo = value?.devices[0]
                        if (deviceInfo && deviceInfo.castCategory !== undefined && deviceInfo.deviceId !== undefined &&
                            deviceInfo.deviceName !== undefined && deviceInfo.deviceType !== undefined && deviceInfo.ipAddress !== undefined &&
                            deviceInfo.providerId !== undefined && deviceInfo.supportedProtocols !== undefined && deviceInfo.authenticationStatus !== undefined) {
                            expect(true).assertTrue();
                        } else {
                            console.info('getOutputDevice value error.')
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (err: BusinessError) {
                console.info(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0200
         * @tc.desc        Testing call getOutputDevice(callback)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_CALLBACK_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                session!.getOutputDevice((err: BusinessError | null, value: avSession.OutputDeviceInfo | undefined) => {
                    if (err) {
                        console.info(`Get device information BusinessError: ${err.code}, message: ${err.message}`);
                        expect(false).assertTrue();
                    } else if (value) {
                        console.info('Get device information successfully');
                        let deviceInfo = value?.devices[0]
                        console.info(`manufacturer:${deviceInfo?.manufacturer},modelName:${deviceInfo?.modelName}`);
                        if (deviceInfo?.manufacturer == null || deviceInfo?.modelName == null || deviceInfo?.manufacturer == undefined || deviceInfo?.modelName == undefined) {
                            expect(false).assertTrue();
                        }
                    } else {
                        console.info('Get device information failed');
                        expect(false).assertTrue();
                    }
                    done();
                });
            } catch (err: BusinessError) {
                console.info(`Get device information unknownError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        })

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_STATIC_0100
         * @tc.desc        get session controller - promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                const data = await session!.getController();
                console.info('TestLog: Get controller successfully');
                expect(true).assertTrue();
            } catch (err: BusinessError) {
                console.info('TestLog: Get controller failed');
                console.info(`TestLog:Get controller BusinessError: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_STATIC_0100
         * @tc.desc        get session controller - callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETCONTROLLER_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                session!.getController((err, data) => {
                    if (err) {
                        console.info('Get controller failed');
                        expect(false).assertTrue();
                    } else {
                        console.info('Get controller successfully');
                        expect(true).assertTrue();
                    }
                    done();
                });
            } catch (err: BusinessError) {
                console.info(`Get controller failed, unknown error: code: ${err.code} message: ${err.message}.`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_STATIC_0100
         * @tc.desc        controller send AVKeyEvent - callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                controller.sendAVKeyEvent(event, (err, data) => {
                    if (err?.code) {
                        console.info(`TestLog: sendAVKeyEvent error: code: ${err?.code}, message: ${err?.message}`);
                        expect(false).assertTrue();
                    } else {
                        console.info('sendAVKeyEvent Successfully');
                        expect(true).assertTrue();
                    }
                    done();
                });
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent unknownError: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
            }
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_STATIC_0100
         * @tc.desc        controller send AVKeyEvent - promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                await controller.sendAVKeyEvent(event);
                console.info('TestLog: sendAVKeyEvent Successfully');
                expect(true).assertTrue();
            } catch (err: BusinessError) {
                console.info(`TestLog: sendAVKeyEvent error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_STATIC_0100
         * @tc.desc        get controller real playbackPosition - async
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETREALPLAYBACKPOSITIONSYNC_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                let realPosition: long = -1;
                try {
                    realPosition = controller.getRealPlaybackPositionSync();
                } catch (err: BusinessError) {
                    console.info(`TestLog: getRealPlaybackPositionSync error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                }
                done();
            });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_STATIC_0100
         * @tc.desc        get session support commands - promise
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_PROMISE_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            session!.on('play', () => {
            });
            await Utils.msSleep(500);
            try {
                const data = await controller.getValidCommands();
                console.info(`TestLog: getValidCommands Successfully, the length ${data.length}`);
                expect(data[0]).assertEqual('play');
            } catch (err: BusinessError) {
                console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_STATIC_0100
         * @tc.desc        get session support commands - callback
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_CALLBACK_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                try {
                    session!.on('play', () => {
                    });
                    await Utils.msSleep(500);
                    controller.getValidCommands((err, data) => {
                        if (err) {
                            console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else {

                            console.info(`TestLog: getValidCommands Successfully, the length ${data?.length}`);
                            expect(data![0]).assertEqual('play');
                        }
                        done();
                    });
                } catch (err: BusinessError) {
                    console.info(`TestLog: getValidCommands error: code: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
            });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2200
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2200
         * @tc.desc        Testing call setAVMetadata(promise) set filter(ProtocolType.TYPE_DLN)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2200', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata0: avSession.AVMetadata = {
                assetId: '121278',
                filter: avSession.ProtocolType.TYPE_DLNA
            }
            try {
                await session!.setAVMetadata(metadata0);
                console.info('TestLog: Set assetId successfully');
            } catch (err: BusinessError) {
                console.error(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            try {
                const data = await controller.getAVMetadata();
                if (data.filter === 4) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
            await Utils.msSleep(800);
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2300
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2300
         * @tc.desc        Testing call setAVMetadata(promise) set drmSchemes
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2300', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                drmSchemes: ["abcdefghjkl", "asdfghjklqw"]
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set assetId successfully');
            } catch (err: BusinessError) {
                console.error(`TestLog: Set assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            try {
                const data = await controller.getAVMetadata();
                console.error(`TestLog: ${data.drmSchemes}, : ${metadata.drmSchemes}`);
                if (data.drmSchemes?.toString() === metadata.drmSchemes?.toString()) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
            await Utils.msSleep(800);
        });


        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2400
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2400
         * @tc.desc        Testing call setAVMetadata(promise) set singleLyricText
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_2400', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            let metadata: avSession.AVMetadata = {
                assetId: '121278',
                singleLyricText: 'dream it possible'
            };
            try {
                await session!.setAVMetadata(metadata);
                console.info('TestLog: Set singleLyricText successfully');
            } catch (err: BusinessError) {
                console.error(`TestLog: Set singleLyricText error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }

            try {
                const data = await controller.getAVMetadata();
                if (data.singleLyricText === metadata.singleLyricText) {
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: Get filter failed');
                    expect(false).assertTrue();
                }
            } catch (err: BusinessError) {
                console.error(`TestLog: Get filter error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            }
            done();
            await Utils.msSleep(800);
        });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_STATIC_0100
         * @tc.desc        Testing call getOutputDevice(supportedDrmCapabilities)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_SUPPORTEDDRMCAPABILITIES_STATIC_0100', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
                try {
                    session!.getOutputDevice((err, value: avSession.OutputDeviceInfo | undefined) => {
                        if (err) {
                            console.error(`TestLog: Get device information BusinessError: ${err.code}, message: ${err.message}`);
                            expect(false).assertTrue();
                        } else if (value) {
                            console.info('TestLog: Get device information successfully');
                            let deviceInfo: avSession.DeviceInfo | undefined = value?.devices[0];
                            console.info(`TestLog: ${value?.devices[0].deviceId}`);
                            if (deviceInfo && Array.isArray(deviceInfo.supportedDrmCapabilities)) {
                                expect(true).assertTrue();
                            } else {
                                console.info('TestLog: getOutputDevice value error.');
                                expect(false).assertTrue();
                            }
                        } else {
                            console.info('TestLog: Get device information failed');
                            expect(false).assertTrue();
                        }
                        done();
                    });
                } catch (err: BusinessError) {
                    console.error(`TestLog: Get device information unknownError: ${err.code}, message: ${err.message}`);
                    expect(false).assertTrue();
                    done();
                }
            });

        /**
         * @tc.number      SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_0100
         * @tc.name        SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_0100
         * @tc.desc        Testing call getAllCastDisplays(6600101)
         * @tc.size        MediumTest
         * @tc.type        Function
         * @tc.level       Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_0100', Level.LEVEL2,
            async (done: () => void): Promise<void> => {
            try {
                const data = await session!.getAllCastDisplays();
                if (Array.isArray(data)) {
                    console.info(`TestLog: getAllCastDisplays success: ${JSON.stringify(data)}`);
                    expect(true).assertTrue();
                } else {
                    console.info('TestLog: getAllCastDisplays failed');
                    expect(false).assertTrue();
                    done();
                }
            } catch (err: BusinessError) {
                expect(err.code).assertEqual(6600101);
                console.info(`TestLog: getAllCastDisplays successfully: ${err.code}, message: ${err.message}`);
            }
            done();
        });
    })
}
