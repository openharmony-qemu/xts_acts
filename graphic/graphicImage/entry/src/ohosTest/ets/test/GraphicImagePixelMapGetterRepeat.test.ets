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
import image from '@ohos.multimedia.image';

const LOG_PREFIX: string = '[www data PixelMapGetterRepeat]';

export default function GraphicImagePixelMapGetterRepeat() {
  describe('GraphicImagePixelMapGetterRepeat', (): void => {
    console.log('describe GraphicImagePixelMapGetterRepeat start!!!')

    beforeAll(async (): Promise<void> => {
    })

    /**
     * @tc.name   getBytesNumberPerRowRepeat_0100
     * @tc.number SUB_GRAPHIC_image_getBytesNumberPerRowRepeat_0100
     * @tc.desc   Repeat getBytesNumberPerRow 100 times on RGBA_8888 PixelMap, verify return value is consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBytesNumberPerRowRepeat_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getBytesNumberPerRowRepeat_0100 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstValue: number = pixelMap.getBytesNumberPerRow();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertEqual(24);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getBytesNumberPerRow();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
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
     * @tc.name   getPixelBytesNumberRepeat_0200
     * @tc.number SUB_GRAPHIC_image_getPixelBytesNumberRepeat_0200
     * @tc.desc   Repeat getPixelBytesNumber 100 times on RGBA_8888 PixelMap, verify return value is consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumberRepeat_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getPixelBytesNumberRepeat_0200 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstValue: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertEqual(96);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getPixelBytesNumber();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
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
     * @tc.name   getDensityRepeat_0300
     * @tc.number SUB_GRAPHIC_image_getDensityRepeat_0300
     * @tc.desc   Repeat getDensity 100 times on PixelMap, verify return value is consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityRepeat_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getDensityRepeat_0300 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstValue: number = pixelMap.getDensity();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertEqual(0);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getDensity();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
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
     * @tc.name   getUniqueIdRepeat_0400
     * @tc.number SUB_GRAPHIC_image_getUniqueIdRepeat_0400
     * @tc.desc   Repeat getUniqueId 100 times before release (verify consistent), then 100 times after release (verify error 7600201 each time).
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUniqueIdRepeat_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getUniqueIdRepeat_0400 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstValue: number = pixelMap.getUniqueId();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertLargerOrEqual(0);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getUniqueId();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent before release: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();

          for (let i = 0; i < 100; i++) {
            try {
              pixelMap.getUniqueId();
              expect().assertFail();
              break;
            } catch (err) {
              expect(Number(err.code)).assertEqual(7600201);
            }
          }
          console.info(msgStr + 'all 100 calls throw 7600201 after release');

          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   isReleasedRepeat_0500
     * @tc.number SUB_GRAPHIC_image_isReleasedRepeat_0500
     * @tc.desc   Repeat isReleased 100 times before release (all false), then 100 times after release (all true), verify consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isReleasedRepeat_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' isReleasedRepeat_0500 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          let allFalseBeforeRelease: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: boolean = pixelMap.isReleased();
            if (value !== false) {
              allFalseBeforeRelease = false;
              console.error(msgStr + 'expected false at iteration ' + i +
                ' before release, got true');
              break;
            }
          }
          console.info(msgStr + 'all 100 calls return false before release: ' + allFalseBeforeRelease);
          expect(allFalseBeforeRelease).assertTrue();

          await pixelMap.release();

          let allTrueAfterRelease: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: boolean = pixelMap.isReleased();
            if (value !== true) {
              allTrueAfterRelease = false;
              console.error(msgStr + 'expected true at iteration ' + i +
                ' after release, got false');
              break;
            }
          }
          console.info(msgStr + 'all 100 calls return true after release: ' + allTrueAfterRelease);
          expect(allTrueAfterRelease).assertTrue();

          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   allGetterRepeat_0600
     * @tc.number SUB_GRAPHIC_image_allGetterRepeat_0600
     * @tc.desc   Combined: call getBytesNumberPerRow, getPixelBytesNumber, getDensity, getUniqueId, isReleased together in a loop 100 times, verify all return values are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('allGetterRepeat_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' allGetterRepeat_0600 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstBytesPerRow: number = pixelMap.getBytesNumberPerRow();
          const firstPixelBytesNumber: number = pixelMap.getPixelBytesNumber();
          const firstDensity: number = pixelMap.getDensity();
          const firstUniqueId: number = pixelMap.getUniqueId();
          const firstIsReleased: boolean = pixelMap.isReleased();
          console.info(msgStr + 'first call results: bytesPerRow=' + firstBytesPerRow +
            ', pixelBytesNumber=' + firstPixelBytesNumber +
            ', density=' + firstDensity +
            ', uniqueId=' + firstUniqueId +
            ', isReleased=' + firstIsReleased);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const bytesPerRow: number = pixelMap.getBytesNumberPerRow();
            const pixelBytesNumber: number = pixelMap.getPixelBytesNumber();
            const density: number = pixelMap.getDensity();
            const uniqueId: number = pixelMap.getUniqueId();
            const isReleased: boolean = pixelMap.isReleased();
            if (bytesPerRow !== firstBytesPerRow ||
              pixelBytesNumber !== firstPixelBytesNumber ||
              density !== firstDensity ||
              uniqueId !== firstUniqueId ||
              isReleased !== firstIsReleased) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', bytesPerRow: ' + bytesPerRow + '/' + firstBytesPerRow +
                ', pixelBytesNumber: ' + pixelBytesNumber + '/' + firstPixelBytesNumber +
                ', density: ' + density + '/' + firstDensity +
                ', uniqueId: ' + uniqueId + '/' + firstUniqueId +
                ', isReleased: ' + isReleased + '/' + firstIsReleased);
              break;
            }
          }
          console.info(msgStr + 'all 100 combined calls consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();
          expect(firstBytesPerRow).assertEqual(24);
          expect(firstPixelBytesNumber).assertEqual(96);
          expect(firstDensity).assertEqual(0);
          expect(firstIsReleased).assertFalse();

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
     * @tc.name   getBytesNumberPerRowRepeat_0700
     * @tc.number SUB_GRAPHIC_image_getBytesNumberPerRowRepeat_0700
     * @tc.desc   Repeat getBytesNumberPerRow 100 times after crop, verify return value is consistent with new dimensions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBytesNumberPerRowRepeat_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getBytesNumberPerRowRepeat_0700 ';
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

          const firstValue: number = pixelMap.getBytesNumberPerRow();
          console.info(msgStr + 'first call after crop: ' + firstValue);
          expect(firstValue).assertEqual(8);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getBytesNumberPerRow();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
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
     * @tc.name   getPixelBytesNumberRepeat_0800
     * @tc.number SUB_GRAPHIC_image_getPixelBytesNumberRepeat_0800
     * @tc.desc   Repeat getPixelBytesNumber 100 times after scale, verify return value is consistent with new dimensions.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumberRepeat_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getPixelBytesNumberRepeat_0800 ';
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

          const firstValue: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'first call after scale: ' + firstValue);
          expect(firstValue).assertEqual(384);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getPixelBytesNumber();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
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
     * @tc.name   getUniqueIdRepeat_0900
     * @tc.number SUB_GRAPHIC_image_getUniqueIdRepeat_0900
     * @tc.desc   Repeat getUniqueId 100 times on createPixelMapUsingAllocatorSync PixelMap, verify return value is consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUniqueIdRepeat_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getUniqueIdRepeat_0900 ';
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

          const firstValue: number = pixelMap.getUniqueId();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertLargerOrEqual(0);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getUniqueId();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
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
     * @tc.name   isReleasedRepeat_1000
     * @tc.number SUB_GRAPHIC_image_isReleasedRepeat_1000
     * @tc.desc   Stress test: repeat isReleased 500 times before release (all false), then 500 times after release (all true), verify consistency.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isReleasedRepeat_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' isReleasedRepeat_1000 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          let allFalseBeforeRelease: boolean = true;
          for (let i = 0; i < 500; i++) {
            const value: boolean = pixelMap.isReleased();
            if (value !== false) {
              allFalseBeforeRelease = false;
              console.error(msgStr + 'expected false at iteration ' + i +
                ' before release, got true');
              break;
            }
          }
          console.info(msgStr + 'all 500 calls return false before release: ' + allFalseBeforeRelease);
          expect(allFalseBeforeRelease).assertTrue();

          await pixelMap.release();

          let allTrueAfterRelease: boolean = true;
          for (let i = 0; i < 500; i++) {
            const value: boolean = pixelMap.isReleased();
            if (value !== true) {
              allTrueAfterRelease = false;
              console.error(msgStr + 'expected true at iteration ' + i +
                ' after release, got false');
              break;
            }
          }
          console.info(msgStr + 'all 500 calls return true after release: ' + allTrueAfterRelease);
          expect(allTrueAfterRelease).assertTrue();

          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getPixelBytesNumberRepeat_1100
     * @tc.number SUB_GRAPHIC_image_getPixelBytesNumberRepeat_1100
     * @tc.desc   On ARGB_8888 PixelMap, repeat getBytesNumberPerRow and getPixelBytesNumber 100 times, verify both return values are consistent.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumberRepeat_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getPixelBytesNumberRepeat_1100 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.ARGB_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const firstBytesPerRow: number = pixelMap.getBytesNumberPerRow();
          const firstPixelBytes: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'first call: bytesPerRow=' + firstBytesPerRow +
            ', pixelBytes=' + firstPixelBytes);
          expect(firstBytesPerRow).assertEqual(24);
          expect(firstPixelBytes).assertEqual(96);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const bytesPerRow: number = pixelMap.getBytesNumberPerRow();
            const pixelBytes: number = pixelMap.getPixelBytesNumber();
            if (bytesPerRow !== firstBytesPerRow || pixelBytes !== firstPixelBytes) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent: ' + allConsistent);
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
     * @tc.name   getUniqueIdRepeat_1200
     * @tc.number SUB_GRAPHIC_image_getUniqueIdRepeat_1200
     * @tc.desc   Create two separate PixelMaps, verify getUniqueId returns different values between them, each consistent across 100 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUniqueIdRepeat_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getUniqueIdRepeat_1200 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap1: image.PixelMap = image.createPixelMapSync(color, opts);
          const pixelMap2: image.PixelMap = image.createPixelMapSync(color, opts);

          const id1: number = pixelMap1.getUniqueId();
          const id2: number = pixelMap2.getUniqueId();
          console.info(msgStr + 'pixelMap1 id=' + id1 + ', pixelMap2 id=' + id2);
          expect(id1).assertLargerOrEqual(0);
          expect(id2).assertLargerOrEqual(0);
          expect(id1 !== id2).assertTrue();

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const v1: number = pixelMap1.getUniqueId();
            const v2: number = pixelMap2.getUniqueId();
            if (v1 !== id1 || v2 !== id2 || v1 === v2) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', v1=' + v1 + ', v2=' + v2);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent and different: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap1.release();
          await pixelMap2.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getBytesNumberPerRowRepeat_1300
     * @tc.number SUB_GRAPHIC_image_getBytesNumberPerRowRepeat_1300
     * @tc.desc   After rotate(90), use getImageInfoSync to get new width, verify getBytesNumberPerRow equals width*4, repeat 100 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getBytesNumberPerRowRepeat_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getBytesNumberPerRowRepeat_1300 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          await pixelMap.rotate(90);
          console.info(msgStr + 'rotate 90 done');

          const imgInfo: image.ImageInfo = pixelMap.getImageInfoSync();
          const expectedBytesPerRow: number = imgInfo.size.width * 4;
          console.info(msgStr + 'after rotate: width=' + imgInfo.size.width +
            ', expectedBytesPerRow=' + expectedBytesPerRow);

          const firstValue: number = pixelMap.getBytesNumberPerRow();
          console.info(msgStr + 'first call result: ' + firstValue);
          expect(firstValue).assertEqual(expectedBytesPerRow);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getBytesNumberPerRow();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent after rotate: ' + allConsistent);
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
     * @tc.name   getPixelBytesNumberRepeat_1400
     * @tc.number SUB_GRAPHIC_image_getPixelBytesNumberRepeat_1400
     * @tc.desc   After flip, dimensions unchanged, verify getPixelBytesNumber stays the same across 100 repeated calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumberRepeat_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getPixelBytesNumberRepeat_1400 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const valueBeforeFlip: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'before flip: pixelBytesNumber=' + valueBeforeFlip);

          await pixelMap.flip(true, false);
          console.info(msgStr + 'flip done');

          const firstValue: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'after flip first call: ' + firstValue);
          expect(firstValue).assertEqual(valueBeforeFlip);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getPixelBytesNumber();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
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

    /**
     * @tc.name   getDensityRepeat_1500
     * @tc.number SUB_GRAPHIC_image_getDensityRepeat_1500
     * @tc.desc   Across 4 creation methods (createPixelMapSync, createPixelMapUsingAllocatorSync, createPixelMap, createPixelMapFromPixels), repeat getDensity 50 times each, verify all return 0.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityRepeat_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getDensityRepeat_1500 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            srcPixelFormat: image.PixelMapFormat.RGBA_8888,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };

          const pm1: image.PixelMap = image.createPixelMapSync(color, opts);
          const pm2: image.PixelMap = image.createPixelMapUsingAllocatorSync(color, opts);
          const pm3: image.PixelMap = await image.createPixelMap(color, opts);
          const pm4: image.PixelMap = await image.createPixelMapFromPixels(color, opts);

          const pixelMaps: image.PixelMap[] = [pm1, pm2, pm3, pm4];
          const names: string[] = ['createPixelMapSync', 'createPixelMapUsingAllocatorSync',
            'createPixelMap', 'createPixelMapFromPixels'];

          let allConsistent: boolean = true;
          for (let m = 0; m < pixelMaps.length; m++) {
            const firstDensity: number = pixelMaps[m].getDensity();
            console.info(msgStr + names[m] + ' first density=' + firstDensity);
            expect(firstDensity).assertEqual(0);
            for (let i = 0; i < 50; i++) {
              const value: number = pixelMaps[m].getDensity();
              if (value !== firstDensity) {
                allConsistent = false;
                console.error(msgStr + names[m] + ' inconsistency at iteration ' + i);
                break;
              }
            }
            if (!allConsistent) {
              break;
            }
          }
          console.info(msgStr + 'all creation methods consistent: ' + allConsistent);
          expect(allConsistent).assertTrue();

          for (let m = 0; m < pixelMaps.length; m++) {
            await pixelMaps[m].release();
          }
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   isReleasedRepeat_1600
     * @tc.number SUB_GRAPHIC_image_isReleasedRepeat_1600
     * @tc.desc   Clone independence: after cloneSync, release the original PixelMap, verify clone's isReleased returns false 100 times; then release clone, verify returns true 100 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('isReleasedRepeat_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' isReleasedRepeat_1600 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          const clonedPixelMap: image.PixelMap = pixelMap.cloneSync();
          console.info(msgStr + 'cloneSync done');

          await pixelMap.release();
          console.info(msgStr + 'original released');

          let allFalseAfterOriginalRelease: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: boolean = clonedPixelMap.isReleased();
            if (value !== false) {
              allFalseAfterOriginalRelease = false;
              console.error(msgStr + 'expected false at iteration ' + i +
                ' after original release, got true');
              break;
            }
          }
          console.info(msgStr + 'clone isReleased false 100 times after original release: '
            + allFalseAfterOriginalRelease);
          expect(allFalseAfterOriginalRelease).assertTrue();

          await clonedPixelMap.release();

          let allTrueAfterCloneRelease: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: boolean = clonedPixelMap.isReleased();
            if (value !== true) {
              allTrueAfterCloneRelease = false;
              console.error(msgStr + 'expected true at iteration ' + i +
                ' after clone release, got false');
              break;
            }
          }
          console.info(msgStr + 'clone isReleased true 100 times after clone release: '
            + allTrueAfterCloneRelease);
          expect(allTrueAfterCloneRelease).assertTrue();

          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getUniqueIdRepeat_1700
     * @tc.number SUB_GRAPHIC_image_getUniqueIdRepeat_1700
     * @tc.desc   Clone uniqueness: after cloneSync, verify clone's getUniqueId differs from original, each consistent across 100 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getUniqueIdRepeat_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getUniqueIdRepeat_1700 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          const clonedPixelMap: image.PixelMap = pixelMap.cloneSync();
          console.info(msgStr + 'cloneSync done');

          const originalId: number = pixelMap.getUniqueId();
          const clonedId: number = clonedPixelMap.getUniqueId();
          console.info(msgStr + 'original id=' + originalId + ', cloned id=' + clonedId);
          expect(originalId).assertLargerOrEqual(0);
          expect(clonedId).assertLargerOrEqual(0);
          expect(originalId !== clonedId).assertTrue();

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const v1: number = pixelMap.getUniqueId();
            const v2: number = clonedPixelMap.getUniqueId();
            if (v1 !== originalId || v2 !== clonedId || v1 === v2) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', original=' + v1 + ', clone=' + v2);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent and different: ' + allConsistent);
          expect(allConsistent).assertTrue();

          await pixelMap.release();
          await clonedPixelMap.release();
          console.info(msgStr + 'end');
          done();
        } catch (error) {
          console.error(msgStr + 'failed: ' + error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   getPixelBytesNumberRepeat_1800
     * @tc.number SUB_GRAPHIC_image_getPixelBytesNumberRepeat_1800
     * @tc.desc   After opacity(0.5), dimensions unchanged, verify getPixelBytesNumber stays the same across 100 repeated calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getPixelBytesNumberRepeat_1800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getPixelBytesNumberRepeat_1800 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const valueBeforeOpacity: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'before opacity: pixelBytesNumber=' + valueBeforeOpacity);

          await pixelMap.opacity(0.5);
          console.info(msgStr + 'opacity 0.5 done');

          const firstValue: number = pixelMap.getPixelBytesNumber();
          console.info(msgStr + 'after opacity first call: ' + firstValue);
          expect(firstValue).assertEqual(valueBeforeOpacity);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getPixelBytesNumber();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
              break;
            }
          }
          console.info(msgStr + 'all 100 calls consistent after opacity: ' + allConsistent);
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
     * @tc.name   getDensityRepeat_1900
     * @tc.number SUB_GRAPHIC_image_getDensityRepeat_1900
     * @tc.desc   After scale(2.0, 2.0), verify getDensity remains unchanged (0), repeat 100 times.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('getDensityRepeat_1900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' getDensityRepeat_1900 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);

          const densityBeforeScale: number = pixelMap.getDensity();
          console.info(msgStr + 'before scale: density=' + densityBeforeScale);
          expect(densityBeforeScale).assertEqual(0);

          await pixelMap.scale(2.0, 2.0);
          console.info(msgStr + 'scale 2x2 done');

          const firstValue: number = pixelMap.getDensity();
          console.info(msgStr + 'after scale first call: ' + firstValue);
          expect(firstValue).assertEqual(densityBeforeScale);

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const value: number = pixelMap.getDensity();
            if (value !== firstValue) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i +
                ', expected: ' + firstValue + ', actual: ' + value);
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
     * @tc.name   allGetterRepeat_2000
     * @tc.number SUB_GRAPHIC_image_allGetterRepeat_2000
     * @tc.desc   After createScaledPixelMapSync(2.0, 1.0), new 12x4 PixelMap, verify all 5 getters (bytesPerRow=48, pixelBytes=192, density=0, uniqueId>=0, isReleased=false) are consistent across 100 calls.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('allGetterRepeat_2000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = LOG_PREFIX + ' allGetterRepeat_2000 ';
        console.info(msgStr + 'begin');
        try {
          const color: ArrayBuffer = new ArrayBuffer(96);
          const opts: image.InitializationOptions = {
            editable: true,
            pixelFormat: image.PixelMapFormat.RGBA_8888,
            size: { height: 4, width: 6 }
          };
          const pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
          const scaledPixelMap: image.PixelMap =
            pixelMap.createScaledPixelMapSync(2.0, 1.0);
          console.info(msgStr + 'createScaledPixelMapSync(2.0, 1.0) done');

          const firstBytesPerRow: number = scaledPixelMap.getBytesNumberPerRow();
          const firstPixelBytes: number = scaledPixelMap.getPixelBytesNumber();
          const firstDensity: number = scaledPixelMap.getDensity();
          const firstUniqueId: number = scaledPixelMap.getUniqueId();
          const firstIsReleased: boolean = scaledPixelMap.isReleased();
          console.info(msgStr + 'first call: bytesPerRow=' + firstBytesPerRow +
            ', pixelBytes=' + firstPixelBytes +
            ', density=' + firstDensity +
            ', uniqueId=' + firstUniqueId +
            ', isReleased=' + firstIsReleased);
          expect(firstBytesPerRow).assertEqual(48);
          expect(firstPixelBytes).assertEqual(192);
          expect(firstDensity).assertEqual(0);
          expect(firstUniqueId).assertLargerOrEqual(0);
          expect(firstIsReleased).assertFalse();

          let allConsistent: boolean = true;
          for (let i = 0; i < 100; i++) {
            const bytesPerRow: number = scaledPixelMap.getBytesNumberPerRow();
            const pixelBytes: number = scaledPixelMap.getPixelBytesNumber();
            const density: number = scaledPixelMap.getDensity();
            const uniqueId: number = scaledPixelMap.getUniqueId();
            const isReleased: boolean = scaledPixelMap.isReleased();
            if (bytesPerRow !== firstBytesPerRow ||
              pixelBytes !== firstPixelBytes ||
              density !== firstDensity ||
              uniqueId !== firstUniqueId ||
              isReleased !== firstIsReleased) {
              allConsistent = false;
              console.error(msgStr + 'inconsistency at iteration ' + i);
              break;
            }
          }
          console.info(msgStr + 'all 100 combined calls consistent on scaled PixelMap: '
            + allConsistent);
          expect(allConsistent).assertTrue();

          await scaledPixelMap.release();
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
