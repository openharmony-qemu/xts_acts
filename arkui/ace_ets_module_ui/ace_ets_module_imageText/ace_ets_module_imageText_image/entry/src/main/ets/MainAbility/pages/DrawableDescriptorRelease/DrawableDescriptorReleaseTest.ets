/**
 * Copyright (c) 2026 Huawei Device Co., Ltd.
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

import {
  AnimatedDrawableDescriptor,
  DrawableDescriptor,
  PixelMapDrawableDescriptor,
  LayeredDrawableDescriptor
} from '@kit.ArkUI';

@Entry
@Component
struct DrawableDescriptorReleaseTest {
  private resManager = this.getUIContext().getHostContext()?.resourceManager;
  @State testResult001: string = '';
  @State testResult002: string = '';
  @State testResult003: string = '';
  @State testResult004: string = '';
  @State testResult005: string = '';
  @State testResult006: string = '';
  @State testResult007: string = '';
  @State testResult008: string = '';
  @State testResult009: string = '';
  @State testResult010: string = '';
  @State testResult011: string = '';
  @State testResult012: string = '';

  build() {
    Scroll() {
      Column({ space: 5 }) {
        // DrawableDescriptor release/isReleased
        // 1. DrawableDescriptor 测试
        Row() {
          Button('release→isReleased')
            .id('btnTest001')
            .height('5%')
            .onClick(() => this.Test001())
          Text(this.testResult001)
            .id('txtTestResult001')
            .fontSize(10)
        }

        Row() {
          Button('release→getPixelMap')
            .id('btnTest002')
            .height('5%')
            .onClick(() => this.Test002())
          Text(this.testResult002)
            .id('txtTestResult002')
            .fontSize(10)
        }

        Row() {
          Button('double release')
            .id('btnTest003')
            .height('5%')
            .onClick(() => this.Test003())
          Text(this.testResult003)
            .id('txtTestResult003')
            .fontSize(10)
        }

        // 2. LayeredDrawableDescriptor 测试
        Row() {
          Button('release→getForeground')
            .id('btnTest004')
            .height('5%')
            .onClick(() => this.Test004())
          Text(this.testResult004)
            .id('txtTestResult004')
            .fontSize(10)
        }

        Row() {
          Button('release→getBackground')
            .id('btnTest005')
            .height('5%')
            .onClick(() => this.Test005())
          Text(this.testResult005)
            .id('txtTestResult005')
            .fontSize(10)
        }

        Row() {
          Button('release→getMask')
            .id('btnTest006')
            .height('5%')
            .onClick(() => this.Test006())
          Text(this.testResult006)
            .id('txtTestResult006')
            .fontSize(10)
        }

        // 3. PixelMapDrawableDescriptor 测试
        Row() {
          Button('release→getPixelMap')
            .id('btnTest007')
            .height('5%')
            .onClick(() => this.Test007())
          Text(this.testResult007)
            .id('txtTestResult007')
            .fontSize(10)
        }

        // 4. AnimatedDrawableDescriptor 测试
        Row() {
          Button('release→getPixelMap')
            .id('btnTest008')
            .height('5%')
            .onClick(() => this.Test008())
          Text(this.testResult008)
            .id('txtTestResult008')
            .fontSize(10)
        }

        Row() {
          Button('release→getController')
            .id('btnTest009')
            .height('5%')
            .onClick(() => this.Test009())
          Text(this.testResult009)
            .id('txtTestResult009')
            .fontSize(10)
        }

        Row() {
          Button('release→loadSync')
            .id('btnTest010')
            .height('5%')
            .onClick(() => this.Test010())
          Text(this.testResult010)
            .id('txtTestResult010')
            .fontSize(10)
        }

        Row() {
          Button('release→load')
            .id('btnTest011')
            .height('5%')
            .onClick(async () => await this.Test011())
          Text(this.testResult011)
            .id('txtTestResult011')
            .fontSize(10)
        }

        Row() {
          Button('double release')
            .id('btnTest012')
            .height('5%')
            .onClick(() => this.Test012())
          Text(this.testResult012)
            .id('txtTestResult012')
            .fontSize(10)
        }
      }
      .width('80%')
    }
    .width('100%')
    .height('100%')
    .backgroundColor(0xF5F5F5)
  }

  private getErrorCode(e: Object): number {
    try {
      let code = (e as Record<string, Object>)['code'];
      if (typeof code === 'number') {
        return code;
      }
      if (typeof code === 'string') {
        return parseInt(code, 10);
      }
      return -1;
    } catch (err) {
      return -1;
    }
  }

  private createDrawableFromRes(): DrawableDescriptor | null {
    if (!this.resManager) {
      return null;
    }
    try {
      return this.resManager.getDrawableDescriptor($r('app.media.tree').id);
    } catch (e) {
      return null;
    }
  }

  private createAnimatedDrawable(): AnimatedDrawableDescriptor {
    return new AnimatedDrawableDescriptor($r('app.media.tree'), { iterations: 1 });
  }

  Test001() {
    const id = 'E2E_001';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult001 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      let beforeRelease = drawable.isReleased();
      drawable.release();
      let afterRelease = drawable.isReleased();
      if (!beforeRelease && afterRelease) {
        this.testResult001 = 'PASS';
      } else {
        this.testResult001 = `FAIL: beforeRelease=${beforeRelease}, afterRelease=${afterRelease}`;
      }
    } catch (e) {
      this.testResult001 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    const id = 'E2E_002';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult002 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      drawable.release();
      try {
        drawable.getPixelMap();
        this.testResult002 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult002 = 'PASS: error 111002';
        } else {
          this.testResult002 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult002 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    const id = 'E2E_003';
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult003 = 'FAIL: 无法创建 DrawableDescriptor';
        return;
      }
      drawable.release();
      drawable.release();
      if (drawable.isReleased()) {
        this.testResult003 = 'PASS';
      } else {
        this.testResult003 = 'FAIL: 第二次 release 后 isReleased 为 false';
      }
    } catch (e) {
      this.testResult003 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }

  Test004() {
    const id = 'E2E_004';
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        drawable.getForeground();
        this.testResult004 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult004 = 'PASS: error 111002';
        } else {
          this.testResult004 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult004 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test005() {
    const id = 'E2E_005';
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        drawable.getBackground();
        this.testResult005 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult005 = 'PASS: error 111002';
        } else {
          this.testResult005 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult005 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test006() {
    const id = 'E2E_006';
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        drawable.getMask();
        this.testResult006 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult006 = 'PASS: error 111002';
        } else {
          this.testResult006 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult006 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test007() {
    const id = 'E2E_007';
    try {
      let drawable = new PixelMapDrawableDescriptor();
      drawable.release();
      try {
        drawable.getPixelMap();
        this.testResult007 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult007 = 'PASS: error 111002';
        } else {
          this.testResult007 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult007 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test008() {
    const id = 'E2E_008';
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        drawable.getPixelMap();
        this.testResult008 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult008 = 'PASS: error 111002';
        } else {
          this.testResult008 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult008 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test009() {
    const id = 'E2E_009';
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        let controller = drawable.getAnimationController();
        if (controller === undefined) {
          this.testResult009 = 'PASS: undefined';
        } else {
          this.testResult009 = 'FAIL: animationController not undefined';
        }
      } catch (e) {
        this.testResult009 = 'FAIL: 不应该抛异常';
      }
    } catch (e) {
      this.testResult009 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test010() {
    const id = 'E2E_010';
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        drawable.loadSync();
        this.testResult010 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult010 = 'PASS: error 111002';
        } else {
          this.testResult010 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult010 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  async Test011() {
    const id = 'E2E_011';
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        await drawable.load();
        this.testResult011 = 'FAIL: 预期抛出 111002 但未抛出';
      } catch (e) {
        let code = this.getErrorCode(e as Object);
        if (code === 111002) {
          this.testResult011 = 'PASS: error 111002';
        } else {
          this.testResult011 = `FAIL: 错误码 ${code}`;
        }
      }
    } catch (e) {
      this.testResult011 = `FAIL: 外层异常 ${JSON.stringify(e)}`;
    }
  }

  Test012() {
    const id = 'E2E_012';
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      drawable.release();
      if (drawable.isReleased()) {
        this.testResult012 = 'PASS';
      } else {
        this.testResult012 = 'FAIL: 第二次 release 后 isReleased 为 false';
      }
    } catch (e) {
      this.testResult012 = `FAIL: 异常 ${JSON.stringify(e)}`;
    }
  }
}