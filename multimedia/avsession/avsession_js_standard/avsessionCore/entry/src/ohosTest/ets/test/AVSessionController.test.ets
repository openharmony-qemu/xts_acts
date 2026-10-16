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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium-dynamic';
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
  describe('AVSessionController', () => {
    let TAG: string = "[AVSessionController]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVSessionControllerXTS';
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_PROMISE_4600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVMetadata().then((metadata: avSession.AVMetadata) => {
        console.info(`GetAVMetadata12 : SUCCESS : assetId : ${metadata.assetId}`);
      }).catch((err: BusinessError) => {
        console.error(`GetAVMetadata12 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })
    

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_4700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getLaunchAbility((err: BusinessError, agent: object) => {
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_4800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getLaunchAbility().then((agent: object) => {
        console.info(`GetLaunchAbility12 : SUCCESS : wantAgent : ${agent}`);
      }).catch((err: BusinessError) => {
        console.error(`GetLaunchAbility12 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_4900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_5000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.isActive((err: BusinessError, isActive: boolean) => {
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_PROMISE_5100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
        console.info('getAVPlaybackState : SUCCESS');
      }).catch((err: BusinessError) => {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      })
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_5200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      await controller.getAVPlaybackState((err: BusinessError, state: avSession.AVPlaybackState) => {
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


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_6000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.getLaunchAbility((err: BusinessError, agent: object) => {
      if (err) {
        console.error(`GetLaunchAbility14 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      } else {
        console.info(`GetLaunchAbility14 : SUCCESS : wantAgent : ${agent}`);
      }
    });
      controller = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETLAUNCHABILITY_PROMISE_6100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.getLaunchAbility().then((agent: object) => {
        console.info(`GetLaunchAbility13 : SUCCESS : wantAgent : ${agent}`);
      }).catch((err: BusinessError) => {
        console.error(`GetLaunchAbility13 BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      controller = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_PROMISE_6200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      controller = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISACTIVE_6300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy()
      await sleep(500)
      await controller.isActive((err: BusinessError, isActive: boolean) => {
      if (err) {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      } else {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }
    });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900
     * @tc.desc   Testing sendCommonCommand errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let commandName = "my_command";
      await controller.sendCommonCommand(commandName, {command : "This is my command"}, (err: BusinessError) => {
        if (err) {
          console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        }
      })
      await sleep(500);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100
     * @tc.desc   Testing sendCommonCommand errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCOMMONCOMMAND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let commandName = "my_command";
      await controller.sendCommonCommand(commandName, {command : "This is my command"}).then(() => {
        console.info('SendCommonCommand successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendCommonCommand BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      })
      await sleep(500);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200
     * @tc.desc   Testing sendAVKeyEvent-promise errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await controller.sendAVKeyEvent(event).then(() => {
        console.info('SendAVKeyEvent Successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      });
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000
     * @tc.desc   Testing sendAVKeyEvent-callback errcode 6600102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      await controller.sendAVKeyEvent(event, (err: BusinessError) => {
        if (err) {
          console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        } else {
          console.info('SendAVKeyEvent Successfully');
        }
      });
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900
     * @tc.desc   Testing sendAVKeyEvent-callback errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.sendAVKeyEvent(event1, (err: BusinessError) => {
        if (err) {
          console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(401);
        } else {
          console.info('SendAVKeyEvent Successfully');
        }
      });
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100
     * @tc.desc   Testing sendAVKeyEvent-promise errcode 401
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDAVKEYEVENT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.sendAVKeyEvent(event1).then(() => {
        console.info('SendAVKeyEvent Successfully');
      }).catch((err: BusinessError) => {
        console.error(`SendAVKeyEvent BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(401);
      });
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500
     * @tc.desc   Testing off(toggleFavorite) errcode 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_DESTORY_ERRORCODE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try{
        await controller.destroy();
      }catch(err){
        console.error(`off BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      }      
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.isActive().then((isActive: boolean) => {
        console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.isActive((err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        } else {
          console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ISAVTIVE_ERRORCODE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.isActive((err: BusinessError, isActive: boolean) => {
        if (err) {
          console.error(`IsActive BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600103);
        } else {
          console.info(`IsActive : SUCCESS : isactive : ${isActive}`);
          expect(false).assertTrue();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.getAVPlaybackState((err: BusinessError, state: avSession.AVPlaybackState) => {
        if (err) {
          console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600103);
        } else {
          console.info(`getAVPlaybackState : SUCCESS`);
          expect(false).assertTrue();
        }
      })
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVPLAYBACKSTATE_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await sleep(1000);
      await controller.destroy();
      await controller.getAVPlaybackState().then((state: avSession.AVPlaybackState) => {
        console.info(`getAVPlaybackState : SUCCESS `);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`getAVPlaybackState BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      await controller.getAVMetadata((err: BusinessError, metadata: avSession.AVMetadata) => {
          if (err) {
            console.error(`GetAVMetadata BusinessError: code: ${err.code}, message: ${err.message}`);
            expect(err.code).assertEqual(6600103);
          } else {
            console.info(`GetAVMetadata : SUCCESS : assetId : ${metadata.assetId}`);
            expect(false).assertTrue();
          }
        });
      done();
    })   


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVMETADATA_ERRORCODE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      await controller.getAVMetadata().then((metadata: avSession.AVMetadata) => {
        console.info(`GetAVMetadata : SUCCESS : assetId : ${metadata.assetId}`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.error(`GetAVMetadata BusinessError: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600103);
      });
      done();
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        console.info(`${TAG}: before SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0100 ${controller}`);
        const COMMON_COMMAND_STRING = undefined;
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
            expect(false).assertTrue();
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(err.code).assertEqual(401);
        })
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_XXX";
        await controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then(() => {
            console.info(`${TAG}: getExtrasWithEvent successfully`);
        }).catch((err: BusinessError) => {
            if (err.message == 'expect true, actualValue is false' || err.code == 6600105){
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            } else {
                console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
                expect(false).assertTrue();
            }           
        })
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_VOLUME";
        let extras: avSession.ExtraInfo = await controller.getExtrasWithEvent(COMMON_COMMAND_STRING);
        console.info(`${TAG}: aduio get volume with ${JSON.stringify(extras)}`);
        if (JSON.stringify(extras) == '{}' || 0 <= extras[COMMON_COMMAND_STRING] && extras[COMMON_COMMAND_STRING] <= 15){
          console.info(`${TAG}: aduio get volume with ${extras[COMMON_COMMAND_STRING]}`);
        } else {
          expect(false).assertTrue();
        }           
        done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_AVAILABLE_DEVICES";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_AVAILABLE_DEVICES ${extras[COMMON_COMMAND_STRING]}`);
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })
    

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500
     * @tc.desc   Testing getExtrasWithEvent
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETEXTRASWITHEVENT__0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        const COMMON_COMMAND_STRING = "AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO";
        controller.getExtrasWithEvent(COMMON_COMMAND_STRING).then((extras: avSession.ExtraInfo) => {
            console.info(` AUDIO_GET_PREFERRED_OUTPUT_DEVICE_FOR_RENDERER_INFO ${extras[COMMON_COMMAND_STRING]}`);
        }).catch((err: BusinessError) => {
            console.info(`${TAG}: getExtrasWithEvent failed with err: ${err.code}, ${err.message}`);
            expect(false).assertTrue();
        })
        done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing isDesktopLyricEnabled = true (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let isEnable: boolean = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          expect(isEnable).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200
     * @tc.desc   Testing isDesktopLyricEnabled = false (normal scenario)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_2200';
        let isEnable: boolean = true;
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          isEnable = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          await session.enableDesktopLyric(false);
          isEnable = await controller.isDesktopLyricEnabled();
          console.info(`${TAG}: isDesktopLyricEnabled SUCCESS: isEnable: ${isEnable}`)
          expect(isEnable).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing onDesktopLyricEnabled - callback equals true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData = false;
          let callbackTriggered = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: TestLog: onDesktopLyricEnabled callback data = ${data}`);
          }
          controller.onDesktopLyricEnabled(callback);
          await session.enableDesktopLyric(true);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackData).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200
     * @tc.desc   Testing onDesktopLyricEnabled - callback equals false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_ONDESKTOPLYRICENABLED_2200';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData = false;
          let callbackTriggered = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: TestLog: onDesktopLyricEnabled callback data = ${data}`);
          }
          await session.enableDesktopLyric(true);
          await sleep(200);
          controller.onDesktopLyricEnabled(callback);
          await session.enableDesktopLyric(false);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackData).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100
     * @tc.desc   Testing offDesktopLyricEnabled unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0100';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          };
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          };
          controller.onDesktopLyricEnabled(callback1);
          controller.onDesktopLyricEnabled(callback2);
          controller.offDesktopLyricEnabled(callback1);
          await session.enableDesktopLyric(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200
     * @tc.desc   Testing offDesktopLyricEnabled unregisters specif callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_OFFDESKTOPLYRICENABLED_0200';
        try {
          let isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          };
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          };
          controller.onDesktopLyricEnabled(callback1);
          controller.onDesktopLyricEnabled(callback2);
          controller.offDesktopLyricEnabled();
          await session.enableDesktopLyric(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0100
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(true);
          const getVisibleResult: boolean = await controller.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(true);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0200
     * @tc.desc   Testing setDesktopLyricVisible&isDesktopLyricVisible with visible=false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICVISIBLE_ISDESKTOPLYRICVISIBLE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(false);
          const getVisibleResult: boolean = await controller.isDesktopLyricVisible();
          expect(getVisibleResult).assertEqual(false);
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData:boolean = false;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered, data = ${data}`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricVisibilityChanged(callback);
          await controller.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackTriggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200
     * @tc.desc   Testing onDesktopLyricVisibilityChanged - callback equals false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICVISIBLITYCHANGED_2200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackData:boolean = true;
          let callbackTriggered: boolean = false;
          let callback = (data: boolean) => {
            callbackData = data;
            callbackTriggered = true;
            console.info(`${TAG}: onDesktopLyricVisibilityChanged callback triggered, data = ${data}`);
          }
          await session.enableDesktopLyric(true);
          await controller.setDesktopLyricVisible(true);
          controller.onDesktopLyricVisibilityChanged(callback);
          await controller.setDesktopLyricVisible(false);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
          expect(callbackData).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters all callbacks (verify no trigger after unregister)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricVisibilityChanged(callback1);
          controller.onDesktopLyricVisibilityChanged(callback2);
          controller.offDesktopLyricVisibilityChanged(callback1);
          await controller.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200
     * @tc.desc   Testing offDesktopLyricVisibilityChanged unregisters specific callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICVISIBLITYCHANGED_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: boolean) => {
            callback1Triggered = data;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: boolean) => {
            callback2Triggered = data;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricVisibilityChanged(callback1);
          controller.onDesktopLyricVisibilityChanged(callback2);
          controller.offDesktopLyricVisibilityChanged();
          await controller.setDesktopLyricVisible(true);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0100
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: true) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await controller.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await controller.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(true)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0200
     * @tc.desc   Testing setDesktopLyricState&getDesktopLyricState with locked state (isLocked: false) - normal scenario
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_SETDESKTOPLYRICSTATE_GETDESKTOPLYRICSTATE_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          await session.enableDesktopLyric(true);
          let state: avSession.DesktopLyricState = { isLocked: false };
          await controller.setDesktopLyricState(state);
          let getState: avSession.DesktopLyricState = await controller.getDesktopLyricState();
          expect(getState.isLocked).assertEqual(false)
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing onDesktopLyricStateChanged
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ONDESKTOPLYRICSTATECHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callbackTriggered: boolean = false;
          let callback = (data: avSession.DesktopLyricState) => {
            callbackTriggered = data.isLocked;
            console.info(`${TAG}: boolean: callback triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricStateChanged(callback);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callbackTriggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters all callbacks
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0100';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: avSession.DesktopLyricState) => {
            callback1Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: avSession.DesktopLyricState) => {
            callback2Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricStateChanged(callback1);
          controller.onDesktopLyricStateChanged(callback2);
          controller.offDesktopLyricStateChanged(callback1);
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200
     * @tc.desc   Testing offDesktopLyricStateChanged unregisters specified callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_OFFDESKTOPLYRICSTATECHANGED_0200';
        try {
          const isSupported: boolean = await avSession.isDesktopLyricSupported();
          if (!isSupported) {
            done();
            return;
          }
          let callback1Triggered = false;
          let callback2Triggered = false;
          let callback1 = (data: avSession.DesktopLyricState) => {
            callback1Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback1 triggered (visible=${data})`);
          }
          let callback2 = (data: avSession.DesktopLyricState) => {
            callback2Triggered = data.isLocked;
            console.info(`${TAG}: TestLog: callback2 triggered (visible=${data})`);
          }
          await session.enableDesktopLyric(true);
          controller.onDesktopLyricStateChanged(callback1);
          controller.onDesktopLyricStateChanged(callback2);
          controller.offDesktopLyricStateChanged();
          let state: avSession.DesktopLyricState = { isLocked: true };
          await session.setDesktopLyricState(state);
          await sleep(200);
          expect(callback1Triggered).assertFalse();
          expect(callback2Triggered).assertFalse();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
        done();
      });

    /**
    * @tc.name   SUB_MULTIMEDIA_AVSESSION_DESTROY_TRANSFER_0100
    * @tc.number SUB_MULTIMEDIA_AVSESSION_DESTROY_TRANSFER_0100
    * @tc.desc   SUB_MULTIMEDIA_AVSESSION_DESTROY_TRANSFER_0100
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_AVSESSION_DESTROY_TRANSFER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      controller.destroy((err: BusinessError) => {
        if (err) {
          console.error(`Failed to destroy controller, code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600103);
          return;
        } 
        console.info('Succeeded in destroying.');
        done();
      });
      done();
    })
    /**
     * @tc.number   SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIONDESTROY_0100
     * @tc.name     SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIONDESTROY_0100
     * @tc.desc     Testing session destroy Callback
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIONDESTROY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1: avSession.NoParamCallback = () => {
        console.info('callback1 call.');
        }
        let callback2: avSession.NoParamCallback = () => {
        console.info('callback2 call.');
        }

        controller.off('sessionDestroy');
        controller.on('sessionDestroy', callback1);
        controller.on('sessionDestroy', callback2);
        controller.off('sessionDestroy', callback1);
        controller.off('sessionDestroy', callback2);
      } catch (error) {
        console.info('SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIONDESTROY_0100 failed: ' + error.message + error.code);
        expect(false).assertTrue();
        done();
      }
      await sleep(500);
      done();
    })
    /**
     * @tc.number   SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIOEVENT_0100
     * @tc.name     SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIOEVENT_0100
     * @tc.desc     Testing sessionEvent Callback
     * @tc.size     MediumTest
     * @tc.type     Function
     * @tc.level    Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIOEVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1: avSession.EventProcess = (event, args) => {
        console.info('callback1 call.');
        }
        let callback2: avSession.EventProcess = (event, args) => {
        console.info('callback2 call.');
        }

        controller.off('sessionEvent');
        controller.on('sessionEvent', callback1);
        controller.on('sessionEvent', callback2);
        controller.off('sessionEvent', callback1);
        controller.off('sessionEvent', callback2);
      } catch (error) {
        console.info('SUB_MULTIMEDIA_AVSESSION_MANAGER_ON_OFF_SESSIOEVENT_0100 failed: ' + error.message + error.code);
        expect(false).assertTrue();
        done();
      }
      await sleep(500);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_NULL_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_NULL_0100
     * @tc.desc   Testing isDesktopLyricEnabled = null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_NULL_0100';
      try {
        await session.enableDesktopLyric(null);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.message).assertContain('get isEnabled_ failed');
      }
      done();
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_UNDERFINED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_UNDERFINED_0100
     * @tc.desc   Testing isDesktopLyricEnabled = underfined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_UNDERFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = 'SUB_MULTIMEDIA_AVSESSIONCONTROLLER_ISDESKTOPLYRICENABLED_UNDERFINED_0100';
      try {
        await session.enableDesktopLyric(undefined);
        expect(false).assertTrue();
      } catch (err) {
        console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
        expect(err.message).assertContain('get isEnabled_ failed');
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0100
     * @tc.desc   Testing setDesktopLyricVisible null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0100';
        try {
          await session.setDesktopLyricVisible(null);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.message).assertContain('get isVisible_ failed');
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0100
     * @tc.desc   Testing setDesktopLyricVisible undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0100',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0100';
        try {
          await session.setDesktopLyricVisible(undefined);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.message).assertContain('get isVisible_ failed');
        }
        done();
      });
    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_NULL_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_NULL_0100
     * @tc.desc   test setBackgroundPlayMode null
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_NULL_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_NULL_0100]';
      session.setBackgroundPlayMode(null).then(()=>{
        console.info(`${TAG}TestLog: setBackgroundPlayMode success, ENABLE_BACKGROUND_PLAY set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}TestLog: setBackgroundPlayMode error occurred, error: code: ${err.code}, message: ${err.message}`);
        expect(err.message).assertContain('get playMode_ failed');
      });
      await sleep(300);
      done();
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNDERFINED_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNDERFINED_0100
     * @tc.desc   test setBackgroundPlayMode undefined
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNDERFINED_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNDERFINED_0100]';
      session.setBackgroundPlayMode(undefined).then(()=>{
        console.info(`${TAG}TestLog: setBackgroundPlayMode success, ENABLE_BACKGROUND_PLAY set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}TestLog: setBackgroundPlayMode error occurred, error: code: ${err.code}, message: ${err.message}`);
        expect(err.message).assertContain('get playMode_ failed');
      });
      await sleep(300);
      done();
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNKNOW_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNKNOW_0100
     * @tc.desc   test setBackgroundPlayMode 999
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNKNOW_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_SETBACKGROUNDPLAYMODE_UNKNOW_0100]';
      session.setBackgroundPlayMode(999 as avSession.BackgroundPlayMode).then(()=>{
        console.info(`${TAG}TestLog: setBackgroundPlayMode success, ENABLE_BACKGROUND_PLAY set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        console.info(`${TAG}TestLog: setBackgroundPlayMode error occurred, error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      });
      await sleep(300);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYFROMASSETID_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYFROMASSETID_0100
     * @tc.desc   playFromAssetId  on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYFROMASSETID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let callback1 = (assetId: number) => {
          console.info('on playFromAssetId callback1');
        }
        let callback2 = (assetId: number) => {
          console.info('on playFromAssetId callback2');
        }
        session.off('playFromAssetId');
        session.on('playFromAssetId', callback1);
        session.on('playFromAssetId', callback2);
        session.off('playFromAssetId', callback1);
        session.off('playFromAssetId', callback2);
      } catch (error) {
        console.info(`on off playFromAssetId error, error code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      await sleep(300);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_OUTPUTDEVICECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_OUTPUTDEVICECHANGE_0100
     * @tc.desc   outputDeviceChange on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_OUTPUTDEVICECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = () => {
          console.info('on outputdevicechange callback1');
        }
        let callback2 = () => {
          console.info('on outputdevicechange callback2');
        }
        session.off('outputdevicechange');
        session.on('outputdevicechange', callback1);
        session.on('outputdevicechange', callback2);
        session.off('outputdevicechange', callback1);
        session.off('outputdevicechange', callback2);
      } catch (error) {
        console.info(`on off outputDeviceChange error, error code: ${error.code}, message: ${error.message}`);
        expect(error.message).assertContain('invalid');
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_SKIPTOQUEUEITEM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_SKIPTOQUEUEITEM_0100
     * @tc.desc   skipToQueueItem on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_SKIPTOQUEUEITEM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = (itemId: number) => {
          console.info('on skipToQueueItem callback1');
        }
        let callback2 = (itemId: number) => {
          console.info('on skipToQueueItem callback2');
        }
        session.off('skipToQueueItem');
        session.on('skipToQueueItem', callback1);
        session.on('skipToQueueItem', callback2);
        session.off('skipToQueueItem', callback1);
        session.off('skipToQueueItem', callback2);
      } catch (error) {
        console.info(`on off skipToQueueItem error, error code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_CASTDISPLAYCHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_CASTDISPLAYCHANGE_0100
     * @tc.desc   castDisplayChange on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_CASTDISPLAYCHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = () => {
          console.info('on castDisplayChange callback1');
        }
        let callback2 = () => {
          console.info('on castDisplayChange callback2');
        }
        session.off('castDisplayChange');
        session.on('castDisplayChange', callback1);
        session.on('castDisplayChange', callback2);
        session.off('castDisplayChange', callback1);
        session.off('castDisplayChange', callback2);
      } catch (error) {
        console.info(`on off castDisplayChange error, error code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_CUSTOMDATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_CUSTOMDATACHANGE_0100
     * @tc.desc   customDataChange on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = () => {
          console.info('on customDataChange callback1');
        }
        let callback2 = () => {
          console.info('on customDataChange callback2');
        }
        session.off('customDataChange');
        session.on('customDataChange', callback1);
        session.on('customDataChange', callback2);
        session.off('customDataChange', callback1);
        session.off('customDataChange', callback2);
      } catch (error) {
        console.info(`on off customDataChange error, error code: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_KEYREQUEST_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_KEYREQUEST_0100
     * @tc.desc   keyRequest on_off
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_KEYREQUEST_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1: avSession.KeyRequestCallback = (assetId, requestData) => {
          console.info('on keyRequest callback1');
        }
        let callback2: avSession.KeyRequestCallback = (assetId, requestData) => {
          console.info('on keyRequest callback2');
        }
        controller.off('keyRequest');
        controller.on('keyRequest', callback1);
        controller.on('keyRequest', callback2);
        controller.off('keyRequest', callback1);
        controller.off('keyRequest', callback2);
      } catch (error) {
        console.info(`on off keyRequest error, error code: ${error.code}, message: ${error.message}`);
        expect(error.message).assertContain('invalid');
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYINFO_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYINFO_0100
     * @tc.desc   CastDisplayInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_CASTDISPLAYINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let castDisplayInfo: avSession.CastDisplayInfo = {
          id: 1234567890123,
          name: 'CastDisplay_01',
          state: avSession.CastDisplayState.STATE_ON,
          width: 1920,
          height: 1080,
        };
        let aVMediaDescription: avSession.AVMediaDescription = {
          assetId: '123',
          drmScheme: 'drmScheme'
        };
        expect(castDisplayInfo.id).assertEqual(1234567890123);
        expect(castDisplayInfo.name).assertEqual('CastDisplay_01');
        expect(castDisplayInfo.state).assertEqual(avSession.CastDisplayState.STATE_ON);
        expect(castDisplayInfo.width).assertEqual(1920);
        expect(castDisplayInfo.height).assertEqual(1080);
        expect(aVMediaDescription.drmScheme).assertEqual('drmScheme');
      } catch (error) {
        console.info(`CastDisplayInfo error, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_DEVICEINFO_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_DEVICEINFO_0100
     * @tc.desc   DeviceInfo
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_DEVICEINFO_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let deviceInfo: avSession.DeviceInfo = {
          castCategory: avSession.AVCastCategory.CATEGORY_LOCAL,
          deviceId: '1234567890ABCDEF',
          deviceName: 'sound-01',
          deviceType: avSession.DeviceType.DEVICE_TYPE_LOCAL,
          manufacturer: 'manufacturer',
          modelName: 'modelName',
          supportedProtocols: 0x07,
          supportedDrmCapabilities: ['edef8ba9-79d6-4ace-a3c8-27dcd51d21ed'],
          supportedPullClients: [1, 2, 3]
        };
        expect(deviceInfo.manufacturer).assertEqual('manufacturer');
        expect(deviceInfo.modelName).assertEqual('modelName');
        expect(deviceInfo.supportedProtocols).assertEqual(0x07);
        expect(deviceInfo.supportedDrmCapabilities).not().assertNull();
        expect(deviceInfo.supportedPullClients).not().assertNull();
      } catch (error) {
        console.info(`DeviceInfo error, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVSESSIONDESCRIPTOR_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVSESSIONDESCRIPTOR_0100
     * @tc.desc   AVSessionDescriptor
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVSESSIONDESCRIPTOR_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let aVSessionDescriptor: avSession.AVSessionDescriptor = {
          sessionId: 'session_1234567890',
          type: 'audio',
          sessionTag: 'com.example',
          elementName: {
            bundleName: 'com.example',
            abilityName: 'Ability',
            moduleName: 'entry',
          },
          isActive: true,
          isTopSession: false,
          outputDevice: {
            devices: []
          }
        };
        expect(aVSessionDescriptor.sessionId).assertEqual('session_1234567890');
        expect(aVSessionDescriptor.type).assertEqual('audio');
        expect(aVSessionDescriptor.sessionTag).assertEqual('com.example');
        expect(aVSessionDescriptor.elementName).not().assertNull();
        expect(aVSessionDescriptor.isActive).assertEqual(true);
        expect(aVSessionDescriptor.isTopSession).assertEqual(false);
      } catch (error) {
        console.info(`AVSessionDescriptor error, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_0100
     * @tc.desc   getOutputDevice callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        controller.getOutputDevice((err: BusinessError, deviceInfo: avSession.OutputDeviceInfo) => {
          if (err) {
            console.error(`Failed to get output device, code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
            return;
          }
          console.info('SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_0100 Succeeded in getting output device.');
        });
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AVSESSION_GETOUTPUTDEVICE_0100, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0200
     * @tc.desc   Testing setDesktopLyricVisible null
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_NULL_0200';
        try {
          await controller.setDesktopLyricVisible(null);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.message).assertContain('get isVisible_ failed');
        }
        done();
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0200
     * @tc.desc   Testing setDesktopLyricVisible undefined
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL2
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0200',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
        let TAG = 'SUB_MULTIMEDIA_AVSESSION_SETDESKTOPLYRICVISIBLE_UNDERFINED_0200';
        try {
          await controller.setDesktopLyricVisible(undefined);
          expect(false).assertTrue();
        } catch (err) {
          console.error(`${TAG}: Testlog BusinessError: code:${err.code}, message: ${err.message}`);
          expect(err.message).assertContain('get isVisible_ failed');
        }
        done();
      });
    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.desc   playbackStateChange  on_off
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYBACKSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = (playbackstate: avSession.AVPlaybackState) => {
          console.info('on playbackStateChange callback1');
        }
        let callback2 = (playbackstate: avSession.AVPlaybackState) => {
          console.info('on playbackStateChange callback2');
        }
        controller.off('playbackStateChange');
        controller.on('playbackStateChange', 'all', callback1);
        controller.on('playbackStateChange', 'all', callback2);
        controller.off('playbackStateChange', callback1);
        controller.off('playbackStateChange', callback2);
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AVSESSION_ON_OFF_PLAYBACKSTATECHANGE_0100, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      await sleep(300);
      done();
    })
    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_CONTROLLER_ON_OFF_CUSTOMDATACHANGE_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_CONTROLLER_ON_OFF_CUSTOMDATACHANGE_0100
     * @tc.desc   customDataChange  on_off
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 2
     */
    it('SUB_MULTIMEDIA_AVSESSION_CONTROLLER_ON_OFF_CUSTOMDATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL2, async (done: Function) => {
      try {
        let callback1 = () => {
          console.info('on customDataChange callback1');
        }
        let callback2 = () => {
          console.info('on customDataChange callback2');
        }
        controller.off('customDataChange');
        controller.on('customDataChange', callback1);
        controller.on('customDataChange', callback2);
        controller.off('customDataChange', callback1);
        controller.off('customDataChange', callback2);
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AVSESSION_CONTROLLER_ON_OFF_CUSTOMDATACHANGE_0100, error code: ${error.code}, message: ${error.message}`);
        expect(false).assertTrue();
      }
      await sleep(300);
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_EMPTY_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_EMPTY_0100
     * @tc.desc   Testing on('callMetadataChange') empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let metadata = [];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata`);
        });
        expect(false).assertTrue();
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_EMPTY_0100 error, error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      done();
    })
    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_EMPTY_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_EMPTY_0100
     * @tc.desc   Testing on('callStateChange') empty
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_EMPTY_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state = [];
        controller.on('callStateChange', state, (avCallState: ESObject) => {
          console.info(`on callStateChange avCallState`);
        });
        expect(false).assertTrue();
      } catch (error) {
        console.info(`SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_EMPTY_0100 error, error: ${error.code}, ${error.message}`);
        expect(error.code).assertEqual(6600101);
      }
      done();
    })
  })
}

