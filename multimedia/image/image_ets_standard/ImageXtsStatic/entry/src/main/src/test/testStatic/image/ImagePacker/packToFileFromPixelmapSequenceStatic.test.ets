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
import { afterAll, afterEach, beforeAll, beforeEach, describe, expect,Hypium, it, Level} from '../../../../../../hypium';
import { common } from '@kit.AbilityKit';
import fs from '@ohos.file.fs';

const TAG = 'xts_static_packToFileFromPixelmapSequence';
let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;

async function packToFileFromPixelmapSequencePromiseTest(done: () => void, testName: string, inputPathUri: string,outputPathUri: string,
  ops: image.PackingOptionsForSequence,callback: (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File ) => Promise<void>) {
     let path = `file://${testContext.filesDir}/${inputPathUri}`;
     console.info(TAG, testName, `path: ${path}`);
     let imageSource: image.ImageSource|undefined = image.createImageSource(path);
     console.info(TAG,testName, `image.createImageSource success`, imageSource!);
     // let pixelMapList = await imageSource!.createPixelMapList();
     let outputPath = `${testContext.filesDir}/${outputPathUri}`;
     let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
     let Packer : image.ImagePacker = image.createImagePacker();
     console.info(TAG,testName, `image.createImagePacker success`, Packer);
     await callback(Packer,imageSource!,file);
     done();
}

export default function imagePackerPackToFileFromPixelmapSequenceSUppStaticTest(): void {
  describe('imagePackerPackToFileFromPixelmapSequenceSUppStaticTest', (): void => {

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
     * @tc.name   SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.desc   第3个参数属性delayTimeList:非空数组覆盖，pixelMapList非空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0100';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      try {
        let ops: image.PackingOptionsForSequence = {
          frameCount: 3,
          delayTimeList: [10, 10, 10],
          disposalTypes: [3, 2, 3],
          loopCount: 0
        };
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
        let state = await fs.stat(file.fd);
        console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
        expect(state.size > 0).assertTrue();
        await Packer.release();
      } catch (err) {
        console.error(TAG, testName, `Faild Error, errorCode: ${err.code},errorMessage: ${err.message}`)
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.desc   第3个参数属性delayTimeList:空数组覆盖
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0200'
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack)
        console.info(TAG,testName,'Succeeded in packToFileMultiFrames.');
        let state= await fs.stat( file.fd);
        console.info(TAG,testName,'Succeeded in fs.stat.',state);
        expect(state.size > 0).assertTrue();
        await Packer.release();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name    SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.number  SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.desc    Packer.packToFileFromPixelmapSequence,disposalTypes: []
     * @tc.size    MEDIUM
     * @tc.type    Function
     * @tc.level   Level 0
     */
    it('SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_image_Packer_packToFileFromPixelmapSequence_promise_SUPP_static_0300';
      let testContext: common.UIAbilityContext = Hypium.get('Context') as common.UIAbilityContext;
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let path = `file://${testContext.filesDir}/${inputPathUri}`;
      console.info(TAG, testName, `path: ${path}`);
      let imageSource: image.ImageSource|undefined = image.createImageSource(path);
      let opsPack: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [],
        loopCount: 0
      };
      try {
        let pixelMapList = await imageSource!.createPixelMapList();
        let outputPath = `${testContext.filesDir}/${outputPathUri}`;
        let file = fs.openSync(outputPath, fs.OpenMode.CREATE | fs.OpenMode.READ_WRITE);
        let Packer = image.createImagePacker();
        await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, opsPack);
        console.info(TAG,testName,'Succeeded in packToFileFromPixelmapSequence.');
        let state = await fs.stat(file.fd);
        console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
        expect(state.size > 0).assertTrue();
        await Packer.release();
        done();
      } catch (error) {
        console.error(TAG,testName, `failed; error: ${error},${error.code}`, testName);
        expect().assertFail();
        done();
      }
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0100
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0100';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10, 10, 10],
        disposalTypes: [3, 2, 3],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
          let pixelMapList = await imageSource!.createPixelMapList();
          await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
        })
      } catch (error) {
      console.info(TAG, testName, `failed; error: ${error},${error.code}`);
      expect().assertFail();
    }
    done();
  })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0200
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0200';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 99,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 3],
        loopCount: 65535
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0300
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0300';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 1,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 2, 3],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0400
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0400';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 2, 1],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0500
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0500';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [0, 0, 0],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0600
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0600';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [1, 1, 1],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0700
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0700';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [2, 2, 2],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0800
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0800
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0800', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0800';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0900
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0900
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0900', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_0900';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1000
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1000
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1000', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1000';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
        disposalTypes: [3, 3, 3]
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1100
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1100';
      const inputPathUri = 'test6.gif';
      const outputPathUri = 'output_test6.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1200
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1200';
      const inputPathUri = 'test.jpg';
      const outputPathUri = 'output_test.jpg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })
    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1300
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1300';
      const inputPathUri = 'test.svg';
      const outputPathUri = 'output_test.svg';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })



    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1400
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1400
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1400', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1400';
      const inputPathUri = 'test_exif_v2.png';
      const outputPathUri = 'output_test.png';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1500
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1500
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1500', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1500';
      const inputPathUri = 'test8.bmp';
      const outputPathUri = 'output_test8.bmp';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })


    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1600
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1600
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1600', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1600';
      const inputPathUri = 'test_aisr.ico';
      const outputPathUri = 'output_testaisr.ico';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1700
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1700
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1700', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_promise_SUPP_static_1700';
      const inputPathUri = 'test_exif_v3.webp';
      const outputPathUri = 'output_test_v3.webp';
      
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [100, 100, 100],
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            let state = await fs.stat(file.fd);
            console.info(TAG,testName,'Succeeded in fs.stat.',JSON.stringify(state));
            expect(state.size > 0).assertTrue();
            await Packer.release();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect().assertFail();
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0100
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0100
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0100', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0100';
        const inputPathUri = 'test.jpg';
      const outputPathUri = 'output_test.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [4, 4, 4],
        loopCount: 0
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            expect().assertFail();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0200
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0200
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0200', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0200';
        const inputPathUri = 'test.jpg';
      const outputPathUri = 'output_test.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: -1
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
          expect().assertFail();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    })

    /**
     * @tc.name   SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0300
     * @tc.number SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0300
     * @tc.desc   imagePacker_packToFileFromPixelmapSequence
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0300', Level.LEVEL0, async (done: () => void) => {
      const testName = 'SUB_MEDIA_IMAGE_imagePacker_packToFileFromPixelmapSequence_abnormal_promise_SUPP_static_0300';
      const inputPathUri = 'test.jpg';
      const outputPathUri = 'output_test.gif';
      let ops: image.PackingOptionsForSequence = {
        frameCount: 3,
        delayTimeList: [10000, 10000, 10000],
        disposalTypes: [3, 3, 3],
        loopCount: 65536
      };
      try {
        await packToFileFromPixelmapSequencePromiseTest(done, testName, inputPathUri, outputPathUri,ops,
          async (Packer: image.ImagePacker,imageSource: image.ImageSource|undefined,file: fs.File) => {
            let pixelMapList = await imageSource!.createPixelMapList();
            await Packer.packToFileFromPixelmapSequence(pixelMapList, file.fd, ops);
            expect().assertFail();
          })
      } catch (error) {
        console.info(TAG, testName, `failed; error: ${error},${error.code}`);
        expect(error.code).assertEqual(401);
      }
      done();
    })
  })
}