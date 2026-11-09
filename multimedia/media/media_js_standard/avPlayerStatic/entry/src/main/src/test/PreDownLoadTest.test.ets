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
import resourceManager from '@ohos.resourceManager';
import MediaTestBase from './MediaTestBase.test';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Size, TestType } from "@ohos/hypium-static/src/main/indexStatic";
import { BusinessError } from '@ohos.base';
import HashMap from '@ohos.util.HashMap';
import fs from '@ohos.file.fs';
import { globalThis } from './Util.test';

const MAX_COUNT = 999999999;
const READ_TO_END: long = -1;
const MAX_PUSH_CHUNK_SIZE: long = 64 * 1024;
const DATA_NOT_NEEDED = -2;
const DATA_BUFFER_FULL = -3;
const CREAT_PROMISE_EVENT = 'createPromise';
const SET_CALLBACK_EVENT = 'setCallback';
const SET_MEDIA_SOURCE_EVENT = 'setMediaSource';
const PREPARE_EVENT = 'prepare';
const PLAY_EVENT = 'play';
const PLAYING_EVENT = 'playing';
const PAUSE_EVENT = 'pause'
const RELEASE_EVENT = 'release'
const ERROR_EVENT = 'error';
const END_EVENT = 'end';
const VIDEO_SOURCE = 'H264_AAC.mp4';
const FILE_LENGTH: long = 1894335;
const URL_TO_HEADER: Record<string, Record<string, string>> =
  { "https://xxx/xx.mp4" : {"content-length": "1894335"} }
const TAG = 'AVPlayer.MediaSource';
const url_1a1v_m3u8 = "https://hwposter-inland.hwcloudtest.cn/rem/DTA/20240117/h264-sm4c-hls/ChinaDRMLab_Promo_210525-264-30-480p-2000K/sm4c.m3u8"

let avPlayer: media.AVPlayer | undefined;
let mediaSource: media.MediaSource | undefined;
let resourceLoader: media.MediaSourceLoader;
let requests: HashMap<long, media.MediaSourceLoadingRequest> = new HashMap<long, media.MediaSourceLoadingRequest>(); // uuid:request
let fileDescriptor: resourceManager.RawFileDescriptor | undefined;
let uuid: long = 0;
let loaderFailure: string = '';
let loaderBytesAccepted: long = 0;
let loadingErrorInjected: boolean = false;
let mediaTestBase = new MediaTestBase()

interface PreDownConfig {
  url: string,
  playTime: number, // Used to PLAYING_EVENT, -1 means wait for end callback
  respondDataCount: number, // test for finishLoading
  needHeader: boolean,
  loadingError?: media.LoadingRequestError,
  loadingErrorAfterBytes?: long // Inject a fatal error without waiting for another read callback.
}

async function getAVPlayerRequest(testName: string, url: string, callBack: (request: media.MediaSourceLoadingRequest) => void) {
  let avPlayer = await media.createAVPlayer()
  let headers: Record<string, string> = {"User-Agent": "User-Agent-Value"};
  let mediaSource1 : media.MediaSource | undefined = media.createMediaSourceWithUrl(url, headers);
  let uuid: long = 1;
  let requests1: HashMap<long, media.MediaSourceLoadingRequest> = new HashMap<long, media.MediaSourceLoadingRequest>();


  let playStrategy: media.PlaybackStrategy = {
    preferredWidth: 1,
    preferredHeight: 2,
    preferredBufferDuration: 3,
    preferredHdr: false,
    preferredBufferDurationForPlaying: 1,
    showFirstFrameOnPrepare: false
  };
  let SourceCallbackCount: number = 0

  let sourceOpenCallback: media.SourceOpenCallback = (request: media.MediaSourceLoadingRequest) => {
    SourceCallbackCount++
    console.log(TAG, testName, `Opening resource: ${request.url}`);
    uuid += 1;
    requests1.set(uuid, request);
    callBack(request);
    return uuid;
  };

  let sourceReadCallback: media.SourceReadCallback = (uuid: long, requestedOffset: long, requestedLength: long) => {
    SourceCallbackCount++
    console.log(TAG, `Reading resource with handle ${uuid}, offset: ${requestedOffset}, length: ${requestedLength}`);
    avPlayer!!.release()
  };

  let sourceCloseCallback: media.SourceCloseCallback = (uuid: long) => {
    SourceCallbackCount++
    console.log(TAG, `Closing resource with handle ${uuid}`);
    requests1.remove(uuid);
  };

  let resourceLoader: media.MediaSourceLoader = {
    open: sourceOpenCallback,
    read: sourceReadCallback,
    close: sourceCloseCallback
  };

  mediaSource1!!.setMediaResourceLoaderDelegate(resourceLoader);
  console.log(TAG, `setMediaResourceLoaderDelegate success`)
  avPlayer?.onStateChange((state, reason) =>{
    console.info(`state change, current state is: ${state}`)
    if(state == "initialized"){
      console.info(TAG, `avPlayer enter initialized state`)
      avPlayer!!.prepare().then(() => {
        console.log(TAG, `avPlayer.prepare().then`)
      })
    }
    if(state == "prepared"){
      console.info(TAG, `avPlayer enter prepared state`)
    }
    if(state == "released"){
      console.info(TAG, `avPlayer enter released state`)
    }
  })
  avPlayer!!.setMediaSource(mediaSource1 as media.MediaSource, playStrategy)
  console.log(TAG, `setMediaSource success`)
}

function createEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void) {
  media.createAVPlayer().then((avplayer: media.AVPlayer | undefined) => {
    if (avplayer != null) {
      console.info('Succeeded in creating avplayer');
      avPlayer = avplayer;
      toNextStep(avPlayer, config, steps, done);
    } else {
      console.error('Failed to create avplayer');
      done();
    }
  }).catch((error: Error) => {
    console.error(`Failed to create avplayer, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function setCallbackEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  console.info(`case setAVPlayerCb`);
  avPlayer?.onStateChange((state, reason) => {
    console.info(`case state: ${state}, reason: ${state}`);
    switch (state) {
      case 'playing':
        break;
      case 'initialized':
        avPlayer!!.surfaceId = globalThis.value;
      default:
        toNextStep(avPlayer, config, steps, done);
    }
  })
  avPlayer?.onError((err) => {
    console.info(`case on error: ${err}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
  toNextStep(avPlayer, config, steps, done);
}

function respondHeader(uuid: long, config: PreDownConfig) {
  let request = requests.get(uuid);
  if (request) {
    let url = request.url;
    let header = URL_TO_HEADER[url];
    console.log(`case in respondHeader`)
    request.respondHeader(uuid, header);
    config.needHeader = false;
  }
}

function getReadEnd(offset: long, length: long, resourceLength: long): long {
  if (resourceLength < 0 || offset < 0 || offset > resourceLength || length < READ_TO_END) {
    throw new Error(`Invalid loader range: offset=${offset}, length=${length}, resourceLength=${resourceLength}`);
  }
  const remaining = resourceLength - offset;
  return length == READ_TO_END || length > remaining ? resourceLength : offset + length;
}

async function respondData(uuid: long, offset: long, length: long, config: PreDownConfig) {
  const request = requests.get(uuid);
  const descriptor = fileDescriptor;
  if (!request) {
    return;
  }
  if (!descriptor) {
    throw new Error(`Loader resource is not open: uuid=${uuid}`);
  }
  const end = getReadEnd(offset, length, descriptor.length);
  const errorAfterBytes = config.loadingErrorAfterBytes;
  while (offset < end && requests.get(uuid) === request) {
    let size: long = end - offset;
    if (size > MAX_PUSH_CHUNK_SIZE) {
      size = MAX_PUSH_CHUNK_SIZE;
    }
    if (errorAfterBytes !== undefined) {
      if (loadingErrorInjected) {
        return;
      }
      if (loaderBytesAccepted >= errorAfterBytes) {
        finishLoading(uuid, config);
        return;
      }
      const remaining = errorAfterBytes - loaderBytesAccepted;
      if (size > remaining) {
        size = remaining;
      }
    }
    const buffer = new ArrayBuffer(size.toInt());
    const bytesRead = fs.readSync(descriptor.fd, buffer, { offset: descriptor.offset + offset, length: size });
    if (bytesRead <= 0) {
      throw new Error(`Unexpected loader EOF: uuid=${uuid}, offset=${offset}, end=${end}`);
    }
    const accepted = request.respondData(uuid, offset, bytesRead == size ? buffer : buffer.slice(0, bytesRead.toInt()));
    if (accepted == DATA_NOT_NEEDED || accepted == DATA_BUFFER_FULL) {
      return;
    }
    if (accepted === undefined || accepted <= 0 || accepted > bytesRead) {
      throw new Error(`Invalid accepted length: uuid=${uuid}, accepted=${accepted}, sent=${bytesRead}`);
    }
    offset += accepted.toLong();
    loaderBytesAccepted += accepted.toLong();
    if (errorAfterBytes !== undefined && loaderBytesAccepted >= errorAfterBytes) {
      finishLoading(uuid, config);
      return;
    }
    if (offset < end) {
      await mediaTestBase.msleepAsync(0); // Allow read/close callbacks to run between chunks.
    }
  }
  if (requests.get(uuid) === request && offset == descriptor.length &&
    (config.loadingError === undefined || config.loadingError == media.LoadingRequestError.LOADING_ERROR_SUCCESS)) {
    finishLoading(uuid, config);
  }
}

function reportLoaderFailure(uuid: long, error: Error) {
  loaderFailure = `Loader failure: uuid=${uuid}, message=${error.message}`;
  console.error(loaderFailure);
  try {
    requests.get(uuid)?.finishLoading(uuid, media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE);
  } catch (finishError) {
    console.error(`Failed to report loader failure: ${finishError.message}`);
  }
}

function finishLoading(uuid: long, config: PreDownConfig) {
  const request = requests.get(uuid);
  if (request) {
    const loadingErr = config.loadingError ?? media.LoadingRequestError.LOADING_ERROR_SUCCESS;
    console.log(`case in finishLoading loadingError ${loadingErr}`);
    request.finishLoading(uuid, loadingErr);
    if (loadingErr != media.LoadingRequestError.LOADING_ERROR_SUCCESS) {
      loadingErrorInjected = true;
    }
  }
}

function initResourceLoader(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  loaderFailure = '';
  loaderBytesAccepted = 0;
  loadingErrorInjected = false;
  resourceLoader = {
    open: (request: media.MediaSourceLoadingRequest) => {
      if (!request) {
        console.error('request nullptr');
        expect().assertFail();
      }
      uuid += 1;
      requests.set(uuid, request);
      return uuid;
    },
    read: (uuid: long, requestedOffset: long, requestedLength: long) => {
      try {
        if (!requests.hasKey(uuid)) {
          console.warn('uuid not find');
          return;
        }
        if (config.needHeader) {
          respondHeader(uuid, config);
        }
        if (config.respondDataCount == 0 && config.loadingErrorAfterBytes === undefined) {
          finishLoading(uuid, config);
          return;
        }
        if (config.respondDataCount > 0) {
          config.respondDataCount -= 1;
        }
        if (config.loadingError == media.LoadingRequestError.LOADING_ERROR_NOT_READY) {
          finishLoading(uuid, config);
          config.loadingError = media.LoadingRequestError.LOADING_ERROR_SUCCESS;
          return;
        }
        respondData(uuid, requestedOffset, requestedLength, config).catch((error: Error) => {
          reportLoaderFailure(uuid, error);
        });
      } catch (error) {
        reportLoaderFailure(uuid, error);
      }
    },
    close: (uuid: long) => {
      requests.remove(uuid);
      config.needHeader = true;
    }
  }
  mediaSource = media.createMediaSourceWithUrl(config.url);
  mediaSource!!.setMediaResourceLoaderDelegate(resourceLoader);
}

function setMediaSourceEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void) {
  console.info('case setSourceEvent');
  let playStrategy : media.PlaybackStrategy = { preferredBufferDuration: 0 };
  initResourceLoader(avPlayer, config, steps, done);
  avPlayer?.setMediaSource(mediaSource!, playStrategy).catch((error: Error) => {
    console.error(`Failed to setMediaSource, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function prepareEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.info('case prepareEvent');
  avPlayer?.prepare().catch((error: Error) => {
    console.error(`Failed to prepare, error message:${error}`);
  })
}

function playEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.info('case playEvent');
  avPlayer?.play().then(() => {
    console.info('play success');
    setTimeout(() => {
      toNextStep(avPlayer, config, steps, done);
  }, 3000)
  }).catch((error: Error) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

async function playingEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig,
  steps: Array<string>, done: () => void)
{
  console.log('playingEvent enter');
  if (config.playTime == -1) {
  } else {
    await mediaTestBase.msleepAsync(config.playTime);
    toNextStep(avPlayer, config, steps, done);
  }
}

function pauseEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void)
{
  console.info('case pauseEvent');
  console.info(`case pauseEvent, state is ${avPlayer?.state}`);
  avPlayer?.pause().catch((error: Error) => {
    console.error(`Failed to play, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function releaseEvent(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void)
{
  console.info('case releaseEvent');
  avPlayer?.release().catch((error: Error) => {
    console.error(`Failed to relese, error message:${error}`);
    expect(steps[0]).assertEqual(ERROR_EVENT);
    steps.shift();
    toNextStep(avPlayer, config, steps, done);
  });
}

function toNextStep(avPlayer: media.AVPlayer | undefined, config: PreDownConfig, steps: Array<string>, done: () => void) {
  if (steps[0] == END_EVENT) {
    expect(loaderFailure).assertEqual('');
    if (config.loadingErrorAfterBytes !== undefined) {
      expect(loadingErrorInjected).assertEqual(true);
    }
    console.info('case success!!');
    done();
    return;
  }
  console.log("Current step:", steps[0]);
  console.log("Is it PLAY_EVENT?", steps[0] === PLAY_EVENT);
  switch (steps[0]) {
    case CREAT_PROMISE_EVENT:
      steps.shift();
      createEvent(avPlayer, config, steps, done);
      break;
    case SET_CALLBACK_EVENT:
      steps.shift();
      setCallbackEvent(avPlayer, config, steps, done);
      break;
    case SET_MEDIA_SOURCE_EVENT:
      steps.shift();
      setMediaSourceEvent(avPlayer, config, steps, done);
      break;
    case PREPARE_EVENT:
      steps.shift();
      prepareEvent(avPlayer, config, steps, done);
      break;
    case PLAY_EVENT:
      steps.shift();
      playEvent(avPlayer, config, steps, done);
      break;
    case PLAYING_EVENT:
      steps.shift();
      playingEvent(avPlayer, config, steps, done);
      break;
    case PAUSE_EVENT:
      steps.shift();
      pauseEvent(avPlayer, config, steps, done);
      break;
    case RELEASE_EVENT:
      steps.shift();
      releaseEvent(avPlayer, config, steps, done);
      break;
    default:
      break;
  }
}

async function getFd(path: string): Promise<void> {
  const descriptor = await mediaTestBase.getFileDescriptorFromFileDir(path, () => {});
  const resourceLength = fs.statSync(descriptor.fd).size;
  fileDescriptor = { fd: descriptor.fd, length: resourceLength, offset: 0 };
  expect(resourceLength).assertEqual(FILE_LENGTH);
}

export default function PreDownLoadTest() {

  describe('PreDownLoadTest', () => {
    beforeAll(async () => {
      console.log("check surfaceId is " + globalThis.value)
      for (let i =0; i < 10; i++) {
        if (!globalThis.value) {
          console.log("surfaceId is undefined")
          await mediaTestBase.msleepAsync(500);
        } else {
          console.log("surfaceId is " + globalThis.value)
          break;
        }
      }
      await getFd(VIDEO_SOURCE);
      console.log(`fileDescriptor: ${JSON.stringify(fileDescriptor)}`);
      console.log(`laamy ${Number.MAX_VALUE}`)
    })
    beforeEach(() => { })
    afterEach(() => { })
    afterAll(() => {
      if (fileDescriptor) {
        fs.closeSync(fileDescriptor!.fd);
      }
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100
     * @tc.desc   start-pause-resume-stop-release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT,
    
        SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play player
        PLAY_EVENT,
        // playing preConfig.playTime
        PLAYING_EVENT,
        // pause player
        PAUSE_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FUNCTION_0100 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100
     * @tc.desc   LOADING_ERROR_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: -1,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_SUCCESS
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play
        PLAY_EVENT,
        // playing
        PLAYING_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0100 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200
     * @tc.desc   LOADING_ERROR_NOT_READY
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: MAX_COUNT,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NOT_READY
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // play player
        PLAY_EVENT,
        // pause player
        PAUSE_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0200 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300
     * @tc.desc   LOADING_ERROR_NO_RESOURCE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_NO_RESOURCE,
        loadingErrorAfterBytes: 1024
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0300 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400
     * @tc.desc   LOADING_ERROR_INVAID_HANDLE
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_INVAID_HANDLE,
        loadingErrorAfterBytes: 1024
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0400 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500
     * @tc.desc   LOADING_ERROR_ACCESS_DENIED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_DENIED,
        loadingErrorAfterBytes: 1024
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0500 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600
     * @tc.desc   LOADING_ERROR_ACCESS_TIMEOUT
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_ACCESS_TIMEOUT,
        loadingErrorAfterBytes: 1024
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0600 end');
    });
    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700
     * @tc.number SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700
     * @tc.desc   LOADING_ERROR_AUTHORIZE_FAILED
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 begin');
      let preConfig: PreDownConfig = {
        url: 'https://xxx/xx.mp4',
        needHeader: true,
        playTime: 3000,
        respondDataCount: 1,
        loadingError: media.LoadingRequestError.LOADING_ERROR_AUTHORIZE_FAILED,
        loadingErrorAfterBytes: 1024
      }
      let mySteps = new Array<string>(
        // create avplayer
        CREAT_PROMISE_EVENT, SET_CALLBACK_EVENT,
        // set mediaSource
        SET_MEDIA_SOURCE_EVENT,
        // prepare
        PREPARE_EVENT,
        // ERROR prepare error on error
        ERROR_EVENT,
        // release player
        RELEASE_EVENT,
        // end
        END_EVENT);
      expect(fileDescriptor).not().assertNull();
      toNextStep(avPlayer, preConfig, mySteps, done)
      console.info('SUB_MULTIMEDIA_PLAYER_PRE_DOWNLOAD_FINISH_LOADING_FUNCTION_0700 end');
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100
     * @tc.number SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100
     * @tc.desc   TESTING_RESPONDDATA
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void) => {
      console.info('SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100 begin');
      const testName = 'SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100';
      try {
        let header:Record<string, string> = {
          'Transfer-Encoding':'xxx',
          'Location' : 'xxx',
          'Content-Type' : 'xxx',
          'Content-Range' : 'xxx',
          'Content-Encode' : 'xxx',
          'Accept-Ranges' : 'xxx',
          'Content-length' : 'xxx'
        };
        await getAVPlayerRequest(testName, url_1a1v_m3u8, (request: media.MediaSourceLoadingRequest) => {
          request.respondHeader(1, header, '');
          console.info(TAG, 'SUCCEED', request);
          done();
        })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error}, ${error?.code}`);
        expect(error).assertFail();
        done();
      }
      console.info('SUB_MULTIMEDIA_PLAYER_RESPOND_DATA_static_0100 end');
    });
  })
}
