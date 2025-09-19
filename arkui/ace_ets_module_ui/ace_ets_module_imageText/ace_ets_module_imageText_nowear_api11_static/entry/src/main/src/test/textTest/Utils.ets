/**
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http:
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
import RectValue from '../Rect.test';

import inspector from '@ohos.arkui.inspector';
import { TouchObject, TouchType } from '@ohos.arkui.component'
import { sendTouchEvent } from "@kit.ArkUI";

export default class Utils {
  static rect_width: number;
  static rect_height: number;
  static rect_localOffsetX: number;
  static rect_localOffsetY: number;
  static rect_windowOffsetX: number;
  static rect_windowOffsetY: number;
  static rect_screenOffsetX: number;
  static rect_screenOffsetY: number;
  static rect_value: RectValue = new RectValue();

  static sleep(count:int) : Promise<int> {
    return new Promise<int>((resolve, reject) => {
      setTimeout(() => {
        resolve(0)
      }, count)
    })
  }

  static getComponentRect(key: string) {
    
    
    
    
    
    
    
    
    
    
    


    
    
    
    
    
    
    
    
    
    
  }
}