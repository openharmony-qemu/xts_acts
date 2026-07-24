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
import common from '@ohos.app.ability.common';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, Level, Hypium } from "../../../hypium/index";
import fs from '@ohos.file.fs';

const TAG = 'PackBinaryImageToTiff';

let imagePacker: image.ImagePacker | undefined;
let testContext: common.UIAbilityContext;
let isSupportTiff: Boolean;

function createBinaryBufferInfo(width: int, height: int,
  withBytesPerRow: boolean = false): image.BinaryBufferInfo {
  let rowBytes: int = (Math.floor((width + 7) / 8)).toInt();
  let bufferSize: int = (withBytesPerRow ? rowBytes * height : Math.floor((width + 7) / 8) * height).toInt();
  let buffer: ArrayBuffer = new ArrayBuffer(bufferSize);
  let size: image.Size = { width: width, height: height };
  let bufferInfo: image.BinaryBufferInfo = {
    size: size,
    data: buffer
  };
  if (withBytesPerRow) {
    bufferInfo.bytesPerRow = rowBytes.toInt();
  }
  return bufferInfo;
}

async function createImagePackerInstance(): Promise<image.ImagePacker> {
  let packer: image.ImagePacker = await image.createImagePacker();
  return packer;
}


function isSupportTiffPack(testName: string, mimeType: string): Boolean {
  let result = false
  try {
    result = image.createImagePacker().supportedFormats.includes(mimeType);
  } catch (error) {
    console.info(`${testName} failed; error: ${error}, ${error.code}`);
  }
  return result;
}

export default function packBinaryImageToTiff() {
  let filesDir: string | undefined | null;
  describe("packBinaryImageToTiff", () => {
    beforeAll(async () => {
      filesDir = Hypium.get('filesDir') as string | undefined | null;
      console.info(TAG, 'beforeAll case.');
      isSupportTiff = image.getImageSourceSupportedFormats().includes("image/tiff");
      console.info(TAG, ' isSupportTiff is ' + isSupportTiff);
    });

    beforeEach(async () => {
      console.info(TAG, 'beforeEach case.');
    });

    afterEach(async () => {
      console.info(TAG, 'afterEach case.');
    });

    afterAll(async () => {
      console.info(TAG, 'afterAll case.');
      if (imagePacker != undefined) {
        await imagePacker!.release();
        imagePacker = undefined;
      }
    });

    const testPackBinaryImageError = async (testName: string, mimeType: string, options: image.PackingOptionsForTiff,
      encodeType: string = 'data'): Promise<boolean> => {
      let result = true;
      let isSupportEecode = isSupportTiffPack(testName, `image/tiff`);
      let packer: image.ImagePacker = await image.createImagePacker();
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
      let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        if (!isSupportEecode && encodeType == 'data') {
          await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect().assertFail();
          result = false;
        } else if (!isSupportEecode && encodeType == 'file') {
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd);
          expect().assertFail();
          result = false;
        }
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800301);
        result = true;
      }
      fs.closeSync(file);
      return result;
    }

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with valid info and fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
      let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        console.info(TAG, testName + ' test begin.');
        let packer: image.ImagePacker = await createImagePackerInstance();
        console.info(testName + `packer is ${packer} file.fs is ${file.fd}, buffer is ${bufferInfo}`);
        await packer.packBinaryImageToTiffFile(bufferInfo, file.fd);
        console.info(TAG, testName + ' success.');
        await packer.release();
        fs.closeSync(file);
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        fs.closeSync(file);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with valid info
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo);
        expect(result.byteLength).assertLarger(0);
        console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
        await packer.release();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0100';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          compression: 4,
          orientation: image.Orientation.TOP_LEFT,
          xResolution: 72.0,
          yResolution: 72.0
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.TOP_RIGHT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0300
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0300", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0300';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.BOTTOM_RIGHT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0400
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0400
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0400", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0400';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.BOTTOM_LEFT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0500
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0500
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0500", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0500';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.LEFT_TOP
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0600
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0600
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0600", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0600';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.RIGHT_TOP
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0700
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0700
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0700", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0700';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.RIGHT_BOTTOM
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0800
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0800
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0800", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0800';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.LEFT_BOTTOM
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0100';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          compression: 4,
          orientation: image.Orientation.TOP_LEFT,
          xResolution: 72.0,
          yResolution: 72.0
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.TOP_RIGHT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0300
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0300", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0300';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.BOTTOM_RIGHT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0400
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0400
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0400", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0400';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.BOTTOM_LEFT
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0500
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0500
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0500", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0500';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.LEFT_TOP
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0600
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0600
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0600", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0600';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.RIGHT_TOP
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0700
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0700
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0700", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0700';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.RIGHT_BOTTOM
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0800
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0800
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0800", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0800';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          orientation: image.Orientation.LEFT_BOTTOM
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with invalid fd
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      let invalidFd: int = -1;
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        await packer.packBinaryImageToTiffFile(bufferInfo, invalidFd);
        console.error(TAG, testName + ' failed, expected error but success.');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800202);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with invalid compression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0200';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
      let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      let options: image.PackingOptionsForTiff = {
        compression: 5
      };
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
        await packer.release();
        fs.closeSync(file);
        console.error(TAG, testName + ' failed, expected error but success.');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800202);
        fs.closeSync(file);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0100
     * @tc.desc   packBinaryImageToTiffData with invalid compression
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0100", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0100';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
      let options: image.PackingOptionsForTiff = {
        compression: 5
      };
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        await packer.packBinaryImageToTiffData(bufferInfo, options);
        await packer.release();
        console.error(TAG, testName + ' failed, expected error but success.');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800202);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0300
     * @tc.desc   packBinaryImageToTiffFile with encode error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_ERROR_STATIC_0300';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let emptyBuffer: ArrayBuffer = new ArrayBuffer(0);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: 0, height: 0 },
        data: emptyBuffer
      };
      let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
      let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        await packer.packBinaryImageToTiffFile(bufferInfo, file.fd);
        await packer.release();
        fs.closeSync(file);
        console.error(TAG, testName + ' failed, expected error but success.');
        expect().assertFail();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800202);
        fs.closeSync(file);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0400
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0400
     * @tc.desc   packBinaryImageToTiffFile with encode error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0400", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0400';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let options: image.PackingOptionsForTiff = {
        compression: 4,
        orientation: image.Orientation.TOP_LEFT,
        xResolution: 72.0,
        yResolution: 72.0
      };
      try {
        let result = await testPackBinaryImageError(testName, 'image/tiff', options, 'file');
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0200
     * @tc.desc   packBinaryImageToTiffData with encode error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0200", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0200';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let emptyBuffer: ArrayBuffer = new ArrayBuffer(0);
      let bufferInfo: image.BinaryBufferInfo = {
        size: { width: 0, height: 0 },
        data: emptyBuffer
      };
      try {
        let packer: image.ImagePacker = await createImagePackerInstance();
        await packer.packBinaryImageToTiffData(bufferInfo);
        await packer.release();
        console.error(TAG, testName + ' failed, expected error but success.');
        expect().assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect(error.code).assertEqual(7800202);
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0300
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0300
     * @tc.desc   packBinaryImageToTiffData with encode error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0300", Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_ERROR_STATIC_0300';
      console.info(TAG, testName + ' begin.');
      if (!isSupportTiff) {
        console.info(TAG, testName + ' device does not support tiff');
        done();
        return;
      }
      let options: image.PackingOptionsForTiff = {
        compression: 4,
        orientation: image.Orientation.TOP_LEFT,
        xResolution: 72.0,
        yResolution: 72.0
      };
      try {
        let result = await testPackBinaryImageError(testName, 'image/tiff', options, 'data');
        expect(result).assertTrue();
        done();
      } catch (error) {
        console.info(`${testName} failed; error: ${error}, ${error.code}`);
        expect().assertFail();
        done();
      }
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with bytesPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0100';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(16, 8, true);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0100
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0100
     * @tc.desc   packBinaryImageToTiffFile with bytesPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0100", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0100';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(16, 8, true);
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with bytesPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_BYTESPERROW_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(24, 12, true);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with bytesPerRow
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_BYTESPERROW_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(24, 12, true);
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200
     * @tc.desc   packBinaryImageToTiffFile with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_FILE_WITH_OPTIONS_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let path: string = filesDir + '/' + new Date().getTime() + 'test.tiff';
        let file = fs.openSync(path, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let options: image.PackingOptionsForTiff = {
          compression: 3
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          await packer.packBinaryImageToTiffFile(bufferInfo, file.fd, options);
          console.info(TAG, testName + ' success.');
          await packer.release();
          fs.closeSync(file);
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          fs.closeSync(file);
          expect().assertFail();
          done();
        }
      });

    /**
     * @tc.name   SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200
     * @tc.int    SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200
     * @tc.desc   packBinaryImageToTiffData with options
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it("SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200", Level.LEVEL0,
      async (done: () => void) => {
        const testName = 'SUB_MULTIMEDIA_IMAGE_PACKER_BINARY_IMAGE_TO_TIFF_DATA_WITH_OPTIONS_STATIC_0200';
        console.info(TAG, testName + ' begin.');
        if (!isSupportTiff) {
          console.info(TAG, testName + ' device does not support tiff');
          done();
          return;
        }
        let bufferInfo: image.BinaryBufferInfo = createBinaryBufferInfo(8, 8, false);
        let options: image.PackingOptionsForTiff = {
          compression: 4
        };
        try {
          let packer: image.ImagePacker = await createImagePackerInstance();
          let result: ArrayBuffer = await packer.packBinaryImageToTiffData(bufferInfo, options);
          expect(result.byteLength).assertLarger(0);
          console.info(TAG, testName + ' success, result byteLength: ' + result.byteLength);
          await packer.release();
          done();
        } catch (error) {
          console.info(`${testName} failed; error: ${error}, ${error.code}`);
          expect().assertFail();
          done();
        }
      });

  });
}
