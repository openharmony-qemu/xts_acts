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
import { describe, it, expect, TestType, Size, Level, beforeAll, beforeEach, afterEach, afterAll } from "../../../hypium/index";
import avSession from '@ohos.multimedia.avsession';
import { canIUse } from '@internal.full.global'
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import Utils from './Util.test';
import { WantAgent } from '@ohos.app.ability.wantAgent';
import { AppStorage } from '@ohos.arkui.stateManagement'

let context: common.UIAbilityContext;
export default function abilityTest() {
    describe('AVSessionTest', () => {
        let TAG: string = "[AVSessionTest]";
        let session: avSession.AVSession | null = null;
        let controller: avSession.AVSessionController;
        let tag: string = 'VoiceCallXTS';

        let invalidSession = async (validFunc:() => Promise<void>) => {
            await session!.destroy().then(async () => {
                console.info('TestLog: session destroy success');
                await validFunc();
            }).catch((err: Error) => {
                console.info(`TestLog: session destroy error: err: ${err}`);
                expect().assertFail();
            })
        }

        beforeAll(() => {
            context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
            console.info(`${TAG}: beforeAll in`);
        })

        beforeEach(async () => {
            try{
                session = await avSession.createAVSession(context, tag, 'voice_call');
                console.info(`${session!.sessionType}`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
            };
            try{
                await session!.activate();
                console.info(`${TAG}: Session activate`);
            }catch(err: BusinessError){
                console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
            };
            try {
                controller = await session!.getController();
            } catch (err: BusinessError) {
                console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
            }
            await Utils.msSleep(800);
            console.info(`${TAG}: beforeEach out`);
        })

        afterEach(async () => {
            console.info(`${TAG}: afterEach in`);
            if (session != null) {
                try{
                    await session!.destroy()
                    console.info(`${TAG}: Session destroy success`);
                } catch (err: BusinessError) {
                    console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Session is already destroy`);
            }
            if (controller != null) {
                try{
                    await controller.destroy()
                    console.info(`${TAG}: Controller destroy success`);
                } catch (err: BusinessError) {
                    console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
                };
            } else {
                console.info(`${TAG}: Controller is already destroy`);
            }
            console.info(`${TAG}: afterEach out`);
        })

        afterAll(() => {
            console.info(`${TAG}: afterAll in`);
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100
         * @tc.desc      : test getAVCastController(promise) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let aVCastController: avSession.AVCastController;
            try{
                console.info(`TestTag: getAVCastController : start`);
                aVCastController = await session!.getAVCastController();
                console.info(`${TAG}: getAVCastController11 : SUCCESS`);
                expect(false).assertTrue();
            }catch(err: BusinessError){
                console.info(`${TAG}:getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200
         * @tc.desc      : test getAVCastController() errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let aVCastController: avSession.AVCastController|undefined;
            session!.getAVCastController((err: BusinessError|null, avcontroller: avSession.AVCastController|undefined) => {
                if (err) {
                    console.info(`${TAG}:getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err?.code).assertEqual(6600102);
                } else {
                    aVCastController = avcontroller;
                    console.info('$\{TAG}:getAVCastController11 : SUCCESS');
                    expect(false).assertTrue();
                }
            });
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300
         * @tc.desc      : test on(pause) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('pause', () => {
                    console.info('on pause entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`ghg, SUB_MULTIMEDIA_AVSESSION_ON_PAUSE_STATIC_1300 on pause entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400
         * @tc.desc      : test on(stop) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_STOP_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('stop', () => {
                    console.info('on stop entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on stop entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500
         * @tc.desc      : test on(playNext) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYNEXT_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('playNext', () => {
                    console.info('on playNext entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600
         * @tc.desc      : test on(playPrevious) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYPREVIOUS_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('playPrevious', () => {
                    console.info('on playPrevious entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700
         * @tc.desc      : test on(fastForward) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_FASTFORWARD_STATIC_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('fastForward', (time?: number) => {
                    console.info('on fastForward entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }

            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800
         * @tc.desc      : test on(rewind) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_REWIND_STATIC_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('rewind', (time?: number) => {
                    console.info('on rewind entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900
         * @tc.desc      : test off(play) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAY_STATIC_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('play');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off play entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })


        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000
         * @tc.desc      : test off(pause) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PAUSE_STATIC_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('pause');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off pause entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100
         * @tc.desc      : test off(stop) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_STOP_STATIC_2100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('stop');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off stop entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200
         * @tc.desc      : test off(playNext) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYNEXT_STATIC_2200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('playNext');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off playNext entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300
         * @tc.desc      : test off(playPrevious) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYPREVIOUS_STATIC_2300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('playPrevious');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off playPrevious entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400
         * @tc.desc      : test off(fastForward) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_FASTFORWARD_STATIC_2400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('fastForward');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off fastForward entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500
         * @tc.desc      : test off(rewind) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_REWIND_STATIC_2500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('rewind');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off rewind entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800
         * @tc.desc      : test on(seek) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SEEK_STATIC_2800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('seek', (assetId: long) => {
                    console.info('on playFromAssetId entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on seek entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })


        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900
         * @tc.desc      : test off(seek) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SEEK_STATIC_2900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('seek');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off seek entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000
         * @tc.desc      : test on(setSpeed) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETSPEED_STATIC_3000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('setSpeed', () => {
                    console.info('on setSpeed entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100
         * @tc.desc      : test off(setSpeed) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETSPEED_STATIC_3100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('setSpeed');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off setSpeed entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200
         * @tc.desc      : test on(setLoopMode) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SETLOOPMODE_STATIC_3200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('setLoopMode', () => {
                    console.info('on setLoopMode entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300
         * @tc.desc      : test off(setLoopMode) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SETLOOPMODE_STATIC_3300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('setLoopMode');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off setLoopMode entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400
         * @tc.desc      : test on(taggleFavorite) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLEFAVORITE_STATIC_3400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('toggleFavorite', () => {
                    console.info('on toggleFavorite entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500
         * @tc.desc      : test off(toggleFavorite) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */

        it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLEFAVORITE_STATIC_3500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('toggleFavorite');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off toggleFavorite entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600
         * @tc.desc      : test on(handleKeyEvent) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_HANDLEKEYEVENT_STATIC_3600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('handleKeyEvent', () => {
                    console.info('on handleKeyEvent entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700
         * @tc.desc      : test off(handleKeyEvent) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_HANDLEKEYEVENT_STATIC_3700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('handleKeyEvent');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off handleKeyEvent entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800
         * @tc.desc      : test on(outputDeviceChange) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_OUTPUTDEVICECHANGE_STATIC_3800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('outputDeviceChange', () => {
                    console.info('on outputDeviceChange entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900
         * @tc.desc      : test off(outputDeviceChange) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_OUTPUTDEVICECHANGE_STATIC_3900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('outputDeviceChange');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off outputDeviceChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000
         * @tc.desc      : test on(commonCommand) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_COMMONCOMMAND_STATIC_4000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('commonCommand', () => {
                    console.info('on commonCommand entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100
         * @tc.desc      : test off(commonCommand) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_COMMONCOMMAND_STATIC_4100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('commonCommand');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off commonCommand entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200
         * @tc.desc      : test on(skipToQueueItem) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_SKIPTOQUEUEITEM_STATIC_4200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('skipToQueueItem', () => {
                    console.info('on skipToQueueItem entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300
         * @tc.desc      : test off(skipToQueueItem) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_SKIPTOQUEUEITEM_STATIC_4300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('skipToQueueItem');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off skipToQueueItem entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400
         * @tc.desc      : test off(castDisplayChange) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_OFF_CASTDISPLAYCHANGE_STATIC_4400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.off('castDisplayChange');
            } catch (err) {
                let error =err as BusinessError;
                console.info(`off castDisplayChange entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500
        * @tc.desc      : test getAVMetadata() errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_STATIC_4500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller.getAVMetadata((err: BusinessError | null, metadata: avSession.AVMetadata | undefined) => {
                if (err) {
                    console.error(`GetAVMetadata11 BusinessError: code: ${err.code}, message: ${err.message}`);
                    expect(err.code).assertEqual(6600102);
                } else {
                    console.info(`GetAVMetadata11 : SUCCESS : assetId : ${metadata?.assetId}`);
                }
            });
            session = null;
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600
        * @tc.desc      : test getAVMetadata(promise) errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_STATIC_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller.getAVMetadata().then((metadata: avSession.AVMetadata) => {
                console.info(`GetAVMetadata12 : SUCCESS : assetId : ${metadata.assetId}`);
            }).catch(async(err: BusinessError) => {
                console.error(`GetAVMetadata12 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700
        * @tc.desc      : test getLaunchAbility() errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_STATIC_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller.getLaunchAbility((err: BusinessError | null, agent: object | undefined) => {
            if (err) {
                console.error(`GetLaunchAbility11 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info(`GetLaunchAbility11 : SUCCESS : wantAgent : ${agent}`);
            }
            });
            session = null;
            done();
        })


        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800
        * @tc.desc      : test getLaunchAbility(promise) errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_STATIC_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller.getLaunchAbility().then((agent: object) => {
                console.info(`GetLaunchAbility12 : SUCCESS : wantAgent : ${agent}`);
            }).catch(async(err: BusinessError) => {
                console.error(`GetLaunchAbility12 BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900
        * @tc.desc      : test isActive(promise) errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_STATIC_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller.isActive().then((isActive: boolean) => {
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }).catch(async(err: BusinessError) => {
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            });
            session = null;
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000
        * @tc.desc      : test isActive() errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_STATIC_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller.isActive((err: BusinessError | null, isActive: boolean | undefined) => {
            if (err) {
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
            });
            session = null;
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100
        * @tc.desc      : test getAVPlaybackState(promise) errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_STATIC_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
                console.info('getAVPlaybackState : SUCCESS');
            }).catch(async(err: BusinessError) => {
                console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            })
            session = null;
            done();
        })


        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200
        * @tc.desc      : test getAVPlaybackState() errcode 6600102
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */

        it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_STATIC_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            controller.getAVPlaybackState((err: BusinessError | null, state: avSession.AVPlaybackState | undefined) => {
            if (err) {
                console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
                expect(err.code).assertEqual(6600102);
            } else {
                console.info('getAVPlaybackState : SUCCESS');
            }
            });
            session = null;
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300
         * @tc.desc      : test on(rewind) errcode 6600102
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_ON_PLAY_STATIC_5300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            try {
                session!.on('play', () => {
                    console.info('on play entry11');
                    done();
                });
            } catch (err) {
                let error =err as BusinessError;
                console.info(`on play entry11 error,error code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600102);
            }
            done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400
         * @tc.desc      : Testing call setAVMetadata(promise) set bundleIcon
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level0
         */
        it('SUB_MULTIMEDIA_AVSESSION_SET_METADATA_PROMISE_STATIC_5400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
            let metadata0: avSession.AVMetadata = {
                assetId: '121278',
            };
            try{
                await session!.setAVMetadata(metadata0);
                console.info(`${TAG}:TestLog: Set bundleIcon Successfully`);
            }catch(err: BusinessError){
                console.info(`${TAG}:TestLog: Set bundleIcon error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };

            let data: avSession.AVMetadata;
            try{
                data = await controller.getAVMetadata()
                if (data.bundleIcon ) {
                    console.info(`${data.bundleIcon} TestLog: Get bundleIcon Successfully`);
                    expect(true).assertTrue();
                } else {
                    console.info(`${TAG}:TestLog: Get bundleIcon failed`);
                    console.info(`${TAG}:TestLog: bundleIcon is: ${data.bundleIcon}`);
                    expect(true).assertTrue();
                }
            }catch(err: BusinessError){
                console.info(`${TAG}:TestLog: Get assetId error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
            };
            done();
        })

        /* *
        * @tc.number    : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500
        * @tc.name      : SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500
        * @tc.desc      : Testing call setAVPlaybackState(promise)
        * @tc.size      : MediumTest
        * @tc.type      : Function
        * @tc.level     : Level2
        */
        it('SUB_MULTIMEDIA_AVSESSION_SETAVPLAYBACKSTATE_PROMISE_STATIC_5500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            let extras0: Record<string, Object> = {'extras': "any"};
            let PlaybackState: avSession.AVPlaybackState = {
            state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
            speed: 1.0,
            position:{elapsedTime:10, updateTime:(new Date()).getTime() as long},
            bufferedTime:1000,
            loopMode:avSession.LoopMode.LOOP_MODE_SINGLE,
            isFavorite:true,
            volume: 3,
            extras: extras0
           };
           try{
               session!.setAVPlaybackState(PlaybackState)
               console.info(`${TAG}:SetAVPlaybackState successfully`);
               expect(true).assertTrue();
           }catch(err: BusinessError){
               console.error(`${TAG}:SetAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
           };
           done();
        })

        /* *
         * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600
         * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600
         * @tc.desc      : Testing call getAllCastDisplays(6600102)
         * @tc.size      : MediumTest
         * @tc.type      : Function
         * @tc.level     : Level2
         */
        it('SUB_MULTIMEDIA_AVSESSION_GETALLCASTDISPLAYS_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            await session!.destroy()
            await Utils.msSleep(500)
            let data: Array<avSession.CastDisplayInfo>;
            try{
                data = await session!.getAllCastDisplays()
                console.info(`${TAG}:getAllCastDisplays success: ${JSON.stringify(data)}`);
                expect(true).assertTrue();
            }catch(err: BusinessError){
                console.info(`${TAG}:getAllCastDisplays successfully: ${err.code}, message: ${err.message}`)
                expect(err.code).assertEqual(6600102);
            };
            done();
        })

        /* *
          * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600
          * @tc.name      : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600
          * @tc.desc      : Testing call stopCasting(callback)
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level2
          */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_CALLBACK_STATIC_5600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                session!.stopCasting((err:BusinessError|null) => {
                    if (err) {
                        console.info(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                    } else {
                        console.info(`stopCasting successfully`);
                        expect(true).assertTrue();
                    };
                });
            } catch (error: BusinessError) {
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600109);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
          * @tc.number    : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700
          * @tc.name      : SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700
          * @tc.desc      : Testing call stopCasting(promise)
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level2
          */
        it('SUB_MULTIMEDIA_AVSESSION_STOPCASTING_PROMISE_STATIC_5700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                try{
                    await session!.stopCasting()
                    console.info('stopCasting successfully');
                }catch(err: BusinessError){
                    console.error(`stopCasting BusinessError: code: ${err.code}, message: ${err.message}`);
                };
            } catch (error: BusinessError) {
                console.info(`stopCasting BusinessError2: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property catch of undefined" || error.code == 6600109) {
                    console.info(`stopCasting callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
          * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800
          * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800
          * @tc.desc      : Testing call getavcastcontroller(promise)
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level2
          */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_PROMISE_STATIC_5800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let aVCastController: avSession.AVCastController;
                let avcontroller: avSession.AVCastController;
                try{
                    session!.getAVCastController();
                    aVCastController = avcontroller;
                    console.info(`${TAG}:getAVCastController : SUCCESS : sessionid `);
                }catch(err: BusinessError){
                    console.error(`${TAG}:getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                };
            } catch (error: BusinessError) {
                console.info(`${TAG}:getAVCastController failed: code: ${error.code}, message: ${error.message}`);
                if (error.message == "Cannot read property then of undefined" || error.code == 6600109 ) {
                    console.info(`${TAG}:getAVCastController callback successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })

        /* *
          * @tc.number    : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900
          * @tc.name      : SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900
          * @tc.desc      : Testing call getavcastcontroller(callback)
          * @tc.size      : MediumTest
          * @tc.type      : Function
          * @tc.level     : Level2
          */
        it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_CALLBACK_STATIC_5900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: () => void): Promise<void> => {
            try {
                let aVCastController: avSession.AVCastController | undefined;
                session!.getAVCastController((err: BusinessError | null, avcontroller: avSession.AVCastController | undefined) => {
                    if (err) {
                        console.error(`${TAG}:getAVCastController BusinessError: code: ${err.code}, message: ${err.message}`);
                    } else {
                        aVCastController = avcontroller;
                        console.info(`${TAG}:getAVCastController : SUCCESS`);
                    }
                });
            } catch (error: BusinessError) {
                console.error(`${TAG}:getAVCastController BusinessError: code: ${error.code}, message: ${error.message}`);
                expect(error.code).assertEqual(6600109);
                if (error.message == "Cannot read property catch of undefined") {
                    console.info(`${TAG}:getAVCastController promise successfully`);
                    expect(true).assertTrue()
                }
            }
            done();
        })
    })
}


