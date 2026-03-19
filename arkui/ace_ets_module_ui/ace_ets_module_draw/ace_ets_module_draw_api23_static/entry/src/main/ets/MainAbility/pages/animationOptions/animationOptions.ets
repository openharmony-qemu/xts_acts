/**
 * Copyright (c) 2026 Shenzhen Kaihong Digital Industry Development Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

'use static'

import {
  Column,
  ColumnOptions,
  Button,
  Text,
  Entry,
  Component,
  Image,
  $r,
  ClickEvent
} from '@ohos.arkui.component';
import {
  AnimationOptions,
  AnimationController,
  AnimatedDrawableDescriptor,
  DrawableDescriptor
} from '@ohos.arkui.drawableDescriptor';
import { AppStorage } from '@ohos.arkui.stateManagement';
import { image } from '@kit.ImageKit';

@Entry
@Component
struct animationOptions {
  // Test AnimationOptions - frameDurations
  @Builder
  buildImage1() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageFrameDurations')
  }

  // Test AnimationOptions - autoPlay
  @Builder
  buildImage2() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageAutoPlay')
  }

  // Test AnimationController - start, stop, pause, resume, getStatus
  @Builder
  buildImage3() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageAnimationController')
  }

  // Test AnimatedDrawableDescriptor - getAnimationController
  @Builder
  buildImage4() {
    Image($r('sys.media.ohos_ic_public_voice'))
      .width(100)
      .height(100)
      .id('imageGetAnimationController')
  }

  build() {
    Column({ space: 15 } as ColumnOptions) {
      Button('Test AnimationOptions - frameDurations')
        .id('btnFrameDurations')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            // Test frameDurations property
            let animationOptions: AnimationOptions = {
              frameDurations: [100, 200, 300]
            };
            AppStorage.setOrCreate<AnimationOptions>('animationOptionsFrameDurations', animationOptions);
          } catch (error) {
            console.error('[ARKUI_NEW] frameDurations error: ' + error);
          }
        })

      Button('Test AnimationOptions - autoPlay')
        .id('btnAutoPlay')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            // Test autoPlay property
            let animationOptions: AnimationOptions = {
              autoPlay: true
            };
            AppStorage.setOrCreate<AnimationOptions>('animationOptionsAutoPlay', animationOptions);
          } catch (error) {
            console.error('autoPlay error: ' + error);
          }
        })

      Button('Test AnimationController - start/stop/pause/resume/getStatus')
        .id('btnAnimationController')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            // Per API, create AnimatedDrawableDescriptor via constructor
            // Get pixelMap first
            let uiContext = this.getUIContext();
            if (!uiContext) {
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }
            let resManager = uiContext.getHostContext()?.resourceManager;
            if (!resManager) {
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }
            let drawableDescriptor: DrawableDescriptor | undefined =
              resManager.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (!drawableDescriptor) {
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }
            let pixelMap: image.PixelMap | undefined = drawableDescriptor.getPixelMap();
            if (!pixelMap) {
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }
            // Create pixelMaps array
            let pixelMaps: image.PixelMap[] = [pixelMap];
            // Create AnimationOptions
            let options: AnimationOptions = { duration: 1000, iterations: 1 };
            // Create AnimatedDrawableDescriptor via constructor
            let animatedDrawableDescriptor = new AnimatedDrawableDescriptor(pixelMaps, options);
            let controller: AnimationController | undefined = animatedDrawableDescriptor.getAnimationController();
            if (!controller) {
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }
            // Test start
            try {
              console.info('[ARKUI_NEW] animationController - calling controller.start()');
              controller.start();
              console.info('[ARKUI_NEW] animationController - controller.start() succeeded');
              AppStorage.setOrCreate<boolean>('animationControllerStart', true);
            } catch (error) {
              console.error('[ARKUI_NEW] controller.start error: ' + error);
              AppStorage.setOrCreate<boolean>('animationControllerStart', false);
              return;
            }

            // Test getStatus
            // getStatus may fail if called right after start(); check controller still valid
            try {
              console.info('[ARKUI_NEW] animationController - calling controller.getStatus(), controller is: ' + (controller !== undefined ? 'defined' : 'undefined'));
              if (controller) {
                let status: number = controller.getStatus();
                console.info('[ARKUI_NEW] animationController - controller.getStatus() succeeded, status: ' + status);
                AppStorage.setOrCreate<number>('animationControllerStatus', status);
              } else {
                console.error('[ARKUI_NEW] animationController - controller is null/undefined before getStatus');
                AppStorage.setOrCreate<number>('animationControllerStatus', -1);
              }
            } catch (error) {
              console.error('[ARKUI_NEW] controller.getStatus error: ' + error);
              // getStatus failure does not affect others; set default
              AppStorage.setOrCreate<number>('animationControllerStatus', -1);
            }

            // Test pause
            try {
              console.info('[ARKUI_NEW] animationController - calling controller.pause()');
              if (controller) {
                controller.pause();
                console.info('[ARKUI_NEW] animationController - controller.pause() succeeded');
                AppStorage.setOrCreate<boolean>('animationControllerPause', true);
              } else {
                console.error('[ARKUI_NEW] animationController - controller is null/undefined before pause');
                AppStorage.setOrCreate<boolean>('animationControllerPause', false);
              }
            } catch (error) {
              console.error('[ARKUI_NEW] controller.pause error: ' + error);
              AppStorage.setOrCreate<boolean>('animationControllerPause', false);
            }

            // Test resume
            try {
              console.info('[ARKUI_NEW] animationController - calling controller.resume()');
              if (controller) {
                controller.resume();
                console.info('[ARKUI_NEW] animationController - controller.resume() succeeded');
                AppStorage.setOrCreate<boolean>('animationControllerResume', true);
              } else {
                console.error('[ARKUI_NEW] animationController - controller is null/undefined before resume');
                AppStorage.setOrCreate<boolean>('animationControllerResume', false);
              }
            } catch (error) {
              console.error('[ARKUI_NEW] controller.resume error: ' + error);
              AppStorage.setOrCreate<boolean>('animationControllerResume', false);
            }

            // Test stop
            try {
              console.info('[ARKUI_NEW] animationController - calling controller.stop()');
              if (controller) {
                controller.stop();
                console.info('[ARKUI_NEW] animationController - controller.stop() succeeded');
                AppStorage.setOrCreate<boolean>('animationControllerStop', true);
              } else {
                console.error('[ARKUI_NEW] animationController - controller is null/undefined before stop');
                AppStorage.setOrCreate<boolean>('animationControllerStop', false);
              }
            } catch (error) {
              console.error('[ARKUI_NEW] controller.stop error: ' + error);
              AppStorage.setOrCreate<boolean>('animationControllerStop', false);
            }
          } catch (error) {
            console.error('[ARKUI_NEW] animationController error: ' + error);
            AppStorage.setOrCreate<boolean>('animationControllerStart', false);
          }
        })

      Button('Test AnimatedDrawableDescriptor - getAnimationController')
        .id('btnGetAnimationController')
        .width(300)
        .height(50)
        .onClick(() => {
          try {
            // Per API, create AnimatedDrawableDescriptor via constructor
            // Get pixelMap first
            let resManager = this.getUIContext().getHostContext()?.resourceManager;
            let drawableDescriptor: DrawableDescriptor | undefined =
              resManager?.getDrawableDescriptor($r('sys.media.ohos_ic_public_voice').id) as DrawableDescriptor;
            if (drawableDescriptor) {
              let pixelMap: image.PixelMap | undefined = drawableDescriptor.getPixelMap();
              if (pixelMap) {
                // Create pixelMaps array
                let pixelMaps: image.PixelMap[] = [pixelMap];
                // Create AnimationOptions
                let options: AnimationOptions = { duration: 1000, iterations: 1 };
                // Create AnimatedDrawableDescriptor via constructor
                let animatedDrawableDescriptor = new AnimatedDrawableDescriptor(pixelMaps, options);
                let controller: AnimationController | undefined = animatedDrawableDescriptor.getAnimationController();
                AppStorage.setOrCreate<boolean>('animatedDrawableDescriptorGetController', controller !== undefined);
                if (controller) {
                  let controllerWithId: AnimationController | undefined =
                    animatedDrawableDescriptor.getAnimationController('testId');
                  AppStorage.setOrCreate<boolean>('animatedDrawableDescriptorGetControllerWithId',
                    controllerWithId !== undefined);
                }
              }
            }
          } catch (error) {
            console.error('[ARKUI_NEW] getAnimationController error: ' + error);
          }
        })
    }
    .width('100%')
    .height('100%')
    .padding(20)
  }
}
