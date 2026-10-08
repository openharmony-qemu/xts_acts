/*
 * Copyright (C) 2024 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';


let sleep = (ms: number): Promise<string> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve('');
    }, ms)
  })
}

let context: common.UIAbilityContext;


export default function abilityTest() {
  describe('AVCastController', () => {
    let TAG: string = "[AVCastController]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let avCastController: avSession.AVCastController | ESObject;
    let tag: string = 'AVCastXTS';

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'video').then((data) => {
        session = data;
        session.sessionType = 'video';
        console.info(`${TAG}: avSession create success`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err: BusinessError) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      try {
        avCastController = await session.getAVCastController();
        console.info(`${TAG}: getAVCastController success`);
      } catch (err) {
        console.info(`${TAG}: getAVCastController error: code: ${err.code}, message: ${err.message}`);
      }
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (avCastController != null) {
        try {
          await avCastController.destroy();
          console.info(`${TAG}: AVCastController destroy success`);
        } catch (err) {
          console.info(`${TAG}: AVCastController destroy error: code: ${err.code}, message: ${err.message}`);
        }
      }
      if (session != null) {
        await session.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: Controller destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Controller is already destroy`);
      }
      console.info(`${TAG}: afterEach out`);
    })

    afterAll(() => {
      console.info(`${TAG}: afterAll in`);
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200
     * @tc.desc   SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GETAVCASTCONTROLLER_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      await session.destroy()
      await sleep(500)
      let aVCastController: avSession.AVCastController;
      await session.getAVCastController((err: BusinessError, avcontroller: avSession.AVCastController) => {
        if (err) {
          console.info(`getAVCastController11 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600102);
        } else {
          aVCastController = avcontroller;
          console.info('getAVCastController11 : SUCCESS');
          expect(false).assertTrue();
        }
      });
      session = null;
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0100
     * @tc.desc   正常值参数测试-传入有效 AVQueueItem 更新媒体信息
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: update PARAM_0100 start`);
      if (avCastController == null || avCastController == undefined) {
        console.info(`${TAG}: update PARAM_0100 avCastController is null, getAVCastController failed as expected without cast device`);
        done();
        return;
      }
      let mediaDescription: avSession.AVMediaDescription = {
        assetId: 'update_test_001',
        title: 'UpdatedTitle',
      };
      let queueItem: avSession.AVQueueItem = {
        itemId: 0,
        description: mediaDescription,
      };
      try {
        await avCastController.update(queueItem).then(() => {
          console.info(`${TAG}: update PARAM_0100 success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: update PARAM_0100 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.info(`${TAG}: update PARAM_0100 catch error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0200
     * @tc.desc   正常值参数测试-传入带 mediaImage 的 AVQueueItem 更新媒体图片
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: update PARAM_0200 start`);
      if (avCastController == null || avCastController == undefined) {
        console.info(`${TAG}: update PARAM_0200 avCastController is null, getAVCastController failed as expected without cast device`);
        done();
        return;
      }
      let mediaDescription: avSession.AVMediaDescription = {
        assetId: 'update_test_002',
        title: 'TitleWithImage',
        mediaImage: 'https://example.com/image.jpg',
      };
      let queueItem: avSession.AVQueueItem = {
        itemId: 1,
        description: mediaDescription,
      };
      try {
        await avCastController.update(queueItem).then(() => {
          console.info(`${TAG}: update PARAM_0200 success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: update PARAM_0200 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.info(`${TAG}: update PARAM_0200 catch error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0300
     * @tc.desc   正常值参数测试-传入仅含必填字段的 AVQueueItem
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`${TAG}: update PARAM_0300 start`);
      if (avCastController == null || avCastController == undefined) {
        console.info(`${TAG}: update PARAM_0300 avCastController is null, getAVCastController failed as expected without cast device`);
        done();
        return;
      }
      let mediaDescription: avSession.AVMediaDescription = {
        assetId: 'update_test_003',
      };
      let queueItem: avSession.AVQueueItem = {
        itemId: 2,
        description: mediaDescription,
      };
      try {
        await avCastController.update(queueItem).then(() => {
          console.info(`${TAG}: update PARAM_0300 success`);
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: update PARAM_0300 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(false).assertTrue();
        });
      } catch (err) {
        console.info(`${TAG}: update PARAM_0300 catch error: code: ${err.code}, message: ${err.message}`);
        expect(false).assertTrue();
      }
      await sleep(300);
      done();
    })

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0300
     * @tc.desc   错误码测试-未建立远端连接调用 update 触发 6600109
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`${TAG}: update ERROR_0300 start`);
      if (avCastController == null || avCastController == undefined) {
        console.info(`${TAG}: update ERROR_0300 avCastController is null, getAVCastController failed with 6600109 as expected without cast device`);
        done();
        return;
      }
      let mediaDescription: avSession.AVMediaDescription = {
        assetId: 'update_test_err_001',
        title: 'ErrorNoConnection',
      };
      let queueItem: avSession.AVQueueItem = {
        itemId: 0,
        description: mediaDescription,
      };
      try {
        await avCastController.update(queueItem).then(() => {
          console.info(`${TAG}: update ERROR_0300 resolved without remote connection`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: update ERROR_0300 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600109);
        });
      } catch (err) {
        console.info(`${TAG}: update ERROR_0300 catch error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600109);
      }
      await sleep(300);
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0400
     * @tc.desc   错误码测试-Controller 销毁后调用 update 触发 6600101
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL1
     */
    it('SUB_MULTIMEDIA_AVSESSION_AVCASTCONTROLLER_UPDATE_ERROR_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL1, async (done: Function) => {
      console.info(`${TAG}: update ERROR_0400 start`);
      if (avCastController == null || avCastController == undefined) {
        console.info(`${TAG}: update ERROR_0400 avCastController is null, getAVCastController failed as expected without cast device`);
        done();
        return;
      }
      let mediaDescription: avSession.AVMediaDescription = {
        assetId: 'update_test_err_002',
        title: 'ErrorAfterDestroy',
      };
      let queueItem: avSession.AVQueueItem = {
        itemId: 0,
        description: mediaDescription,
      };
      try {
        await avCastController.destroy();
        console.info(`${TAG}: update ERROR_0400 avCastController destroy success`);
      } catch (err) {
        console.info(`${TAG}: update ERROR_0400 avCastController destroy error: code: ${err.code}, message: ${err.message}`);
      }
      try {
        await avCastController.update(queueItem).then(() => {
          console.info(`${TAG}: update ERROR_0400 should reject but resolved after destroy`);
          expect(false).assertTrue();
        }).catch((err: BusinessError) => {
          console.info(`${TAG}: update ERROR_0400 BusinessError: code: ${err.code}, message: ${err.message}`);
          expect(err.code).assertEqual(6600101);
        });
      } catch (err) {
        console.info(`${TAG}: update ERROR_0400 catch error: code: ${err.code}, message: ${err.message}`);
        expect(err.code).assertEqual(6600101);
      }
      avCastController = null;
      await sleep(300);
      done();
    })
  })
}





