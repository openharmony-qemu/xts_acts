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

function buildPositionArea(srcFormat: image.PixelMapFormat, width: int, height: int): image.PositionArea {
  const bytesPerPixel: double = getBytesPerPixel(srcFormat);
  const stride: int = (width * bytesPerPixel).toInt();
  const bufferSize: double = stride * height;
  const buffer: ArrayBuffer = new ArrayBuffer(bufferSize);
  const arr: Uint8Array = new Uint8Array(buffer);
  for (let i = 0; i < arr.length; i++) {
    arr[i] = (i % 255) + 1;
  }
  return {
    pixels: buffer,
    offset: 0,
    stride: stride,
    region: { x: 0, y: 0, size: { width: width, height: height } }
  };
}

export default function GraphicImageWritePixelsFromAreaAPI2610() {

  describe("GraphicImageWritePixelsFromAreaAPI2610", (): void => {

    afterAll((): void => {
      console.info('www data GraphicImageWritePixelsFromAreaAPI2610 afterAll');
    });
    beforeEach((): void => {
      console.info('www data GraphicImageWritePixelsFromAreaAPI2610 beforeEach');
    });
    afterEach((): void => {
      console.info('www data GraphicImageWritePixelsFromAreaAPI2610 afterEach');
    });
    beforeAll((): void => {
      console.info('www data GraphicImageWritePixelsFromAreaAPI2610 beforeAll');
    });

    // ==================== Group A: writePixelsFromArea async, 17 sourcePixelFormats ====================

    /**
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0100
     * @tc.desc   writePixelsFromArea sourcePixelFormat UNKNOWN unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.UNKNOWN, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.UNKNOWN);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0200
     * @tc.desc   writePixelsFromArea sourcePixelFormat ARGB_8888 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ARGB_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.ARGB_8888);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0300
     * @tc.desc   writePixelsFromArea sourcePixelFormat RGB_565 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGB_565, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0400
     * @tc.desc   writePixelsFromArea sourcePixelFormat RGBA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0500
     * @tc.desc   writePixelsFromArea sourcePixelFormat BGRA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.BGRA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.BGRA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0600
     * @tc.desc   writePixelsFromArea sourcePixelFormat RGB_888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGB_888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGB_888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0700
     * @tc.desc   writePixelsFromArea sourcePixelFormat ALPHA_8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.ALPHA_8);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0800
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0800
     * @tc.desc   writePixelsFromArea sourcePixelFormat RGBA_F16 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0800 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_F16, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_F16);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_0900
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_0900
     * @tc.desc   writePixelsFromArea sourcePixelFormat NV21 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_0900 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.NV21, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.NV21);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1000
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1000
     * @tc.desc   writePixelsFromArea sourcePixelFormat NV12 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1000 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.NV12, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.NV12);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1100
     * @tc.desc   writePixelsFromArea sourcePixelFormat RGBA_1010102 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_1010102, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_1010102);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1200
     * @tc.desc   writePixelsFromArea sourcePixelFormat YCBCR_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.YCBCR_P010, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.YCBCR_P010);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1300
     * @tc.desc   writePixelsFromArea sourcePixelFormat YCRCB_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.YCRCB_P010, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.YCRCB_P010);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1400
     * @tc.desc   writePixelsFromArea sourcePixelFormat Y8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.Y8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.Y8);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1500
     * @tc.desc   writePixelsFromArea sourcePixelFormat ALPHA_U8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_U8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.ALPHA_U8);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1600
     * @tc.desc   writePixelsFromArea sourcePixelFormat ALPHA_F16 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_F16, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.ALPHA_F16);
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
     * @tc.name   graphicImageWritePixelsFromArea_srcFmt_static_1700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_srcFmt_static_1700
     * @tc.desc   writePixelsFromArea sourcePixelFormat ASTC_4x4 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_srcFmt_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_srcFmt_static_1700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ASTC_4x4, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.ASTC_4x4);
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

    // ==================== Group B: writePixelsFromAreaSync, 17 sourcePixelFormats ====================

    /**
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0100
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat UNKNOWN unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.UNKNOWN, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.UNKNOWN);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0200
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat ARGB_8888 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ARGB_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.ARGB_8888);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0300
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat RGB_565 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGB_565, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGB_565);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0400
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat RGBA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0500
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat BGRA_8888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.BGRA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.BGRA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0600
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat RGB_888 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGB_888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGB_888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0700
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat ALPHA_8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.ALPHA_8);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0800
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0800
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat RGBA_F16 supported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0800', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0800 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_F16, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_F16);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_0900
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_0900
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat NV21 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_0900', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_0900 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.NV21, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.NV21);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1000
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1000
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat NV12 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1000', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1000 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.NV12, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.NV12);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1100
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat RGBA_1010102 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_1010102, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_1010102);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1200
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat YCBCR_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.YCBCR_P010, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.YCBCR_P010);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1300
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat YCRCB_P010 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.YCRCB_P010, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.YCRCB_P010);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1400
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat Y8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.Y8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.Y8);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1500
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat ALPHA_U8 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_U8, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.ALPHA_U8);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1600
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat ALPHA_F16 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ALPHA_F16, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.ALPHA_F16);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_srcFmt_static_1700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_srcFmt_static_1700
     * @tc.desc   writePixelsFromAreaSync sourcePixelFormat ASTC_4x4 unsupported test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_srcFmt_static_1700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_srcFmt_static_1700 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.ASTC_4x4, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.ASTC_4x4);
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

    // ==================== Group C: writePixelsFromArea async, 7 pixelFormats ====================

    /**
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0100
     * @tc.desc   writePixelsFromArea pixelFormat BGRA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.BGRA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=BGRA_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0200
     * @tc.desc   writePixelsFromArea pixelFormat RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0300
     * @tc.desc   writePixelsFromArea pixelFormat ARGB_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.ARGB_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=ARGB_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0400
     * @tc.desc   writePixelsFromArea pixelFormat RGB_888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0500
     * @tc.desc   writePixelsFromArea pixelFormat RGB_565 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_565);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_565');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0600
     * @tc.desc   writePixelsFromArea pixelFormat RGBA_F16 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_F16);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_F16');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
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
     * @tc.name   graphicImageWritePixelsFromArea_pixelFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_pixelFmt_static_0700
     * @tc.desc   writePixelsFromArea pixelFormat RGBA_1010102 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_pixelFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_pixelFmt_static_0700 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_1010102');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromArea success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    // ==================== Group D: writePixelsFromAreaSync, 7 pixelFormats ====================

    /**
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0100
     * @tc.desc   writePixelsFromAreaSync pixelFormat BGRA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.BGRA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=BGRA_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0200
     * @tc.desc   writePixelsFromAreaSync pixelFormat RGBA_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0300
     * @tc.desc   writePixelsFromAreaSync pixelFormat ARGB_8888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0300 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.ARGB_8888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=ARGB_8888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0400
     * @tc.desc   writePixelsFromAreaSync pixelFormat RGB_888 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0400 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_888);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_888');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0500
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0500
     * @tc.desc   writePixelsFromAreaSync pixelFormat RGB_565 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0500 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGB_565);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGB_565');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0600
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0600
     * @tc.desc   writePixelsFromAreaSync pixelFormat RGBA_F16 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0600 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_F16);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_F16');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_pixelFmt_static_0700
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_pixelFmt_static_0700
     * @tc.desc   writePixelsFromAreaSync pixelFormat RGBA_1010102 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_pixelFmt_static_0700', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_pixelFmt_static_0700 ';
        console.info(msgStr + 'begin');
        const opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.RGBA_1010102,
          pixelFormat: image.PixelMapFormat.RGBA_1010102,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(opts);
        console.info(msgStr + 'createPixelMapSync success pixelFormat=RGBA_1010102');
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
          console.info(msgStr + 'writePixelsFromAreaSync success');
          await pixelMap.release();
          console.info(msgStr + 'release success');
          done();
        } catch (error) {
          console.error(msgStr + 'failed', error);
          expect().assertFail();
          done();
        }
      })

    // ==================== Group G: writePixelsFromArea async, error code scenarios ====================

    /**
     * @tc.name   graphicImageWritePixelsFromArea_errCode_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_errCode_static_0100
     * @tc.desc   writePixelsFromArea released pixelmap error code 7600105 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_errCode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_errCode_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        await pixelMap.release();
        console.info(msgStr + 'release success');
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromArea_errCode_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_errCode_static_0200
     * @tc.desc   writePixelsFromArea area pixels too small error code 7600206 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_errCode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_errCode_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let smallArea: image.PositionArea = {
          pixels: new ArrayBuffer(10),
          offset: 0,
          stride: 16,
          region: { x: 0, y: 0, size: { width: PIXEL_WIDTH, height: PIXEL_HEIGHT } }
        };
        try {
          await pixelMap.writePixelsFromArea(smallArea, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromArea_errCode_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_errCode_static_0300
     * @tc.desc   writePixelsFromArea non-editable pixelmap error code 7600201 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_errCode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_errCode_static_0300 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(64);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromArea_errCode_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromArea_errCode_static_0400
     * @tc.desc   writePixelsFromArea unsupported conversion error code 7600203 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromArea_errCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromArea_errCode_static_0400 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          await pixelMap.writePixelsFromArea(area, image.PixelMapFormat.RGBA_8888);
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

    // ==================== Group H: writePixelsFromAreaSync sync, error code scenarios ====================

    /**
     * @tc.name   graphicImageWritePixelsFromAreaSync_errCode_static_0100
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_errCode_static_0100
     * @tc.desc   writePixelsFromAreaSync released pixelmap error code 7600105 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_errCode_static_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_errCode_static_0100 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        await pixelMap.release();
        console.info(msgStr + 'release success');
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_errCode_static_0200
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_errCode_static_0200
     * @tc.desc   writePixelsFromAreaSync area pixels too small error code 7600206 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_errCode_static_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_errCode_static_0200 ';
        console.info(msgStr + 'begin');
        let pixelMap: image.PixelMap = createPixelMapByFormat(image.PixelMapFormat.RGBA_8888);
        let smallArea: image.PositionArea = {
          pixels: new ArrayBuffer(10),
          offset: 0,
          stride: 16,
          region: { x: 0, y: 0, size: { width: PIXEL_WIDTH, height: PIXEL_HEIGHT } }
        };
        try {
          pixelMap.writePixelsFromAreaSync(smallArea, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_errCode_static_0300
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_errCode_static_0300
     * @tc.desc   writePixelsFromAreaSync non-editable pixelmap error code 7600201 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_errCode_static_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_errCode_static_0300 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(64);
        let opts: image.InitializationOptions = {
          editable: false,
          srcPixelFormat: image.PixelMapFormat.RGBA_8888,
          pixelFormat: image.PixelMapFormat.RGBA_8888,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
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
     * @tc.name   graphicImageWritePixelsFromAreaSync_errCode_static_0400
     * @tc.number SUB_GRAPHIC_image_writePixelsFromAreaSync_errCode_static_0400
     * @tc.desc   writePixelsFromAreaSync unsupported conversion error code 7600203 test.
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('graphicImageWritePixelsFromAreaSync_errCode_static_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
        let msgStr: string = 'www data graphicImageWritePixelsFromAreaSync_errCode_static_0400 ';
        console.info(msgStr + 'begin');
        let color: ArrayBuffer = new ArrayBuffer(24);
        let opts: image.InitializationOptions = {
          editable: true,
          srcPixelFormat: image.PixelMapFormat.NV21,
          pixelFormat: image.PixelMapFormat.NV21,
          size: { height: PIXEL_HEIGHT, width: PIXEL_WIDTH }
        };
        let pixelMap: image.PixelMap = image.createPixelMapSync(color, opts);
        let area: image.PositionArea = buildPositionArea(image.PixelMapFormat.RGBA_8888, PIXEL_WIDTH, PIXEL_HEIGHT);
        try {
          pixelMap.writePixelsFromAreaSync(area, image.PixelMapFormat.RGBA_8888);
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
