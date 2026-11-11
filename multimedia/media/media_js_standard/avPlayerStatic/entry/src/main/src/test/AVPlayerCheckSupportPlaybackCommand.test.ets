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

import media from '@ohos.multimedia.media';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import MediaTestBase from './MediaTestBase.test';
import { setSource } from './AVPlayerTestBase.test';

const AUDIO_SOURCE = '01.mp3';
const INITIALIZED = 'initialized';
const PREPARED = 'prepared';
const PLAYING = 'playing';
const PAUSED = 'paused';
const WRONG_STATE_ERROR_CODE = 5400102;
let fileDescriptor: media.AVFileDescriptor | undefined;
let avPlayer: media.AVPlayer | null | undefined;
let mediaTestBase = new MediaTestBase();

function openFileFailed(): void {
  console.info('case file fail');
}

function avPlayerCheckSupportPlaybackCommandByPromise(done: () => void, command: media.PlaybackCommand,
  exceptValue: boolean): void {
  if (avPlayer == null) {
    console.info('case avPlayer is null');
    expect().assertFail();
    done();
    return;
  }
  avPlayer!!.checkSupportPlaybackCommand(command).then((result: boolean) => {
    console.info('Succeeded in checking support playback command, result: ' + result);
    expect(result).assertEqual(exceptValue);
    done();
  }).catch((error: Error) => {
    console.error(`Failed to check support playback command, error:${error}`);
    expect(exceptValue).assertEqual(false);
    done();
  });
}

export default function AVPlayerCheckSupportPlaybackCommand(): void {
  describe('AVPlayerCheckSupportPlaybackCommand', () => {
    beforeAll(async (): Promise<void> => {
      console.info('beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(AUDIO_SOURCE, openFileFailed)
        .then((res: media.AVFileDescriptor) => {
          fileDescriptor = res;
        });
    });
    beforeEach(async (): Promise<void> => {
      console.info('beforeEach case');
      await media.createAVPlayer().then((video: media.AVPlayer | undefined) => {
        if (typeof (video) != 'undefined') {
          avPlayer = video;
        } else {
          expect().assertFail();
        }
      }).catch(mediaTestBase.catchCallback);
    });
    afterEach(async (): Promise<void> => {
      console.info('afterEach case');
      if (avPlayer != null) {
        try {
          await avPlayer!!.release().then(() => {
            avPlayer = null;
            console.log('avPlayer has been to null');
          }).catch(mediaTestBase.catchCallback);
        } catch (error) {
          console.info(`afterEach error: ${JSON.stringify(error)}`);
        }
      }
    });
    afterAll(async (): Promise<void> => {
      console.info('afterAll case');
      try {
        await mediaTestBase.closeFdNumber(fileDescriptor!.fd);
      } catch (error) {
        console.info(`afterAll error: ${JSON.stringify(error)}`);
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0100
     * @tc.desc   query playback command SEEK in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0200
     * @tc.desc   query playback command RATE in prepared state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0300
     * @tc.desc   query playback command SEEK in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayer!!.play();
                  break;
                case PLAYING:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0400
     * @tc.desc   query playback command RATE in playing state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayer!!.play();
                  break;
                case PLAYING:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0500
     * @tc.desc   query playback command SEEK in paused state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayer!!.play();
                  break;
                case PLAYING:
                  avPlayer!!.pause();
                  break;
                case PAUSED:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_SEEK, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0600
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0600
     * @tc.desc   query playback command RATE in paused state
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayer!!.play();
                  break;
                case PLAYING:
                  avPlayer!!.pause();
                  break;
                case PAUSED:
                  avPlayerCheckSupportPlaybackCommandByPromise(done,
                    media.PlaybackCommand.PLAYBACK_COMMAND_RATE, true);
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0700
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0700
     * @tc.desc   query playback command SEEK without prepare, error code 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              console.info('case current state is: ' + state);
            });
            avPlayer!!.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_SEEK)
              .then((result: boolean) => {
                console.info('Succeeded in checking support playback command, result: ' + result);
                expect().assertFail();
                done();
              }).catch((error: Error) => {
                console.error(`Failed to check support playback command, error:${error}`);
                expect(error.code).assertEqual(WRONG_STATE_ERROR_CODE);
                done();
              });
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0800
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0800
     * @tc.desc   query playback command RATE without prepare, error code 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              console.info('case current state is: ' + state);
            });
            avPlayer!!.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_RATE)
              .then((result: boolean) => {
                console.info('Succeeded in checking support playback command, result: ' + result);
                expect().assertFail();
                done();
              }).catch((error: Error) => {
                console.error(`Failed to check support playback command, error:${error}`);
                expect(error.code).assertEqual(WRONG_STATE_ERROR_CODE);
                done();
              });
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0900
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0900
     * @tc.desc   query playback command SEEK without prepare, error code 5400102
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              console.info('case current state is: ' + state);
            });
            avPlayer!!.checkSupportPlaybackCommand(media.PlaybackCommand.PLAYBACK_COMMAND_SEEK)
              .then((result: boolean) => {
                console.info('Succeeded in checking support playback command, result: ' + result);
                expect().assertFail();
                done();
              }).catch((error: Error) => {
                console.error(`Failed to check support playback command, error:${error}`);
                expect(error.code).assertEqual(WRONG_STATE_ERROR_CODE);
                done();
              });
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_1000
     * @tc.number SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_1000
     * @tc.desc   check MD_KEY_TRACK_PLAYABLE in track description
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVPLAYER_CHECKSUPPORT_STATIC_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1,
      async (done: () => void): Promise<void> => {
        if (!avPlayer) {
          console.info(`avPlayer is null`);
          expect().assertFail();
          done();
        } else {
          try {
            avPlayer!!.onStateChange((state: media.AVPlayerState, reason: media.StateChangeReason) => {
              if (!avPlayer) return;
              console.info('case current state is: ' + state);
              switch (state) {
                case INITIALIZED:
                  avPlayer!!.prepare();
                  break;
                case PREPARED:
                  avPlayer!!.getTrackDescription().then((arrList: Array<media.MediaDescription>) => {
                    console.info('Succeeded in getting TrackDescription');
                    if (arrList.length) {
                      expect(string(media.MediaDescriptionKey.MD_KEY_TRACK_PLAYABLE)).assertEqual('is_playable');
                      for (let i = 0; i < arrList.length; i++) {
                        let playableValue = arrList[i][media.MediaDescriptionKey.MD_KEY_TRACK_PLAYABLE];
                        console.info('case track playable value is: ' + playableValue);
                        expect(playableValue != undefined).assertEqual(true);
                      }
                    } else {
                      expect().assertFail();
                    }
                    done();
                  }).catch((error: Error) => {
                    console.error(`Failed to get TrackDescription, error:${error}`);
                    expect().assertFail();
                    done();
                  });
                  break;
                default:
                  break;
              }
            });
            setSource(avPlayer!!, fileDescriptor);
          } catch (error) {
            console.error(`Test exception: ${JSON.stringify(error)}`);
            expect().assertFail();
            done();
          }
        }
      });
  });
}
