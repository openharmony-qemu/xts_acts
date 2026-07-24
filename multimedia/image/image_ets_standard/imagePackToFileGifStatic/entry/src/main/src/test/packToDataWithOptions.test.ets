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

import image from "@ohos.multimedia.image";
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level } from "../../../hypium/index";

const TAG = 'PackToDataWithOptions';
let isSupportTiff: Boolean;

async function packToDataWithPixelMap(testName: string, packOpts: image.PackingOption,
  pixelFormat0: image.PixelMapFormat = image.PixelMapFormat.RGBA_8888): Promise<boolean> {
  let result = false;
  try {
    const color: ArrayBuffer = new ArrayBuffer(96);
    let opts: image.InitializationOptions =
      { editable: true, pixelFormat: pixelFormat0, size: { height: 4, width: 6 } };
    const pixelMap: image.PixelMap = await image.createPixelMap(color, opts);
    const imagePackerApi: image.ImagePacker = image.createImagePacker();
    let packResult: ArrayBuffer = await imagePackerApi!.packToData(pixelMap, packOpts);
    let packImageSource = image.createImageSource(packResult);
    console.info(`${testName} packImageSource is : ${packImageSource}`);
    if (packImageSource != undefined) {
      result = true;
    }
    await packImageSource!.release();
    await imagePackerApi.release();
    await pixelMap.release();
  } catch (error) {
    console.error(TAG, `failed; error: ${error}, ${error.code}`, testName);
  }
  return result;
}

export default function packToDataWithOptions() {
  describe("packToDataWithOptionsStatic", () => {
    beforeAll(async () => {
      console.info(TAG, 'beforeAll case.');
      isSupportTiff = image.getImageSourceSupportedFormats().includes("image/tiff");
      console.info(TAG, ' isSupportTiff is ' + isSupportTiff);
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MIN_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MIN_STATIC_0100
     * @tc.desc   packToData with backgroundColor 0x000000 (black)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MIN_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MIN_STATIC_0100';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        backgroundColor: 0x000000
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MAX_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MAX_STATIC_0200
     * @tc.desc   packToData with backgroundColor 0xFFFFFF (white)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MAX_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MAX_STATIC_0200';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        backgroundColor: 0xFFFFFF
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MID_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MID_STATIC_0300
     * @tc.desc   packToData with backgroundColor 0x808080 (gray)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MID_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_BACKGROUND_COLOR_MID_STATIC_0300';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        backgroundColor: 0x808080
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_TRUE_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_TRUE_STATIC_0100
     * @tc.desc   packToData with needsPackGPS true
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_TRUE_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_TRUE_STATIC_0100';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackGPS: true
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_FALSE_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_FALSE_STATIC_0200
     * @tc.desc   packToData with needsPackGPS false
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_FALSE_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_NEEDSPACKGPS_FALSE_STATIC_0200';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        needsPackGPS: false
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_NORMAL_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_NORMAL_STATIC_0100
     * @tc.desc   packToData with valid sizeLimit(maxSize and level)
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_NORMAL_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_NORMAL_STATIC_0100';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        sizeLimit: {
          maxSize: { height: 4096, width: 4096 },
          level: image.AntiAliasingLevel.LOW
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_MEDIUM_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_MEDIUM_STATIC_0100
     * @tc.desc   packToData with valid sizeLimit AntiAliasingLevel MEDIUM
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_MEDIUM_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_MEDIUM_STATIC_0100';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        sizeLimit: {
          maxSize: { height: 2048, width: 2048 },
          level: image.AntiAliasingLevel.MEDIUM
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_HIGH_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_HIGH_STATIC_0100
     * @tc.desc   packToData with valid sizeLimit AntiAliasingLevel HIGH
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_HIGH_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_SIZELIMIT_HIGH_STATIC_0100';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        sizeLimit: {
          maxSize: { height: 1024, width: 1024 },
          level: image.AntiAliasingLevel.HIGH
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0100
     * @tc.desc   packToData with tiffPackingOptions compression g3
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0100';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            compression: 3
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0200
     * @tc.desc   packToData with tiffPackingOptions compression g4
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0200';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            compression: 4
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0300
     * @tc.desc   packToData with tiffPackingOptions compression lzw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0300", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0300';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            compression: 5
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0400
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0400
     * @tc.desc   packToData with tiffPackingOptions compression lzw
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0400", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_COMPRESSION_STATIC_0400';
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            compression: 5
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.Y8);
          expect(result).assertFalse();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0100
     * @tc.desc   packToData with tiffPackingOptions orientation top left
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0100';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            orientation: image.Orientation.TOP_LEFT
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0200
     * @tc.desc   packToData with tiffPackingOptions orientation bottom right
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_ORIENTATION_STATIC_0200';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            orientation: image.Orientation.BOTTOM_RIGHT
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_STATIC_0100
     * @tc.desc   packToData with tiffPackingOptions orientation xResolution riyResolutionght
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_STATIC_0100';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            xResolution: 300.0,
            yResolution: 300.0
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0100
     * @tc.desc   packToData with tiffPackingOptions orientation resolutionUnit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0100';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            resolutionUnit: 2
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0200
     * @tc.desc   packToData with tiffPackingOptions orientation resolutionUnit
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_RESOLUTION_UNIT_STATIC_0200';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            resolutionUnit: 3
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_FULL_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_FULL_STATIC_0100
     * @tc.desc   packToData with tiffPackingOptions all set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_FULL_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_TIFFPACKING_OPTION_FULL_STATIC_0100';
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let packOpts: image.PackingOption = {
          format: "image/tiff",
          quality: 100,
          tiffPackingOptions: {
            compression: 5,
            orientation: image.Orientation.TOP_LEFT,
            xResolution: 300.0,
            yResolution: 300.0,
            resolutionUnit: 2
          }
        };
        try {
          let result = await packToDataWithPixelMap(testName, packOpts, image.PixelMapFormat.RGB_888);
          expect(result).assertTrue();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0200
     * @tc.desc   packToData with PackingOptions all set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0200';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        backgroundColor: 0xFF8080,
        needsPackGPS: true,
        sizeLimit: {
          maxSize: { height: 2048, width: 2048 },
          level: image.AntiAliasingLevel.HIGH
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0300
     * @tc.desc   packToData with PackingOptions all set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0300';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        backgroundColor: 0x0000FF,
        needsPackGPS: false,
        sizeLimit: {
          maxSize: { height: 1024, width: 1024 },
          level: image.AntiAliasingLevel.LOW
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0400
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0400
     * @tc.desc   packToData with PackingOptions all set
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0400", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_PACK_TO_DATA_PACKING_OPTION_FULL_STATIC_0400';
      let packOpts: image.PackingOption = {
        format: "image/jpeg",
        quality: 98,
        bufferSize: 1024 * 1024,
        needsPackProperties: true,
        maxEmbedThumbnailDimension: 256,
        backgroundColor: 0xFFFFFF,
        needsPackGPS: false,
        sizeLimit: {
          maxSize: { height: 4096, width: 4096 },
          level: image.AntiAliasingLevel.MEDIUM
        }
      };
      try {
        let result = await packToDataWithPixelMap(testName, packOpts);
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

  });
}
