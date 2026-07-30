'use static';
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
  Entry,
  Text,
  Column,
  ColumnOptions,
  Row,
  RowOptions,
  Component,
  Button,
  ClickEvent,
  Scroll,
  FontWeight,
  Color,
  Builder,
  $r
} from '@ohos.arkui.component'
import { State } from '@ohos.arkui.stateManagement'
import {
  AnimatedDrawableDescriptor,
  DrawableDescriptor,
  PixelMapDrawableDescriptor,
  LayeredDrawableDescriptor
} from '@ohos.arkui.drawableDescriptor'

@Entry
@Component
struct DrawableDescriptorReleaseTest {
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
      Column({ space: 10 } as ColumnOptions) {
        Text('DrawableDescriptor release/isReleased')
          .fontSize(14)
          .fontWeight(FontWeight.Bold)
          .fontColor(0x333333)

        this.BuildSectionTitle('1. DrawableDescriptor')

        Row({ space: 5 } as RowOptions) {
          Button('release->isReleased')
            .id('btnTest001')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test001())
          Text(this.testResult001)
            .id('txtTestResult001')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('release->getPixelMap')
            .id('btnTest002')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test002())
          Text(this.testResult002)
            .id('txtTestResult002')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('double release')
            .id('btnTest003')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test003())
          Text(this.testResult003)
            .id('txtTestResult003')
            .fontSize(10)
        }

        this.BuildSectionTitle('2. LayeredDrawableDescriptor')

        Row({ space: 5 } as RowOptions) {
          Button('release->getForeground')
            .id('btnTest004')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test004())
          Text(this.testResult004)
            .id('txtTestResult004')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('release->getBackground')
            .id('btnTest005')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test005())
          Text(this.testResult005)
            .id('txtTestResult005')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('release->getMask')
            .id('btnTest006')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test006())
          Text(this.testResult006)
            .id('txtTestResult006')
            .fontSize(10)
        }

        this.BuildSectionTitle('3. PixelMapDrawableDescriptor')

        Row({ space: 5 } as RowOptions) {
          Button('release->getPixelMap')
            .id('btnTest007')
            .height('5%')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test007())
          Text(this.testResult007)
            .id('txtTestResult007')
            .fontSize(10)
        }

        this.BuildSectionTitle('4. AnimatedDrawableDescriptor')

        Row({ space: 5 } as RowOptions) {
          Button('release->getPixelMap')
            .id('btnTest008')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test008())
          Text(this.testResult008)
            .id('txtTestResult008')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('release->getController')
            .id('btnTest009')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test009())
          Text(this.testResult009)
            .id('txtTestResult009')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('release->loadSync')
            .id('btnTest010')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test010())
          Text(this.testResult010)
            .id('txtTestResult010')
            .fontSize(10)
        }

        Row({ space: 5 } as RowOptions) {
          Button('double release')
            .id('btnTest012')
            .height('5%')
            .onClick((e: ClickEvent) => this.Test012())
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

  @Builder
  BuildSectionTitle(title: string) {
    Text(title)
      .fontSize(14)
      .fontWeight(FontWeight.Medium)
      .fontColor(Color.Black)
      .width('100%')
  }

  private createDrawableFromRes(): DrawableDescriptor | null {
    let resManager = this.getUIContext().getHostContext()?.resourceManager;
    if (!resManager) {
      return null;
    }
    try {
      return resManager.getDrawableDescriptor($r('app.media.startIcon').id);
    } catch (e) {
      return null;
    }
  }

  private createAnimatedDrawable(): AnimatedDrawableDescriptor {
    return new AnimatedDrawableDescriptor($r('app.media.startIcon'), { iterations: 1 });
  }

  Test001() {
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult001 = 'FAIL: cannot create DrawableDescriptor';
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
      this.testResult001 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test002() {
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult002 = 'FAIL: cannot create DrawableDescriptor';
        return;
      }
      drawable.release();
      try {
        let pixelMapRes = drawable.getPixelMap();
        if (pixelMapRes === undefined) {
          this.testResult002 = 'PASS: undefined';
        } else {
          this.testResult002 = 'FAIL: pixelMapRes not undefined';
        }
      } catch (e) {
        this.testResult002 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult002 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test003() {
    try {
      let drawable = this.createDrawableFromRes();
      if (!drawable) {
        this.testResult003 = 'FAIL: cannot create DrawableDescriptor';
        return;
      }
      drawable.release();
      drawable.release();
      if (drawable.isReleased()) {
        this.testResult003 = 'PASS';
      } else {
        this.testResult003 = 'FAIL: isReleased is false after second release';
      }
    } catch (e) {
      this.testResult003 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }

  Test004() {
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        let foregroundRes = drawable.getForeground();
        if (foregroundRes === undefined) {
          this.testResult004 = 'PASS: undefined';
        } else {
          this.testResult004 = 'FAIL: foregroundRes not undefined';
        }
      } catch (e) {
        this.testResult004 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult004 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test005() {
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        let backgroundRes = drawable.getBackground();
        if (backgroundRes === undefined) {
          this.testResult005 = 'PASS: undefined';
        } else {
          this.testResult005 = 'FAIL: backgroundRes not undefined';
        }
      } catch (e) {
        this.testResult005 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult005 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test006() {
    try {
      let drawable = new LayeredDrawableDescriptor();
      drawable.release();
      try {
        let maskRes = drawable.getMask();
        if (maskRes === undefined) {
          this.testResult006 = 'PASS: undefined';
        } else {
          this.testResult006 = 'FAIL: maskRes not undefined';
        }
      } catch (e) {
        this.testResult006 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult006 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test007() {
    try {
      let drawable = new PixelMapDrawableDescriptor();
      drawable.release();
      try {
        let pixelMapRes1 = drawable.getPixelMap();
        if (pixelMapRes1 === undefined) {
          this.testResult007 = 'PASS: undefined';
        } else {
          this.testResult007 = 'FAIL: pixelMapRes1 not undefined';
        }
      } catch (e) {
        this.testResult007 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult007 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test008() {
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        let pixelMapRes2 = drawable.getPixelMap();
        if (pixelMapRes2 === undefined) {
          this.testResult008 = 'PASS: undefined';
        } else {
          this.testResult008 = 'FAIL: pixelMapRes2 not undefined';
        }
      } catch (e) {
        this.testResult008 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult008 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test009() {
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
        this.testResult009 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult009 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test010() {
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      try {
        let loadSyncRes = drawable.loadSync();
        console.log('loadSyncRes=====' + JSON.stringify(loadSyncRes))
        if (loadSyncRes.imageWidth === -1) {
          this.testResult010 = 'PASS';
        } else {
          this.testResult010 = 'FAIL: loadSyncRes not undefined';
        }
      } catch (e) {
        this.testResult010 = 'FAIL: should not throw exception';
      }
    } catch (e) {
      this.testResult010 = `FAIL: outer exception ${JSON.stringify(e)}`;
    }
  }

  Test012() {
    try {
      let drawable = this.createAnimatedDrawable();
      drawable.release();
      drawable.release();
      if (drawable.isReleased()) {
        this.testResult012 = 'PASS';
      } else {
        this.testResult012 = 'FAIL: isReleased is false after second release';
      }
    } catch (e) {
      this.testResult012 = `FAIL: exception ${JSON.stringify(e)}`;
    }
  }
}
