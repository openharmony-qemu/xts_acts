/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
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

import { describe, beforeAll, beforeEach, afterEach, afterAll, it, expect, TestType, Size, Level } from '@ohos/hypium';
import avSession from '@ohos.multimedia.avsession';
import featureAbility from '@ohos.ability.featureAbility';
import image from '@ohos.multimedia.image';
import common from '@ohos.app.ability.common';
import { BusinessError } from '@ohos.base';
import { Key, KeyEvent } from '@kit.InputKit';

let sleep = (ms: number): Promise<void> => {
  return new Promise((resolve) => {
    setTimeout(() => {
      resolve();
    }, ms);
  });
};

let context: common.UIAbilityContext;

export default function abilityTest() {
  describe('AVSessionController2', () => {
    let TAG: string = "[AVSessionController2]";
    let session: avSession.AVSession | ESObject;
    let controller: avSession.AVSessionController | ESObject;
    let tag: string = 'AVSessionController2XTS';

    beforeAll(() => {
      context = AppStorage.get<common.UIAbilityContext>('testContext') as common.UIAbilityContext;
      console.info(`${TAG}: beforeAll in`);
    })

    beforeEach(async () => {
      console.info(`${TAG}: beforeEach in`);
      console.info(`${TAG}: createAVSession begin`);
      await avSession.createAVSession(context, tag, 'voice_call').then((data) => {
        session = data;
        session.sessionType = 'voice_call';
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
      await sleep(800);
      console.info(`${TAG}: beforeEach out`);
    })

    afterEach(async () => {
      console.info(`${TAG}: afterEach in`);
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
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0100
     * @tc.desc Test setSupportedPlaySpeeds with valid PlaybackSpeed array.
     *         测试点：验证设置支持的播放速度功能
     *         测试输入：有效的 PlaybackSpeed 数组 [SPEED_1_00_X, SPEED_1_50_X, SPEED_2_00_X]
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedPlaySpeedsValidParam001 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [
        avSession.PlaybackSpeed.SPEED_1_00_X,
        avSession.PlaybackSpeed.SPEED_1_50_X,
        avSession.PlaybackSpeed.SPEED_2_00_X
      ];
      await session?.setSupportedPlaySpeeds(speeds).then(() => {
        console.info(`${TAG}: setSupportedPlaySpeeds success`);
      }).catch((error: BusinessError) => {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      });
      console.info(`${TAG}: setSupportedPlaySpeedsValidParam001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0200
     * @tc.desc Test setSupportedPlaySpeeds with single PlaybackSpeed element.
     *         测试点：验证设置单个播放速度
     *         测试输入：单个元素数组 [SPEED_1_00_X]
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedPlaySpeedsSingleSpeed002 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [avSession.PlaybackSpeed.SPEED_1_00_X];
      await session?.setSupportedPlaySpeeds(speeds).then(() => {
        console.info(`${TAG}: setSupportedPlaySpeeds with single speed success`);
      }).catch((error: BusinessError) => {
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${error.code}`);
        expect().assertFail();
      });
      console.info(`${TAG}: setSupportedPlaySpeedsSingleSpeed002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0300
     * @tc.desc Test setSupportedPlaySpeeds with all PlaybackSpeed values.
     *         测试点：验证设置所有支持的播放速度
     *         测试输入：包含所有 PlaybackSpeed 值的数组
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedPlaySpeedsAllSpeeds003 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [
        avSession.PlaybackSpeed.SPEED_0_125_X,
        avSession.PlaybackSpeed.SPEED_0_25_X,
        avSession.PlaybackSpeed.SPEED_0_50_X,
        avSession.PlaybackSpeed.SPEED_0_75_X,
        avSession.PlaybackSpeed.SPEED_1_00_X,
        avSession.PlaybackSpeed.SPEED_1_25_X,
        avSession.PlaybackSpeed.SPEED_1_50_X,
        avSession.PlaybackSpeed.SPEED_1_75_X,
        avSession.PlaybackSpeed.SPEED_2_00_X,
        avSession.PlaybackSpeed.SPEED_3_00_X,
        avSession.PlaybackSpeed.SPEED_4_00_X
      ];
      try {
        await session?.setSupportedPlaySpeeds(speeds);
        console.info(`${TAG}: setSupportedPlaySpeeds with all speeds success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedPlaySpeedsAllSpeeds003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0400
     * @tc.desc Test setSupportedPlaySpeeds with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功（空数组表示不支持任何速度）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray004 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [];
      try {
        await session?.setSupportedPlaySpeeds(speeds);
        console.info(`${TAG}: setSupportedPlaySpeeds with empty array success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedPlaySpeeds error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedPlaySpeedsEmptyArray004 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_0100
     * @tc.desc Test setSupportedPlaySpeeds when session is destroyed - error code 6600102.
     *         测试点：验证会话不存在时的错误处理
     *         测试输入：会话销毁后调用 setSupportedPlaySpeeds
     *         测试输出：抛出错误码 6600102（会话不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_PLAY_SPEEDS_ERROR_6600102_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedPlaySpeedsErrorSessionNotExist005 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [avSession.PlaybackSpeed.SPEED_1_00_X];
      try {
        await session?.destroy();
        session = null;
        await session?.setSupportedPlaySpeeds(speeds);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600102);
      }
      console.info(`${TAG}: setSupportedPlaySpeedsErrorSessionNotExist005 end`);
      done();
    });

    // ==================== setSupportedLoopModes 测试 ====================

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0100
     * @tc.desc Test setSupportedLoopModes with valid LoopMode array.
     *         测试点：验证设置支持的循环模式功能
     *         测试输入：有效的 LoopMode 数组 [LOOP_MODE_SINGLE, LOOP_MODE_LIST, LOOP_MODE_SHUFFLE]
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedLoopModesValidParam001 start`);
      let loopModes: Array<avSession.LoopMode> = [
        avSession.LoopMode.LOOP_MODE_SINGLE,
        avSession.LoopMode.LOOP_MODE_LIST,
        avSession.LoopMode.LOOP_MODE_SHUFFLE
      ];
      try {
        await session?.setSupportedLoopModes(loopModes);
        console.info(`${TAG}: setSupportedLoopModes success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedLoopModes error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedLoopModesValidParam001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0200
     * @tc.desc Test setSupportedLoopModes with single LoopMode element.
     *         测试点：验证设置单个循环模式
     *         测试输入：单个元素数组 [LOOP_MODE_SINGLE]
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedLoopModesSingleMode002 start`);
      let loopModes: Array<avSession.LoopMode> = [avSession.LoopMode.LOOP_MODE_SINGLE];
      try {
        await session?.setSupportedLoopModes(loopModes);
        console.info(`${TAG}: setSupportedLoopModes with single mode success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedLoopModes error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedLoopModesSingleMode002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0300
     * @tc.desc Test setSupportedLoopModes with all LoopMode values.
     *         测试点：验证设置所有支持的循环模式
     *         测试输入：包含所有 LoopMode 值的数组
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedLoopModesAllModes003 start`);
      let loopModes: Array<avSession.LoopMode> = [
        avSession.LoopMode.LOOP_MODE_NONE,
        avSession.LoopMode.LOOP_MODE_SINGLE,
        avSession.LoopMode.LOOP_MODE_LIST,
        avSession.LoopMode.LOOP_MODE_SHUFFLE
      ];
      try {
        await session?.setSupportedLoopModes(loopModes);
        console.info(`${TAG}: setSupportedLoopModes with all modes success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedLoopModes error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedLoopModesAllModes003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0400
     * @tc.desc Test setSupportedLoopModes with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedLoopModesEmptyArray004 start`);
      let loopModes: Array<avSession.LoopMode> = [];
      try {
        await session?.setSupportedLoopModes(loopModes);
        console.info(`${TAG}: setSupportedLoopModes with empty array success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setSupportedLoopModes error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setSupportedLoopModesEmptyArray004 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_ERROR_6600102_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_ERROR_6600102_0100
     * @tc.desc Test setSupportedLoopModes when session is destroyed - error code 6600102.
     *         测试点：验证会话不存在时的错误处理
     *         测试输入：会话销毁后调用 setSupportedLoopModes
     *         测试输出：抛出错误码 6600102（会话不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_SUPPORTED_LOOP_MODES_ERROR_6600102_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setSupportedLoopModesErrorSessionNotExist005 start`);
      let loopModes: Array<avSession.LoopMode> = [avSession.LoopMode.LOOP_MODE_SINGLE];
      try {
        await session?.destroy();
        session = null;
        await session?.setSupportedLoopModes(loopModes);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600102);
      }
      console.info(`${TAG}: setSupportedLoopModesErrorSessionNotExist005 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0100
     * @tc.desc Test setMediaCenterControlType with valid AVMediaCenterControlType array.
     *         测试点：验证设置媒体中心控制类型功能
     *         测试输入：有效的 AVMediaCenterControlType 数组 ['playNext', 'playPrevious', 'setSpeed']
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setMediaCenterControlTypeValidParam001 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'playPrevious', 'setSpeed'];
      try {
        await session?.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setMediaCenterControlType error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeValidParam001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0200
     * @tc.desc Test setMediaCenterControlType with single control type.
     *         测试点：验证设置单个控制类型
     *         测试输入：单个元素数组 ['playNext']
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setMediaCenterControlTypeSingleType002 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
      try {
        await session?.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with single type success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setMediaCenterControlType error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeSingleType002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0300
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0300
     * @tc.desc Test setMediaCenterControlType with all AVMediaCenterControlType values.
     *         测试点：验证设置所有控制类型
     *         测试输入：包含所有 AVMediaCenterControlType 值的数组
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0300', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        await session?.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with all types success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setMediaCenterControlType error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeAllTypes003 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0400
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0400
     * @tc.desc Test setMediaCenterControlType with empty array.
     *         测试点：验证设置空数组
     *         测试输入：空数组 []
     *         测试输出：Promise resolve，设置成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_PARAM_0400', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray004 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = [];
      try {
        await session?.setMediaCenterControlType(controlTypes);
        console.info(`${TAG}: setMediaCenterControlType with empty array success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: setMediaCenterControlType error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: setMediaCenterControlTypeEmptyArray004 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_0100
     * @tc.desc Test setMediaCenterControlType when session is destroyed - error code 6600102.
     *         测试点：验证会话不存在时的错误处理
     *         测试输入：会话销毁后调用 setMediaCenterControlType
     *         测试输出：抛出错误码 6600102（会话不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_SET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600102_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: setMediaCenterControlTypeErrorSessionNotExist005 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
      try {
        await session?.destroy();
        session = null;
        await session?.setMediaCenterControlType(controlTypes);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600102);
      }
      console.info(`${TAG}: setMediaCenterControlTypeErrorSessionNotExist005 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0100
     * @tc.desc Test getSupportedPlaySpeeds returns correct PlaybackSpeed array.
     *         测试点：验证获取支持的播放速度返回值
     *         测试输入：先设置 speeds，再获取
     *         测试输出：返回与设置值相同的 PlaybackSpeed 数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedPlaySpeedsReturnValue001 start`);
      let speeds: Array<avSession.PlaybackSpeed> = [
        avSession.PlaybackSpeed.SPEED_1_00_X,
        avSession.PlaybackSpeed.SPEED_1_50_X
      ];
      try {
        await session?.setSupportedPlaySpeeds(speeds);
        let result: Array<avSession.PlaybackSpeed> = await controller?.getSupportedPlaySpeeds();
        console.info(`${TAG}: getSupportedPlaySpeeds result: ${JSON.stringify(result)}`);
        expect(result?.length).assertEqual(2);
        expect(result?.includes(avSession.PlaybackSpeed.SPEED_1_00_X)).assertTrue();
        expect(result?.includes(avSession.PlaybackSpeed.SPEED_1_50_X)).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedPlaySpeedsReturnValue001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0200
     * @tc.desc Test getSupportedPlaySpeeds returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 speeds，直接获取
     *         测试输出：返回空数组或默认值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_RETURN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedPlaySpeedsEmptyResult002 start`);
      try {
        let result: Array<avSession.PlaybackSpeed> = await controller?.getSupportedPlaySpeeds();
        console.info(`${TAG}: getSupportedPlaySpeeds result without setting: ${JSON.stringify(result)}`);
        expect(result).assertNotNull();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedPlaySpeedsEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_0100
     * @tc.desc Test getSupportedPlaySpeeds when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getSupportedPlaySpeeds
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_PLAY_SPEEDS_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedPlaySpeedsErrorControllerNotExist003 start`);
      try {
        await controller?.destroy();
        controller = null;
        await controller?.getSupportedPlaySpeeds();
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: getSupportedPlaySpeedsErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0100
     * @tc.desc Test getSupportedLoopModes returns correct LoopMode array.
     *         测试点：验证获取支持的循环模式返回值
     *         测试输入：先设置 loopModes，再获取
     *         测试输出：返回与设置值相同的 LoopMode 数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedLoopModesReturnValue001 start`);
      let loopModes: Array<avSession.LoopMode> = [
        avSession.LoopMode.LOOP_MODE_SINGLE,
        avSession.LoopMode.LOOP_MODE_SHUFFLE
      ];
      try {
        await session?.setSupportedLoopModes(loopModes);
        let result: Array<avSession.LoopMode> = await controller?.getSupportedLoopModes();
        console.info(`${TAG}: getSupportedLoopModes result: ${JSON.stringify(result)}`);
        expect(result?.length).assertEqual(2);
        expect(result?.includes(avSession.LoopMode.LOOP_MODE_SINGLE)).assertTrue();
        expect(result?.includes(avSession.LoopMode.LOOP_MODE_SHUFFLE)).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedLoopModesReturnValue001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0200
     * @tc.desc Test getSupportedLoopModes returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 loopModes，直接获取
     *         测试输出：返回空数组或默认值
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_RETURN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedLoopModesEmptyResult002 start`);
      try {
        let result: Array<avSession.LoopMode> = await controller?.getSupportedLoopModes();
        console.info(`${TAG}: getSupportedLoopModes result without setting: ${JSON.stringify(result)}`);
        expect(result).assertNotNull();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getSupportedLoopModesEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_0100
     * @tc.desc Test getSupportedLoopModes when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getSupportedLoopModes
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_SUPPORTED_LOOP_MODES_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getSupportedLoopModesErrorControllerNotExist003 start`);
      try {
        await controller?.destroy();
        controller = null;
        await controller?.getSupportedLoopModes();
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: getSupportedLoopModesErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0100
     * @tc.desc Test getMediaCenterControlType returns correct AVMediaCenterControlType array.
     *         测试点：验证获取媒体中心控制类型返回值
     *         测试输入：先设置 controlTypes，再获取
     *         测试输出：返回与设置值相同的 AVMediaCenterControlType 数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getMediaCenterControlTypeReturnValue001 start`);
      let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'setSpeed'];
      try {
        await session?.setMediaCenterControlType(controlTypes);
        let result: Array<avSession.AVMediaCenterControlType> = await controller?.getMediaCenterControlType();
        console.info(`${TAG}: getMediaCenterControlType result: ${JSON.stringify(result)}`);
        expect(result?.length).assertEqual(2);
        expect(result?.includes('playNext')).assertTrue();
        expect(result?.includes('setSpeed')).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getMediaCenterControlTypeReturnValue001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0200
     * @tc.desc Test getMediaCenterControlType returns empty array when not set.
     *         测试点：验证未设置时返回空数组
     *         测试输入：不设置任何 controlTypes，直接获取
     *         测试输出：返回空数组
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_RETURN_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 start`);
      try {
        let result: Array<avSession.AVMediaCenterControlType> = await controller?.getMediaCenterControlType();
        console.info(`${TAG}: getMediaCenterControlType result without setting: ${JSON.stringify(result)}`);
        expect(result?.length).assertEqual(0);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: getMediaCenterControlTypeEmptyResult002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_0100
     * @tc.desc Test getMediaCenterControlType when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后调用 getMediaCenterControlType
     *         测试输出：抛出错误码 6600103（控制器不存在）
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_GET_MEDIA_CENTER_CONTROL_TYPE_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist003 start`);
      try {
        await controller?.destroy();
        controller = null;
        await controller?.getMediaCenterControlType();
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: getMediaCenterControlTypeErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100
     * @tc.desc Test onMediaCenterControlTypeChanged register callback successfully.
     *         测试点：验证注册媒体中心控制类型变化回调
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 start`);
      let callbackCalled = false;
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: onMediaCenterControlTypeChanged callback triggered: ${JSON.stringify(data)}`);
        callbackCalled = true;
      };
      try {
        controller?.onMediaCenterControlTypeChanged(callback);
        console.info(`${TAG}: onMediaCenterControlTypeChanged register success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200
     * @tc.desc Test onMediaCenterControlTypeChanged callback is triggered when type changes.
     *         测试点：验证控制类型变化时回调触发
     *         测试输入：注册回调后设置新的控制类型
     *         测试输出：回调被触发，收到新的控制类型数据
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedTrigger002 start`);
      let receivedData: Array<avSession.AVMediaCenterControlType> = [];
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback received: ${JSON.stringify(data)}`);
        receivedData = data;
      };
      try {
        controller?.onMediaCenterControlTypeChanged(callback);
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext', 'playPrevious'];
        await session?.setMediaCenterControlType(controlTypes);
        await sleep(500);
        expect(receivedData.length).assertEqual(2);
        expect(receivedData.includes('playNext')).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedTrigger002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_0100
     * @tc.desc Test onMediaCenterControlTypeChanged when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后注册回调
     *         测试输出：抛出错误码 6600103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_MEDIA_CENTER_CONTROL_TYPE_CHANGED_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onMediaCenterControlTypeChangedErrorControllerNotExist003 start`);
      let callback = (data: Array<avSession.AVMediaCenterControlType>) => {
        console.info(`${TAG}: callback received`);
      };
      try {
        await controller?.destroy();
        controller = null;
        controller?.onMediaCenterControlTypeChanged(callback);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: onMediaCenterControlTypeChangedErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100
     * @tc.desc Test offMediaCenterControlTypeChanged unregister all callbacks.
     *         测试点：验证注销所有回调
     *         测试输入：注销所有已注册的回调
     *         测试输出：注销成功，回调不再触发
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        controller?.onMediaCenterControlTypeChanged(callback1);
        controller?.onMediaCenterControlTypeChanged(callback2);
        controller?.offMediaCenterControlTypeChanged();
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
        await session?.setMediaCenterControlType(controlTypes);
        await sleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200
     * @tc.desc Test offMediaCenterControlTypeChanged unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销，其他回调仍有效
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_MEDIA_CENTER_CONTROL_TYPE_CHANGED_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
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
        controller?.onMediaCenterControlTypeChanged(callback1);
        controller?.onMediaCenterControlTypeChanged(callback2);
        controller?.offMediaCenterControlTypeChanged(callback1);
        let controlTypes: Array<avSession.AVMediaCenterControlType> = ['playNext'];
        await session?.setMediaCenterControlType(controlTypes);
        await sleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offMediaCenterControlTypeChangedUnregisterSpecific002 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100
     * @tc.desc Test onSupportedPlaySpeedsChange register callback successfully.
     *         测试点：验证注册播放速度变化回调
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedPlaySpeedsChangeRegister001 start`);
      let callback = (data: Array<avSession.PlaybackSpeed>) => {
        console.info(`${TAG}: onSupportedPlaySpeedsChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller?.onSupportedPlaySpeedsChange(callback);
        console.info(`${TAG}: onSupportedPlaySpeedsChange register success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedPlaySpeedsChangeRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200
     * @tc.desc Test onSupportedPlaySpeedsChange callback is triggered when speeds change.
     *         测试点：验证播放速度变化时回调触发
     *         测试输入：注册回调后设置新的播放速度
     *         测试输出：回调被触发，收到新的播放速度数据
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedPlaySpeedsChangeTrigger002 start`);
      let receivedData: Array<avSession.PlaybackSpeed> = [];
      let callback = (data: Array<avSession.PlaybackSpeed>) => {
        console.info(`${TAG}: callback received speeds: ${JSON.stringify(data)}`);
        receivedData = data;
      };
      try {
        controller?.onSupportedPlaySpeedsChange(callback);
        let speeds: Array<avSession.PlaybackSpeed> = [avSession.PlaybackSpeed.SPEED_2_00_X];
        await session?.setSupportedPlaySpeeds(speeds);
        await sleep(500);
        expect(receivedData.length).assertEqual(1);
        expect(receivedData.includes(avSession.PlaybackSpeed.SPEED_2_00_X)).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedPlaySpeedsChangeTrigger002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_ERROR_6600103_0100
     * @tc.desc Test onSupportedPlaySpeedsChange when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后注册回调
     *         测试输出：抛出错误码 6600103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_PLAY_SPEEDS_CHANGE_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedPlaySpeedsChangeErrorControllerNotExist003 start`);
      let callback = (data: Array<avSession.PlaybackSpeed>) => {
        console.info(`${TAG}: callback received`);
      };
      try {
        await controller?.destroy();
        controller = null;
        controller?.onSupportedPlaySpeedsChange(callback);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: onSupportedPlaySpeedsChangeErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100
     * @tc.desc Test offSupportedPlaySpeedsChange unregister all callbacks.
     *         测试点：验证注销所有回调
     *         测试输入：注销所有已注册的回调
     *         测试输出：注销成功，回调不再触发
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregister001 start`);
      let callbackTriggered = false;
      let callback = (data: Array<avSession.PlaybackSpeed>) => {
        console.info(`${TAG}: callback triggered`);
        callbackTriggered = true;
      };
      try {
        controller?.onSupportedPlaySpeedsChange(callback);
        controller?.offSupportedPlaySpeedsChange();
        let speeds: Array<avSession.PlaybackSpeed> = [avSession.PlaybackSpeed.SPEED_1_50_X];
        await session?.setSupportedPlaySpeeds(speeds);
        await sleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200
     * @tc.desc Test offSupportedPlaySpeedsChange unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_PLAY_SPEEDS_CHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<avSession.PlaybackSpeed>) => {
        callback1Triggered = true;
      };
      let callback2 = (data: Array<avSession.PlaybackSpeed>) => {
        callback2Triggered = true;
      };
      try {
        controller?.onSupportedPlaySpeedsChange(callback1);
        controller?.onSupportedPlaySpeedsChange(callback2);
        controller?.offSupportedPlaySpeedsChange(callback1);
        let speeds: Array<avSession.PlaybackSpeed> = [avSession.PlaybackSpeed.SPEED_1_25_X];
        await session?.setSupportedPlaySpeeds(speeds);
        await sleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedPlaySpeedsChangeUnregisterSpecific002 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100
     * @tc.desc Test onSupportedLoopModesChange register callback successfully.
     *         测试点：验证注册循环模式变化回调
     *         测试输入：有效的回调函数
     *         测试输出：回调注册成功
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: onSupportedLoopModesChange callback: ${JSON.stringify(data)}`);
      };
      try {
        controller?.onSupportedLoopModesChange(callback);
        console.info(`${TAG}: onSupportedLoopModesChange register success`);
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeRegister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200
     * @tc.desc Test onSupportedLoopModesChange callback is triggered when modes change.
     *         测试点：验证循环模式变化时回调触发
     *         测试输入：注册回调后设置新的循环模式
     *         测试输出：回调被触发，收到新的循环模式数据
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedLoopModesChangeTrigger002 start`);
      let receivedData: Array<avSession.LoopMode> = [];
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: callback received modes: ${JSON.stringify(data)}`);
        receivedData = data;
      };
      try {
        controller?.onSupportedLoopModesChange(callback);
        let loopModes: Array<avSession.LoopMode> = [avSession.LoopMode.LOOP_MODE_LIST];
        await session?.setSupportedLoopModes(loopModes);
        await sleep(500);
        expect(receivedData.length).assertEqual(1);
        expect(receivedData.includes(avSession.LoopMode.LOOP_MODE_LIST)).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: onSupportedLoopModesChangeTrigger002 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_0100
     * @tc.desc Test onSupportedLoopModesChange when controller is destroyed - error code 6600103.
     *         测试点：验证控制器不存在时的错误处理
     *         测试输入：控制器销毁后注册回调
     *         测试输出：抛出错误码 6600103
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_ON_SUPPORTED_LOOP_MODES_CHANGE_ERROR_6600103_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: onSupportedLoopModesChangeErrorControllerNotExist003 start`);
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: callback received`);
      };
      try {
        await controller?.destroy();
        controller = null;
        controller?.onSupportedLoopModesChange(callback);
        expect().assertFail();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error code: ${e.code}`);
        expect(e.code).assertEqual(6600103);
      }
      console.info(`${TAG}: onSupportedLoopModesChangeErrorControllerNotExist003 end`);
      done();
    });


    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100
     * @tc.desc Test offSupportedLoopModesChange unregister all callbacks.
     *         测试点：验证注销所有回调
     *         测试输入：注销所有已注册的回调
     *         测试输出：注销成功，回调不再触发
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0100', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: offSupportedLoopModesChangeUnregister001 start`);
      let callbackTriggered = false;
      let callback = (data: Array<avSession.LoopMode>) => {
        console.info(`${TAG}: callback triggered`);
        callbackTriggered = true;
      };
      try {
        controller?.onSupportedLoopModesChange(callback);
        controller?.offSupportedLoopModesChange();
        let loopModes: Array<avSession.LoopMode> = [avSession.LoopMode.LOOP_MODE_SHUFFLE];
        await session?.setSupportedLoopModes(loopModes);
        await sleep(500);
        expect(callbackTriggered).assertFalse();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedLoopModesChangeUnregister001 end`);
      done();
    });

    /**
     * @tc.name SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200
     * @tc.number SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200
     * @tc.desc Test offSupportedLoopModesChange unregister specific callback.
     *         测试点：验证注销指定回调
     *         测试输入：注销指定的回调函数
     *         测试输出：指定回调被注销
     * @tc.type FUNCTION
     * @tc.size MEDIUMTEST
     * @tc.level LEVEL0
     */
    it('SUB_MULTIMEDIA_AVSESSION_OFF_SUPPORTED_LOOP_MODES_CHANGE_EVENT_0200', TestType.FUNCTION | Size.MEDIUMTEST | Level.LEVEL0, async (done: Function) => {
      console.info(`${TAG}: offSupportedLoopModesChangeUnregisterSpecific002 start`);
      let callback1Triggered = false;
      let callback2Triggered = false;
      let callback1 = (data: Array<avSession.LoopMode>) => {
        callback1Triggered = true;
      };
      let callback2 = (data: Array<avSession.LoopMode>) => {
        callback2Triggered = true;
      };
      try {
        controller?.onSupportedLoopModesChange(callback1);
        controller?.onSupportedLoopModesChange(callback2);
        controller?.offSupportedLoopModesChange(callback1);
        let loopModes: Array<avSession.LoopMode> = [avSession.LoopMode.LOOP_MODE_NONE];
        await session?.setSupportedLoopModes(loopModes);
        await sleep(500);
        expect(callback1Triggered).assertFalse();
        expect(callback2Triggered).assertTrue();
      } catch (error) {
        let e: BusinessError = error as BusinessError;
        console.info(`${TAG}: error: ${e.code}`);
        expect().assertFail();
      }
      console.info(`${TAG}: offSupportedLoopModesChangeUnregisterSpecific002 end`);
      done();
    });


  });
}