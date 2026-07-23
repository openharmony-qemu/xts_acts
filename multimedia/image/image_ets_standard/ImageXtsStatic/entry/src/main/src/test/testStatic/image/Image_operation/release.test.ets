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

import { image } from '@kit.ImageKit';
import {
  describe,
  beforeAll,
  beforeEach,
  afterEach,
  afterAll,
  it,
  expect,
  Level,
  Hypium
} from '../../../../../../hypium/index';
import { BusinessError } from '@ohos.base';

const TAG = 'Image.Release'

async function releasePromiseTest(done: () => void, testName: string): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator({
    height: 8192,
    width: 8
  }, image.ImageFormat.JPEG, 8);
  creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
    if (err) {
      console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
      expect().assertFail();
      done();
    } else {
      img!.release().then(() => {
        expect(err == null).assertTrue();
        console.info(TAG, 'Succeeded in releasing the image instance.');
        done();
      }).catch((error) => {
        console.error(TAG, `Failed to release the image instance.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      })
    }
  })
}

async function releaseCallbackTest(done: () => void, testName: string): Promise<void> {
  const creator: image.ImageCreator = await image.createImageCreator({
    height: 8192,
    width: 8
  }, image.ImageFormat.JPEG, 8);
  creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
    if (err) {
      console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
      expect().assertFail();
      done();
    } else {
      img?.release((err: BusinessError | null) => {
        if (err) {
          console.error(TAG, `Failed to release the image instance.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          expect(err == null).assertTrue();
          console.info(TAG, 'Succeeded in releasing the image instance.');
        }
        done();
      })
    }
  })
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
     * @tc.name   SUB_MEDIA_IMAGE_release_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_release_promise_static_0100
     * @tc.desc   Image_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_release_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_release_promise_static_0100';
      try {
        await releasePromiseTest(done, testName);
      } catch (error) {
        console.error(TAG, `Failed to release the image instance.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_release_callback_static_0100
     * @tc.desc   Image_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_release_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_release_callback_static_0100';
      try {
        await releaseCallbackTest(done, testName);
      } catch (error) {
        console.error(TAG, `Failed to release the image instance.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}