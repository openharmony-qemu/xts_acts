/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium-dynamic';
import { BusinessError } from '@kit.BasicServicesKit';

const TAG = 'dequeueImage';
const POLL_INTERVAL_MS = 20;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

export default function dequeueImageCallbackTest() {
  describe('dequeueImageCallbackTest', () => {

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
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0001
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0001', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0001';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      let result: Boolean = false;
      let flag: Boolean = false;
      try {
        const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
        creator.dequeueImage((err: BusinessError, img: image.Image) => {
          if (err) {
            console.error(testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
          } else {
            result = (img.size.width === size.width) && (img.size.height === size.height) && (img.format === 12);
            flag = true;
            // expect(img.format).assertEqual(image.ImageFormat.JPEG);
            console.info(testName, 'Succeeded in dequeuing the Image.');
          }

          creator.queueImage(img).then(() => {
            console.info(testName, 'Succeeded in queuing the Image.');
          }).catch((error: BusinessError) => {
            console.error(testName, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
          });

          creator.release((err: BusinessError) => {
            if (err) {
              console.error(testName, `Failed to release the creator.code ${err.code},message is ${err.message}`);
            } else {
              console.info(testName, 'Succeeded in releasing creator.');
            }
          });
        });
      } catch (error) {
        console.info(testName, `failed; error: ${error},${error.code}`, testName);
      }
      while (!flag) {
        await sleep(POLL_INTERVAL_MS);
      }
      expect(result).assertTrue();
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0002
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0002', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0002';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      let result:boolean = true;
      try {
        await creator.dequeueImage(null);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        result = false;
      }
      await creator.release();
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0003
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0003', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0003';
      const size: image.Size = {
        height: 8,
        width: 8192
      };
      let result:boolean = true;
      const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
      try {
        await creator.dequeueImage(undefined);
      } catch (error) {
        console.info(TAG, `failed; error: ${error},${error.code}`, testName);
        result = false;
      }
      await creator.release();
      expect(result).assertTrue();
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0004
     * @tc.desc   ImageCreator_dequeueImage
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0004', Level.LEVEL0, async (done: Function) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_0004';
      const size: image.Size = {
        height: 8192,
        width: 8
      };
      let result: Boolean = false;
      let flag: Boolean = false;
      try {
        const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
        let testNumber = 10;
        for(let i = 0; i < testNumber; i++){
          creator.dequeueImage((err: BusinessError, img: image.Image) => {
            if (err) {
              console.error(testName, `Failed to dequeue the Image.code ${err.code},message is ${err.message}`);
            } else {
              result = (img.size.width === size.width) && (img.size.height === size.height) && (img.format === 12);
              flag = true;
              console.info(testName, 'Succeeded in dequeuing the Image.');
            }
          });
          while (!flag) {
            await sleep(POLL_INTERVAL_MS);
          }
          expect(result).assertTrue();
          flag = false;
        }
        creator.release((err: BusinessError) => {
          if (err) {
            console.error(testName, `Failed to release the creator.code ${err.code},message is ${err.message}`);
          } else {
            console.info(testName, 'Succeeded in releasing creator.');
          }
        });
      } catch (error) {
        console.info(testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail()
      }
      done();
    });
  })
}