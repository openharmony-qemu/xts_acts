/*
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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
import { describe, beforeAll, it, expect, TestType, Level, Size } from "@ohos/hypium-dynamic"
import { BusinessError } from '@ohos.base';
import image from '@ohos.multimedia.image';

const LOG_PREFIX: string = '[www data getImageInfoSyncRepeat]';

export default function GraphicImageGetImageInfoSyncRepeat() {
  describe('GraphicImageGetImageInfoSyncRepeat', (): void => {
    console.log('describe GraphicImageGetImageInfoSyncRepeat start!!!')

    beforeAll(async (): Promise<void> => {
    })

    /**
     * @tc.name   getImageInfoSyncRepeat_0100
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0100
     * @tc.desc   Repeat getImageInfoSync 100 times on RGBA_8888 PixelMap, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0100 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstInfo.size.width).assertEqual(6);
          expect(firstInfo.size.height).assertEqual(4);
          expect(firstInfo.pixelFormat).assertEqual(image.PixelMapFormat.RGBA_8888);

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0200
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0200
     * @tc.desc   Repeat getImageInfoSync 100 times on ARGB_8888 PixelMap, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0200 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstInfo.pixelFormat).assertEqual(image.PixelMapFormat.ARGB_8888);

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0300
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0300
     * @tc.desc   Repeat getImageInfoSync 100 times on createPixelMapSync(opts) without color buffer, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0300 ';
        console.info(msgStr + 'begin');
        try {
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstInfo.size.width).assertEqual(6);
          expect(firstInfo.size.height).assertEqual(4);

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0400
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0400
     * @tc.desc   Repeat getImageInfoSync after crop operation, verify all subsequent calls return consistent values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0400 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const region: image.Region = { x: 0, y: 0, size: { width: 2, height: 2 } };
          await pixelMap.crop(region);
          console.info(msgStr + 'crop to 2x2 done');

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call after crop: ' + JSON.stringify(firstInfo));
          expect(firstInfo.size.width).assertEqual(2);
          expect(firstInfo.size.height).assertEqual(2);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent after crop: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0500
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0500
     * @tc.desc   Repeat getImageInfoSync after scale operation, verify all subsequent calls return consistent values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0500 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          await pixelMap.scale(2.0, 2.0);
          console.info(msgStr + 'scale 2x2 done');

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call after scale: ' + JSON.stringify(firstInfo));
          expect(firstInfo.size.width).assertEqual(12);
          expect(firstInfo.size.height).assertEqual(8);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent after scale: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0600
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0600
     * @tc.desc   Stress test: repeat getImageInfoSync 500 times, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0600 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          let lastInfo: image.ImageInfo = firstInfo;
          for (let i = 0; i < 500; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
            lastInfo = info;
          }
          console.info(msgStr + 'all 500 calls consistent: ' + allConsistent);
          console.info(msgStr + 'last call result: ' + JSON.stringify(lastInfo));
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0700
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0700
     * @tc.desc   Repeat getImageInfoSync on createPixelMapUsingAllocator PixelMap, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0700 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstInfo.size.width).assertEqual(6);
          expect(firstInfo.size.height).assertEqual(4);

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0800
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0800
     * @tc.desc   Verify getImageInfoSync results match getImageInfo (Promise) results across repeated calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0800 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          let allConsistent: boolean = true;
          for (let i = 0; i < 50; i++) {
            const syncInfo: image.ImageInfo = pixelMap.getImageInfoSync();
            const promiseInfo: image.ImageInfo = await pixelMap.getImageInfo();
            if (syncInfo.size.width !== promiseInfo.size.width ||
              syncInfo.size.height !== promiseInfo.size.height ||
              syncInfo.pixelFormat !== promiseInfo.pixelFormat ||
              syncInfo.alphaType !== promiseInfo.alphaType ||
              syncInfo.isHdr !== promiseInfo.isHdr ||
              syncInfo.stride !== promiseInfo.stride ||
              syncInfo.density !== promiseInfo.density ||
              syncInfo.mimeType !== promiseInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', sync: ' + JSON.stringify(syncInfo) +
                ', promise: ' + JSON.stringify(promiseInfo));
              break;
            }
          }
          console.info(msgStr + 'sync vs promise consistent across 50 rounds: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_0900
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_0900
     * @tc.desc   Repeat getImageInfoSync on createPixelMapFromPixels PixelMap, verify all returned ImageInfo fields are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_0900 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = await image.createPixelMapFromPixels(color, opts);

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call result: ' + JSON.stringify(firstInfo));

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstInfo.size.width).assertEqual(6);
          expect(firstInfo.size.height).assertEqual(4);

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getImageInfoSyncRepeat_1000
     * @tc.number SUB_GRAPHIC_image_getImageInfoSyncRepeat_1000
     * @tc.desc   Repeat getImageInfoSync after flip operation, verify all subsequent calls return consistent values.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getImageInfoSyncRepeat_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getImageInfoSyncRepeat_1000 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          await pixelMap.flip(true, false);
          console.info(msgStr + 'flip horizontal done');

          const firstInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          console.info(msgStr + 'first call after flip: ' + JSON.stringify(firstInfo));
          expect(firstInfo.size.width).assertEqual(6);
          expect(firstInfo.size.height).assertEqual(4);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const info: image.ImageInfo = pixelMap.getImageInfoSync();
            if (info.size.width !== firstInfo.size.width ||
              info.size.height !== firstInfo.size.height ||
              info.pixelFormat !== firstInfo.pixelFormat ||
              info.alphaType !== firstInfo.alphaType ||
              info.isHdr !== firstInfo.isHdr ||
              info.stride !== firstInfo.stride ||
              info.density !== firstInfo.density ||
              info.mimeType !== firstInfo.mimeType) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + JSON.stringify(firstInfo) +
                ', actual: ' + JSON.stringify(info));
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent after flip: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })
  })
}
