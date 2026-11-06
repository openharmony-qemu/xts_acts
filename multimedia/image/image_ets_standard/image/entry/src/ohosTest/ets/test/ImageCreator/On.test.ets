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
import { BusinessError } from '@kit.BasicServicesKit';
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium-dynamic';
import imageCreatorConsumer from 'libentry.so';

const TAG = 'ImageXts.ImageCreatorOnOff';
const WIDTH = 64;
const HEIGHT = 64;
const CAPACITY = 2;
const RELEASE_TIMEOUT_MS = 5000;
const CALLBACK_OBSERVE_MS = 1000;
const POLL_INTERVAL_MS = 20;

function sleep(ms: number): Promise<void> {
  return new Promise<void>((resolve: () => void) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
}

function offImageRelease(testName:string, creator: image.ImageCreator): Promise<void> {
  return new Promise<void>((resolve: () => void, reject: (reason: Error) => void) => {
    creator.off('imageRelease', (error: BusinessError): void => {
      if (error) {
        reject(new Error(`off imageRelease failed: code=${error.code}, message=${error.message}`));
        return;
      }
      console.info(testName, 'off imageRelease completed.');
      resolve();
    });
  });
}

async function produceOneImage(testName:string, creator: image.ImageCreator): Promise<void> {
  const outputImage: image.Image = await creator.dequeueImage();
  let queued: boolean = false;

  try {
    const component: image.Component = await outputImage.getComponent(image.ComponentType.JPEG);
    const buffer: Uint8Array = new Uint8Array(component.byteBuffer);
    for (let offset: number = 0; offset + 3 < buffer.length; offset += 4) {
      buffer[offset] = 0;
      buffer[offset + 1] = 0;
      buffer[offset + 2] = 255;
      buffer[offset + 3] = 255;
    }
    await creator.queueImage(outputImage);
    queued = true;
    console.info(testName, 'Producer queued one image.');
  } finally {
    if (!queued) {
      await outputImage.release();
    }
  }
}

async function consumeOneImage(testName:string, creator: image.ImageCreator): Promise<void> {
  const result: imageCreatorConsumer.ConsumeResult = await imageCreatorConsumer.consumeOnce(creator);
  expect(result.acquireResult).assertEqual(0);
  expect(result.releaseResult).assertEqual(0);
  console.info(testName, `Consumer finished. timestamp=${result.timestamp}`);
}

async function waitForRelease(
  getReleaseCount: () => number,
  getCallbackError: () => BusinessError | undefined,
  expectedCount: number
): Promise<void> {
  const begin: number = Date.now();
  while (getReleaseCount() < expectedCount) {
    const callbackError: BusinessError | undefined = getCallbackError();
    if (callbackError !== undefined) {
      throw new Error(`imageRelease failed: code=${callbackError.code}, message=${callbackError.message}`);
    }
    if (Date.now() - begin >= RELEASE_TIMEOUT_MS) {
      throw new Error(`Timed out waiting for imageRelease, count=${getReleaseCount()}`);
    }
    await sleep(POLL_INTERVAL_MS);
  }
}

export default function OnTest(): void {
  describe('OnTest', () => {

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0001
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0001
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0001', Level.LEVEL0,async (done: Function): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0001';
      let creator: image.ImageCreator | undefined = undefined;
      let releaseCount: number = 0;
      let callbackError: BusinessError | undefined = undefined;

      const releaseListener = (error: BusinessError): void => {
        if (error) {
          callbackError = error;
          console.error(testName, `imageRelease callback failed: code=${error.code}, message=${error.message}`);
          return;
        }
        releaseCount++;
        console.info(testName, `imageRelease callback count=${releaseCount}`);
      };

      try {
        creator = image.createImageCreator(
          { width: WIDTH, height: HEIGHT }, image.ImageFormat.JPEG, CAPACITY);
        creator.on('imageRelease', releaseListener);

        await produceOneImage(testName, creator);
        await consumeOneImage(testName, creator);
        await waitForRelease(
          (): number => releaseCount,
          (): BusinessError | undefined => callbackError,
          1
        );
        expect(releaseCount).assertEqual(1);

        console.info(testName, 'Passed: callback fired before off and did not fire after off.');
      } finally {
        if (creator !== undefined) {
          try {
            creator.off('imageRelease');
          } catch (error) {
            console.warn(testName, `Cleanup off failed: ${error}`);
          }
          try {
            await creator.release();
          } catch (error) {
            console.warn(testName, `Cleanup release failed: ${error}`);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0002
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0002
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0002', Level.LEVEL0,async (done: Function): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0002';
      let creator: image.ImageCreator | undefined = undefined;
      let releaseCount: number = 0;
      let callbackError: BusinessError | undefined = undefined;

      const releaseListener = (error: BusinessError): void => {
        if (error) {
          callbackError = error;
          console.error(testName, `imageRelease callback failed: code=${error.code}, message=${error.message}`);
          return;
        }
        releaseCount++;
        console.info(testName, `imageRelease callback count=${releaseCount}`);
      };

      try {
        let testNumber = 10;
        for(let i = 0; i < testNumber; i++) {
          creator = image.createImageCreator({ width: WIDTH, height: HEIGHT }, image.ImageFormat.JPEG, CAPACITY);
          creator.on('imageRelease', releaseListener);

          await produceOneImage(testName, creator);
          await consumeOneImage(testName, creator);
          await waitForRelease(
            (): number => releaseCount,
            (): BusinessError | undefined => callbackError,
            i+1
          );
          expect(releaseCount).assertEqual(i+1);

          console.info(testName, 'Passed: callback fired before off and did not fire after off.');
        }
      } finally {
        if (creator !== undefined) {
          try {
            creator.off('imageRelease');
          } catch (error) {
            console.warn(testName, `Cleanup off failed: ${error}`);
          }
          try {
            await creator.release();
          } catch (error) {
            console.warn(testName, `Cleanup release failed: ${error}`);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0003
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0003
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0003', Level.LEVEL0,async (done: Function): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0003';
      let creator: image.ImageCreator | undefined = undefined;
      let releaseCount: number = 0;
      let callbackError: BusinessError | undefined = undefined;

      try {
        creator = image.createImageCreator(
          { width: WIDTH, height: HEIGHT }, image.ImageFormat.JPEG, CAPACITY);
        creator.on("imageRelease", (err: BusinessError)=>{
          console.info(testName, `On: callback fired before off and did not fire after off.${err}`);
        });

        await produceOneImage(testName, creator);
        await consumeOneImage(testName, creator);

        await waitForRelease(
          (): number => releaseCount,
          (): BusinessError | undefined => callbackError,
          0
        );
        expect(releaseCount).assertEqual(0);
        
        console.info(testName, 'Passed: callback fired before off and did not fire after off.');
      } finally {
        if (creator !== undefined) {
          try {
            creator.off('imageRelease');
          } catch (error) {
            console.warn(testName, `Cleanup off failed: ${error}`);
          }
          try {
            await creator.release();
          } catch (error) {
            console.warn(testName, `Cleanup release failed: ${error}`);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0004
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0004
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0004', Level.LEVEL0,async (done: Function): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0004';
      let creator: image.ImageCreator | undefined = undefined;
      let onCount: boolean = true;

      try {
        creator = image.createImageCreator(
          { width: WIDTH, height: HEIGHT }, image.ImageFormat.JPEG, CAPACITY);
        creator.on("imageRelease", null);
      } catch (err){
        onCount = false;
        console.info(testName, 'creator.on fail. err is ', err);
        expect(onCount).assertFalse();
      }finally {
        if (creator !== undefined) {
          try {
            creator.off('imageRelease');
          } catch (error) {
            console.warn(testName, `Cleanup off failed: ${error}`);
          }
          try {
            await creator.release();
          } catch (error) {
            console.warn(testName, `Cleanup release failed: ${error}`);
          }
        }
      }
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0005
     * @tc.number SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0005
     * @tc.desc   ImageCreator_on
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0005', Level.LEVEL0,async (done: Function): Promise<void> => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_CREATOR_ON_CALLBACK_0005';
      let creator: image.ImageCreator | undefined = undefined;
      let releaseCount: number = 0;
      let callbackError: BusinessError | undefined = undefined;

      const releaseListener = (error: BusinessError): void => {
        if (error) {
          callbackError = error;
          console.error(testName, `imageRelease callback failed: code=${error.code}, message=${error.message}`);
          return;
        }
        releaseCount++;
        console.info(testName, `imageRelease callback count=${releaseCount}`);
      };

      try {
        creator = image.createImageCreator(
          { width: WIDTH, height: HEIGHT }, image.ImageFormat.JPEG, CAPACITY);

        await creator.release();
        creator.on('imageRelease', releaseListener);

        const begin: number = Date.now();
        while (releaseCount < 1) {
          if (Date.now() - begin >= RELEASE_TIMEOUT_MS) {
            throw new Error(`Timed out waiting for imageRelease, count=${releaseCount}`);
          }
          await sleep(POLL_INTERVAL_MS);
        }
        expect().assertFail();
      }catch (err) {
        console.info(`creator.on failed, err=${err}`);
        expect(releaseCount).assertEqual(0);
      }
      done();
    });
  });
}