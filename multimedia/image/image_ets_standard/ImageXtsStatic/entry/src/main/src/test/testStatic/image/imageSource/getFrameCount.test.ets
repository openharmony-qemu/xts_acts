'use static';
/*
 * Copyright (C) 2026 Huawei Device Co., Ltd.
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

import { Context } from '@kit.AbilityKit';
import {afterAll,afterEach,beforeAll,beforeEach,describe,expect,Hypium, it, Level } from '@ohos/hypium-binary/src/main/indexStatic';
import { image } from '@kit.ImageKit';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'xts.getFrameCount';

async function getFrameCountPromiseTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  let frameCount: Double = await imageSourceApi!.getFrameCount();
  console.info(TAG, 'frameCount', JSON.stringify(frameCount));
  expect(frameCount != undefined).assertTrue();
  imageSourceApi!.release();
  done();
}

async function getFrameCountCallbackTest(done: () => void, testName: string, pathUri: string) {
  let testContext: Context = Hypium.get("Context") as Context;
  const path = 'file://' + testContext.filesDir + "/" + pathUri;
  const imageSourceApi: image.ImageSource | undefined = await image.createImageSource(path);
  imageSourceApi!.getFrameCount((err: BusinessError | null, frameCount: int | undefined) => {
    imageSourceApi!.release();
    if (err) {
      console.error(TAG, `Failed to get frame count.code is ${err.code},message is ${err.message}`);
      expect().assertFail();
    } else {
      console.info(TAG, 'Succeeded in getting frame count.');
      expect(frameCount != undefined).assertTrue();
    }
  })
  done();
}

export default function ImageSourceGetFrameCountTest(): void {
  describe('ImageSourceGetFrameCountTest', () => {

    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
    });

    beforeEach(() => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(() => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(() => {
      console.info(TAG, 'afterAll case.');
    });

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0100
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0100
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0100';
      const path = 'test6.gif';
      try {
        await getFrameCountPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0200
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0200
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0200';
      const path = 'test.jpg';
      try {
        await getFrameCountPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0300
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0300
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0300';
      const path = 'test.svg';
      try {
        await getFrameCountPromiseTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0400
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0400
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0400';
      const path = 'test6.gif';
      try {
        await getFrameCountCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0500
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0500
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0500';
      const path = 'test.jpg';
      try {
        await getFrameCountCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_getFrameCount_static_0600
     * @tc.number SUB_MEDIA_IMAGE_getFrameCount_static_0600
     * @tc.desc   imageSource_getFrameCount
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_getFrameCount_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_getFrameCount_static_0600';
      const path = 'test.svg';
      try {
        await getFrameCountCallbackTest(done, testName, path);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}