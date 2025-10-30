/*
 * Copyright (c) 2025 Huawei Device Co., Ltd.
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
import hilog from '@ohos.hilog';
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, DEFAULT, Hypium, Level } from '../../../hypium/index';
import fs from '@ohos.file.fs';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { initialize } from './AbilityContextHelper.test';
import { BusinessError } from '@ohos.base';

class Logger {
  testNum: string;

  constructor(testNum: string) {
    this.testNum = testNum;
  }

  log(msg: string) {
    hilog.info(0x0000, "imagePicture", 'case: %{public}s msg:%{public}s', this.testNum, msg);
  }
}

export default function imageGif() {
  describe('imageGif', (): void => {
    let filesDir: string | undefined | null;
    let filePath: string;
    const EXPECTFRAMECOUNT = 3;
    const ERR_CODE = 62980149;
    const ERR_CODE1 = 62980096;
    const ERR_CODE2 = 62980118;
    const RGBA_8888 = image.PixelMapFormat.RGBA_8888;

    let globalpixelmap: image.PixelMap | undefined = undefined;
    let globalimageSource: image.ImageSource | undefined = undefined;
    beforeAll(() => {
      await initialize();
      filesDir = Hypium.get('filesDir') as string | undefined | null;
    })

    afterEach(async () => {
      if (globalpixelmap != undefined) {
        console.info('globalpixelmap release start');
        try {
          await globalpixelmap!.release();
        } catch (error) {
          console.info('globalpixelmap release fail');
        }
      }
      if (globalimageSource != undefined) {
        console.info('globalimageSource release start');
        try {
          await globalimageSource!.release();
        } catch (error) {
          console.info('globalimageSource release fail');
        }
      }
      console.info('afterEach case');
    });


    const getFd = (fileName: string): int => {
      filePath = filesDir + "/" + fileName;
      console.info("image filePath:" + filePath);
      const file = fs.openSync(filePath);
      return file.fd as int;
    };

    const getDelayTimePromise = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log('getDelayTimePromise create imageSource success');
          let delayTimes = await imageSourceApi.getDelayTimeList();
          if (delayTimes != undefined) {
            logger.log("getDelayTimePromise getDelayTime success");
            expect(true).assertTrue();
            logger.log("getDelayTimeList success: " + delayTimes.length);
            for (let i = 0; i < delayTimes.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes[i]}`);
            }
            logger.log("delayTimes show end");
          } else {
            logger.log("getDelayTimePromise getDelayTime failed");
            expect(false).assertTrue();
          }
          done();
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getDelayTimeCallBack = async (
      done: () => void,
      testNum: string,
      fileName: string
    ) => {
      let logger = new Logger(testNum);
      try {
        let fd: int = getFd(fileName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          expect(false).assertTrue();
          logger.log('create image source failed');
          done();
        } else {
          globalimageSource = imageSourceApi;
          logger.log('getDelayTimePromise create imageSource success');
          imageSourceApi.getDelayTimeList((error: BusinessError | null, delayTimes) => {
            if (error && error.code) {
              logger.log("getDelayTimeCallBack getDelayTime failed err: " + error);
              expect(false).assertTrue();
              done();
            }
            expect(delayTimes != undefined).assertTrue();
            logger.log('getDelayTimeCallBack getDelayTime success');
            logger.log("getDelayTimeList success: " + delayTimes!.length);
            for (let i = 0; i < delayTimes!.length; i++) {
              logger.log(`delayTimes[ ${i} ]= ${delayTimes![i]}`);
            }
            logger.log('delayTimes show end');
            done();
          });
        }
      } catch (error) {
        logger.log("getDelayTimeList error: " + error);
        expect(false).assertTrue();
        done();
      }
    }

    const testGetDisposalTypePromise = async (
      done: () => void,
      testNum: string,
      picName: string
    ) => {
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        console.info(`${testNum} testGetDisposalTypePromise create imagesource failed`);
        expect(false).assertTrue();
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          console.info(`${testNum} testGetDisposalTypePromise create imagesource success`);
          try {
            let disposalTypes: Array<int> = await imageSourceApi.getDisposalTypeList();
            console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList success`);
            expect(true).assertTrue();
            console.info(`${testNum} disposalTypes show begin length: ${disposalTypes.length} `);
            for (let i = 0; i < disposalTypes.length; i++) {
              console.info(`${testNum} disposalTypes[ ${i} ]= ${disposalTypes[i]}`);
            }
            console.info(`${testNum} disposalTypes show end`);
          } catch (err) {
            err = err as BusinessError;
            console.info(`${testNum} testGetDisposalTypePromise getDisposalTypeList failed err: code is ${err.code},message is ${err.message}`);
            expect(err.code == ERR_CODE).assertTrue();
          }
          done();
        } catch (error) {
          console.log(`${testNum} testGetDisposalTypePromise err: ${error}`);
          expect(false).assertTrue();
          done();
        };
      }
    }

    const getFrameCountPromise = async (
      done: () => void,
      testNum: string,
      picName: string
    ) => {
      try {
        let fd: int = getFd(picName);
        const imageSourceApi = image.createImageSource(fd);
        if (imageSourceApi == undefined) {
          console.info(`${testNum} getFrameCountPromise create imagesource failed`);
          expect(false).assertTrue();
          done();
        } else {
          globalimageSource = imageSourceApi;
          console.info(`${testNum} getFrameCountPromise create imagesource success`);
          let frameCount = await imageSourceApi.getFrameCount();
          if (frameCount != undefined) {
            console.info(`${testNum} getFrameCountPromise getFrameCount success`);
            expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
            console.info(`${testNum} getFrameCountPromise frameCount= ${frameCount}`);
          } else {
            console.info(`${testNum} getFrameCountPromise getFrameCount failed`);
            expect(false).assertTrue();
          }
          done();
        }
      } catch (error) {
        console.info(`${testNum} getFrameCountPromise error: ` + error);
        expect(false).assertTrue();
        done();
      }
    }

    const getFrameCountCallBack = async (
      done: () => void,
      testNum:string,
      picName:string
    ) => {
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        console.info(`${testNum} getFrameCountCallBack create imagesource failed`);
        done();
      } else {
        globalimageSource = imageSourceApi;
        console.info(`${testNum} getFrameCountCallBack create imagesource success`);
        imageSourceApi.getFrameCount((err: BusinessError|null, frameCount) => {
          if (err && err.code) {
            console.info(`${testNum} getFrameCountCallBack getFrameCount failed err: ${err}`);
            expect(false).assertTrue();
            done();
          }
          expect(frameCount).assertEqual(EXPECTFRAMECOUNT);
          console.info(`${testNum} getFrameCountCallBack getFrameCount success`);
          console.info(`${testNum} getFrameCountCallBack frameCount= ${frameCount}`);
          done();
        });
      }
    }

    const createPixelMapListPromise = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          logger.log('createPixelMapListPromise create imagesource success');
          let pixelMapList: Array<image.PixelMap> = await imageSourceApi.createPixelMapList(decodeOpts);
          if (pixelMapList != undefined) {
            logger.log('pixelMapList show begin length: ' + pixelMapList.length);
            expect(pixelMapList != undefined).assertTrue();
            // packingPromise(done, testNum, pixelMapList[0]);
            done();
          } else {
            logger.log('createPixelMapListPromise createPixelMapList failed');
            expect(false).assertTrue();
            done();
          }
        } catch (error) {
          logger.log('createPixelMapListPromise error: ' + error);
          expect(false).assertTrue();
          done();
        }
      }
    }

    const createPixelMapListCallBack = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        logger.log('createPixelMapListCallBack create imagesource success');
        imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
          if (err && err.code) {
            logger.log('createPixelMapListCallBack failed err: ' + err);
            expect(false).assertTrue();
            done();
          }
          expect(pixelMapList != undefined).assertTrue();
          logger.log('pixelMapList show begin length: ' + pixelMapList!.length);
          // packingPromise(done, testNum, pixelMapList[0]);
          done();
        });
      }
    }

    const createPixelMapListErrPromise = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions,
      checkErrCode: (code: int) => void
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        try {
          await imageSourceApi.createPixelMapList(decodeOpts);
          logger.log('create pixel map list failed');
          expect(false).assertTrue();
          done();
        } catch (error) {
          error = error as BusinessError;
          logger.log('createPixelMapListErrPromise error.code: ' + error.code);
          logger.log('createPixelMapListErrPromise error: ' + error);
          checkErrCode(error.code as int);
          done();
        }
      }
    }

    const createPixelMapListErrCallBack = async (
      done: () => void,
      testNum: string,
      picName: string,
      decodeOpts: image.DecodingOptions,
      checkErrCode: (code: double|null) => void
    ) => {
      let logger = new Logger(testNum);
      let fd: int = getFd(picName);
      const imageSourceApi = image.createImageSource(fd);
      if (imageSourceApi == undefined) {
        expect(false).assertTrue();
        logger.log('create image source failed');
        done();
      } else {
        globalimageSource = imageSourceApi;
        logger.log('createPixelMapListErrCallBack create imagesource success');
        imageSourceApi.createPixelMapList(decodeOpts, (err, pixelMapList) => {
          if (err && err.code) {
            checkErrCode(err!.code);
            logger.log('createPixelMapListErrCallBack error.code: ' + err.code);
            logger.log('createPixelMapListErrCallBack error: ' + err);
            done();
          } else {
            logger.log('create pixel map list failed');
            expect(false).assertTrue();
            done();
          }
        });
      }
    }

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100
     * @tc.desc      : test getDelayTimeList(promise) one frame gif
     *                 1.create one frame gif imagesource
     *                 2.getDelayTimeList(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0100", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200
     * @tc.desc      : test getDelayTimeList(promise) gif
     *                 1.create gif imagesource
     *                 2.getDelayTimeList(promise)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_PROMISE_STATIC_0200", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100
     * @tc.desc      : test getDelayTimeList(callback) one frame gif
     *                 1.create one frame gif imagesource
     *                 2.getDelayTimeList(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0100", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200
     * @tc.desc      : test getDelayTimeList(callback) gif
     *                 1.create gif imagesource
     *                 2.getDelayTimeList(callback)
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getDelayTimeCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDELAYTIME_CALLBACK_STATIC_0200", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100
     * @tc.desc      : test getDisposalType promise for gif
     *                 1.create gif imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200
     * @tc.desc      : test getDisposalType promise for one frame gif
     *                 1.create one frame gif imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0200", "test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300
     * @tc.desc      : test getDisposalType promise jpg error
     *                 1.create jpg imagesource
     *                 2.getDisposalType
     * @tc.size      : MediumTest
     * @tc.type      : Function
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await testGetDisposalTypePromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETDISPOSALTYPE_PROMISE_STATIC_0300", "test.jpg");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100
     * @tc.desc      : getFrameCount - promise
     *                 1.create imagesource
     *                 2.getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFrameCountPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_PROMISE_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100
     * @tc.desc      : getFrameCount - callback
     *                 1.create imagesource
     *                 2.getFrameCount
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      await getFrameCountCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_GETFRAMECOUNT_CALLBACK_STATIC_0100", "moving_test.gif");
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100
     * @tc.desc      : createPixelMapList - promise
     *                 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      await createPixelMapListPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_PROMISE_STATIC_0100",
        "moving_test.gif", decodeOpts);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100
     * @tc.desc      : createPixelMapList - promise-sampleSize: -1
     *                 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: -1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE2).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0100",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200
     * @tc.desc      : createPixelMapList - promise-index: -8
     *                 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: -8,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0200",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300
     * @tc.desc      : createPixelMapList - promise-rotate: 500
     *                 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 500,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };

      let checkErrCode = (code: int)=> {
        expect(code == ERR_CODE1).assertTrue();
      }

      await createPixelMapListErrPromise(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_ERR_PROMISE_STATIC_0300",
        "moving_test.gif", decodeOpts, checkErrCode);
    });

    /**
     * @tc.number    : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100
     * @tc.name      : SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100
     * @tc.desc      : createPixelMapList - callback
     *                 1.create imagesource
     *                 2.set DecodeOptions
     *                 3.createPixelMapList
     *                 4.packing
     * @tc.size      : MEDIUM
     * @tc.type      : Functional
     * @tc.level     : Level 0
     */
    it("SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100", Level.LEVEL0, async (done: () => void): Promise<void> => {
      let desired_size: image.Size ={ width: 198, height: 202 };
      let decodeOpts: image.DecodingOptions = {
        sampleSize: 1,
        editable: true,
        desiredSize: desired_size,
        rotate: 0,
        desiredPixelFormat: RGBA_8888,
        index: 0,
      };
      await createPixelMapListCallBack(done, "SUB_MULTIMEDIA_IMAGE_GIF_CREATEPIXELMAPLIST_CALLBACK_STATIC_0100",
        "moving_test.gif", decodeOpts);
    });

  })
}

