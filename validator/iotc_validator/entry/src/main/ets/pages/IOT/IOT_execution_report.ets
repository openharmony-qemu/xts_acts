import router from '@ohos.router';
import promptAction from '@ohos.promptAction';
import { ExecutionStepResult } from './model/IotConstants';
import IotHelper from './model/IotHelper';

const TAG = '[IOTExecutionReport]';

@Entry
@Component
struct IOTExecutionReport {
  @State results: ExecutionStepResult[] = [];
  @State allPass: boolean = false;

  aboutToAppear() {
    let params = router.getParams() as Record<string, Object>;
    let resultStr = params['results'] as string;
    if (resultStr) {
      this.results = JSON.parse(resultStr) as ExecutionStepResult[];
    }
    this.allPass = params['allPass'] as boolean;
  }

  aboutToDisappear(): void {
    IotHelper.getInstance().stopConnect();
  }

  build() {
    Column() {
      Row() {
        Button() {
          Image($r('app.media.ic_public_back'))
            .width('20vp')
            .height('18vp')
            .margin({ left: '20vp' });
        }
        .backgroundColor(Color.Black)
        .size({ width: '40vp', height: '30vp' })
        .onClick(() => router.back());

        Text('执行报告')
          .fontColor(Color.White)
          .fontSize('22fp');
        Text('')
          .fontColor(Color.White)
          .visibility(Visibility.Hidden);
      }
      .width('100%')
      .height('10%')
      .backgroundColor(Color.Black)
      .justifyContent(FlexAlign.SpaceBetween);

      Scroll() {
        Column() {
          Text(this.allPass ? '全部通过' : '存在失败项')
            .fontSize(20)
            .fontColor(this.allPass ? '#0CB60C' : '#d60a0a')
            .fontWeight(FontWeight.Bold)
            .margin({ top: 16, bottom: 12 })
            .width('100%');

          Column() {
            ForEach(this.results, (item: ExecutionStepResult) => {
              Row() {
                Text(`${this.results.indexOf(item) + 1}.`)
                  .fontSize(16)
                  .fontColor('#333333')
                  .fontWeight(FontWeight.Bold)
                  .width(28);
                Column() {
                  Text(item.stepName)
                    .fontSize(16)
                    .fontColor('#333333');
                  if (item.status === 'fail' && item.reason) {
                    Text(`→ ${item.reason}`)
                      .fontSize(12)
                      .fontColor('#d60a0a')
                      .margin({ top: 4 });
                  }
                }
                .layoutWeight(1)
                .alignItems(HorizontalAlign.Start);
                Blank();
                Text(item.status === 'pass' ? 'PASS' : 'FAIL')
                  .fontSize(14)
                  .fontColor(item.status === 'pass' ? '#0CB60C' : '#d60a0a')
                  .fontWeight(FontWeight.Bold);
              }
              .width('100%')
              .padding({ top: 14, bottom: 14, left: 12, right: 12 })
            }, (item: ExecutionStepResult) => item.stepName)
          }
          .backgroundColor(Color.White)
          .borderRadius(12)
          .width('100%')
          .shadow({ radius: 2, offsetX: 0, offsetY: 1, color: '#1A000000' });
        }
        .padding({ left: 16, right: 16 });
      }
      .align(Alignment.Top)
      .layoutWeight(1)
      .backgroundColor(Color.White);

      Row() {
        Button({ stateEffect: false }) {
          Image($r('app.media.ic_public_pass'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .opacity(this.allPass ? 1.0 : 0.4)
        .enabled(this.allPass)
        .onClick(() => {
          router.back();
          promptAction.showToast({ message: '通过', duration: 1000 });
        });

        Button() {
          Image($r('app.media.ic_public_help'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .onClick(() => {
          AlertDialog.show({
            title: '操作提示',
            message: '执行为顺序执行，失败即停止，全部通过或失败进入报告页',
            confirm: { value: 'OK', action: () => {} }
          });
        });

        Button({ stateEffect: false }) {
          Image($r('app.media.ic_public_fail'))
            .width('20vp')
            .height('20vp')
        }
        .width('30%')
        .height('30vp')
        .backgroundColor(Color.Grey)
        .opacity(!this.allPass ? 1.0 : 0.4)
        .enabled(!this.allPass)
        .onClick(() => {
          router.back();
          promptAction.showToast({ message: '失败', duration: 1000 });
        });
      }
      .height('10%')
      .width('100%')
      .justifyContent(FlexAlign.SpaceEvenly)
      .backgroundColor(Color.Black);
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White);
  }
}
