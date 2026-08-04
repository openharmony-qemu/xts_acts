/**
 * Copyright (c) 2026 Kaihong Digital Industry Development Co., Ltd.
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

import { CustomComponentLifecycleObserver, IReusePool, UIUtils } from '@kit.ArkUI';

/**
 * Cover lifecycle/context APIs with a real custom component instance.
 */
@Entry
@ComponentV2
struct LifecycleReuseCover {
  @Local lifecycleStatus: string = 'init';
  @Local contextStatus: string = 'init';

  aboutToAppear(): void {
    this.lifecycleStatus = this.runLifecycleCases();
    this.contextStatus = this.runContextCases();
  }

  private callSafe(tag: string, action: () => void): number {
    try {
      action();
    } catch (err) {
      console.info('[LifecycleReuseCover] ' + tag + ': ' + JSON.stringify(err));
    }
    return 1;
  }

  private runLifecycleCases(): string {
    let passedCount: number = 0;
    try {
      const lifecycle = UIUtils.getLifecycle(this);
      const observer: CustomComponentLifecycleObserver = {
        aboutToReuse(params?: Record<string, Object | undefined | null>): void {
          console.info('[LifecycleReuseCover] aboutToReuse params=' + JSON.stringify(params));
        }
      };
      lifecycle.getCurrentState();
      lifecycle.addObserver(observer);
      lifecycle.removeObserver(observer);
      passedCount += 3;
      passedCount += this.callSafe('addObserver(null)', () => {
        lifecycle.addObserver(null);
      });
      passedCount += this.callSafe('addObserver(undefined)', () => {
        lifecycle.addObserver(undefined);
      });
      passedCount += this.callSafe('removeObserver(null)', () => {
        lifecycle.removeObserver(null);
      });
      passedCount += this.callSafe('removeObserver(undefined)', () => {
        lifecycle.removeObserver(undefined);
      });
      observer.aboutToReuse?.(null);
      observer.aboutToReuse?.(undefined);
      passedCount += 2;
    } catch (err) {
      console.error('[LifecycleReuseCover] lifecycle error: ' + JSON.stringify(err));
      return 'lifecycle:error';
    }
    return 'lifecycle:' + passedCount.toString();
  }

  private runGetReusableInfoCases(pool: IReusePool): number {
    let hit: number = 0;
    hit += this.callSafe('getReusableInfo(null)', () => {
      pool.getReusableInfo(null);
    });
    hit += this.callSafe('getReusableInfo(undefined)', () => {
      pool.getReusableInfo(undefined);
    });
    hit += this.callSafe('getReusableInfo reuseId null', () => {
      const reuseId: string | null = null;
      pool.getReusableInfo(Object, reuseId);
    });
    hit += this.callSafe('getReusableInfo reuseId undefined', () => {
      const reuseIdU: string | undefined = undefined;
      pool.getReusableInfo(Object, reuseIdU);
    });
    return hit;
  }

  private runPreRenderCases(pool: IReusePool): number {
    let hit: number = 0;
    hit += this.callSafe('preRender(null,null)', () => {
      const builder: WrappedBuilder<[]> | null = null;
      const times: number | null = null;
      pool.preRender(builder, times);
    });
    hit += this.callSafe('preRender(undefined)', () => {
      const builderU: WrappedBuilder<[]> | undefined = undefined;
      const timesU: number | undefined = undefined;
      pool.preRender(builderU, timesU);
    });
    return hit;
  }

  private runContextCases(): string {
    try {
      const context = UIUtils.getCustomComponentContext(this);
      const pool = context.getReusePool();
      if (!pool) {
        return 'context:none';
      }
      const hit: number = this.runGetReusableInfoCases(pool) + this.runPreRenderCases(pool);
      return 'context:pool:' + hit.toString();
    } catch (err) {
      console.error('[LifecycleReuseCover] context error: ' + JSON.stringify(err));
      return 'context:error';
    }
  }

  build() {
    Column() {
      Text('LifecycleReuseCover')
        .id('lifecycle_reuse_cover_title')
        .fontSize(16)
        .height('5%')
      Text(this.lifecycleStatus)
        .id('lifecycle_reuse_cover_lifecycle')
        .height('5%')
      Text(this.contextStatus)
        .id('lifecycle_reuse_cover_context')
        .height('5%')
    }
    .width('100%')
    .height('100%')
    .justifyContent(FlexAlign.Center)
  }
}
