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

import { image } from '@kit.ImageKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '../../../../../../hypium';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = '[Image_operation].release';

async function releasePromiseTest(done: () => void, testName: string): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  await img.release();
  console.info(TAG, 'Succeeded in releasing the image instance.');
  done();
}

async function releaseCallbackTest(done: () => void, testName: string): Promise<void> {
  let size: image.Size = {
    height: 8192,
    width: 8
  }
  const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
  let img: image.Image = await creator.dequeueImage();
  await img.release();
  console.info(TAG, 'Succeeded in releasing the image instance.');
  done();
}


export default function ImageReleaseTest(): void {
  describe('ImageReleaseTest', () => {

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
     * @tc.name   Image_release_promise_001
     * @tc.number IMAGE_RELEASE_001
     * @tc.desc   Image_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_release_promise_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'imagePacker_release_promise_001';
      try {
        await releasePromiseTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   Image_release_callback_001
     * @tc.number IMAGE_RELEASE_002
     * @tc.desc   Image_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('Image_release_callback_001', Level.LEVEL0, async (done: () => void) => {
      const testName = 'Image_release_callback_001';
      try {
        await releaseCallbackTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.error(TAG, `Failed. code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}