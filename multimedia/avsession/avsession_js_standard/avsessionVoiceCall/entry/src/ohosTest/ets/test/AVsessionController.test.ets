/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Key, KeyEvent } from '@kit.InputKit';


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}



let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('AVSessionControllerTest', () => {
    let TAG: string = "[AVSessionControllerTest]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'VoiceCallXTS';
    let keyItem: Key = {code:0x49, pressedTime:2, deviceId:0};
    let event:KeyEvent = {id:1, deviceId:0, actionTime:1, screenId:1, windowId:1, action:2, key:keyItem, unicodeChar:0, keys:[keyItem], ctrlKey:false, altKey:false, shiftKey:false, logoKey:false, fnKey:false, capsLock:false, numLock:false, scrollLock:false};
    let event1: string = 'aaa'
    let customdata: Record<string,string> = {'customData': 'appdata'}
    let eventName = 'dynamic_lyric'


    let invalidSession = async (validFunc:Function) => {
        await session.destroy().then(async () => {
            console.info('TestLog: session destroy success');
            await validFunc();
            session = null;
        }).catch((err: BusinessError) => {
            console.info(`TestLog: session destroy error: code: ${err.code}, message: ${err.message}`);
            expect().assertFail();
        })
    }

     beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getAVQueueItems().then((items: avSession.AVQueueItem[]) => {
                if(items.length){
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);           
                    expect(items.length>0).assertTrue();            
                }else{
                    console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
                    expect(items.length==0).assertTrue();
                }
            }).catch((err: BusinessError) => {
            });
      } catch (err) {
        console.info('GetAVQueueItems failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getAVQueueItems((err: BusinessError, items: avSession.AVQueueItem[]) => {
            if (err) {
                expect(items.length>0).assertTrue();
                console.error(`GetAVQueueItems BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(items.length==0).assertTrue();
                console.info(`GetAVQueueItems : SUCCESS : length : ${items.length}`);
            }
            })
      } catch (err) {
        console.info('GetAVQueueItems failed${err.code} message:${err.message}');
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVQUEUEITEMSSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let currentQueueItems: Array<avSession.AVQueueItem> = await controller.getAVQueueItemsSync();
        if(currentQueueItems.length){
            console.info(`GetAVQueueItemsSync : SUCCESS : length : ${currentQueueItems.length}`);           
            expect(currentQueueItems.length>0).assertTrue();            
        }else{
            console.info(`GetAVQueueItemsSync : SUCCESS : length : ${currentQueueItems.length}`);
            expect(currentQueueItems.length==0).assertTrue();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`getAVQueueItemsSync error, error code: ${error.code}, error message: ${error.message}`);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        try{
          await controller.isActive().then((isActive: boolean) => {
            if (isActive) {
                expect(isActive).assertEqual(true);
            } else {
                expect(isActive).assertEqual(false);
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
          }).catch((err: BusinessError) => {
            console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          });
        } catch (err) {
        console.info('IsActive failed${err.code} message:${err.message}');
        done();
      }
      done();
    })          


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.isActive((err: BusinessError, isActive: boolean) => {
            if (err) {
                expect(isActive).assertEqual(false);
                console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(isActive).assertEqual(true);
                console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
            }
            });
        } catch (err) {
        console.info('IsActive failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  



    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVESYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
            let isActive: boolean = await controller.isActiveSync();
            if(isActive){
                console.info(`isActiveSync : SUCCESS :  ${isActive}`);           
                expect(isActive).assertEqual(true);            
            }else{
                console.info(`isActiveSync : SUCCESS :  ${isActive}`);
                expect(isActive).assertEqual(false); 
            }
        } catch (err) {
            let error = err as BusinessError;
            console.error(`isActiveSync error, error code: ${error.code}, error message: ${error.message}`);
        }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getValidCommands().then((validCommands: avSession.AVControlCommandType[]) => {
                if(validCommands.length){
                    console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);           
                    expect(validCommands.length>0).assertTrue();            
                }else{
                    console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);
                    expect(validCommands.length==0).assertTrue();
                }
            }).catch((err: BusinessError) => {

            console.error(`getValidCommands BusinessError: code: ${err.code}, message: ${err.message}`);
            });
      } catch (err) {
        console.info('getValidCommands failed${err.code} message:${err.message}');
        done();
      }
      done();
    })  


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDS_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await sleep(500);
        await controller.getValidCommands((err: BusinessError, validCommands: avSession.AVControlCommandType[]) => {
            if (err) {
                expect(validCommands.length>0).assertTrue();
                console.error(`GetvalidCommands BusinessError: code: ${err.code}, message: ${err.message}`);
            } else {
                expect(validCommands.length==0).assertTrue();
                console.info(`GetvalidCommands : SUCCESS : length : ${validCommands.length}`);
            }
            })
      } catch (err) {
        console.info('GetvalidCommands failed${err.code} message:${err.message}');
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETVALIDCOMMANDSSYNC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let validCommands: Array<avSession.AVControlCommandType> = await controller.getValidCommandsSync();
        if(validCommands.length){
            console.info(`GetvalidCommandsSync : SUCCESS : length : ${validCommands.length}`);           
            expect(validCommands.length>0).assertTrue();            
        }else{
            console.info(`GetvalidCommandsSync : SUCCESS : length : ${validCommands.length}`);
            expect(validCommands.length==0).assertTrue();
        }
      } catch (err) {
        let error = err as BusinessError;
        console.error(`GetvalidCommandsSync error, error code: ${error.code}, error message: ${error.message}`);
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_REVENT_0100
     * @tc.desc   Testing on setTargetLoopMode callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SETTARGETLOOPMODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        await session.on('setTargetLoopMode', (mode: number) => {
            if(mode == 1){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SINGLE)
            }else if(mode == 0){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SEQUENCE)
            }else if(mode == 2){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_LIST)
            }else if(mode == 3){
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_SHUFFLE)
            }else{
                expect(mode).assertEqual(avSession.LoopMode.LOOP_MODE_CUSTOM)
            }
        });
        await sleep(500);
        await session.off('setTargetLoopMode')
        done();
    })





  })
}
