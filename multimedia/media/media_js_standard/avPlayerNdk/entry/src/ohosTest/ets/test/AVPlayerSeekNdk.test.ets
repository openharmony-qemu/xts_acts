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

import { beforeAll, beforeEach, describe, expect, it, Level, Size, TestType } from '@ohos/hypium'
import avplayer from 'libavplayerndk.so'
import AbilityDelegatorRegistry from '@ohos.app.ability.abilityDelegatorRegistry'
import fs from '@ohos.file.fs'
import { BusinessError } from '@ohos.base';
import Utils from './Utils';

function getContext(): Context {
  let abilityDelegator = AbilityDelegatorRegistry.getAbilityDelegator();
  let context = abilityDelegator.getAppContext();
  return context;
}
const PATH_DEMO =  "demo_no_audio_10s.mp4"

export default function AVPlayerSeekNdk() {
  describe('AVPlayerSeekNdk', () => {

    beforeAll(async () => {
      await Utils.sleep(2000)
    })

    beforeEach(async () => {
      await Utils.sleep(2000)
    })

    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0800', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1200', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0700', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("demo_video_audio_10s.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1400', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mkv");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1300', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("01.mp3");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1600', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("AAC_48000_32_1.aac");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1500', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("vorbis_48000_32_1.wav");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0600', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1100', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0500', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0400', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1000', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0300', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0200', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0900', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_0100', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_2000', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1900', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1800', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });
    /**
     * @tc.number     : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700
     * @tc.name       : SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700
     * @tc.desc       : test seekAvPlayerStateTest
     * @tc.size       : MediumTest
     * @tc.type       : Function
     * @tc.level      : Level 0
     */
    it('SUB_MULTIMEDIA_MEDIA_INTEGRATION_ACCURATESEEKNDKINTERFACE_1700', Level.LEVEL0, async (done: Function) => {
      let fileDescriptor: resourceManager.RawFileDescriptor | undefined =
        await globalThis.abilityContext.resourceManager.getRawFd("H264_AAC.mp4");
      console.info(TAG, 'player fileDescriptor fd://' + fileDescriptor?.fd);
      avplayer.setup('sss', fileDescriptor?.fd, fileDescriptor?.offset, fileDescriptor?.length);
      await Utils.sleep(5000)
      await avplayer.release();
      done();
    });

  })
}
