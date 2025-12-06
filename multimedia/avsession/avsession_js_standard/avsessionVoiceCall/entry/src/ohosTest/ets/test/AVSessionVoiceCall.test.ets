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

let changedata: avSession.AVMetadata = {
  assetId : '9526',
  title: "lose yourself",
  artist: "Eminem",
  author: "ST",
  avQueueName: "session queuename",
  avQueueId: "session queueid",
  avQueueImage: "session queueimage",
  album: "Slim shady",
  writer: "ST",
  composer: "ST",
  duration: 2222,
  mediaImage: "https://www.example.com/example.jpg",
  publishDate: new Date(1994,1,1,1),
  subtitle: "8 Mile",
  description: "Rap",
  lyric: "lrc格式歌词内容",
  singleLyricText: "单条歌词内容",
  previousAssetId: "121277",
  nextAssetId: "121279",
  filter: 2,
  drmSchemes: ['123123','456456'],
  skipIntervals: 10,
  displayTags: 1
};

let playbackstate: avSession.AVPlaybackState = {
  state:avSession.PlaybackState.PLAYBACK_STATE_PLAY,
  speed: 1.0,
  position: {elapsedTime:10, updateTime:(new Date()).getTime()},
  bufferedTime: 1000,
  loopMode: avSession.LoopMode.LOOP_MODE_SINGLE,
  isFavorite: true,
  activeItemId: 123456,
  volume: 4,
  maxVolume: 15,
  muted: true,
  duration: 123,
  videoWidth: 30,
  videoHeight: 20,
  extras: {'EX': 'this is session ex'}
};

let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

interface Size_Pixel {
  height: number,
  width: number
}

interface Opts {
  editable: boolean,
  pixelFormat: number,
  size: Size_Pixel,
  AlphaType: number
};

interface callMetadata0 {
  name: string,
  phoneNumber: string,
  avatar?: ESObject
};

interface callMetadata1 {
  name: number
};

interface callMetadata2 {
  phoneNumber: number
};

interface callMetadata3 {
  avatar: number
};

interface callMetadata5 {
  name: string,
  phoneNumber: string
};

interface callMetadata6 {
  name: string
};

interface callMetadata7 {
  phoneNumber: string
};

interface callMetadataOne {
  name: string,
  phoneNumber: string
};

interface avCallState {
  state?: number | string,
  muted?: boolean | string,
};

interface callMetadata {
  name: string,
  phoneNumber: string
};

interface AVCallState {
  state: number,
  muted: boolean
};


let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('AVSessionVoiceCallTest', () => {
    let TAG: string = "[AVSessionVoiceCallTest]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let receivedCallback1: boolean = false;
    let receivedCallback2: boolean = false;
    let tag: string = 'VoiceCallXTS';
    let assetId: string = 'assetIdTest';
    let assetId1: string = '';
    let assetId2: string = '';
    let assetId3: string = '~!@#$%^&*()_+{}:">?,./123456789'+'a'.repeat(40928);
    let assetId4: string = 'a'.repeat(40960)
    let assetId5: number = 123

    let getPixelMap = async () => {
      let color = new ArrayBuffer(96);
      let bufferArr = new Uint8Array(color);
      bufferArr.fill(3, 0, 95);
      let opts: Opts = {
        editable: true,
        pixelFormat: 3,
        size: {
          height: 4, width: 6
        },
        AlphaType: 3
      };
      return image.createPixelMap(color, opts);
    }

    let callMetadataChangeCallback1 = (callMetadata: ESObject) => {
      console.info(`${TAG}: callMetadataChangeCallback1 received callMetadata: ${JSON.stringify(callMetadata)}`);
      if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
        console.error(`${TAG}: callMetadataChangeCallback1 received callMetadata unmatch`);
        expect().assertFail();
      }
      receivedCallback1 = true;
    }

    let callMetadataChangeCallback2 = (callMetadata: ESObject) => {
      console.info(`${TAG}: callMetadataChangeCallback2 received callMetadata: ${JSON.stringify(callMetadata)}`);
      if (callMetadata.name != '123456789' || callMetadata.phoneNumber != '65432111' || callMetadata.avatar != null) {
        console.error(`${TAG}: callMetadataChangeCallback2 received callMetadata unmatch`);
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    let callStateChangeCallback1 = (callState: ESObject) => {
      console.info(`${TAG}: callStateChangeCallback1 received callState: ${JSON.stringify(callState)}`);
      if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
        console.error(`${TAG}: callStateChangeCallback1 received callState unmatch`);
        expect().assertFail();
      }
      receivedCallback1 = true;
    }

    let callStateChangeCallback2 = (callState: ESObject) => {
      console.info(`${TAG}: callStateChangeCallback2 received callState: ${JSON.stringify(callState)}`);
      if (callState.state != avSession.CallState.CALL_STATE_WAITING || callState.muted) {
        console.error(`${TAG}: callStateChangeCallback2 received callState unmatch`);
        expect().assertFail();
      }
      receivedCallback2 = true;
    }

    let answerCallback1 = () => {
      console.info(`${TAG}: answerCallback1 received`);
      receivedCallback1 = true;
    }

    let answerCallback2 = () => {
      console.info(`${TAG}: answerCallback2 received`);
      receivedCallback2 = true;
    }

    let hangUpCallback1 = () => {
      console.info(`${TAG}: hangUpCallback1 received`);
      receivedCallback1 = true;
    }

    let hangUpCallback2 = () => {
      console.info(`${TAG}: hangUpCallback2 received`);
      receivedCallback2 = true;
    }

    let toggleCallMuteCallback1 = () => {
      console.info(`${TAG}: toggleCallMuteCallback1 received`);
      receivedCallback1 = true;
    }

    let toggleCallMuteCallback2 = () => {
      console.info(`${TAG}: toggleCallMuteCallback2 received`);
      receivedCallback2 = true;
    }

    let playWithAssetIdCallback1 = (data: string) => {
      console.info(`${TAG}: playWithAssetIdCallback1 received ${data}`);
      assetId1 = data;
    }

    let playWithAssetIdCallback2 = (data: string) => {
      console.info(`${TAG}: playWithAssetIdCallback2 received ${data}`);
      assetId2 = data;
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
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100
     * @tc.desc   Testing set callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let pixelMap = await getPixelMap();
      let readBuffer0 = new ArrayBuffer(96);
      await pixelMap.readPixelsToBuffer(readBuffer0);
      let bufferArr0 = new Uint8Array(readBuffer0);
      let callMetadata0: callMetadata0 = {
        name: '12345678',
        phoneNumber: '65432111',
        avatar: pixelMap
      };
      await session.setCallMetadata(callMetadata0).then(() => {
        console.info(`${TAG}: setCallMetadata set avatar successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixMap: ESObject;
      await controller.getCallMetadata().then((data: ESObject) => {
        if (data.name === '12345678' && data.phoneNumber === '65432111') {
          console.info(`${TAG}: getCallMetadata get name and phoneNumber Successfully`);
        } else {
          console.info(`${TAG}: getCallMetadata get name and phoneNumber failed`);
          console.info(`${TAG}: name is: ${data.name}, phoneNumber is ${data.phoneNumber}`);
          expect(false).assertTrue();
          done();
        }
        pixMap = data.avatar;
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixelSize: ESObject = pixMap.getPixelBytesNumber();
      console.info(`${TAG}: pixelSize is: ${pixelSize}`);
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
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadata1 = {
        name: 1
      };
      await session.setCallMetadata(callMetadata1).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setCallMetadata with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata2: callMetadata2 = {
        phoneNumber: 123
      };
      await session.setCallMetadata(callMetadata2).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setCallMetadata with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata3: callMetadata3 = {
        avatar: 1
      };
      await session.setCallMetadata(callMetadata3).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setCallMetadata with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500
     * @tc.desc   Testing set error callMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata4: ESObject = {};
      await session.setCallMetadata(callMetadata4).then(() => {
        console.info(`${TAG}: setCallMetadata with error callMetadata test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setCallMetadata with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600
     * @tc.desc   Testing destroy before setCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata5: callMetadata5 = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      await session.destroy();
      await session.setCallMetadata(callMetadata5).then(() => {
        console.info(`${TAG}: setCallMetadata without avsession test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 6600102) {
          console.info(`${TAG}: setCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700
     * @tc.desc   Testing set name - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata6: callMetadata6 = {
        name: '12345678'
      };
      await session.setCallMetadata(callMetadata6).then(() => {
        console.info(`${TAG}: setCallMetadata set name successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set name error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getCallMetadata().then((data: ESObject) => {
        if (data.name === '12345678') {
          console.info(`${TAG}: getCallMetadata get name Successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getCallMetadata get name failed`);
          console.info(`${TAG}: name is: ${data.name}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800
     * @tc.desc   Testing set phoneNumber - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata7: callMetadata7 = {
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata7).then(() => {
        console.info(`${TAG}: setCallMetadata set phoneNumber successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set phoneNumber error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getCallMetadata().then((data: ESObject) => {
        if (data.phoneNumber === '65432111') {
          console.info(`${TAG}: getCallMetadata get phoneNumber Successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getCallMetadata get phoneNumber failed`);
          console.info(`${TAG}: phoneNumber is: ${data.phoneNumber}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900
     * @tc.desc   Testing set avatar - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let pixelMap = await getPixelMap();
      let readBuffer0 = new ArrayBuffer(96);
      await pixelMap.readPixelsToBuffer(readBuffer0);
      let bufferArr0 = new Uint8Array(readBuffer0);
      let callMetadata8: ESObject = {
        avatar: pixelMap
      };
      await session.setCallMetadata(callMetadata8).then(() => {
        console.info(`${TAG}: setCallMetadata set avatar successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixMap: ESObject;
      await controller.getCallMetadata().then((data: ESObject) => {
        pixMap = data.avatar;
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getCallMetadata set avatar error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      let pixelSize: ESObject = pixMap.getPixelBytesNumber();
      console.info(`${TAG}: pixelSize is: ${pixelSize}`);
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
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100
     * @tc.desc   Testing destroy before getCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata0: callMetadata0 = {
        name: '1234568',
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata0).then(() => {
        console.info(`${TAG}: setCallMetadata successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await session.destroy();
      await controller.getCallMetadata().then(() => {
        console.info(`${TAG}: getCallMetadata without avsession test fail, get successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err) {
          if (err.code == 6600102) {
            console.info(`${TAG}: getCallMetadata without avsession test success, error: code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TAG}: getCallMetadata get successful without avsession test fail, get successful!`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200
     * @tc.desc   Testing destroy before getCallMetadata - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadataOne = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      await session.setCallMetadata(callMetadata1).then(() => {
        console.info(`${TAG}: setCallMetadata successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setCallMetadata error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      await controller.destroy();
      await controller.getCallMetadata().then(() => {
        console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err) {
          if (err.code == 6600103) {
            console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TAG}: getCallMetadata without controller test fail, get successful!`);
          expect(false).assertTrue();
        }
      });
      controller = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100
     * @tc.desc   Testing set callMetadata0 - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let pixelMap = await getPixelMap();
        let readBuffer0 = new ArrayBuffer(96);
        await pixelMap.readPixelsToBuffer(readBuffer0);
        let bufferArr0 = new Uint8Array(readBuffer0);
        let callMetadata0: callMetadata0 = {
          name: '12345678',
          phoneNumber: '65432111',
          avatar: pixelMap
        };
        session.setCallMetadata(callMetadata0, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set successfully`);
            let pixMap: ESObject;
            controller.getCallMetadata((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                if (data.name === '12345678' && data.phoneNumber === '65432111') {
                  console.info(`${TAG}: getCallMetadataCallback get name and phoneNumber Successfully`);
                } else {
                  console.info(`${TAG}: getCallMetadataCallback failed, name is: ${data.name}, phoneNumber is ${data.phoneNumber}`);
                  expect(false).assertTrue();
                  done();
                }
                pixMap = data.avatar;
                let pixelSize: ESObject = pixMap.getPixelBytesNumber();
                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                let readBuffer = new ArrayBuffer(pixelSize);
                pixMap.readPixelsToBuffer(readBuffer);
                let bufferArr2 = new Uint8Array(readBuffer);
                for (let i = 0; i < bufferArr2.length; i++) {
                  if (bufferArr0[i] !== bufferArr2[i]) {
                    expect(false).assertTrue();
                  } else {
                    expect(true).assertTrue();
                  }
                }
                done();
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata1: callMetadata1 = {
        name: 1
      };
      try {
        session.setCallMetadata(callMetadata1, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setCallMetadataCallback with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setCallMetadataCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setCallMetadataCallback with error callMetadata test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata2: callMetadata2 = {
        phoneNumber: 123
      };
      try {
        session.setCallMetadata(callMetadata2, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setCallMetadataCallback with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setCallMetadataCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setCallMetadataCallback with error callMetadata test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata3: callMetadata3 = {
        avatar: 1
      };
      try {
        session.setCallMetadata(callMetadata3, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setCallMetadataCallback with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setCallMetadataCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setCallMetadataCallback with error callMetadata test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500
     * @tc.desc   Testing set error callMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata4: ESObject = {};
      session.setCallMetadata(callMetadata4, (err: BusinessError, data: ESObject) => {
        if (err) {
          if (err.code == 401) {
            console.info(`${TAG}: setCallMetadataCallback with error callMetadata test success, error: code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        } else {
          console.info(`${TAG}: setCallMetadataCallback with error callMetadata test fail, set successful!`);
          expect(false).assertTrue();
        }
        done();
      });
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600
     * @tc.desc   Testing destroy before setCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata5: callMetadata5 = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      try {
        await session.destroy();
        session.setCallMetadata(callMetadata5, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: setCallMetadataCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setCallMetadataCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setCallMetadataCallback without avsession test fail, set successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070
     * @tc.desc   Testing set name - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0070', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata6: callMetadata6 = {
        name: '12345678'
      };
      try {
        session.setCallMetadata(callMetadata6, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set name error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set name successfully`);
            controller.getCallMetadata().then((data: ESObject) => {
              if (data.name === '12345678') {
                console.info(`${TAG}: getCallMetadata get name Successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getCallMetadata get name failed`);
                console.info(`${TAG}: name is: ${data.name}`);
                expect(false).assertTrue();
              }
              done();
            }).catch((err: BusinessError) => {
              console.info(`${TAG}: getCallMetadata get name error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080
     * @tc.desc   Testing set phoneNumber - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0080', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata7: callMetadata7 = {
        phoneNumber: '65432111'
      };
      try {
        session.setCallMetadata(callMetadata7, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set phoneNumber error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set phoneNumber successfully`);
            controller.getCallMetadata().then((data: ESObject) => {
              if (data.phoneNumber === '65432111') {
                console.info(`${TAG}: getCallMetadata get phoneNumber Successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getCallMetadata get phoneNumber failed`);
                console.info(`${TAG}: name is: ${data.name}`);
                expect(false).assertTrue();
              }
              done();
            }).catch((err: BusinessError) => {
              console.info(`${TAG}: getCallMetadata get phoneNumber error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
              done();
            });
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090
     * @tc.desc   Testing set avatar - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETCALLMETADATA_CALLBACK_0090', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let pixelMap = await getPixelMap();
        let readBuffer0 = new ArrayBuffer(96);
        await pixelMap.readPixelsToBuffer(readBuffer0);
        let bufferArr0 = new Uint8Array(readBuffer0);
        let callMetadata8: ESObject = {
          avatar: pixelMap
        };
        session.setCallMetadata(callMetadata8, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setCallMetadataCallback set avatar error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: setCallMetadataCallback set avatar successfully`);
            let pixMap: ESObject;
            controller.getCallMetadata((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getCallMetadataCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
                done();
              } else {
                pixMap = data.avatar;
                let pixelSize: ESObject = pixMap.getPixelBytesNumber();
                console.info(`${TAG}: pixelSize is: ${pixelSize}`);
                let readBuffer = new ArrayBuffer(pixelSize);
                pixMap.readPixelsToBuffer(readBuffer);
                let bufferArr2 = new Uint8Array(readBuffer);
                for (let i = 0; i < bufferArr2.length; i++) {
                  if (bufferArr0[i] !== bufferArr2[i]) {
                    expect(false).assertTrue();
                  } else {
                    expect(true).assertTrue();
                  }
                }
                done();
              }
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100
     * @tc.desc   Testing destroy before getCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        controller.getCallMetadata((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: getCallMetadataCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: getCallMetadataCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200
     * @tc.desc   Testing destroy before getCallMetadata - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETCALLMETADATA_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        controller.getCallMetadata((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600103) {
              console.info(`${TAG}: getCallMetadataCallback without controller test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: getCallMetadataCallback errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getCallMetadataCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          controller = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_ACTIVE,
        muted: true,
      };
      await session.setAVCallState(avCallState0).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 2 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed, callState: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      await session.setAVCallState(avCallState1).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 0 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed, callState: ${JSON.stringify(data)}`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState2: avCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true,
      };
      await session.setAVCallState(avCallState2).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 1 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState3: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      await session.setAVCallState(avCallState3).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 3 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState4: avCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: true,
      };
      await session.setAVCallState(avCallState4).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 4 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState5: avCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true,
      };
      await session.setAVCallState(avCallState5).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 5 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState6: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
        muted: true,
      };
      await session.setAVCallState(avCallState6).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 6 && data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800
     * @tc.desc   Testing set AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState7: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: false,
      };
      await session.setAVCallState(avCallState7).then(() => {
        console.info(`${TAG}: setAVCallState successfully`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });

      await controller.getAVCallState().then((data: ESObject) => {
        if (data.state === 0 && !data.muted) {
          console.info(`${TAG}: getAVCallState successfully`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: getAVCallState failed`);
          expect(false).assertTrue();
        }
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: getAVCallState error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState8: avCallState = {
        state: -1,
        muted: true,
      };
      await session.setAVCallState(avCallState8).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState with error state test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState9: avCallState = {
        state: 8,
        muted: true,
      };
      await session.setAVCallState(avCallState9).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState with error state test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState10: avCallState = {
        state: '123',
        muted: true,
      };
      await session.setAVCallState(avCallState10).then(() => {
        console.info(`${TAG}: setAVCallState with error state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState with error state test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState11: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: '123',
      };
      await session.setAVCallState(avCallState11).then(() => {
        console.info(`${TAG}: setAVCallState with error muted test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState with error muted test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300
     * @tc.desc   Testing destroy before setAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState12: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      await session.destroy();
      await session.setAVCallState(avCallState12).then(() => {
        console.info(`${TAG}: setAVCallState without avsession test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 6600102) {
          console.info(`${TAG}: setAVCallState without avsession test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState13: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
      };
      await session.setAVCallState(avCallState13).then(() => {
        console.info(`${TAG}: setAVCallState without muted test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState without muted test success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500
     * @tc.desc   Testing set error AVCallstate - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState14: avCallState = {
        muted: true,
      };
      await session.setAVCallState(avCallState14).then(() => {
        console.info(`${TAG}: setAVCallState without state test fail, set successful!`);
        expect(false).assertTrue();
      }).catch((err: BusinessError) => {
        if (err.code == 401) {
          console.info(`${TAG}: setAVCallState without state success, error: code: ${err.code}, message: ${err.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: setAVCallState errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        }
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100
     * @tc.desc   Testing destroy before getAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        await session.setAVCallState(avCallState0).then(() => {
          console.info(`${TAG}: setAVCallState successfully`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        await session.destroy();
        await controller.getAVCallState().then(() => {
          console.info(`${TAG}: getAVCallState without session test fail, get successful!`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          if (err.code == 6600102) {
            console.info(`${TAG}: getCallMetadata without session test success, error: code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        });
        session = null;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200
     * @tc.desc   Testing destroy before getAVCallState - promise
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_PROMISE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        await session.setAVCallState(avCallState1).then(() => {
          console.info(`${TAG}: setAVCallState successfully`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState error: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
        await controller.destroy();
        await controller.getAVCallState().then(() => {
          console.info(`${TAG}: getAVCallState without controller test fail, get successful!`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          if (err.code == 6600103) {
            console.info(`${TAG}: getCallMetadata without controller test success, error: code: ${err.code}, message: ${err.message}`);
            expect(true).assertTrue();
          } else {
            console.info(`${TAG}: getCallMetadata errorCode != 6600103, error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
          }
        });
        controller = null;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState0: avCallState = {
        state: avSession.CallState.CALL_STATE_ACTIVE,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState0, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 2 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState1: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState1, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 0 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState2: avCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState2, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 1 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState3: avCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState3, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 3 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState4: avCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState4, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 4 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState5: avCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState5, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 5 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState6: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState6, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 6 && data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800
     * @tc.desc   Testing set AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState7: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: false,
      };
      try {
        session.setAVCallState(avCallState7, (err: BusinessError, data: ESObject) => {
          if (err) {
            console.info(`${TAG}: setAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
            expect(false).assertTrue();
            done();
          } else {
            console.info(`${TAG}: setAVCallStateCallback successfully`);
            controller.getAVCallState((err: BusinessError, data: ESObject) => {
              if (err) {
                console.info(`${TAG}: getAVCallStateCallback error: code: ${err.code}, message: ${err.message}`);
                expect(false).assertTrue();
              } else if (data.state === 0 && !data.muted) {
                console.info(`${TAG}: getAVCallStateCallback successfully`);
                expect(true).assertTrue();
              } else {
                console.info(`${TAG}: getAVCallStateCallback failed`);
                expect(false).assertTrue();
              }
              done();
            })
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState8: avCallState = {
        state: -1,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState8, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback with error state test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState9: avCallState = {
        state: 8,
        muted: true,
      };
      try {
        session.setAVCallState(avCallState9, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback with error state test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState10: avCallState = {
        state: '123',
        muted: true,
      };
      try {
        session.setAVCallState(avCallState10, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback with error state test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState11: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: '123',
      };
      try {
        session.setAVCallState(avCallState11, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback with error muted test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback with error muted test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300
     * @tc.desc   Testing destroy before setAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState12: avCallState = {
        state: avSession.CallState.CALL_STATE_IDLE,
        muted: true,
      };
      try {
        await session.destroy();
        session.setAVCallState(avCallState12, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: setAVCallStateCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback without avsession test fail, set successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState13: avCallState = {
        state: avSession.CallState.CALL_STATE_DISCONNECTING,
      };
      try {
        session.setAVCallState(avCallState13, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback without muted test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback without muted test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500
     * @tc.desc   Testing set error AVCallstate - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SETAVCALLSTATE_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let avCallState14: avCallState = {
        muted: false,
      };
      try {
        session.setAVCallState(avCallState14, (err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 401) {
              console.info(`${TAG}: setAVCallStateCallback without state test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: setAVCallStateCallback errorCode != 401, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: setAVCallStateCallback without state test fail, set successful!`);
            expect(false).assertTrue();
          }
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100
     * @tc.desc   Testing destroy before getAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        controller.getAVCallState((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600102) {
              console.info(`${TAG}: getAVCallStateCallback without avsession test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getAVCallStateCallback without avsession test fail, get successful!`);
            expect(false).assertTrue();
          }
          session = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200
     * @tc.desc   Testing destroy before getAVCallState - callback
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCALLSTATE_CALLBACK_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        controller.getAVCallState((err: BusinessError, data: ESObject) => {
          if (err) {
            if (err.code == 6600103) {
              console.info(`${TAG}: getAVCallStateCallback without controller test success, error: code: ${err.code}, message: ${err.message}`);
              expect(true).assertTrue();
            } else {
              console.info(`${TAG}: getAVCallStateCallback errorCode != 6600102, error: code: ${err.code}, message: ${err.message}`);
              expect(false).assertTrue();
            }
          } else {
            console.info(`${TAG}: getAVCallStateCallback without controller test fail, get successful!`);
            expect(false).assertTrue();
          }
          controller = null;
          done();
        })
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '65432111' ||
            callMetadata.avatar != null) {
            console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
          }
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '654321111'
      };
      try {
        controller.on('callMetadataChange', 'all', (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          if (callMetadata.name != '12345678' || callMetadata.phoneNumber != '654321111' ||
            callMetadata.avatar != null) {
            console.error(`${TAG}: on callMetadataChange received callMetadata unmatch`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
          }
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '12345678',
        phoneNumber: '65432111'
      };
      let flag = false;
      try {
        controller.on('callMetadataChange', 'all', (callMetadata: ESObject) => {
          console.info(`on callMetadataChange callMetadata : ${JSON.stringify(callMetadata)}`);
          flag = true;
        });
        await controller.off('callMetadataChange');
        await session.setCallMetadata(callMetadata);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: callMetadataChange off fail, on callMetadataChange called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: callMetadataChange off`);
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on callMetadataChange called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on callMetadataChange not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callMetadataChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await controller.off('callMetadataChange', callMetadataChangeCallback1);
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: off callMetadataChange success and on callMetadataChange called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callMetadataChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback1);
        controller.on('callMetadataChange', metadata, callMetadataChangeCallback2);
        await controller.off('callMetadataChange');
        await session.setCallMetadata(callMetadata).catch((err: BusinessError) => {
          console.info(`${TAG}: setCallMetadata failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off callMetadataChange success!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let callMetadata: callMetadata = {
        name: '123456789',
        phoneNumber: '65432111'
      };
      try {
        let metadata = ['avatar'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.info(`${TAG}: on callMetadataChange called!`);
          if (callMetadata.avatar != null || callMetadata.name != null || callMetadata.phoneNumber != null) {
            console.info(`${TAG}: callMetadata is not empty, test failed! callMetadata: ${JSON.stringify(callMetadata)}`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: callMetadata is empty, test success`);
            expect(true).assertTrue();
          }
          done();
        });
        await session.setCallMetadata(callMetadata);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        let metadata = ['name', 'phoneNumber'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: on callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let metadata = ['abc'];
        controller.on('callMetadataChange', metadata, (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: on callMetadataChange with error metadata test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callMetadataChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000
     * @tc.desc   Testing on('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLMETADATACHANGE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        controller.on(-1, 'all', (callMetadata: ESObject) => {
          console.error(`${TAG}: on callMetadataChange called, test failed!`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 401) {
          console.info(`${TAG}: on callMetadataChange with error metadata test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callMetadataChange errorCode != 401, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100
     * @tc.desc   Testing off('callMetadataChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLMETADATACHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try {
        await controller.off('callMetadataChange');
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: off callMetadataChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off callMetadataChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: false
      };
      try {
        let state = ['state'];
        controller.on('callStateChange', state, (callState: ESObject) => {
          console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != null) {
            console.error(`${TAG}: on callStateChange received callState unmatch`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_INCOMING,
        muted: true
      };
      try {
        controller.on('callStateChange', 'all', (callState: ESObject) => {
          console.info(`on callStateChange callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_INCOMING || !callState.muted) {
            console.error(`${TAG}: on callStateChange received callState unmatch`);
            expect(false).assertTrue();
          } else {
            expect(true).assertTrue();
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_HOLDING,
        muted: true
      };
      let flag = false;
      try {
        controller.on('callStateChange', 'all', (stateChange: ESObject) => {
          console.info(`on callStateChange stateChange : ${JSON.stringify(stateChange)}`);
          flag = true;
        });
        await controller.off('callStateChange');
        await session.setAVCallState(AVCallState);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: callStateChange off fail, on callStateChange called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: callStateChange off`);
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on callStateChange called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on callStateChange not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callStateChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500
     * @tc.desc   Testing on('callStateChange')f
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await controller.off('callStateChange', callStateChangeCallback2);
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off callStateChange success and on callStateChange called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await controller.off('callStateChange');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_WAITING,
        muted: false
      };
      try {
        controller.on('callStateChange', 'all', callStateChangeCallback2);
        controller.on('callStateChange', 'all', callStateChangeCallback1);
        await controller.off('callStateChange');
        await session.setAVCallState(AVCallState).catch((err: BusinessError) => {
          console.info(`${TAG}: setAVCallState failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off callStateChange success!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let AVCallState: AVCallState = {
        state: avSession.CallState.CALL_STATE_DIALING,
        muted: false
      };
      try {
        let state = ['state'];
        controller.on('callStateChange', state, (callState: ESObject) => {
          console.info(`on callStateChange called, callState : ${JSON.stringify(callState)}`);
          if (callState.state != avSession.CallState.CALL_STATE_DIALING || callState.muted != null) {
            console.info(`${TAG}: on callStateChange test failed!`);
            expect(false).assertTrue();
          } else {
            console.info(`${TAG}: on callStateChange test success, muted is empty`);
            expect(true).assertTrue();
          }
          done();
        });
        await session.setAVCallState(AVCallState);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await controller.destroy();
        let state = ['muted'];
        controller.on('callStateChange', state, (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange called, stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: on callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        let state = ['abc'];
        controller.on('callStateChange', state, (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange with error param test failed! stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: on callStateChange with error param test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000
     * @tc.desc   Testing on('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_CALLSTATECHANGE_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        controller.on(-1, 'all', (stateChange: ESObject) => {
          console.info(`${TAG}: on callStateChange with error param test failed! stateChange: ${JSON.stringify(stateChange)}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 401) {
          console.info(`${TAG}: on callStateChange with error param test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on callStateChange errorCode != 401, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100
     * @tc.desc   Testing off('callStateChange')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_CALLSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await controller.destroy();
      try {
        await controller.off('callStateChange');
      } catch (error) {
        if (error.code == 6600103) {
          console.info(`${TAG}: off callStateChange without controller test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off callStateChange errorCode != 6600103, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        controller = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          expect(true).assertTrue();
          done();
        });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      let flag = false;
      try {
        session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          flag = true;
        });
        await session.off('answer');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: answer off fail, on answer called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: answer off`);
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on answer called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on answer not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('answer');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await session.off('answer', answerCallback1);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: off answer success and on answer called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('answer');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'answer',
      }
      try {
        session.on('answer', answerCallback1);
        session.on('answer', answerCallback2);
        await session.off('answer');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: answer off called`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600
     * @tc.desc   Testing destroy before on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('answer', () => {
          console.info(`${TAG}: on answer called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on answer test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700
     * @tc.desc   Testing on('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_ANSWER_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        session.on('123456', () => {
          console.info(`${TAG}: on answer called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 401) {
          console.info(`${TAG}: on answer with error param test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on answer errorCode != 401, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100
     * @tc.desc   Testing destroy before off('answer')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_ANSWER_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('answer');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off answer test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off answer errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          expect(true).assertTrue();
          done();
        });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      let flag = false;
      try {
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          flag = true;
        });
        await session.off('hangUp');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: hangUp off fail, on hangUp called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: hangUp off`);
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on hangUp called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on hangUp not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('hangUp');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await session.off('hangUp', hangUpCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off hangUp success and on hangUp called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('hangUp');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500
     * @tc.desc   Testing on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'hangUp',
      }
      try {
        session.on('hangUp', hangUpCallback1);
        session.on('hangUp', hangUpCallback2);
        await session.off('hangUp');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: hangUp off called`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600
     * @tc.desc   Testing destroy before on('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_HANGUP_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('hangUp', () => {
          console.info(`${TAG}: on hangUp called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100
     * @tc.desc   Testing destroy before off('hangUp')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_HANGUP_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('hangUp');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off hangUp without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off hangUp errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          expect(true).assertTrue();
          done();
        });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      let flag = false;
      try {
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          flag = true;
        });
        session.off('toggleCallMute');
        await controller.sendControlCommand(command);
        await sleep(500);
        if (flag) {
          console.info(`${TAG}: toggleCallMute off fail, on toggleCallMute called!`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: toggleCallMute off`);
          expect(true).assertTrue();
        }
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && receivedCallback2) {
          console.log(`${TAG}: on toggleCallMute called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on toggleCallMute not received`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('toggleCallMute');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await session.off('toggleCallMute', toggleCallMuteCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: off toggleCallMute success and on toggleCallMute called!`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        await session.off('toggleCallMute');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500
     * @tc.desc   Testing on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'toggleCallMute',
      }
      try {
        session.on('toggleCallMute', toggleCallMuteCallback1);
        session.on('toggleCallMute', toggleCallMuteCallback2);
        await session.off('toggleCallMute');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (!receivedCallback1 && !receivedCallback2) {
          console.log(`${TAG}: toggleCallMute off called`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: receivedCallback1: ${receivedCallback1}, receivedCallback2: ${receivedCallback2}`);
          expect(false).assertTrue();
        }
        receivedCallback1 = false;
        receivedCallback2 = false;
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600
     * @tc.desc   Testing destroy before on('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_TOGGLECALLMUTE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('toggleCallMute', () => {
          console.info(`${TAG}: on toggleCallMute called`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100
     * @tc.desc   Testing destroy before off('toggleCallMute')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_TOGGLECALLMUTE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('toggleCallMute');
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off toggleCallMute without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off toggleCallMute errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100
     * @tc.desc   Testing on('playWithAssetId') -- one on function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          expect(data === assetId).assertTrue();
          done();
        });
        await controller.sendControlCommand(command)
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200
     * @tc.desc   Testing on('playWithAssetId') -- many on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if ((assetId1 === assetId) && (assetId2 === assetId)) {
          console.log(`${TAG}: on playWithAssetId called`);
          expect(true).assertTrue();
        } else {
          console.error(`${TAG}: on playWithAssetId not received`);
          expect(false).assertTrue();
        }
        assetId1 = '';
        assetId2 = '';
        await session.off('playWithAssetId');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300
     * @tc.desc   Testing destroy before on('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_PLAYWITHASSETID_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.destroy();
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          expect(false).assertTrue();
          done();
        });
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: on playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: on playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        session = null;
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100
     * @tc.desc   Testing off('playWithAssetId') --off one function
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', (data: string) => {
          console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
          assetId1=data;
        });
        await session.off('playWithAssetId')
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(6600105);
          done();
        });
        await sleep(500);
        if (assetId1 === assetId) {
          console.log(`${TAG}: off playWithAssetId fail, on playWithAssetId called`);
          expect(false).assertTrue();
        } else {
          console.info(`${TAG}: playWithAssetId off`);
          expect(true).assertTrue();
        }
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200
     * @tc.desc   Testing off('playWithAssetId') -- off select on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await session.off('playWithAssetId', playWithAssetIdCallback2);
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(false).assertTrue();
          done();
        });
        await sleep(500);
        if (assetId2 === assetId) {
          console.log(`${TAG}: on playWithAssetId called`);
          expect(false).assertTrue();
        } else {
          console.error(`${TAG}: on playWithAssetId not received`);
          expect(true).assertTrue();
        }
        assetId1 = '';
        assetId2 = '';
        await session.off('playWithAssetId');
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300
     * @tc.desc   Testing off('playWithAssetId') -- off all on functions
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId
      }
      try {
        session.on('playWithAssetId', playWithAssetIdCallback1);
        session.on('playWithAssetId', playWithAssetIdCallback2);
        await session.off('playWithAssetId');
        await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(6600105);
          done();
        });
        done();
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400
     * @tc.desc   Testing not on('playWithAssetId') before off('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.off('playWithAssetId');
      } catch (error) {
        if (error.code == 6600101) {
          console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off playWithAssetId errorCode != 6600101, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500
     * @tc.desc   Testing destroy before off('playWithAssetId')
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYWITHASSETID_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.off('playWithAssetId')
      } catch (error) {
        if (error.code == 6600102) {
          console.info(`${TAG}: off playWithAssetId without avsession test success, error: code: ${error.code}, message: ${error.message}`);
          expect(true).assertTrue();
        } else {
          console.info(`${TAG}: off playWithAssetId errorCode != 6600102, error: code: ${error.code}, message: ${error.message}`);
          expect(false).assertTrue();
        }
        done();
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200
     * @tc.desc   Testing sendControlCommand(command)-promise-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId3
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data == assetId3).assertTrue();
            session.off('playWithAssetId')
            done();
          });
        await controller.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300
     * @tc.desc   Testing sendControlCommand(command)-promise-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId4
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400
     * @tc.desc   Testing sendControlCommand(command)-promise-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500
     * @tc.desc   Testing sendControlCommand(command)-promise-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId5
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600
     * @tc.desc   Testing sendControlCommand(command)-promise-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId1
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command).catch((err: BusinessError) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200
     * @tc.desc   Testing sendControlCommand(command)-callback-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId3
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data == assetId3).assertTrue();
            session.off('playWithAssetId')
            done();
          });
        await controller.sendControlCommand(command, (err: BusinessError) => {
          if (err) {
            console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
          } else {
            console.info('SendControlCommand successfully');
          }
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300
     * @tc.desc   Testing sendControlCommand(command)-callback-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId4
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400
     * @tc.desc   Testing sendControlCommand(command)-callback-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500
     * @tc.desc   Testing sendControlCommand(command)-callback-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId5
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600
     * @tc.desc   Testing sendControlCommand(command)-callback-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: assetId1
      }
      try {
          session.on('playWithAssetId', (data: string) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session.off('playWithAssetId');
            done();
          });
          await controller.sendControlCommand(command, (err: BusinessError) => {
            if (err) {
              console.error(`SendControlCommand BusinessError: code: ${err.code}, message: ${err.message}`);
              expect(err.code).assertEqual(401);
            } else {
              console.info('SendControlCommand successfully');
            }
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('metadataChange', 'all', (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);

      await session.setAVMetadata(changedata);

      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('metadataChange', 'all', (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);

      let changedata1: avSession.AVMetadata = {
        assetId : '9527',
        title: "lose yourself1",
        artist: "Eminem1",
        author: "ST1",
        avQueueName: "session queuename1",
        avQueueId: "session queueid1",
        avQueueImage: "session queueimage1",
        album: "Slim shady1",
        writer: "ST1",
        composer: "ST1",
        duration: 22221,
        mediaImage: "https://www.example.com/example.jpg1",
        publishDate: new Date(1994,1,1,2),
        subtitle: "8 Mile1",
        description: "Rap1",
        lyric: "lrc格式歌词内容1",
        singleLyricText: "单条歌词内容1",
        previousAssetId: "1212771",
        nextAssetId: "1212791",
        filter: 3,
        drmSchemes: ['123123','4564561'],
        skipIntervals: 15,
        displayTags: 1
      };

      await session.setAVMetadata(changedata1);

      await sleep(300);

      if (flag !== 2) {
        console.info(`metadatachange changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['assetId','title','artist','author','avQueueName','avQueueId','avQueueImage',
        'album','writer','composer','duration','mediaImage','publishDate','subtitle',
        'description','lyric','singleLyricText','previousAssetId','nextAssetId',
        'filter','drmSchemes','skipIntervals','displayTags']
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);

      let changedata1: avSession.AVMetadata = {
        assetId : '9527',
        title: "lose yourself1",
        artist: "Eminem1",
        author: "ST1",
        avQueueName: "session queuename1",
        avQueueId: "session queueid1",
        avQueueImage: "session queueimage1",
        album: "Slim shady1",
        writer: "ST1",
        composer: "ST1",
        duration: 22221,
        mediaImage: "https://www.example.com/example.jpg1",
        publishDate: new Date(1994,1,1,2),
        subtitle: "8 Mile1",
        description: "Rap1",
        lyric: "lrc格式歌词内容1",
        singleLyricText: "单条歌词内容1",
        previousAssetId: "1212771",
        nextAssetId: "1212791",
        filter: 3,
        drmSchemes: ['123123','4564561'],
        skipIntervals: 15,
        displayTags: 1
      };

      await session.setAVMetadata(changedata1);

      await sleep(300);

      if (flag !== 2) {
        console.info(`metadatachange filter changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['assetId','title','artist','author','avQueueName','avQueueId','avQueueImage',
        'album','writer','composer','duration','mediaImage','publishDate','subtitle',
        'description','lyric','singleLyricText','previousAssetId','nextAssetId',
        'filter','drmSchemes','skipIntervals','displayTags']
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });

      await session.setAVMetadata(changedata);

      await session.setAVMetadata(changedata);

      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800
     * @tc.desc   Testing metadata change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONMETADATACHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = []
      let flag = 0;

      await controller.on('metadataChange', filter, (metadata: avSession.AVMetadata) => {
        flag++;
        console.info(`metadatachange success flag : ${flag}`)
      });
      await session.setAVMetadata(changedata);
      await session.setAVMetadata(changedata);
      await sleep(300);

      if (flag == 2) {
        console.info(`metadatachange filter None failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('playbackStateChange', 'all', (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      await session.setAVPlaybackState(playbackstate);

      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;

      await controller.on('playbackStateChange', 'all', (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      let playbackstate1: avSession.AVPlaybackState = {
        state: 3,
        speed: 1.5,
        position: {elapsedTime:10, updateTime:(new Date()).getTime()},
        bufferedTime: 2000,
        loopMode: 2,
        isFavorite: false,
        activeItemId: 123457,
        volume: 5,
        maxVolume: 10,
        muted: false,
        duration: 124,
        videoWidth: 40,
        videoHeight: 50,
        extras: {'EX': 'this is session ex1'}
      };

      await session.setAVPlaybackState(playbackstate1);

      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['state','speed','position','bufferedTime','loopMode','isFavorite','activeItemId',
        'volume','maxVolume','muted','duration','videoWidth','videoHeight','extras']
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      let playbackstate1: avSession.AVPlaybackState = {
        state: 3,
        speed: 1.5,
        position: {elapsedTime:10, updateTime:(new Date()).getTime()},
        bufferedTime: 2000,
        loopMode: 2,
        isFavorite: false,
        activeItemId: 123457,
        volume: 5,
        maxVolume: 10,
        muted: false,
        duration: 124,
        videoWidth: 40,
        videoHeight: 50,
        extras: {'EX': 'this is session ex1'}
      };

      await session.setAVPlaybackState(playbackstate1);

      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange filter changeall failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = ['state','speed','position','bufferedTime','loopMode','isFavorite','activeItemId',
        'volume','maxVolume','muted','duration','videoWidth','videoHeight','extras']
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      await session.setAVPlaybackState(playbackstate);

      await sleep(300);

      if (flag !== 2) {
        console.info(`playbackStateChange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800
     * @tc.desc   Testing playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYBACKSTATECHANGE_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let filter = []
      let flag = 0;

      await controller.on('playbackStateChange', filter, (playbackstate: avSession.AVPlaybackState) => {
        flag++;
        console.info(`playbackStateChange success flag : ${flag}`)
      });

      await session.setAVPlaybackState(playbackstate);

      await session.setAVPlaybackState(playbackstate);

      await sleep(300);

      if (flag == 2) {
        console.info(`playbackStateChange filter all failed flag : ${flag}`)
        expect().assertFail()
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100
     * @tc.desc   Testing off playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.off('playbackStateChange');
      }catch(err){
        console.info(`playbackStateChange off failed flag : ${err.code}  ${err.message}`)
        expect().assertFail()
      }

      await sleep(300);

      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200
     * @tc.desc   Testing off playbackstate change callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level 3
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_PLAYBACKSTATECHANGE_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try{
        await controller.off('playbackStateChange');
      }catch(err){
        console.info(`playbackStateChange off failed flag : ${err.code}  ${err.message}`)
        expect().assertFail()
      }

      await sleep(300);

      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100
     * @tc.desc   test onPlayNext callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayNext((info:avSession.CommandInfo) => {
          console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});

        await sleep(300);
      } catch (err) {
        console.info(`on playNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100
     * @tc.desc   test onPlayNext errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYNEXT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlayNext((info:avSession.CommandInfo) => {
          console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100
     * @tc.desc   test offPlayNext callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayNext((info:avSession.CommandInfo) => {
          console.info(`onPlayNext entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offPlayNext();
        await controller.sendControlCommand({command:'playNext',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100
     * @tc.desc   test offPlayNext errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlayNext();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300
     * @tc.desc   test offPlayNext errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYNEXT_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlayNext();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayNext entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100
     * @tc.desc   test onPlayPrevious callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100
     * @tc.desc   test onPlayPrevious errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAYPREVIOUS_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100
     * @tc.desc   test offPlayPrevious callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlayPrevious((info:avSession.CommandInfo) => {
          console.info(`onPlayPrevious entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offPlayPrevious();
        await controller.sendControlCommand({command:'playPrevious',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`off playPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100
     * @tc.desc   test offPlayPrevious errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlayPrevious();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300
     * @tc.desc   test offPlayPrevious errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAYPREVIOUS_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlayPrevious();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplayPrevious entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100
     * @tc.desc   test onPlay callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100
     * @tc.desc   test onPlay errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONPLAY_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          expect(false).assertTrue()
        });
      } catch (err) {
        console.info(`onplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100
     * @tc.desc   test offPlay callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onPlay((info:avSession.CommandInfo) => {
          console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offPlay();
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200
     * @tc.desc   test offPlay callback unregistration with param
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */

    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let onCallback1 = (info:avSession.CommandInfo) => {
        console.info(`onPlay entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }

      let onCallback2 = (info:avSession.CommandInfo) => {
        console.info(`onPlay 2 entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      }


      try {
        await session.onPlay(onCallback1);
        await session.onPlay(onCallback2);
        await session.offPlay(onCallback1);
        await controller.sendControlCommand({command:'play',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100
     * @tc.desc   test offPlay errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offPlay();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300
     * @tc.desc   test offPlay errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFPLAY_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offPlay();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offplay entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100
     * @tc.desc   test onRewind callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onRewind(infocallback);
        await controller.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200
     * @tc.desc   test onRewind callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onRewind(infocallback);
        await controller.sendControlCommand({command:'rewind',parameter:10,commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100
     * @tc.desc   test onRewind errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONREWIND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        expect(false).assertTrue()
      })
      try {
        await session.onRewind(infocallback);
      } catch (err) {
        console.info(`onRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100
     * @tc.desc   test offRewind callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onRewind((info:avSession.CommandInfo) => {
          console.info(`onRewind entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offRewind();
        await controller.sendControlCommand({command:'rewind',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100
     * @tc.desc   test offRewind errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offRewind();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })

    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300
     * @tc.desc   test offRewind errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFREWIND_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offRewind();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offRewind entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100
     * @tc.desc   test onFastForward callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onFastForward(infocallback);
        await controller.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200
     * @tc.desc   test onFastForward callback registration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        flag++
      })
      try {
        await session.onFastForward(infocallback);
        await controller.sendControlCommand({command:'fastForward',parameter:10,commandInfo:{callerModuleName:'Center'}});
        await sleep(300);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertFail();
      }
      expect(flag).assertEqual(1);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100
     * @tc.desc   test onFastForward errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_ONFASTFORWARD_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      let infocallback:avSession.TwoParamCallback<number,avSession.CommandInfo> = ((time:number,info:avSession.CommandInfo)=>{
        console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
        expect(false).assertTrue()
      })
      try {
        await session.onFastForward(infocallback);
      } catch (err) {
        console.info(`onFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100
     * @tc.desc   test offFastForward callback unregistration
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      let flag = 0;
      try {
        await session.onFastForward((info:avSession.CommandInfo) => {
          console.info(`onFastForward entry & info: ${info.callerModuleName} ${info.callerBundleName} ${info.callerDeviceId} ${info.callerType}`);
          flag++
        });
        await session.offFastForward();
        await controller.sendControlCommand({command:'fastForward',commandInfo:{callerModuleName:'Center'}});
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600105);
      }
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100
     * @tc.desc   test offFastForward errcode 6600102
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy();
      try {
        await session.offFastForward();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600102);
      }
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300
     * @tc.desc   test offFastForward errcode 6600101
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFFASTFORWARD_ERRORCODE_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      try {
        await session.offFastForward();
        expect(false).assertTrue();
      } catch (err) {
        console.info(`offFastForward entry error,error code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      done();
    })
  })
}