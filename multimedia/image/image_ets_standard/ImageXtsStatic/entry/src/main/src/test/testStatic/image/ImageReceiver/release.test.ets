'use static'
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

const TAG = '[ImageReceiver].release';

async function releasePromiseTest(done: () => void, testName: string): Promise<void> {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img?.release().then(() => {
          console.info(TAG, 'Succeeded promise in releasing the image instance.');
          done();
        }).catch((error: Error) => {
          let error1 = error as BusinessError
          console.error(TAG, `Failed to release the image instance.code ${error1.code},message is ${error1.message}`);
          expect().assertFail();
          done();
        })
      }
    })
}

async function releaseCallbackTest(done: () => void, testName: string): Promise<void> {
  try {
    let size: image.Size = {
      height: 8192,
      width: 8
    }
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    creator.dequeueImage((err: BusinessError | null, img: image.Image | undefined) => {
      if (err) {
        console.error(TAG, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
        expect().assertFail();
        done();
      } else {
        img?.release((error: Error | null) => {
          if (error) {
            let error1 = error as BusinessError;
            console.error(TAG, `Failed to release the image instance.code ${error1.code},message is ${error1.message}`);
            expect().assertFail();
          } else {
            console.info(TAG, 'Succeeded callback in releasing the image instance.');
          }
          done();
        })
      }
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageReceiverReleaseTest(): void {
  describe('ImageReceiverReleaseTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_release_promise_static_0100';
      try {
        await releasePromiseTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, `failed; error: ${err}, ${err.code}`, testName);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100
     * @tc.desc   ImageReceiver_release
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageReceiver_release_callback_static_0100';
      try {
        await releaseCallbackTest(done, testName);
      } catch (error) {
        let err = error as BusinessError;
        console.info(TAG, `failed; error: ${err}, ${err.code}`, testName);
        expect().assertFail();
        done();
      }
    })
  })
}