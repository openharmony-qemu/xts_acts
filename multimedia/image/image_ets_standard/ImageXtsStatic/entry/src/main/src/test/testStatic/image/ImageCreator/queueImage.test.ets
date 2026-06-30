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

const TAG = '[ImageCreator].queueImage';

async function queueImagePromiseTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    await creator.dequeueImage().then(async (img: image.Image) => {
      await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
        let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 0;
          bufferArr[i + 1] = 0;
          bufferArr[i + 2] = 255;
          bufferArr[i + 3] = 255;
        }
      })
            try {
        await creator.queueImage(img);
        expect(img.size.width > 0).assertTrue();
        expect(img.size.height > 0).assertTrue();
        console.info('Succeeded promise in queuing the Image.');
      } catch (error) {
        console.error(`Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      }
      done();
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function queueImageCallbackTest(done: () => void, testName: string, size: image.Size): Promise<void> {
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    await creator.dequeueImage().then(async (img: image.Image) => {
      await img.getComponent(image.ComponentType.JPEG).then((component: image.Component) => {
        let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
        for (let i = 0; i < bufferArr.length; i += 4) {
          bufferArr[i] = 0;
          bufferArr[i + 1] = 0;
          bufferArr[i + 2] = 255;
          bufferArr[i + 3] = 255;
        }
      })
      creator.queueImage(img, (err: BusinessError<void> | null) => {
        if (err) {
          console.error(`Failed to queue the Image.code ${err.code},message is ${err.message}`);
          expect().assertFail();
        } else {
          expect(img!.size.width > 0).assertTrue();
          expect(img!.size.height > 0).assertTrue();
          console.info('Succeeded callback in queuing the Image.');
        }
        done();
      })
    })
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreatorQueueImageTest(): void {
  describe('ImageCreatorQueueImageTest', () => {

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
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0100
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await queueImagePromiseTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0200
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_queueImage_promise_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await queueImagePromiseTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0100
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0100
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0100';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      try {
        await queueImageCallbackTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0200
     * @tc.number SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0200
     * @tc.desc   ImageCreator_queueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_ImageCreator_queueImage_callback_static_0200';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      try {
        await queueImageCallbackTest(done, testName, size);
      } catch (error) {
        console.error(TAG, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
        done();
      }
    })
  })
}