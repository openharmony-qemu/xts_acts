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
import commonEvent from '@ohos.commonEventManager';
import { EventPublish } from './EventPublish';

export class FullScreenAdEventPublish {
  private static instance: FullScreenAdEventPublish = new FullScreenAdEventPublish();

  static getInstance(): FullScreenAdEventPublish {
    return FullScreenAdEventPublish.instance;
  }

  publishEvents(status: string, data?: string): void {
    // 协议字段名保持 reward_ad_*；用 Record 避免 G.NAM.03 接口属性 snake_case
    let parameters: Record<string, Object> = {};
    parameters['reward_ad_status'] = status;
    if (data !== undefined) {
      parameters['reward_ad_data'] = data;
    }
    let options: commonEvent.CommonEventPublishData = {
      code: 1, // 公共事件的初始代码
      data: 'initial data', // 公共事件的初始数据
      parameters: parameters
    };
    EventPublish.publishEvents('com.company.pps.action.PPS_REWARD_STATUS_CHANGED', options);
  }
}
