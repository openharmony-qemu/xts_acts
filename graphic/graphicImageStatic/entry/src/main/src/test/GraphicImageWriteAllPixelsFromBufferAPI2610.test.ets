'use static';
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Level, Size } from '@ohos/hypium-static/src/main/indexStatic';
import image from '@ohos.multimedia.image';
import { BusinessError } from '@ohos.base';

const PIXEL_WIDTH: int = 4;
const PIXEL_HEIGHT: int = 4;

function getBytesPerPixel(format: image.PixelMapFormat): number {
  switch (format) {
    case image.PixelMapFormat.RGB_565:
      return 2;
    case image.PixelMapFormat.RGB_888:
      return 3;
    case image.PixelMapFormat.RGBA_8888:
    case image.PixelMapFormat.BGRA_8888:
    case image.PixelMapFormat.ARGB_8888:
    case image.PixelMapFormat.RGBA_1010102:
      return 4;
    case image.PixelMapFormat.RGBA_F16:
      return 8;
    default:
      return 4;
  }
}

function createPixelMapByFormat(pixelFormat: image.PixelMapFormat): image.PixelMap {
  const bytesPerPixel: double = getBytesPerPixel(pixelFormat);
  const colorSize: double = PIXEL_WIDTH * PIXEL_HEIGHT * bytesPerPixel;
  const color: ArrayBuffer = new ArrayBuffer(colorSize);
  const opts: image.InitializationOptions = {
    editable: true,
    srcPixelFormat: pixelFormat,
    pixelFormat: pixelFormat,
    size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
  };
  return image.createPixelMapSync(color, opts);
}

function buildSourceBuffer(srcFormat: image.PixelMapFormat): ArrayBuffer {
  const bytesPerPixel: double = getBytesPerPixel(srcFormat);
  const bufferSize: double = PIXEL_WIDTH * PIXEL_HEIGHT * bytesPerPixel;
  const buffer: ArrayBuffer = new ArrayBuffer(bufferSize);
  const arr: Uint8Array = new Uint8Array(buffer);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = (i % 255) + 1;
  }
  return buffer;
}

export default function GraphicImageWriteAllPixelsFromBufferAPI2610() {

  describe("GraphicImageWriteAllPixelsFromBufferAPI2610", (): void => {

    afterAll((): void => {
      console.info('www data GraphicImageWriteAllPixelsFromBufferAPI2610 afterAll');
    });
    beforeEach((): void => {
      console.info('www data GraphicImageWriteAllPixelsFromBufferAPI2610 beforeEach');
    });
    afterEach((): void => {
      console.info('www data GraphicImageWriteAllPixelsFromBufferAPI2610 afterEach');
    });
    beforeAll((): void => {
      console.info('www data GraphicImageWriteAllPixelsFromBufferAPI2610 beforeAll');
    });

    // ==================== Group A: writeAllPixelsFromBuffer async, 17 sourcePixelFormats ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0100
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat UNKNOWN unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.UNKNOWN);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.UNKNOWN);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0200
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat ARGB_8888 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ARGB_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.ARGB_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0300
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat RGB_565 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGB_565);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0400
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat RGBA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0500
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat BGRA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.BGRA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.BGRA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0600
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat RGB_888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGB_888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGB_888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0700
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat ALPHA_8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_8);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.ALPHA_8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0800
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0800
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat RGBA_F16 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0800 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_F16);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_F16);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0900
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_0900
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat NV21 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_0900 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.NV21);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.NV21);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1000
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1000
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat NV12 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1000 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.NV12);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.NV12);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1100
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat RGBA_1010102 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_1010102);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_1010102);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1200
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat YCBCR_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.YCBCR_P010);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.YCBCR_P010);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1300
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat YCRCB_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.YCRCB_P010);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.YCRCB_P010);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1400
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat Y8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.Y8);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.Y8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1500
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat ALPHA_U8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_U8);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.ALPHA_U8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1600
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat ALPHA_F16 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_F16);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.ALPHA_F16);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_srcFmt_static_1700
     * @tc.desc   writeAllPixelsFromBuffer sourcePixelFormat ASTC_4x4 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_srcFmt_static_1700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ASTC_4x4);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.ASTC_4x4);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    // ==================== Group B: writeAllPixelsFromBufferSync, 17 sourcePixelFormats ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0100
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat UNKNOWN unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.UNKNOWN);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.UNKNOWN);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0200
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat ARGB_8888 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ARGB_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.ARGB_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0300
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat RGB_565 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGB_565);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0400
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat RGBA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0500
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat BGRA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.BGRA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.BGRA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0600
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat RGB_888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGB_888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGB_888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0700
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat ALPHA_8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_8);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.ALPHA_8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0800
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0800
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat RGBA_F16 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0800 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_F16);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_F16);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0900
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_0900
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat NV21 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_0900 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.NV21);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.NV21);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1000
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1000
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat NV12 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1000 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.NV12);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.NV12);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1100
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat RGBA_1010102 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_1010102);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_1010102);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1200
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat YCBCR_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.YCBCR_P010);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.YCBCR_P010);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1300
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat YCRCB_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.YCRCB_P010);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.YCRCB_P010);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1400
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat Y8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.Y8);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.Y8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1500
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat ALPHA_U8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_U8);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.ALPHA_U8);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1600
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat ALPHA_F16 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ALPHA_F16);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.ALPHA_F16);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_srcFmt_static_1700
     * @tc.desc   writeAllPixelsFromBufferSync sourcePixelFormat ASTC_4x4 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_srcFmt_static_1700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.ASTC_4x4);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.ASTC_4x4);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    // ==================== Group C: writeAllPixelsFromBuffer async, 7 pixelFormats ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0100
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat BGRA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.BGRA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=BGRA_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0200
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0300
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat ARGB_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.ARGB_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=ARGB_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0400
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat RGB_888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0500
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat RGB_565 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_565);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_565');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0600
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat RGBA_F16 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_F16);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_F16');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_pixelFmt_static_0700
     * @tc.desc   writeAllPixelsFromBuffer pixelFormat RGBA_1010102 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_pixelFmt_static_0700 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_1010102');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBuffer success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    // ==================== Group D: writeAllPixelsFromBufferSync, 7 pixelFormats ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0100
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat BGRA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.BGRA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=BGRA_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0200
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0300
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat ARGB_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.ARGB_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=ARGB_8888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0400
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat RGB_888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_888');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0500
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat RGB_565 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_565);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_565');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0600
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat RGBA_F16 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_F16);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_F16');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_pixelFmt_static_0700
     * @tc.desc   writeAllPixelsFromBufferSync pixelFormat RGBA_1010102 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_pixelFmt_static_0700 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_1010102');
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writeAllPixelsFromBufferSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    // ==================== Group G: writeAllPixelsFromBuffer async, error code scenarios ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_errCode_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_errCode_static_0100
     * @tc.desc   writeAllPixelsFromBuffer released pixelmap error code 7600105 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_errCode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_errCode_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        await pixelMap.release();
        console.info(msgStr + 'release success');
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600105);
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_errCode_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_errCode_static_0200
     * @tc.desc   writeAllPixelsFromBuffer buffer size too small error code 7600206 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_errCode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_errCode_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let smallBuffer: ArrayBuffer = new ArrayBuffer(10);
        try {
          await pixelMap.writeAllPixelsFromBuffer(smallBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_errCode_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_errCode_static_0300
     * @tc.desc   writeAllPixelsFromBuffer non-editable pixelmap error code 7600201 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_errCode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_errCode_static_0300 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(64);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600201);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBuffer_errCode_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBuffer_errCode_static_0400
     * @tc.desc   writeAllPixelsFromBuffer unsupported conversion error code 7600203 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBuffer_errCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBuffer_errCode_static_0400 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          await pixelMap.writeAllPixelsFromBuffer(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600203);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    // ==================== Group H: writeAllPixelsFromBufferSync sync, error code scenarios ====================

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_errCode_static_0100
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_errCode_static_0100
     * @tc.desc   writeAllPixelsFromBufferSync released pixelmap error code 7600105 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_errCode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_errCode_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        await pixelMap.release();
        console.info(msgStr + 'release success');
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600105);
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_errCode_static_0200
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_errCode_static_0200
     * @tc.desc   writeAllPixelsFromBufferSync buffer size too small error code 7600206 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_errCode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_errCode_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let smallBuffer: ArrayBuffer = new ArrayBuffer(10);
        try {
          pixelMap.writeAllPixelsFromBufferSync(smallBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600206);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_errCode_static_0300
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_errCode_static_0300
     * @tc.desc   writeAllPixelsFromBufferSync non-editable pixelmap error code 7600201 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_errCode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_errCode_static_0300 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(64);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600201);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })

    /**
     * @tc.name   graphicImageWriteAllPixelsFromBufferSync_errCode_static_0400
     * @tc.number SUB_GRAPHIC_image_writeAllPixelsFromBufferSync_errCode_static_0400
     * @tc.desc   writeAllPixelsFromBufferSync unsupported conversion error code 7600203 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWriteAllPixelsFromBufferSync_errCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWriteAllPixelsFromBufferSync_errCode_static_0400 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let srcBuffer: ArrayBuffer = buildSourceBuffer(image.PixelMapFormat.RGBA_8888);
        try {
          pixelMap.writeAllPixelsFromBufferSync(srcBuffer, image.PixelMapFormat.RGBA_8888);
          console.error(msgStr + 'should fail but success');
          await pixelMap.release();
          expect().assertFail();
          done();
        } catch (error) {
          let err: BusinessError = error as BusinessError;
          console.info(msgStr + 'caught expected error code=' + err.code);
          expect(err.code).assertEqual(7600203);
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        }
      })
  })
}
