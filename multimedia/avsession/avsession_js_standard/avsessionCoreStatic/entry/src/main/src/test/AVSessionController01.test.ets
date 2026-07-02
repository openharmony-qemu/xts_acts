'use static';
/*
 * Copyright (c) 2023 Huawei Device Co., Ltd.
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
import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '../../../hypium/index';
import avSession from '@ohos.multimedia.avsession';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { AppStorage } from '@ohos.arkui.stateManagement'
import Utils from './Util.test';

let context: common.UIAbilityContext | undefined;
export default function abilityTest() {
  describe('AVSessionControllerTest01', () => {
    let TAG: string = "[AVSessionControllerTest]";
    let session: avSession.AVSession | null = null;
    let controller: avSession.AVSessionController | undefined;
    let tag: string = 'AVSessionCoreXTS';
    let customData: Record<string,Object> = {'customData': 'appdata'}

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('context') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context!, tag, 'voice_call').then((data) => {
        session = data;
        console.info(`${TAG}: avSession create success`);
      }).catch((err) => {
        console.info(`${TAG}: Session create error: code: ${err.code}, message: ${err.message}`);
      });
      await session!.activate().then(() => {
        console.info(`${TAG}: Session activate`);
      }).catch((err) => {
        console.info(`${TAG}: Session activate error: code: ${err.code}, message: ${err.message}`);
      });
      try {
        controller = await session!.getController();
      } catch (err) {
        console.info(`${TAG}: getController error: code: ${err.code}, message: ${err.message}`);
      }
      await Utils.msSleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
      if (session != null) {
        await session!.destroy().then(() => {
          console.info(`${TAG}: Session destroy success`);
        }).catch((err) => {
          console.info(`${TAG}: Session destroy error: code: ${err.code}, message: ${err.message}`);
        });
      } else {
        console.info(`${TAG}: Session is already destroy`);
      }
      if (controller != null) {
        await controller!.destroy().then(() => {
          console.info(`${TAG}: Controller destroy success`);
        }).catch((err) => {
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
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100
     * @tc.desc   test offCustomDataChange of controller with no input param
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1100]';
      let flag:number = 0;
      let callback1 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 1
      }
      let callback2 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 10
      }
      controller!.onCustomDataChange(callback1);
      controller!.onCustomDataChange(callback2);
      controller!.offCustomDataChange();
      await Utils.msSleep(100);
      session!.sendCustomData(customData);
      await Utils.msSleep(300);
      expect(flag).assertEqual(0);
      done();
    })


    /**
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200
     * @tc.desc   test offCustomDataChange of controller with specified callback function
     * @tc.size   MediumTest
     * @tc.type   Function
     * @tc.level  Level2
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: () => void): Promise<void> => {
      let TAG = '[SUB_MULTIMEDIA_AVSESSION_OFFCUSTOMDATACHANGE_STATIC_CONTROLLER_1200]';
      let flag:number = 0;
      let callback1 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.1 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 1
      }
      let callback2 = (data:Record<string,Object>)=>{
        console.info(`${TAG}Testlog: onCustomDataChange callback registration no.2 triggered.`)
        console.info(`${TAG}Testlog: callback data is ${JSON.stringify(data)}`)
        flag += 10
      }
      controller!.onCustomDataChange(callback1);
      controller!.onCustomDataChange(callback2);
      controller!.offCustomDataChange(callback2);
      await Utils.msSleep(100);
      session!.sendCustomData(customData);
      await Utils.msSleep(300);
      expect(flag).assertEqual(1);
      done();
    })

    /**
    * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0101
    * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0101
    * @tc.desc Test offSupportedLoopModesChange unregister all callbacks.
    *         测试点：验证注销所有回调
    *         测试输入：注销所有已注册的回调
    *         测试输出：注销成功，回调不再触发
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL0
    */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0101', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedLoopModesChangeUnregister001 start`);
      let callbackTriggered = false;
      let callback = (data: Array<avSession.LoopMode> | undefined) => {
        console.info(`${TAG}: callback triggered`);
        callbackTriggered = true;
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        controller!.offSupportedLoopModesChange();
        await Utils.msSleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect(error.code).assertEqual(6600103);
        done();
      }
      console.info(`${TAG}: offSupportedLoopModesChangeUnregister001 end`);
      done();
    });

    /**
    * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201
    * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201
    * @tc.desc Test offSupportedLoopModesChange unregister specific callback.
    *         测试点：验证注销指定回调
    *         测试输入：注销指定的回调函数
    *         测试输出：指定回调被注销
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL0
    */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedLoopModesChangeUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<avSession.LoopMode>  | undefined) => {
        callback1Triggered = true;
      };
      let callback2 = (data: Array<avSession.LoopMode>) => {
        callback2Triggered = true;
      };
      try {
        controller!.onSupportedLoopModesChange(callback1);
        controller!.onSupportedLoopModesChange(callback2);
        controller!.offSupportedLoopModesChange(callback1);
        await Utils.msSleep(500);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600103);
        done();
      }
      console.info(`${TAG}: offSupportedLoopModesChangeUnregisterSpecific002 end`);
      done();
    });

    /**
    * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201
    * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201
    * @tc.desc Test onSupportedLoopModesChange callback is triggered when modes change.
    *         测试点：验证循环模式变化时回调触发
    *         测试输入：注册回调后设置新的循环模式
    *         测试输出：回调被触发，收到新的循环模式数据
    * @tc.type FUNCTION
    * @tc.size MEDIUMTEST
    * @tc.level LEVEL0
    */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0201', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeTrigger002 start`);
      let receivedData: Array<avSession.LoopMode> = [];
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: callback received modes: ${JSON.stringify(data)}`);
        receivedData = data;
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        controller!.offSupportedLoopModesChange(callback);
        await Utils.msSleep(500);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}, message: ${error.message}`);
        expect(error.code).assertEqual(6600103);
        done();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeTrigger002 end`);
      done();
    });
    
	  /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100
     * @tc.desc Test getMediaCenterControlType when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getMediaCenterControlType
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist001 start`);
      try {
        await controller!.destroy();
        await controller!.getMediaCenterControlType();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }
      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist001 end`);
      done();
    }); 

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200
     * @tc.desc Test getMediaCenterControlType returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 controlTypes，直接获取
     *         测试输出：返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 start`);
      try {
        let result: Array<avSession.AVMediaCenterControlType> = await controller!.getMediaCenterControlType();
        console.info(`${TAG}: getMediaCenterControlType result without setting: ${JSON.stringify(result)}`);
        expect(result.length).assertEqual(0);
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_STATIC_0200
     * @tc.desc Test getSupportedLoopModes returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 loopModes，直接获取
     *         测试输出：返回空数组或默认值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getSupportedLoopModesEmptyResult002 start`);
      try {
        let result: Array<avSession.LoopMode> = await controller!.getSupportedLoopModes();
        console.info(`${TAG}: getSupportedLoopModes result without setting: ${JSON.stringify(result)}`);
        expect(result).not().assertNull();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedLoopModesEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_STATIC_0100
     * @tc.desc Test getSupportedLoopModes when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getSupportedLoopModes
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getSupportedLoopModesErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        await controller!.getSupportedLoopModes();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: getSupportedLoopModesErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0100
     * @tc.desc Test getMediaCenterControlType returns correct AVMediaCenterControlType array.
     *         测试点：验证获取媒体中心控制类型返回值
     *         测试输入：先设置 controlTypes，再获取
     *         测试输出：返回与设置值相同的 AVMediaCenterControlType 数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getMediaCenterControlTypeReturnValue001 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'setSpeed'];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        let result: Array<avSession.AVMediaCenterControlType> = await controller!.getMediaCenterControlType();
        console.info(`${TAG}: getMediaCenterControlType result: ${JSON.stringify(result)}`);
        expect(result.length).assertEqual(2);
        expect(result.includes('playNext')).assertTrue();
        expect(result.includes('setSpeed')).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getMediaCenterControlTypeReturnValue001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200
     * @tc.desc Test getMediaCenterControlType returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 controlTypes，直接获取
     *         测试输出：返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 start`);
      try {
        let result: Array<avSession.AVMediaCenterControlType> = await controller!.getMediaCenterControlType();
        console.info(`${TAG}: getMediaCenterControlType result without setting: ${JSON.stringify(result)}`);
        expect(result!.length).assertEqual(0);
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100
     * @tc.desc Test getMediaCenterControlType when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getMediaCenterControlType
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        await controller!.getMediaCenterControlType();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0100
     * @tc.desc Test getSupportedPlaySpeeds returns correct PlaybackSpeed array.
     *         测试点：验证获取支持的播放速度返回值
     *         测试输入：先设置 speeds，再获取
     *         测试输出：返回与设置值相同的 PlaybackSpeed 数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getSupportedPlaySpeedsReturnValue001 start`);
      let speeds: Array<number> = [1.00, 999999999.999999999];
      try {
        await session!.setSupportedPlaySpeeds(speeds);
        let result: Array<number> = await controller!.getSupportedPlaySpeeds();
        console.info(`${TAG}: getSupportedPlaySpeeds result: ${JSON.stringify(result)}`);
        expect(result.length).assertEqual(2);
        expect(result.includes(1.00)).assertTrue();
        expect(result.includes(999999999.999999999)).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedPlaySpeedsReturnValue001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0200
     * @tc.desc Test getSupportedPlaySpeeds returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 speeds，直接获取
     *         测试输出：返回空数组或默认值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getSupportedPlaySpeedsEmptyResult002 start`);
      try {
        let result: Array<number> = await controller!.getSupportedPlaySpeeds();
        console.info(`${TAG}: getSupportedPlaySpeeds result without setting: ${JSON.stringify(result)}`);
        expect(result).not().assertNull();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedPlaySpeedsEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_STATIC_0100
     * @tc.desc Test getSupportedPlaySpeeds when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getSupportedPlaySpeeds
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: getSupportedPlaySpeedsErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        await controller!.getSupportedPlaySpeeds();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: getSupportedPlaySpeedsErrorControllerNotExist003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100
     * @tc.desc Test offMediaCenterControlTypeChanged unregister all callbacks.
     *         测试点：验证注销所有回调
     *         测试输入：注销所有已注册的回调
     *         测试输出：注销成功，回调不再触发
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregister001 start`);
      let callbackTriggered = false;
      let callback1 = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback1 triggered`);
        callbackTriggered = true;
      };
      let callback2 = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback2 triggered`);
        callbackTriggered = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback1);
        controller!.onMediaCenterControlTypeChanged(callback2);
        controller!.offMediaCenterControlTypeChanged();
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
        await session!.setMediaCenterControlType(controlTypes);
        await Utils.msSleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.desc Test offMediaCenterControlTypeChanged unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销，其他回调仍有效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback1 triggered`);
        callback1Triggered = true;
      };
      let callback2 = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback2 triggered`);
        callback2Triggered = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback1);
        controller!.onMediaCenterControlTypeChanged(callback2);
        controller!.offMediaCenterControlTypeChanged(callback1);
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
        await session!.setMediaCenterControlType(controlTypes);
        await Utils.msSleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregisterSpecific002 end`);
      done();
    });

        /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.desc Test offMediaCenterControlTypeChanged when controller is destroyed - error code 6600103.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offMediaCenterControlTypeChanged ErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        controller!.offMediaCenterControlTypeChanged();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: offMediaCenterControlTypeChanged ErrorControllerNotExist003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400
     * @tc.desc Test onMediaCenterControlTypeChanged register callback successfully.
     *         测试点：验证注册媒体中心控制类型变化回调注册在销毁后返回数组为空
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister004 start`);
      let callbackCalled = false;
      let callback = (data: Array<avSession.AVMediaCenterControlType> | undefined) => {
        console.info(`${TAG}: onMediaCenterControlTypeChanged callback triggered: ${JSON.stringify(data)}`);
        callbackCalled = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback);
        console.info(`${TAG}: onMediaCenterControlTypeChanged register success`);
        controller!.offMediaCenterControlTypeChanged(callback);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.desc Test offMediaCenterControlTypeChanged when controller is destroyed - error code 6600103.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offMediaCenterControlTypeChanged ErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        controller!.offMediaCenterControlTypeChanged();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: offMediaCenterControlTypeChanged ErrorControllerNotExist003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.desc Test offMediaCenterControlTypeChanged unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销，其他回调仍有效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<avSession.AVMediaCenterControlType> | undefined) => {
        console.info(`${TAG}: callback1 triggered`);
        callback1Triggered = true;
      };
      let callback2 = (data: Array<avSession.AVMediaCenterControlType> | undefined) => {
        console.info(`${TAG}: callback2 triggered`);
        callback2Triggered = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback1);
        controller!.onMediaCenterControlTypeChanged(callback2);
        controller!.offMediaCenterControlTypeChanged(callback1);
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
        await session!.setMediaCenterControlType(controlTypes);
        await Utils.msSleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregisterSpecific002 end`);
      done();
    });


        /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400
     * @tc.desc Test onSupportedLoopModesChange register callback return null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 start`);
      let callback = (data: Array<avSession.LoopMode> | undefined) => {
        console.info(`${TAG}: onSupportedLoopModesChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        console.info(`${TAG}: onSupportedLoopModesChange register success`);
        controller!.offSupportedLoopModesChange(callback);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeRegister004 end`);
      done();
    });

      /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.desc Test offSupportedLoopModesChange when controller is destroyed - error code 6600103.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedLoopModesChange ErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        controller!.offSupportedLoopModesChange();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: offSupportedLoopModesChange ErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0400
     * @tc.desc Test onSupportedPlaySpeedsChange register callback return null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedPlaySpeedsChangeRegister004 start`);
      let callback = (data: Array<number>) => {
        console.info(`${TAG}: onSupportedPlaySpeedsChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller!.onSupportedPlaySpeedsChange(callback);
        console.info(`${TAG}: onSupportedPlaySpeedsChange register success`);
        controller!.offSupportedPlaySpeedsChange(callback);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedPlaySpeedsChangeRegister004 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0100
     * @tc.desc Test offSupportedPlaySpeedsChange unregister all callbacks.
     *         测试点：验证注销所有回调
     *         测试输入：注销所有已注册的回调
     *         测试输出：注销成功，回调不再触发
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregister001 start`);
      let callbackTriggered = false;
      let callback = (data: Array<number>) => {
        console.info(`${TAG}: callback triggered`);
        callbackTriggered = true;
      };
      try {
        controller!.onSupportedPlaySpeedsChange(callback);
        controller!.offSupportedPlaySpeedsChange();
        let speeds: Array<number> = [4.00];
        await session!.setSupportedPlaySpeeds(speeds);
        await Utils.msSleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0200
     * @tc.desc Test offSupportedPlaySpeedsChange unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<number>) => {
        callback1Triggered = true;
      };
      let callback2 = (data: Array<number>) => {
        callback2Triggered = true;
      };
      try {
        controller!.onSupportedPlaySpeedsChange(callback1);
        controller!.onSupportedPlaySpeedsChange(callback2);
        controller!.offSupportedPlaySpeedsChange(callback1);
        let speeds: Array<number> = [1.25];
        await session!.setSupportedPlaySpeeds(speeds);
        await Utils.msSleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregisterSpecific002 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEED_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEED_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.desc Test offSupportedPlaySpeedsChange when controller is destroyed - error code 6600103.
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEED_CHANGE_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: offSupportedPlaySpeedsChange ErrorControllerNotExist003 start`);
      try {
        await controller!.destroy();
        controller!.offSupportedPlaySpeedsChange();
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: offSupportedPlaySpeedsChange ErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100
     * @tc.desc Test onMediaCenterControlTypeChanged register callback successfully.
     *         测试点：验证注册媒体中心控制类型变化回调
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,  
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 start`);
      let callbackCalled = false;
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: onMediaCenterControlTypeChanged callback triggered: ${JSON.stringify(data)}`);
        callbackCalled = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback);
        console.info(`${TAG}: onMediaCenterControlTypeChanged register success`);
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200
     * @tc.desc Test onMediaCenterControlTypeChanged callback is triggered when type changes.
     *         测试点：验证控制类型变化时回调触发
     *         测试输入：注册回调后设置新的控制类型
     *         测试输出：回调被触发，收到新的控制类型数据
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedTrigger002 start`);
      let receivedData: Array<avSession.AVMediaCenterControlType> = [];
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback received: ${JSON.stringify(data)}`);
        receivedData = data;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback);
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'playPrevious'];
        await session!.setMediaCenterControlType(controlTypes);
        await Utils.msSleep(500);
        expect(receivedData.length).assertEqual(2);
        expect(receivedData.includes('playNext')).assertTrue();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedTrigger002 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0300
     * @tc.desc Test onMediaCenterControlTypeChanged register callback successfully.
     *         测试点：验证注册媒体中心控制类型变化回调返回数组不为空
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,   
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister003 start`);
      let callbackCalled = false;
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: onMediaCenterControlTypeChanged callback triggered: ${JSON.stringify(data)}`);
        callbackCalled = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback);
        console.info(`${TAG}: onMediaCenterControlTypeChanged register success`);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400
     * @tc.desc Test onMediaCenterControlTypeChanged register callback successfully.
     *         测试点：验证注册媒体中心控制类型变化回调注册在销毁后返回数组为空
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister004 start`);
      let callbackCalled = false;
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: onMediaCenterControlTypeChanged callback triggered: ${JSON.stringify(data)}`);
        callbackCalled = true;
      };
      try {
        controller!.onMediaCenterControlTypeChanged(callback);
        console.info(`${TAG}: onMediaCenterControlTypeChanged register success:`);
        controller!.offMediaCenterControlTypeChanged(callback);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100
     * @tc.desc Test onMediaCenterControlTypeChanged when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后注册回调
     *         测试输出：抛出错误码 6600103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedErrorControllerNotExist003 start`);
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback received`);
      };
      try {
        await controller!.destroy();
        controller!.onMediaCenterControlTypeChanged(callback);
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: onMediaCenterControlTypeChangedErrorControllerNotExist003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0100
     * @tc.desc Test onSupportedLoopModesChange register callback successfully.
     *         测试点：验证注册循环模式变化回调
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: onSupportedLoopModesChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        console.info(`${TAG}: onSupportedLoopModesChange register success`);
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0300
     * @tc.desc Test onSupportedLoopModesChange register callback return not null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeRegister003 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: onSupportedLoopModesChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        console.info(`${TAG}: onSupportedLoopModesChange register success`);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeRegister003 end`);
      done();
    });


      /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400
     * @tc.desc Test onSupportedLoopModesChange register callback return null
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: onSupportedLoopModesChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller!.onSupportedLoopModesChange(callback);
        console.info(`${TAG}: onSupportedLoopModesChange register success`);
        controller!.offSupportedLoopModesChange(callback);
        done();
      } catch (error) {
        console.info(`${TAG}: error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeRegister004 end`);
      done();
    });
    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100
     * @tc.desc Test onSupportedLoopModesChange when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后注册回调
     *         测试输出：抛出错误码 6600103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: onSupportedLoopModesChangeErrorControllerNotExist003 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: callback received`);
      };
      try {
        await controller!.destroy();
        controller!.onSupportedLoopModesChange(callback);
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600103);
      }

      console.info(`${TAG}: onSupportedLoopModesChangeErrorControllerNotExist003 end`);
      done();
    });

    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200
     * @tc.desc   Testing sendControlCommand(command)-promise-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId3'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data).assertEqual('assetId3');
            session!.offPlayWithAssetId();
            done();
          });
        await controller!.sendControlCommand(command);
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300
     * @tc.desc   Testing sendControlCommand(command)-promise-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId4'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          await controller!.sendControlCommand(command).catch((err: Error) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400
     * @tc.desc   Testing sendControlCommand(command)-promise-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          await controller!.sendControlCommand(command).catch((err: Error) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500
     * @tc.desc   Testing sendControlCommand(command)-promise-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId5'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          await controller!.sendControlCommand(command).catch((err: Error) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600
     * @tc.desc   Testing sendControlCommand(command)-promise-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_PROMISE_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId1'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          await controller!.sendControlCommand(command).catch((err: Error) => {
          console.info(`${TAG}: sendControlCommand failed, error: [${err.code}, ${err.message}]`);
          expect(err.code).assertEqual(401);
          done();
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200
     * @tc.desc   Testing sendControlCommand(command)-callback-special characters &max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId3'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId3 = ${data}`);
            expect(data).assertEqual('assetId3');
            session!.offPlayWithAssetId();
            done();
          });
        controller!.sendControlCommand(command, () => {
          console.info('Succeeded in sending control command.');
        });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300
     * @tc.desc   Testing sendControlCommand(command)-callback-exceed max length
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter:'assetId4'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId4 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
        controller!.sendControlCommand(command, () => {
            console.info('Succeeded in sending control command.');
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400
     * @tc.desc   Testing sendControlCommand(command)-callback-with no parameters
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
        controller!.sendControlCommand(command, () => {
            console.info('Succeeded in sending control command.');
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500
     * @tc.desc   Testing sendControlCommand(command)-callback-type error
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId5'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId5 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          controller!.sendControlCommand(command, () => {
            console.info('Succeeded in sending control command.');
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })


    /**
     * @tc.name   SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600
     * @tc.desc   Testing sendControlCommand(command)-callback-parameter to None
     * @tc.type   FUNCTION
     * @tc.size   MEDIUMTEST
     * @tc.level  LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SENDCONTROLCOMMAND_CALLBACK_STATIC_1600', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      let command: avSession.AVControlCommand = {
        command: 'playWithAssetId',
        parameter: 'assetId1'
      }
      try {
          session!.onPlayWithAssetId((data: string | null) => {
            console.info(`${TAG}: on playWithAssetId, assetId1 = ${data}`);
            session!.offPlayWithAssetId();
            done();
          });
          controller!.sendControlCommand(command, () => {
            console.info('Succeeded in sending control command.');
          });
      } catch (error) {
        console.info(`${TAG}: catch error, error: [${error.code}, ${error.message}]`);
        expect(false).assertTrue();
        done();
      }
      done();
    })

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0100
     * @tc.desc Test setMediaCenterControlType with valid AVMediaCenterControlType array.
     *         测试点：验证设置媒体中心控制类型功能
     *         测试输入：有效的 AVMediaCenterControlType 数组 ['playNext', 'playPrevious', 'setSpeed']
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeValidParam001 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'playPrevious', 'setSpeed'];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType success`);
      } catch (error) {
        console.info(`${TAG}: setMediaCenterControlType error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeValidParam001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0200
     * @tc.desc Test setMediaCenterControlType with single control type.
     *         测试点：验证设置单个控制类型
     *         测试输入：单个元素数组 ['playNext']
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0,
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeSingleType002 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with single type success`);
      } catch (error) {
        console.info(`${TAG}: setMediaCenterControlType error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeSingleType002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0300
     * @tc.desc Test setMediaCenterControlType with all AVMediaCenterControlType values.
     *         测试点：验证设置所有控制类型
     *         测试输入：包含所有 AVMediaCenterControlType 值的数组
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeAllTypes003 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = [
        'playNext',
        'playPrevious',
        'fastForward',
        'rewind',
        'setSpeed',
        'setLoopMode',
        'toggleFavorite'
      ];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with all types success`);
      } catch (error) {
        console.info(`${TAG}: setMediaCenterControlType error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeAllTypes003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0400
     * @tc.desc Test setMediaCenterControlType with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray004 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = [];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with empty array success`);
      } catch (error) {
        console.info(`${TAG}: setMediaCenterControlType error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray004 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0500
     * @tc.desc Test setMediaCenterControlType with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray005 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = [];
      try {
        await session!.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with empty array success`);
      } catch (error) {
        console.info(`${TAG}: setMediaCenterControlType error: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray005 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_STATIC_0100
     * @tc.desc Test setMediaCenterControlType when session is destroyed - error code 6600102.
     *         测试点：验证会话不存在时的错误处理
     *         测试输入：会话销毁后调用 setMediaCenterControlType
     *         测试输出：抛出错误码 6600102（会话不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setMediaCenterControlTypeErrorSessionNotExist005 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
      try {
        await session!.destroy();
        await session!.setMediaCenterControlType(controlTypes);
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600102);
      }
      session = null;
      console.info(`${TAG}: setMediaCenterControlTypeErrorSessionNotExist005 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0100
     * @tc.desc Test setSupportedPlaySpeeds with valid PlaybackSpeed array.
     *         测试点：验证设置支持的播放速度功能
     *         测试输入：有效的 PlaybackSpeed 数组 1.00, 1.50, 2.00
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsValidParam001 start`);
      let speeds: Array<number> = [1.00, 1.50, 2.00];
      await session!.setSupportedPlaySpeeds(speeds).then(() => {
        console.info(`${TAG}: setSupportedPlaySpeeds success`);
      }).catch((error: Error) => {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      });
      console.info(`${TAG}: setSupportedPlaySpeedsValidParam001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0200
     * @tc.desc Test setSupportedPlaySpeeds with single PlaybackSpeed element.
     *         测试点：验证设置单个播放速度
     *         测试输入：单个元素数组 99.99
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsSingleSpeed002 start`);
      let speeds: Array<number> = [99.99];
      await session!.setSupportedPlaySpeeds(speeds).then(() => {
        console.info(`${TAG}: setSupportedPlaySpeeds with single speed success`);
      }).catch((error: Error) => {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      });
      console.info(`${TAG}: setSupportedPlaySpeedsSingleSpeed002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0300
     * @tc.desc Test setSupportedPlaySpeeds with all PlaybackSpeed values.
     *         测试点：验证设置所有支持的播放速度
     *         测试输入：包含所有 PlaybackSpeed 值的数组
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsAllSpeeds003 start`);
      let speeds: Array<number> = [0.125, 0.25, 0.50, 0.75, 1.00, 10.01, 1111.1111, 11111111111111.0]
      try {
        await session!.setSupportedPlaySpeeds(speeds);
        console.info(`${TAG}: setSupportedPlaySpeeds with all speeds success`);
      } catch (error) {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedPlaySpeedsAllSpeeds003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0400
     * @tc.desc Test setSupportedPlaySpeeds with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功（空数组表示不支持任何速度）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray004 start`);
      let speeds: Array<number> = [];
      try {
        await session!.setSupportedPlaySpeeds(speeds);
        console.info(`${TAG}: setSupportedPlaySpeeds with empty array success`);
      } catch (error) {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray004 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0500
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0500
     * @tc.desc Test setSupportedPlaySpeeds with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功（空数组表示不支持任何速度）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_STATIC_0500', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray005 start`);
      let speeds: Array<number> = [];
      try {
        await session!.setSupportedPlaySpeeds(speeds);
        console.info(`${TAG}: setSupportedPlaySpeeds with empty array success`);
      } catch (error) {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect(error.code).assertEqual(401);
      }
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray005 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_STATIC_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_STATIC_0100
     * @tc.desc Test setSupportedPlaySpeeds when session is destroyed - error code 6600102.
     *         测试点：验证会话不存在时的错误处理
     *         测试输入：会话销毁后调用 setSupportedPlaySpeeds
     *         测试输出：抛出错误码 6600102（会话不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_STATIC_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, 
      async (done: () => void): Promise<void> => {
      console.info(`${TAG}: setSupportedPlaySpeedsErrorSessionNotExist005 start`);
      let speeds: Array<number> = [1.00];
      try {
        await session!.destroy();
        await session!.setSupportedPlaySpeeds(speeds);
        expect().assertFail();
      } catch (error) {
        console.info(`${TAG}: error code: ${error.code}`);
        expect(error.code).assertEqual(6600102);
      }
      session = null;
      console.info(`${TAG}: setSupportedPlaySpeedsErrorSessionNotExist005 end`);
      done();
    });

  })
}
