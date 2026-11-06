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

import { describe, beforeAll, afterEach, it, expect, TestType, Level, Size } from '@ohos/hypium-dynamic'
import ndkTest from 'libImageNdk.so'
import image from '@ohos.multimedia.image';

const IMAGE_SUCCESS = 0;
const IMAGE_INVALID_PARAMETER = 7600206;
const IMAGE_UNSUPPORTED_OPERATION = 7600201;
const IMAGE_UNSUPPORTED_CONVERSION = 7600203;

export default function imageNdk2Test() {
  describe('ImageNdkTest', () => {
    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGBA8888_0100
     * @tc.name testWritePixelsWithFmtRGBA8888
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with RGBA_8888, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtRGBA8888',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtRGBA8888(pm, new ArrayBuffer(20 * 30 * 4));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGB888_0200
     * @tc.name testWritePixelsWithFmtRGB888
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with RGB_888, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtRGB888',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtRGB888(pm, new ArrayBuffer(20 * 30 * 3));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGB565_0300
     * @tc.name testWritePixelsWithFmtRGB565
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with RGB_565, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtRGB565',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtRGB565(pm, new ArrayBuffer(20 * 30 * 2));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtRGBAF16_0400
     * @tc.name testWritePixelsWithFmtRGBAF16
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with RGBA_F16, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtRGBAF16',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtRGBAF16(pm, new ArrayBuffer(20 * 30 * 8));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtNullPixelmap_0500
     * @tc.name testWritePixelsWithFmtNullPixelmap
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with null pixelmap, verify IMAGE_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtNullPixelmap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsWithFmtNullPixelmap(new ArrayBuffer(20 * 30 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtNullSource_0600
     * @tc.name testWritePixelsWithFmtNullSource
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with null source and zero size, verify error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtNullSource',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtNullSource(pm);
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtUnsupportedFmt_0700
     * @tc.name testWritePixelsWithFmtUnsupportedFmt
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with unsupported NV21 format, verify error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtUnsupportedFmt',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtUnsupportedFmt(pm, new ArrayBuffer(20 * 30 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtLocked_0800
     * @tc.name testWritePixelsWithFmtLocked
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat on locked pixelmap, verify IMAGE_UNSUPPORTED_OPERATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtLocked',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtLocked(pm, new ArrayBuffer(20 * 30 * 4));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_OPERATION);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtAllocFailed_1100
     * @tc.name testWritePixelsWithFmtAllocFailed
     * @tc.desc verify IMAGE_ALLOC_FAILED error code constant is accessible and value correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtAllocFailed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsWithFmtAllocFailed();
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtUnsupportedConversion_0900
     * @tc.name testWritePixelsWithFmtUnsupportedConversion
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat NV21 pixelmap with RGBA_8888 source, verify error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtUnsupportedConversion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsWithFmtUnsupportedConversion();
      expect(result).assertEqual(IMAGE_UNSUPPORTED_CONVERSION);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtInsufficientBuffer_1000
     * @tc.name testWritePixelsWithFmtInsufficientBuffer
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat with bufferSize 1, verify IMAGE_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtInsufficientBuffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(20 * 30 * 4), {
        size: { width: 20, height: 30 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsWithFmtInsufficientBuffer(pm, new ArrayBuffer(20 * 30 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtCopyFailed_1200
     * @tc.name testWritePixelsWithFmtCopyFailed
     * @tc.desc verify IMAGE_COPY_FAILED error code constant is accessible and value correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtCopyFailed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsWithFmtCopyFailed();
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsWithFmtByFormat_1300
     * @tc.name testWritePixelsWithFmtAllFormats
     * @tc.desc test OH_PixelmapNative_WritePixelsWithPixelFormat enumerate all PIXEL_FORMAT values, verify each result
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsWithFmtAllFormats',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const formatValues: number[] = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16];
      const expectedResults: number[] = [
        IMAGE_INVALID_PARAMETER, IMAGE_SUCCESS, IMAGE_SUCCESS, IMAGE_SUCCESS,
        IMAGE_SUCCESS, IMAGE_INVALID_PARAMETER, IMAGE_SUCCESS, IMAGE_INVALID_PARAMETER,
        IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER,
        IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER
      ];
      const formatNames: string[] = [
        'UNKNOWN', 'RGB_565', 'RGBA_8888', 'BGRA_8888', 'RGB_888', 'ALPHA_8',
        'RGBA_F16', 'NV21', 'NV12', 'RGBA_1010102', 'YCBCR_P010', 'YCRCB_P010',
        'ALPHA_U8', 'ALPHA_F16'
      ];
      for (let i = 0; i < formatValues.length; i++) {
        let result: number = ndkTest.testWritePixelsWithFmtByFormat(formatValues[i]);
        console.info(`PIXEL_FORMAT_${formatNames[i]}(${formatValues[i]}): result=${result}, expect=${expectedResults[i]}`);
        expect(result).assertEqual(expectedResults[i]);
      }
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGBA8888_0100
     * @tc.name testWritePixelsToAreaWithFmtRGBA8888
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGBA_8888, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtRGBA8888',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtRGBA8888(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 4));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGB888_0200
     * @tc.name testWritePixelsToAreaWithFmtRGB888
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGB_888, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtRGB888',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtRGB888(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 3));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGB565_0300
     * @tc.name testWritePixelsToAreaWithFmtRGB565
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGB_565, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtRGB565',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtRGB565(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 2));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtRGBAF16_0400
     * @tc.name testWritePixelsToAreaWithFmtRGBAF16
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with RGBA_F16, verify IMAGE_SUCCESS
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtRGBAF16',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtRGBAF16(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 8));
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtNullPixelmap_0500
     * @tc.name testWritePixelsToAreaWithFmtNullPixelmap
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with null pixelmap, verify IMAGE_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtNullPixelmap',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtNullPixelmap(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtNullArea_0600
     * @tc.name testWritePixelsToAreaWithFmtNullArea
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with null area, verify IMAGE_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtNullArea',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtNullArea(pm);
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtUnsupportedFmt_0700
     * @tc.name testWritePixelsToAreaWithFmtUnsupportedFmt
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with unsupported NV21 format, verify error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtUnsupportedFmt',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtUnsupportedFmt(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtLocked_0800
     * @tc.name testWritePixelsToAreaWithFmtLocked
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat on locked pixelmap, verify IMAGE_UNSUPPORTED_OPERATION
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtLocked',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtLocked(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 4));
      expect(result).assertEqual(IMAGE_UNSUPPORTED_OPERATION);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtAllocFailed_1100
     * @tc.name testWritePixelsToAreaWithFmtAllocFailed
     * @tc.desc verify IMAGE_ALLOC_FAILED error code constant is accessible and value correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtAllocFailed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsToAreaWithFmtAllocFailed();
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtUnsupportedConversion_0900
     * @tc.name testWritePixelsToAreaWithFmtUnsupportedConversion
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat NV21 pixelmap with RGBA_8888, verify error code
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtUnsupportedConversion',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsToAreaWithFmtUnsupportedConversion();
      expect(result).assertEqual(IMAGE_UNSUPPORTED_CONVERSION);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtInsufficientBuffer_1000
     * @tc.name testWritePixelsToAreaWithFmtInsufficientBuffer
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat with buffer size 1, verify IMAGE_BAD_PARAMETER
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtInsufficientBuffer',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const pm = image.createPixelMapSync(new ArrayBuffer(100 * 100 * 4), {
        size: { width: 100, height: 100 }, pixelFormat: image.PixelMapFormat.BGRA_8888, editable: true });
      let result: number = ndkTest.testWritePixelsToAreaWithFmtInsufficientBuffer(pm, 0, 0, 40, 40, new ArrayBuffer(40 * 40 * 4));
      expect(result).assertEqual(IMAGE_INVALID_PARAMETER);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtCopyFailed_1200
     * @tc.name testWritePixelsToAreaWithFmtCopyFailed
     * @tc.desc verify IMAGE_COPY_FAILED error code constant is accessible and value correct
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtCopyFailed',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      let result: number = ndkTest.testWritePixelsToAreaWithFmtCopyFailed();
      expect(result).assertEqual(IMAGE_SUCCESS);
      done();
    })

    /**
     * @tc.number SUB_GRAPHIC_GRAPHIC2D_PIXELMAPCAPI_NativeWritePixelsToAreaWithFmtByFormat_1300
     * @tc.name testWritePixelsToAreaWithFmtAllFormats
     * @tc.desc test OH_PixelmapNative_WritePixelsToAreaWithPixelFormat enumerate all PIXEL_FORMAT values, verify each
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('testWritePixelsToAreaWithFmtAllFormats',
      TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, (done: Function) => {
      const formatValues: number[] = [0, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 15, 16];
      const expectedResults: number[] = [
        IMAGE_INVALID_PARAMETER, IMAGE_SUCCESS, IMAGE_SUCCESS, IMAGE_SUCCESS,
        IMAGE_SUCCESS, IMAGE_INVALID_PARAMETER, IMAGE_SUCCESS, IMAGE_INVALID_PARAMETER,
        IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER,
        IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER, IMAGE_INVALID_PARAMETER
      ];
      const formatNames: string[] = [
        'UNKNOWN', 'RGB_565', 'RGBA_8888', 'BGRA_8888', 'RGB_888', 'ALPHA_8',
        'RGBA_F16', 'NV21', 'NV12', 'RGBA_1010102', 'YCBCR_P010', 'YCRCB_P010',
        'ALPHA_U8', 'ALPHA_F16'
      ];
      for (let i = 0; i < formatValues.length; i++) {
        let result: number = ndkTest.testWritePixelsToAreaWithFmtByFormat(formatValues[i]);
        console.info(`PIXEL_FORMAT_${formatNames[i]}(${formatValues[i]}): result=${result}, expect=${expectedResults[i]}`);
        expect(result).assertEqual(expectedResults[i]);
      }
      done();
    })
  })
}
