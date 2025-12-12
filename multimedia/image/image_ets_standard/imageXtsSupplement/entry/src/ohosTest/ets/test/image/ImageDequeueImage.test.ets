/*
 * Copyright (C) 2025 Huawei Device Co., Ltd.
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
import { describe, it, expect, Level, beforeAll, beforeEach, afterEach, afterAll } from '@ohos/hypium';
import { LOG_TAG } from '../common';
import { BusinessError } from '@kit.BasicServicesKit';


const TAG = LOG_TAG + 'Xts.ImagedequeueImage';

async function ImageDequeuePromiseTest(done: Function, testName: string, callback:(creator:image.ImageCreator)=>void) {
  const size: image.Size = {
    height: 8192,
    width: 8
  }
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    callback(creator);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

async function ImageDequeueCallbackTest(done: Function, testName: string,callback:(creator:image.ImageCreator)=>void) {
  const size: image.Size = {
    height: 8192,
    width: 8
  }
  try {
    const creator: image.ImageCreator = await image.createImageCreator(size, image.ImageFormat.JPEG, 8);
    callback(creator);
    done();
  } catch (error) {
    console.info(TAG, `failed; error: ${error},${error.code}`, testName);
    expect().assertFail();
    done();
  }
}

export default function ImageCreatorDequeueImageSuppTest() {
  describe('ImageCreatorDequeueImageSuppTest', () => {

    beforeAll(async () => {
      AppStorage.setOrCreate('emptyObj', {})
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
      AppStorage.delete('emptyObj');
    });

    /**
     * @tc.number   ImageCreator_dequeueImage_promise_01
     * @tc.name     ImageCreator_dequeueImage_promise_01
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('ImageCreator_dequeueImage_promise_01', Level.LEVEL0, async (done: Function, img: image.Image) => {
      const testName = 'ImageCreator_dequeueImage_promise_01';
      await ImageDequeuePromiseTest(done, testName, async (creator) => {
        await creator.dequeueImage().then((img: image.Image) => {
          img.getComponent(4).then((component: image.Component) => {
            let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
            for (let i = 0; i < bufferArr.length; i += 4) {
              bufferArr[i] = 0; // B
              bufferArr[i + 1] = 0; // G
              bufferArr[i + 2] = 255; // R
              bufferArr[i + 3] = 255; // A
            }
          })
          console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
          creator.queueImage(img).then(() => {
            console.info(TAG, testName, 'Succeeded in queuing the Image.');
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
          })
          creator.release();
          console.info(TAG, testName, 'Succeeded in creator.release.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        })
      })
    })

    /**
     * @tc.number   ImageCreator_dequeueImage_promise_02
     * @tc.name     ImageCreator_dequeueImage_promise_02
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('ImageCreator_dequeueImage_promise_02', Level.LEVEL0, async (done: Function, img: image.Image) => {
      const testName = 'ImageCreator_dequeueImage_promise_02';
      await ImageDequeuePromiseTest(done, testName, async (creator) => {
        await creator.dequeueImage().then((img: image.Image) => {
          img.getComponent(4).then((component: image.Component) => {
            let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
            for (let i = 0; i < bufferArr.length; i += 4) {
              bufferArr[i] = 0; // B
              bufferArr[i + 1] = 0; // G
              bufferArr[i + 2] = 255; // R
              bufferArr[i + 3] = 255; // A
            }
          })
          console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
          creator.queueImage(undefined).then(() => {
            console.info(TAG, testName, 'Succeeded in queuing the Image.');
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(1);
          })
          creator.release();
          console.info(TAG, testName, 'Succeeded in creator.release.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        })
      })
    })

    /**
     * @tc.number   ImageCreator_dequeueImage_promise_03
     * @tc.name     ImageCreator_dequeueImage_promise_03
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('ImageCreator_dequeueImage_promise_03', Level.LEVEL0, async (done: Function, img: image.Image) => {
      const testName = 'ImageCreator_dequeueImage_promise_03';
      await ImageDequeuePromiseTest(done, testName, async (creator) => {
        await creator.dequeueImage().then((img: image.Image) => {
          img.getComponent(4).then((component: image.Component) => {
            let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
            for (let i = 0; i < bufferArr.length; i += 4) {
              bufferArr[i] = 0; // B
              bufferArr[i + 1] = 0; // G
              bufferArr[i + 2] = 255; // R
              bufferArr[i + 3] = 255; // A
            }
          })
          console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
          creator.queueImage(null).then(() => {
            console.info(TAG, testName, 'Succeeded in queuing the Image.');
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(1);
          })
          creator.release();
          console.info(TAG, testName, 'Succeeded in creator.release.');
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        })
      })
    })
    /**
     * @tc.number   ImageCreator_dequeueImage_promise_04
     * @tc.name     ImageCreator_dequeueImage_promise_04
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('ImageCreator_dequeueImage_promise_04', Level.LEVEL0, async (done: Function) => {
      const testName = 'ImageCreator_dequeueImage_promise_04';
      await ImageDequeuePromiseTest(done, testName, async (creator) => {
        await creator.dequeueImage().then((img: image.Image) => {
          img.getComponent(4).then((component: image.Component) => {
            let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
            for (let i = 0; i < bufferArr.length; i += 4) {
              bufferArr[i] = 0; // B
              bufferArr[i + 1] = 0; // G
              bufferArr[i + 2] = 255; // R
              bufferArr[i + 3] = 255; // A
            }
          })
          console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
          let imgNull: image.Image = AppStorage.get('emptyObj') as ESObject;
          creator.queueImage(imgNull).then(() => {
            console.info(TAG, testName, 'Succeeded in queuing the Image.');
          }).catch((error: BusinessError) => {
            console.error(TAG, testName, `Failed to queue the Image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(1);
          })
          creator.release();
        }).catch((error: BusinessError) => {
          console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
          expect().assertFail();
        })
      })
    })

    /**
     * @tc.number   IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_01
     * @tc.name     IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_01
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_01', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_01';
      await ImageDequeueCallbackTest(done, testName, async (creator) => {
        creator.dequeueImage((err: BusinessError, img: image.Image) => {
          img.getComponent(4).then((component: image.Component) => {
            let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
            for (let i = 0; i < bufferArr.length; i += 4) {
              bufferArr[i] = 0; // B
              bufferArr[i + 1] = 0; // G
              bufferArr[i + 2] = 255; // R
              bufferArr[i + 3] = 255; // A
            }
          })
          console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
          creator.queueImage(img, (err: BusinessError) => {
            if (err) {
              console.error(TAG, testName, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
              expect().assertFail();
            } else {
              console.info(TAG, testName, 'Succeeded in queueing the Image.');
              creator.release();
              done();
            }
          });
        });
      }).catch((error: BusinessError) => {
        console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
        expect().assertFail();
      })
    })

    /**
     * @tc.number   IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_02
     * @tc.name     IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_02
     * @tc.desc     ImageCreator_dequeueImage
     * @tc.size     MEDIUM
     * @tc.type     Function
     * @tc.level    Level 0
     */
    it('IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_02', Level.LEVEL0, async (done: Function) => {
      const testName = 'IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_02';
      await ImageDequeueCallbackTest(done, testName, async (creator) => {
        try {
          await creator.dequeueImage().then((img: image.Image) => {
            img.getComponent(4).then((component: image.Component) => {
              let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
              for (let i = 0; i < bufferArr.length; i += 4) {
                bufferArr[i] = 0; // B
                bufferArr[i + 1] = 0; // G
                bufferArr[i + 2] = 255; // R
                bufferArr[i + 3] = 255; // A
              }
            })
            console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
            creator.queueImage(null, (err: BusinessError) => {
              if (err) {
                console.error(TAG, testName, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
              } else {
                console.info(TAG, testName, 'Succeeded in queuing the Image.');
                expect().assertFail();
              }
            })
          })
        } catch (error) {
          console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
          expect(error.code).assertEqual(1);
          creator.release();
          done();
        }
      })
    })
      /**
       * @tc.number   IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_03
       * @tc.name     IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_03
       * @tc.desc     ImageCreator_dequeueImage
       * @tc.size     MEDIUM
       * @tc.type     Function
       * @tc.level    Level 0
       */
      it('IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_03', Level.LEVEL0, async (done: Function) => {
        const testName = 'IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_03';
        await ImageDequeueCallbackTest(done, testName, async (creator) => {
          try {
            await creator.dequeueImage().then((img: image.Image) => {
              img.getComponent(4).then((component: image.Component) => {
                let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
                for (let i = 0; i < bufferArr.length; i += 4) {
                  bufferArr[i] = 0; // B
                  bufferArr[i + 1] = 0; // G
                  bufferArr[i + 2] = 255; // R
                  bufferArr[i + 3] = 255; // A
                }
              })
              console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
              creator.queueImage(undefined, (err: BusinessError) => {
                if (err) {
                  console.error(TAG, testName, `Failed to queue the Image.code ${err.code},message is ${err.message}`);
                } else {
                  console.info(TAG, testName, 'Succeeded in queuing the Image.');
                  expect().assertFail();
                }
              })
            })
          } catch (error) {
            console.error(TAG, testName, `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
            expect(error.code).assertEqual(1);
            creator.release();
            done();
          }
        })
      })
        /**
         * @tc.number   IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_04
         * @tc.name     IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_04
         * @tc.desc     ImageCreator_dequeueImage
         * @tc.size     MEDIUM
         * @tc.type     Function
         * @tc.level    Level 0
         */
        it('IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_04', Level.LEVEL0, async (done: Function) => {
          const testName = 'IMAGE_CREATOR_DEQUEUE_IMAGE_CALLBACK_04';
          await ImageDequeueCallbackTest(done, testName, async (creator) => {
            try {
              await creator.dequeueImage().then((img: image.Image) => {
                img.getComponent(4).then((component: image.Component) => {
                  let bufferArr: Uint8Array = new Uint8Array(component.byteBuffer);
                  for (let i = 0; i < bufferArr.length; i += 4) {
                    bufferArr[i] = 0; // B
                    bufferArr[i + 1] = 0; // G
                    bufferArr[i + 2] = 255; // R
                    bufferArr[i + 3] = 255; // A
                  }
                })
                console.info(TAG, testName, 'Succeeded in dequeuing the Image.');
                let imgNull: image.Image = AppStorage.get('emptyObj') as ESObject;
                creator.queueImage(imgNull, (err: BusinessError) => {
                  if (err) {
                    console.error(TAG, testName,
                      `Failed to queue the Image.code ${err.code},message is ${err.message}`);
                  } else {
                    console.info(TAG, testName, 'Succeeded in queuing the Image.');
                    expect().assertFail();
                  }
                })
              })
            } catch (error) {
              console.error(TAG, testName,
                `Failed to dequeue the Image.code ${error.code},message is ${error.message}`);
              expect(error.code).assertEqual(1);
              creator.release();
              done();
            }
          })
        })


  })
}