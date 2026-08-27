/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the 'License');
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an 'AS IS' BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import { afterAll, afterEach, beforeAll, beforeEach, describe, expect, it, Level } from "@ohos/hypium";
import { media } from "@kit.MediaKit";
import { BusinessError } from "@kit.BasicServicesKit";
import MediaTestBase from "./MediaTestBase";
import { LOG_TAG, MediaErrorCode, SLEEP_TIME_500, SLEEP_TIME_5000, SLEEP_TIME_200, SLEEP_TIME_20 } from "../Constants";
import { common } from "@kit.AbilityKit";
import { closeFd, getFd, sleep } from '../common';
import {image} from '@kit.ImageKit';

const TAG = LOG_TAG + 'AVTranscoderTest';
const VIDEO_SOURCE = 'H264_AAC.mp4';

let mediaTestBase = new MediaTestBase();
let fileDescriptor: media.AVFileDescriptor;
let mTranscoder: media.AVTranscoder | undefined;
let currentProgress: number = 0;
let imageFd: number = -1;
let imageResource: image.ImageSource | undefined;
let imagePixelmap: image.PixelMap | undefined;

let waterMarkConfig: media.WatermarkConfiguration = {
  top : 100,
  left : 100,
  width : 100,
  height : 100,
};

let avTranscoderConfig: media.AVTranscoderConfig = {
  audioBitrate: 200000,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 3000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
};

let avTranscoderTestConfig: media.AVTranscoderConfig = {
  audioBitrate: 200000,
  audioCodec: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 3000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  enableBFrame: true,
};

let avTranscoderTestConfigNormal: media.AVTranscoderConfig = {
  audioBitrate: 200000,
  audioCodecV2: media.CodecMimeType.AUDIO_AAC,
  fileFormat: media.ContainerFormatType.CFT_MPEG_4,
  videoBitrate: 3000000,
  videoCodec: media.CodecMimeType.VIDEO_AVC,
  enableBFrame: true,
};

function openFileFailed() {
  console.info(TAG, 'openFileFailed case file fail');
}

async function createAVTranscoder(done: Function, context: common.UIAbilityContext, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  await media.createAVTranscoder().then(async (transcoder: media.AVTranscoder) => {
    if (transcoder) {
      mTranscoder = transcoder;
      mTranscoder.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd('H264_AAC.mp4');
      mTranscoder.fdDst = await getFd('output.mp4');
      console.info(TAG, testName + ' Succeeded in creating AVTranscoder, fd: ' + mTranscoder.fdSrc.fd + ', offset: ' +
      mTranscoder.fdSrc.offset + ', length: ' + mTranscoder.fdSrc.length + ', fdDst: ' + mTranscoder.fdDst);
      imageFd = await globalThis.abilityContext.resourceManager.getRawFdSync('watermark.png');
      imageResource = image.createImageSource(imageFd);
      const decodingOptions: image.DecodingOptions = {
        editable: true,
        desiredPixelFormat: image.PixelMapFormat.RGBA_8888,
      }
      imagePixelmap = await imageResource.createPixelMap(decodingOptions);
    } else {
      console.error(TAG, testName + ' transcoder is undefined.');
      expect().assertFail();
    }
  }).catch((error: BusinessError) => {
    console.error(TAG, testName + ' Failed to create AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  });
}

async function prepareAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(avTranscoderConfig).then(() => {
      console.info(TAG, testName + ' prepare success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
}

async function prepareAVTranscoderTest(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(avTranscoderTestConfig).then(() => {
      console.info(TAG, testName + ' prepare success.');
      expect(true).assertTrue();
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
}

async function prepareAVTranscoderNormal(avTranscoderConfig: media.AVTranscoderConfig, done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(avTranscoderConfig).then(() => {
      console.info(TAG, testName + ' prepare success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect().assertFail();
      done();
    });
  }
}

async function prepareAVTranscoderTestError(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(avTranscoderTestConfig).then(() => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder.');
      expect(true).assertFail();
    }).catch((error: BusinessError) => {
      console.info(TAG, testName + ' prepare Failed. assert True. code: ' + error.code + ', msg: ' + error.message);
      expect(true).assertTrue();
      done();
    });
  }
}

async function prepareAVTranscoderTestErrorWithConfig(done: Function, testName: string,
  testConfig: media.AVTranscoderConfig | undefined | null) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.prepare(testConfig).then(() => {
      console.error(TAG, testName + ' Failed to prepare AVTranscoder.');
      expect(true).assertFail();
    }).catch((error: BusinessError) => {
      console.info(TAG, testName + ' prepare Failed. assert True. code: ' + error.code + ', msg: ' + error.message);
      expect(true).assertTrue();
      done();
    });
  }
}

async function startAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.start().then(() => {
      console.info(TAG, testName + ' start AVTranscoder success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to start AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function pauseAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.pause().then(() => {
      console.info(TAG, testName + ' pause AVTranscoder success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to pause AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function resumeAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.resume().then(() => {
      console.info(TAG, testName + ' resume AVTranscoder success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to resume AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function cancelAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.cancel().then(() => {
      console.info(TAG, testName + ' cancel AVTranscoder success.');
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to cancel AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function releaseAVTranscoder(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  if (mTranscoder !== undefined) {
    await mTranscoder.release().then(() => {
      console.info(TAG, testName + ' release AVTranscoder success.');
      mTranscoder = undefined;
    }).catch((error: BusinessError) => {
      console.error(TAG, testName + ' Failed to release AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
      expect(error.code == MediaErrorCode.OPERATE_NOT_PERMIT).assertTrue();
    });
  }
}

async function progressUpdateListen(done: Function, testName: string) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('progressUpdate', async (progress: number) => {
        console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
        currentProgress = progress;
      });
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
      });
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_500);
      mTranscoder.off('progressUpdate');
      mTranscoder.off('error');
      expect(currentProgress > 0).assertTrue();
      done();
    }
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to progressUpdate-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

async function completeListen(done: Function, testName: string) {
  console.info(TAG, testName + ' completeListen begin.');
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('progressUpdate', async (progress: number) => {
        console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
        currentProgress = progress;
      });
      mTranscoder.on('complete', async () => {
        console.info(TAG, testName + ' avTranscoder complete.');
        mTranscoder!.off('complete');
        mTranscoder!.off('progressUpdate');
        await releaseAVTranscoder(done, testName);
      });
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
      });
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_5000);
    }
    done();
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to complete-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

async function errorListen(done: Function, testName: string, context: common.UIAbilityContext) {
  if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
    console.info(TAG, testName + ' This device does not support transcoding.');
    done();
    return;
  }
  try {
    if (mTranscoder !== undefined) {
      mTranscoder.on('error', async (error: BusinessError) => {
        console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
      });
      // await createAVTranscoder(done, context, testName);
      mTranscoder.start();
      await sleep(SLEEP_TIME_500);
      mTranscoder.off('error');
    }
  } catch (error) {
    console.error(TAG,
      testName + ' Failed to error-listen AVTranscoder, code: ' + error.code + ', msg: ' + error.message);
    expect().assertFail();
    done();
  }
}

async function listenComplete(done: Function) {
  let currentProgress: number = 0;
  if (mTranscoder !== undefined) {
    // 转码完成回调函数。
    mTranscoder.on('complete', async () => {
      console.info(`AVTranscoder is completed`);
    });
    // 进度上报回调函数。
    mTranscoder.on('progressUpdate', (progress: number) => {
      console.info(`AVTranscoder progressUpdate = ${progress}`);
      currentProgress = progress;
    })
    while(currentProgress < 100){
      console.info(`AVTranscoder progress is`, currentProgress);
      await sleep(50);
    }
    mTranscoder!.off('complete');
    mTranscoder!.off('progressUpdate');
    done();
  }
}


export default function AVTranscoderTest() {
  describe('AVTranscoderTest', () => {
    let testContext: common.UIAbilityContext = AppStorage.get('testContext') as common.UIAbilityContext;

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case');
      await mediaTestBase.getFileDescriptorFromFileDir(VIDEO_SOURCE, openFileFailed).then((res) => {
        fileDescriptor = res;
      });
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case');
      await sleep(SLEEP_TIME_200);
      if (mTranscoder !== undefined) {
        await mTranscoder.release();
        await closeFd(mTranscoder.fdDst);
        mTranscoder = undefined;
      }
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case');
      await mediaTestBase.closeFdNumber(fileDescriptor.fd);
    });

    /**
     * @tc.name   createAVTranscoder_001
     * @tc.number AV_TRANSCODER_TEST_001
     * @tc.desc   Test normal scene of create AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVTranscoder_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVTranscoder_001';
      await createAVTranscoder(done, testContext, testName);
      done();
    })

    /**
     * @tc.name   createAVTranscoder_002
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of create AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('createAVTranscoder_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'createAVTranscoder_002';
      let avTranscoder: media.AVTranscoder | undefined = undefined;
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        console.info(TAG, testName + ' This device does not support transcoding.');
        done();
        return;
      }
      avTranscoder = await media.createAVTranscoder();
      expect(avTranscoder != undefined).assertTrue();
      done();
    })

    /**
     * @tc.name   prepare_001
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_002
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_002';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_VORBIS;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.VIDEO_MPEG2;
      avTranscoderTestConfig.fileFormat = media.ContainerFormatType.CFT_MPEG_4A;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTest(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_003
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_003';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_FLAC;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.VIDEO_H263;
      avTranscoderTestConfig.fileFormat = media.ContainerFormatType.CFT_MP3;
      avTranscoderTestConfig.enableBFrame = false;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_004
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_004';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_MP3;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.VIDEO_MPEG4;
      avTranscoderTestConfig.fileFormat = media.ContainerFormatType.CFT_WAV;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_005
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_005', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_005';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_G711MU;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.VIDEO_VP8;
      avTranscoderTestConfig.fileFormat = media.ContainerFormatType.CFT_AMR;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_006
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_006', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_006';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_AMR_NB;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.VIDEO_HEVC;
      avTranscoderTestConfig.fileFormat = media.ContainerFormatType.CFT_AAC;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_007
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_007', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_007';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.AUDIO_AMR_WB;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_AAC;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_008
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_008', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_008';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_H263;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_VORBIS;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_009
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_009', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_009';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_AVC;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_FLAC;
      avTranscoderTestConfig.enableBFrame = false;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_010
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_010', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_010';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_MPEG2;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_MP3;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_011
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_011', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_011';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_MPEG4;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_G711MU;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_012
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_012', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_012';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_VP8;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_AMR_NB;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_013
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_013', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_013';
      avTranscoderTestConfig.audioCodec = media.CodecMimeType.VIDEO_HEVC;
      avTranscoderTestConfig.videoCodec = media.CodecMimeType.AUDIO_AMR_WB;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestError(done, testName);
      done();
    })

    /**
     * @tc.name   prepare_014
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_014', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_014';
      let TestConfig: media.AVTranscoderConfig | undefined = undefined;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestErrorWithConfig(done, testName, TestConfig);
      done();
    })

    /**
     * @tc.name   prepare_015
     * @tc.number AV_TRANSCODER_TEST_002
     * @tc.desc   Test normal scene of prepare AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('prepare_015', Level.LEVEL0, async (done: Function) => {
      const testName = 'prepare_015';
      let TestConfig: media.AVTranscoderConfig | null = null;
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderTestErrorWithConfig(done, testName, TestConfig);
      done();
    })

    /**
     * @tc.name   start_001
     * @tc.number AV_TRANSCODER_TEST_003
     * @tc.desc   Test normal scene of start AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   start_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_004
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('start_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'start_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await startAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_START_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_START_0100
     * @tc.desc   Test normal scene of start AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_START_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_START_0100';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoderNormal(avTranscoderTestConfigNormal, done, testName);
      await startAVTranscoder(done, testName);
      await listenComplete(done)
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0100
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0100
     * @tc.desc   Test normal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0100', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0100';
      await createAVTranscoder(done, testContext, testName);
      await mTranscoder?.addWatermark(imagePixelmap, waterMarkConfig).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect(watermarkId).assertEqual(1);
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message);
        expect().assertFail();
        done();
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0200
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0200
     * @tc.desc   Test abnormal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0200', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0200';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await mTranscoder?.addWatermark(imagePixelmap, waterMarkConfig).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(5400102);
      });
      done();
    })
    
    /**
    * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0300
    * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0300
    * @tc.desc   Test abnormal scene of watermark in AVTranscoder, loop addWatermark 6 times.
    * @tc.type   FUNCTION
    * @tc.size   MEDIUMTEST
    * @tc.level  LEVEL0
    */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0300', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0300';
      await createAVTranscoder(done, testContext, testName);
      try {
        // 循环调用 addWatermark 6次
        for (let i = 0; i < 6; i++) {
          const watermarkId: number = await mTranscoder!.addWatermark(imagePixelmap, waterMarkConfig);
          console.info(`addWatermark success, times: ${i + 1}, watermarkId: ${watermarkId}`);
          expect(watermarkId).assertEqual(i + 1);
        }
      } catch (err) {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(5400108);
      }
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0400
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0400
     * @tc.desc   Test abnormal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0400', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0400';
      await createAVTranscoder(done, testContext, testName);
      await mTranscoder?.addWatermark(null, waterMarkConfig).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(401);
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0500
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0500
     * @tc.desc   Test abnormal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0500', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0500';
      await createAVTranscoder(done, testContext, testName);
      await mTranscoder?.addWatermark(undefined, waterMarkConfig).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(401);
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0600
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0600
     * @tc.desc   Test abnormal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0600', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0600';
      await createAVTranscoder(done, testContext, testName);
      await mTranscoder?.addWatermark(imagePixelmap, null).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(401);
      });
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0700
     * @tc.number SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0700
     * @tc.desc   Test abnormal scene of watermark in AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0700', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_MEDIA_AVTRANSCODER_ADDWATERMARK_API_0700';
      await createAVTranscoder(done, testContext, testName);
      await mTranscoder?.addWatermark(imagePixelmap, undefined).then((watermarkId: number) => {
        console.info('addWatermark success, watermarkId: ' + watermarkId);
        expect().assertFail();
      }).catch((err: BusinessError) => {
        console.error('addWatermark failed and catch error is ' + err.message + err.code);
        expect(err.code).assertEqual(401);
      });
      done();
    })

    /**
     * @tc.name   pause_001
     * @tc.number AV_TRANSCODER_TEST_005
     * @tc.desc   Test normal scene of pause AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pause_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'pause_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   pause_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_006
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('pause_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'pause_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await pauseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   resume_001
     * @tc.number AV_TRANSCODER_TEST_007
     * @tc.desc   Test normal scene of resume AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resume_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'resume_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await resumeAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   resume_abnormal_001
     * @tc.number AV_TRANSCODER_TEST_008
     * @tc.desc   Test normal scene of video transcoding.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('resume_abnormal_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'resume_abnormal_001';
      await createAVTranscoder(done, testContext, testName);
      await resumeAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_001
     * @tc.number AV_TRANSCODER_TEST_009  //TODO 报错5400102
     * @tc.desc   cancel after prepare
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await sleep(SLEEP_TIME_20);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_002
     * @tc.number AV_TRANSCODER_TEST_010
     * @tc.desc   cancel after start
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_002';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_003
     * @tc.number AV_TRANSCODER_TEST_011
     * @tc.desc   cancel after pause
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_003', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_003';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   cancel_004
     * @tc.number AV_TRANSCODER_TEST_012
     * @tc.desc   cancel after resume
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('cancel_004', Level.LEVEL0, async (done: Function) => {
      const testName = 'cancel_004';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await startAVTranscoder(done, testName);
      await pauseAVTranscoder(done, testName);
      await resumeAVTranscoder(done, testName);
      await cancelAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   release_001
     * @tc.number AV_TRANSCODER_TEST_013
     * @tc.desc   Test normal scene of release AVTranscoder.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('release_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'release_001';
      await createAVTranscoder(done, testContext, testName);
      await prepareAVTranscoder(done, testName);
      await releaseAVTranscoder(done, testName);
      done();
    })

    /**
     * @tc.name   progressUpdate_listen_001
     * @tc.number AV_TRANSCODER_TEST_014
     * @tc.desc   Test normal scene of listen progressUpdate.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('progressUpdate_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'progressUpdate_listen_001';
      await createAVTranscoder(done, testContext, testName);
      await progressUpdateListen(done, testName);
      done();
    })

    /**
     * @tc.name   complete_listen_001
     * @tc.number AV_TRANSCODER_TEST_015
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('complete_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'complete_listen_001';
      await createAVTranscoder(done, testContext, testName);
      completeListen(done, testName);
    })

    /**
     * @tc.name   progressUpdate_listen_002
     * @tc.number AV_TRANSCODER_TEST_028
     * @tc.desc   Test repeated setting of progressUpdate callback, only the last one takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('progressUpdate_listen_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'progressUpdate_listen_002';
      await createAVTranscoder(done, testContext, testName);
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        if (mTranscoder !== undefined) {
          let firstCallbackCount = 0;
          let secondCallbackCount = 0;
          mTranscoder.on('progressUpdate', async (progress: number) => {
            firstCallbackCount++;
          });
          mTranscoder.on('progressUpdate', async (progress: number) => {
            secondCallbackCount++;
          });
          mTranscoder.on('error', async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
          });
          await prepareAVTranscoder(done, testName);
          await startAVTranscoder(done, testName);
          await sleep(SLEEP_TIME_500);
          mTranscoder.off('progressUpdate');
          mTranscoder.off('error');
          expect(secondCallbackCount > 0).assertTrue();
          expect(firstCallbackCount).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   complete_listen_002
     * @tc.number AV_TRANSCODER_TEST_029
     * @tc.desc   Test repeated setting of complete callback, only the last one takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('complete_listen_002', Level.LEVEL0, async (done: Function) => {
      const testName = 'complete_listen_002';
      await createAVTranscoder(done, testContext, testName);
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        if (mTranscoder !== undefined) {
          let firstCallbackCount = 0;
          let secondCallbackCount = 0;
          currentProgress = 0;
          mTranscoder.on('progressUpdate', async (progress: number) => {
            currentProgress = progress;
          });
          mTranscoder.on('complete', async () => {
            firstCallbackCount++;
          });
          mTranscoder.on('complete', async () => {
            secondCallbackCount++;
          });
          mTranscoder.on('error', async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
          });
          await prepareAVTranscoder(done, testName);
          await startAVTranscoder(done, testName);
          await sleep(SLEEP_TIME_5000);
          mTranscoder.off('complete');
          mTranscoder.off('progressUpdate');
          mTranscoder.off('error');
          expect(secondCallbackCount > 0).assertTrue();
          expect(firstCallbackCount).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   error_listen_001
     * @tc.number AV_TRANSCODER_TEST_030
     * @tc.desc   Test repeated setting of error callback, only the last one takes effect.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('error_listen_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'error_listen_001';
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        let transcoder = await media.createAVTranscoder();
        mTranscoder = transcoder;
        if (mTranscoder !== undefined) {
          let firstCallbackCount = 0;
          let secondCallbackCount = 0;
          mTranscoder.on('error', async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
            firstCallbackCount++;
          });
          mTranscoder.on('error', async (error: BusinessError) => {
            secondCallbackCount++;
          });
          mTranscoder.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd('watermark.png');
          mTranscoder.fdDst = await getFd('output.mp4');
          await mTranscoder.prepare(avTranscoderConfig).catch((error: BusinessError) => {
            console.info(TAG, testName + ' prepare failed as expected, code: ' + error.code);
          });
          await sleep(SLEEP_TIME_500);
          mTranscoder.off('error');
          expect(secondCallbackCount > 0).assertTrue();
          expect(firstCallbackCount).assertEqual(0);
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   progressUpdate_off_callback_001
     * @tc.number AV_TRANSCODER_TEST_031
     * @tc.desc   Test off progressUpdate with callback parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('progressUpdate_off_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'progressUpdate_off_callback_001';
      await createAVTranscoder(done, testContext, testName);
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        if (mTranscoder !== undefined) {
          let progressCallback = async (progress: number) => {
            console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
            currentProgress = progress;
          };
          let errorCallback = async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
          };
          mTranscoder.on('progressUpdate', progressCallback);
          mTranscoder.on('error', errorCallback);
          await prepareAVTranscoder(done, testName);
          await startAVTranscoder(done, testName);
          await sleep(SLEEP_TIME_500);
          mTranscoder.off('progressUpdate', progressCallback);
          mTranscoder.off('error', errorCallback);
          expect(currentProgress > 0).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   complete_off_callback_001
     * @tc.number AV_TRANSCODER_TEST_032
     * @tc.desc   Test off complete with callback parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('complete_off_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'complete_off_callback_001';
      await createAVTranscoder(done, testContext, testName);
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        if (mTranscoder !== undefined) {
          let isCompleted = false;
          let progressCallback = async (progress: number) => {
            console.info(TAG, testName + ' avTranscoder progressUpdate. progress: ' + progress);
            currentProgress = progress;
          };
          let completeCallback = async () => {
            console.info(TAG, testName + ' avTranscoder complete.');
            isCompleted = true;
          };
          let errorCallback = async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
          };
          mTranscoder.on('progressUpdate', progressCallback);
          mTranscoder.on('complete', completeCallback);
          mTranscoder.on('error', errorCallback);
          await prepareAVTranscoder(done, testName);
          await startAVTranscoder(done, testName);
          await sleep(SLEEP_TIME_5000);
          mTranscoder.off('complete', completeCallback);
          mTranscoder.off('progressUpdate', progressCallback);
          mTranscoder.off('error', errorCallback);
          expect(isCompleted).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   error_off_callback_001
     * @tc.number AV_TRANSCODER_TEST_033
     * @tc.desc   Test off error with callback parameter.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level   LEVEL0
     */
    it('error_off_callback_001', Level.LEVEL0, async (done: Function) => {
      const testName = 'error_off_callback_001';
      if (!canIUse("SystemCapability.Multimedia.Media.AVTranscoder")) {
        done();
        return;
      }
      try {
        let transcoder = await media.createAVTranscoder();
        mTranscoder = transcoder;
        if (mTranscoder !== undefined) {
          let isError = false;
          let errorCallback = async (error: BusinessError) => {
            console.error(TAG, testName + ' error listen: err: ' + error.code + ', msg: ' + error.message);
            isError = true;
          };
          mTranscoder.on('error', errorCallback);
          mTranscoder.fdSrc = await globalThis.abilityContext.resourceManager.getRawFd('watermark.png');
          mTranscoder.fdDst = await getFd('output.mp4');
          await mTranscoder.prepare(avTranscoderConfig).catch((error: BusinessError) => {
            console.info(TAG, testName + ' prepare failed as expected, code: ' + error.code);
          });
          await sleep(SLEEP_TIME_500);
          mTranscoder.off('error', errorCallback);
          expect(isError).assertTrue();
          done();
        }
      } catch (error) {
        console.error(TAG, testName + ' Failed, code: ' + error.code + ', msg: ' + error.message);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   null_undefined_001
     * @tc.number AV_TRANSCODER_TEST_016
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_001', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(null, (progress: number) => {
          console.info('avTranscoder progressUpdate = ' + progress);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_002
     * @tc.number AV_TRANSCODER_TEST_017
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_002', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(undefined, (progress: number) => {
          console.info('avTranscoder progressUpdate = ' + progress);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_003
     * @tc.number AV_TRANSCODER_TEST_018
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_003', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(null, async () => {
          console.info('avTranscoder complete');
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_004
     * @tc.number AV_TRANSCODER_TEST_019
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_004', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(undefined, async () => {
          console.info('avTranscoder complete');
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })
  
    /**
     * @tc.name   null_undefined_005
     * @tc.number AV_TRANSCODER_TEST_020
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_005', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(null, (err: BusinessError) => {
          console.info('case avTranscoder.on(error) called, errMessage is ' + err.message);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_006
     * @tc.number AV_TRANSCODER_TEST_021
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_006', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.on(undefined, (err: BusinessError) => {
          console.info('case avTranscoder.on(error) called, errMessage is ' + err.message);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_007
     * @tc.number AV_TRANSCODER_TEST_022
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_007', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(null, (progress: number) => {
          console.info('avTranscoder progressUpdate = ' + progress);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_008
     * @tc.number AV_TRANSCODER_TEST_023
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_008', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(undefined, (progress: number) => {
          console.info('avTranscoder progressUpdate = ' + progress);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_009
     * @tc.number AV_TRANSCODER_TEST_024
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_009', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(null, async () => {
          console.info('avTranscoder complete');
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_010
     * @tc.number AV_TRANSCODER_TEST_025
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_010', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(undefined, async () => {
          console.info('avTranscoder complete');
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })
  
    /**
     * @tc.name   null_undefined_011
     * @tc.number AV_TRANSCODER_TEST_026
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_011', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(null, (err: BusinessError) => {
          console.info('case avTranscoder.on(error) called, errMessage is ' + err.message);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   null_undefined_012
     * @tc.number AV_TRANSCODER_TEST_027
     * @tc.desc   Test normal scene of listen complete.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('null_undefined_012', Level.LEVEL0, async (done: Function) => {
      try {
        let avTranscoder = await media.createAVTranscoder();
        avTranscoder.off(undefined, (err: BusinessError) => {
          console.info('case avTranscoder.on(error) called, errMessage is ' + err.message);
        });
      } catch (err) {
        console.error('avTranscoderNullUndefinedTest failed.', err.code, err.message);
        expect().assertFail();
      }
      done();
    })
  })
}