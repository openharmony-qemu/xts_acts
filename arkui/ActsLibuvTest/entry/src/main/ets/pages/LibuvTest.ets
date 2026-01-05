/*
 * Copyright (c) 2024 Huawei Device Co., Ltd.
 * Licensed under the Apache License, Version 2.0 (the "License");
 */

import { hilog } from '@kit.PerformanceAnalysisKit';
import libuvRunner from 'libuvrunner';

const DOMAIN = 0x0201;
const TAG = 'LibuvTestPage';

@Entry
@Component
struct LibuvTest {
  @State testList: string[] = [];
  @State testResult: string = '点击按钮运行测试';
  @State isRunning: boolean = false;
  @State selectedTest: string = '';

  aboutToAppear() {
    // 页面加载时获取测试列表
    try {
      this.testList = libuvRunner.listTests();
      hilog.info(DOMAIN, TAG, `Loaded ${this.testList.length} tests`);
    } catch (err) {
      hilog.error(DOMAIN, TAG, `Failed to load tests: ${err}`);
      this.testResult = '加载测试列表失败';
    }
  }

  runSingleTest(testName: string) {
    this.isRunning = true;
    this.testResult = `正在运行测试: ${testName}...`;
    
    try {
      hilog.info(DOMAIN, TAG, `Running test: ${testName}`);
      let result = libuvRunner.runTest(testName);
      
      if (result.success) {
        this.testResult = `✓ 测试通过: ${testName}\n退出码: ${result.exitCode}`;
        hilog.info(DOMAIN, TAG, `Test passed: ${testName}`);
      } else {
        this.testResult = `✗ 测试失败: ${testName}\n退出码: ${result.exitCode}`;
        hilog.error(DOMAIN, TAG, `Test failed: ${testName}, exitCode: ${result.exitCode}`);
      }
    } catch (err) {
      this.testResult = `运行测试出错: ${err}`;
      hilog.error(DOMAIN, TAG, `Error running test: ${err}`);
    }
    
    this.isRunning = false;
  }

  runAllTests() {
    this.isRunning = true;
    this.testResult = '正在运行所有测试，请稍候...';
    
    try {
      hilog.info(DOMAIN, TAG, 'Running all tests');
      let result = libuvRunner.runAllTests();
      
      if (result.success) {
        this.testResult = `✓ 所有测试完成\n退出码: ${result.exitCode}\n总测试数: ${this.testList.length}`;
        hilog.info(DOMAIN, TAG, 'All tests completed successfully');
      } else {
        this.testResult = `部分测试失败\n退出码: ${result.exitCode}\n总测试数: ${this.testList.length}`;
        hilog.warn(DOMAIN, TAG, `Some tests failed, exitCode: ${result.exitCode}`);
      }
    } catch (err) {
      this.testResult = `运行所有测试出错: ${err}`;
      hilog.error(DOMAIN, TAG, `Error running all tests: ${err}`);
    }
    
    this.isRunning = false;
  }

  build() {
    Column() {
      // 标题
      Text('Libuv 测试运行器')
        .fontSize(24)
        .fontWeight(FontWeight.Bold)
        .margin({ top: 20, bottom: 10 })

      // 测试统计
      Text(`可用测试: ${this.testList.length} 个`)
        .fontSize(16)
        .margin({ bottom: 20 })

      // 快速测试按钮
      Row() {
        Button('运行简单测试')
          .fontSize(14)
          .margin({ right: 10 })
          .enabled(!this.isRunning)
          .onClick(() => {
            this.runSingleTest('test_pass_always');
          })

        Button('运行所有测试')
          .fontSize(14)
          .enabled(!this.isRunning)
          .onClick(() => {
            this.runAllTests();
          })
      }
      .margin({ bottom: 20 })

      // 常用测试快捷按钮
      Text('常用测试:')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, bottom: 10 })

      Grid() {
        GridItem() {
          Button('test_active')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_active'))
        }
        GridItem() {
          Button('test_timer')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_timer'))
        }
        GridItem() {
          Button('test_idle')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_idle'))
        }
        GridItem() {
          Button('test_loop_alive')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_loop_alive'))
        }
        GridItem() {
          Button('test_error')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_error'))
        }
        GridItem() {
          Button('test_threadpool')
            .width('100%')
            .fontSize(12)
            .enabled(!this.isRunning)
            .onClick(() => this.runSingleTest('test_threadpool'))
        }
      }
      .columnsTemplate('1fr 1fr')
      .rowsTemplate('1fr 1fr 1fr')
      .columnsGap(10)
      .rowsGap(10)
      .width('90%')
      .height(150)
      .margin({ bottom: 20 })

      // 测试结果显示
      Text('测试结果:')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, bottom: 10 })

      Scroll() {
        Text(this.testResult)
          .fontSize(14)
          .width('90%')
          .padding(10)
          .backgroundColor('#f0f0f0')
          .borderRadius(5)
      }
      .width('100%')
      .height(200)
      .margin({ bottom: 20 })

      // 测试列表（可滚动）
      Text('所有测试列表:')
        .fontSize(16)
        .fontWeight(FontWeight.Medium)
        .alignSelf(ItemAlign.Start)
        .margin({ left: 20, bottom: 10 })

      List({ space: 5 }) {
        ForEach(this.testList.slice(0, 20), (testName: string, index: number) => {
          ListItem() {
            Row() {
              Text(`${index + 1}. ${testName}`)
                .fontSize(12)
                .layoutWeight(1)
              
              Button('运行')
                .fontSize(10)
                .height(30)
                .enabled(!this.isRunning)
                .onClick(() => {
                  this.runSingleTest(testName);
                })
            }
            .width('90%')
            .padding(5)
            .backgroundColor('#ffffff')
            .borderRadius(3)
          }
        }, (testName: string) => testName)
      }
      .width('100%')
      .layoutWeight(1)
      .margin({ bottom: 20 })

      // 说明文字
      Text('注意: 运行所有测试可能需要较长时间')
        .fontSize(12)
        .fontColor('#999999')
        .margin({ bottom: 20 })
    }
    .width('100%')
    .height('100%')
    .backgroundColor('#f5f5f5')
  }
}
